@extends('layouts.app_welcome')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="bs-example" data-example-id="table-within-panel">
                <div class="panel panel-default">
                    <div class="panel-heading">API's</div>
                        <div class="panel-body">
                            <p>Faça requisições nas API's</p>

                            <label for="result">Result:</label>
                            <textarea id="result"></textarea>

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
                                <td><button class="btn btn-default request" data-url="{{route('api.request', ['id'=>$api->id])}}">Request</button></td>
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

@section('js')
    <script type="text/javascript">
        $(function(){
            $('button.request').on('click', function(){
                var url = $(this).attr('data-url');
                $.ajax({
                    method: "GET",
                    url: url,
                    dataType: "json"
                 })
                .done(function(response) {
                    $('textarea#result').text(JSON.stringify(response));
                })
                .fail(function() {
                    alert("error");
                })
                .always(function(){
                    alert("Complete")
                })
            });
        });
    </script>
@endsection