<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    //
});

Route::group(['middleware' => 'web'], function () {
    Route::auth();

    Route::group(['prefix'=>'admin', 'middleware' => 'auth', 'namespace'=>'Admin'], function(){

        Route::get('/', ['as'=>'admin.index', 'uses'=>'IndexController@index', 'role'=>'admin_index_view']);

        Route::group(['prefix'=>'api'], function(){
            Route::get('/', ['as'=>'admin.api', 'uses' => 'ApiController@index', 'role' => 'admin_api_view']);

            Route::get('create', ['as'=>'admin.api.create', 'uses' => 'ApiController@create', 'role' => 'admin_api_create']);
            Route::post('store', ['as'=>'admin.api.store', 'uses' => 'ApiController@save', 'role' => 'admin_api_create']);

            Route::get('edit/{id}', ['as'=>'admin.api.edit', 'uses' => 'ApiController@edit', 'role' => 'admin_api_edit']);
            Route::post('update/{id}', ['as'=>'admin.api.update', 'uses' => 'ApiController@save', 'role' => 'admin_api_edit']);
        });
    });

    Route::group(['prefix'=>'api'], function(){
        Route::get('list', ['as'=>'api.list', 'uses'=>'ApiController@index']);
        Route::get('request/{id}', ['as'=>'api.request', 'uses'=>'ApiController@request']);
    });
});