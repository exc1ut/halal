<?php
/**
 * Entry point script:
 *
 * @category YupeScript
 * @package  YupeCMS
 * @author   Yupe Team <team@yupe.ru>
 * @license  https://github.com/yupe/yupe/blob/master/LICENSE BSD
 * @link     http://yupe.ru
 **/

/**
 * @link    http://www.yiiframework.ru/doc/guide/ru/basics.entry
 */

if (!ini_get('date.timezone')) {
    date_default_timezone_set('Asia/Tashkent');
}

// Setting internal encoding to UTF-8.
if (!ini_get('mbstring.internal_encoding')) {
    @ini_set("mbstring.internal_encoding", 'UTF-8');
    mb_internal_encoding('UTF-8');
}

// Comment next two lines on production
define('YII_DEBUG', file_exists(__DIR__ . '/../DEBUG'));
defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL', 3);
define('ROOT_DIR', realpath(__DIR__.'/../'));

require __DIR__ . '/../vendor/yiisoft/yii/framework/yii.php';

$base = require __DIR__ . '/../protected/config/main.php';

$confManager = new yupe\components\ConfigManager();
$confManager->sentEnv(\yupe\components\ConfigManager::ENV_WEB);

require __DIR__ . '/../vendor/autoload.php';

Yii::createWebApplication($confManager->merge($base))->run();
