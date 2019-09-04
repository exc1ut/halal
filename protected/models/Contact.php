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
            ['subject, email, name, message', 'required','on' => 'contact','message' => '{attribute} ' . Yii::t('default', 'cannot be blank')],
            ['phone, name, message', 'required','on' => 'index'],
            ['message', 'length', 'max' => 250],
        ];
    }
    public function attributeLabels()
    {
        return [
            'phone' => Yii::t('default','Phone'),
            'subject' => Yii::t('default','Subject'),
            'email' => Yii::t('default','Email'),
            'message' => Yii::t('default','Message'),
            'name' => Yii::t('default','Name'),
        ];
    }

}
