<?php

namespace App\Http\Controllers\Admin;

use App\Api;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\ApiRequest;
use Illuminate\Support\Facades\URL;

class ApiController extends Controller{

    public function index(){
        $apis = Api::orderby('name')->paginate();

        return view('admin.api.list', ['apis'=>$apis]);
    }

    public function create(){
        return view('admin.api.form',[
            'api' => new Api(),
            'action' => route('admin.api.store')
        ]);
    }

    public function edit($id){
        $api = Api::findOrFail($id);

        return view('admin.api.form',[
            'api'    => $api,
            'action' => route('admin.api.update', ['id'=>$id])
        ]);
    }

    public function save(ApiRequest $request, $id=NULL){
        DB::beginTransaction();

        try{
            $api = new Api();

            if($id !== NULL)
                $api = Api::findOrFail($id);

            $api->name = $request->name;
            $api->url = $request->url;

            if($api->save()){
                DB::commit();

                return redirect()->route('admin.api');
            }

            $this->errorSave();
        }catch(\Exception $e){
            $this->errorSave($e->getMessage());
        }catch(\FatalErrorException $e){
            $this->errorSave($e->getMessage());
        }
    }

    public function errorSave($exceptionMessage=null){
        DB::rollBack();

        $messages = ['Não foi possível realizar esta requisição'];

        if( ($exceptionMessage !== NULL) and (env('APP_DEBUG')) )
            $messages[] = $exceptionMessage;

        return redirect(URL::previous())
            ->withErrors($messages)
            ->withInput();
    }

}
