<?php
use yupe\models\YFormModel;

class Order extends YFormModel
{ 
    public $phone;
    public $address;
    public $email;
    public $name;
    public $surname;
    public $message;

    public function rules()
    {
        return [
            ['phone, address, email, name, message, surname', 'filter', 'filter' => 'trim'],
            ['phone, address, email, name, message, surname', 'filter', 'filter' => [new CHtmlPurifier(), 'purify']],
            ['phone, address, email, name, message, surname', 'required'],
            ['message', 'length', 'max' => 250],
            ['email', 'email'],
        ];
    }

}
