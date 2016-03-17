@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="bs-example" data-example-id="table-within-panel">
                <div class="panel panel-default">
                    <div class="panel-heading">Cadastro de API's</div>
                        <div class="panel-body">
                            <p>Cadastre Api's para requisição de teste.</p>
                            <p>
                                <a href="{{route('admin.api.create')}}" class="btn btn-default">Nova API</a>
                            </p>
                        </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome</th>
                            <th>Url</th>
                            <th>Ações</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($apis as $api)
                            <tr>
                                <th scope="row">1</th>
                                <td>{{$api->name}}</td>
                                <td>{{$api->url}}</td>
                                <td><a href="{{route('admin.api.edit', ['id'=>$api->id])}}">Editar</a></td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection