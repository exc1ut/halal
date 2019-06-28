<?php
use yupe\models\YFormModel;

class Contact extends YFormModel
{ 
    public $phone;
    public $address;
    public $email;
    public $name;
    public $message;
    public $subject;

    public function rules()
    {
        return [
            ['phone, subject, address, email, name, message', 'filter', 'filter' => 'trim'],
            ['phone, subject, address, email, name, message', 'filter', 'filter' => [new CHtmlPurifier(), 'purify']],
            ['phone, subject, address, email, name, message', 'required','on' => 'contact'],
            ['phone, name, message', 'required','on' => 'index'],
            ['message', 'length', 'max' => 250],
            ['email', 'email'],
        ];
    }

}
