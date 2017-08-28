<?php

class EmailConfirmations extends Model
{
    public $id;
    public $usersId;
    public $code;
    public $createdAt;
    public $modifiedAt;
    public $confirmed;
    // public function beforeValidationOnCreate()
    // {
    //     $this->createdAt = time();
    //     $this->code = preg_replace('/[^a-zA-Z0-9]/', '', base64_encode(openssl_random_pseudo_bytes(24)));
    //     $this->confirmed = 'N';
    // }
    // public function beforeValidationOnUpdate()
    // {
    //     $this->modifiedAt = time();
    // }
    public function afterCreate()
    {
        $this->getDI()->getMail()->send(
            array(
                $this->user->email => $this->user->username
            ),
            "Please confirm your email",
            'confirmation',
            array(
                'confirmUrl' => '/confirm/' . $this->code . '/' . $this->user->email
            )
        );
    }
    public function initialize()
    {
        $this->belongsTo('usersId', 'Users', 'id', array(
            'alias' => 'user'
        ));
    }
}