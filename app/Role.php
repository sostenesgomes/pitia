<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'role';
    public $timestamps = false;

    public function roles($userId){
        $collection = $this
            ->select(['role.key'])
            ->join('profile_role', 'profile_role.role_id', '=', 'role.id')
            ->join('profile', 'profile.id', '=', 'profile_role.profile_id')
            ->join('user_profile', 'user_profile.profile_id', '=', 'profile.id')
            ->join('users', 'users.id', '=', 'user_profile.user_id')
            ->where('users.id', $userId)
            ->groupby('role.id')
            ->get();

        $roles = [];

        foreach($collection as $item){
            $roles[] = $item->key;
        }

        return $roles;
    }
}
