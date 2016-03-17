<?php

namespace App\Http\Controllers;

use App\Api;

use App\Http\Requests;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Request as GuzzleRequest;
use Illuminate\Http\Response;

class ApiController extends Controller
{
    public function index(){
        $apis = Api::orderby('name')->paginate();

        return view('api.list', ['apis'=>$apis]);
    }

    public function request($apiId){
        $api = Api::findOrFail($apiId);

        $client = new Client();

        $response = $client->get($api->url);

        return (new Response($response->getBody(), $response->getStatusCode()))
            ->header('Content-Type', 'application/json');
    }

}
