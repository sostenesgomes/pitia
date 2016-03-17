<?php

namespace App\Providers;

use App\Role;
use Illuminate\Contracts\Auth\Access\Gate as GateContract;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Route;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any application authentication / authorization services.
     *
     * @param  \Illuminate\Contracts\Auth\Access\Gate  $gate
     * @return void
     */
    public function boot(GateContract $gate)
    {
        $this->registerPolicies($gate);

        $gate->define('auth', function ($user, $role=NULL) {
            if($role===NULL){
                $actions = Route::current()->getAction();

                if(! isset($actions['role']))
                    return false;

                $role=$actions['role'];
            }

            $objRole = new Role();
            $roles = $objRole->roles($user->id);

            if(in_array($role, $roles))
                return true;

            return false;

        });
    }
}
