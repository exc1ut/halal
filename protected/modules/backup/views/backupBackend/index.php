<?php
/**
* Отображение для backupBackend/index
*
* @category YupeView
* @package  yupe
* @author   Yupe Team <team@yupe.ru>
* @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
* @link     http://yupe.ru
**/
$this->breadcrumbs = [
    Yii::t('BackupModule.backup', 'backup') => ['/backup/backupBackend/index'],
    Yii::t('BackupModule.backup', 'Index'),
];

$this->pageTitle = Yii::t('BackupModule.backup', 'backup - index');

$this->menu = $this->getModule()->getNavigation();
?>

<div class="page-header">
    <h1>
        <?php echo Yii::t('BackupModule.backup', 'backup'); ?>
        <small><?php echo Yii::t('BackupModule.backup', 'Index'); ?></small>
    </h1>
</div>