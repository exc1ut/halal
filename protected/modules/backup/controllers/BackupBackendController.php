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
//        echo Yii::getPathOfAlias('application') . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "backup";
        $this->render('index');
    }
}