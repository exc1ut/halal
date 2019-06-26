<?php
/**
 * Дефолтный контроллер сайта:
 *
 * @category YupeController
 * @package  yupe.controllers
 * @author   YupeTeam <team@yupe.ru>
 * @license  BSD http://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F_BSD
 * @version  0.5.3 (dev)
 * @link     http://yupe.ru
 *
 **/
namespace application\controllers;

use yupe\components\controllers\FrontController;

class SiteController extends FrontController
{
    /**
     * Отображение главной страницы
     *
     * @return void
     */
    public function actionIndex()
    {
        \Yii::import('application.models.Contact');
        $model = new \Contact('index');
        $data = $_POST;
        if (!empty($data)) {
            $model->setAttributes($data);
            if ($model->validate()) {
                $email = new \PHPMailer();
                $email->SMTPDebug = 0;
                $email->isSMTP();
                $email->Host = 'smtp.yandex.ru';
                $email->SMTPAutoTLS = true;
                $email->SMTPAuth = true;
                $email->Username = 'testing@oqila.uz';
                $email->Password = 'oqila-test';
                $email->SMTPSecure = 'tls';
                $email->Port = 25;
                $email->setFrom('testing@oqila.uz');
                $email->isHTML(true);
                $email->Subject = 'Message from site';
                $email->Body = <<<TEST
                Name: {$model->name};
                Phone: {$model->phone};
                Email: {$model->email};
                Address: {$model->address};
                Message: {$model->message};
TEST;
                $email->AddAddress('umid19999@gmail.com');
                $email->TimeOut = 5;
                $email->CharSet = 'UTF-8';
                $email->Send();
            }
        }


        $this->render('index');
    }

    public function actionContacts()
    {
        \Yii::import('application.models.Contact');
        $model = new \Contact('contact');
        $data = \Yii::app()->request->getPost('Contact');
        if (!empty($data)) {
            $model->setAttributes($data);
            if ($model->validate()) {
                $email = new \PHPMailer();
                $email->SMTPDebug = 0;
                $email->isSMTP();
                $email->Host = 'smtp.yandex.ru';
                $email->SMTPAutoTLS = true;
                $email->SMTPAuth = true;
                $email->Username = 'testing@oqila.uz';
                $email->Password = 'oqila-test';
                $email->SMTPSecure = 'tls';
                $email->Port = 25;
                $email->setFrom('testing@oqila.uz');
                $email->isHTML(true);
                $email->Subject = 'Message from site';
                $email->Body = <<<TEST
                Name: {$model->name};
                Phone: {$model->phone};
                Email: {$model->email};
                Address: {$model->address};
                Message: {$model->message};
TEST;
                $email->AddAddress('umid19999@gmail.com');
                $email->TimeOut = 5;
                $email->CharSet = 'UTF-8';
                $email->Send();
            }
        }
        $this->render('contact', [
            'model' => $model
        ]);
    }
    public function actionOrder() 
    {
        $text = '';
        \Yii::import('application.models.Order');
        $model = new \Order();
        $data = \Yii::app()->request->getPost('Order');
        $positions = \Yii::app()->cart->getPositions();
        
        foreach($positions as $position)
        {
            $text .=  "Name : {$position->name}". "\n";
        }

        if (!empty($data)) {
            $model->setAttributes($data);
            if ($model->validate()) {
                $email = new \PHPMailer();
                $email->SMTPDebug = 0;
                $email->isSMTP();
                $email->Host = 'smtp.yandex.ru';
                $email->SMTPAutoTLS = true;
                $email->SMTPAuth = true;
                $email->Username = 'testing@oqila.uz';
                $email->Password = 'oqila-test';
                $email->SMTPSecure = 'tls';
                $email->Port = 25;
                $email->setFrom('testing@oqila.uz');
                $email->isHTML(true);
                $email->Subject = 'Message from site';
                $email->Body = <<<TEST
                Name: {$model->name};
                Phone: {$model->phone};
                Email: {$model->email};
                Address: {$model->address};
                Message: {$model->message};
                Surname: {$model->surname};
                Name: {$text};
TEST;
                $email->AddAddress('umid19999@gmail.com');
                $email->TimeOut = 5;
                $email->CharSet = 'UTF-8';
                $email->Send();
            }
        }
        $this->render('order',[
            'model' => $model
        ]);
    }

    /**
     * Отображение для ошибок:
     *
     * @return void
     */
    public function actionError()
    {
        $error = \Yii::app()->errorHandler->error;

        if (empty($error) || !isset($error['code']) || !(isset($error['message']) || isset($error['msg']))) {
            $this->redirect(['index']);
        }

        if (!\Yii::app()->getRequest()->getIsAjaxRequest()) {

            $this->render(
                'error',
                [
                    'error' => $error
                ]
            );
        }
    }
}
