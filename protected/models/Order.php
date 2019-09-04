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
            ['phone, address, email, name, message, surname', 'required','message' => '{attribute} ' . Yii::t('default', 'cannot be blank')],
            ['message', 'length', 'max' => 250],
            ['email', 'email'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'phone' => Yii::t('default','Phone'),
            'email' => Yii::t('default','Email'),
            'message' => Yii::t('default','Message'),
            'name' => Yii::t('default','Name'),
            'address' => Yii::t('default','Address'),
            'surname' => Yii::t('default','Surname'),
        ];
    }

}
