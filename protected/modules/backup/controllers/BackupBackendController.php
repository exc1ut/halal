<?php
/**
* BackupBackendController контроллер для backup в панели управления
*
* @author Master_C
* @link http://oqila.uz
* @package yupe.modules.backup.controllers
* @since 0.1
*
*/

class BackupBackendController extends \yupe\components\controllers\BackController
{
    public function actionIndex()
    {
        $data = Yii::app()->getModule('backup')->getData();
        
        $model = new CArrayDataProvider($data, []);
        $this->render('index', ['model' => $model]);
    }
    
    public function actionCreate() {
        $this->getModule()->createBackup();
    }
}