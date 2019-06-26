<?php
use yupe\models\YFormModel;

class Contact extends YFormModel
{ 
    public $phone;
    public $address;
    public $email;
    public $name;
    public $message;

    public function rules()
    {
        return [
            ['phone, address, email, name, message', 'filter', 'filter' => 'trim'],
            ['phone, address, email, name, message', 'filter', 'filter' => [new CHtmlPurifier(), 'purify']],
            ['phone, address, email, name, message', 'required','on' => 'contact'],
            ['phone, name, message', 'required','on' => 'index'],
            ['message', 'length', 'max' => 250],
            ['email', 'email'],
        ];
    }

}
