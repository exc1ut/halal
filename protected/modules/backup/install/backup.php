<?php
/**
 * Файл настроек для модуля backup
 *
 * @author yupe team <team@yupe.ru>
 * @link http://yupe.ru
 * @copyright 2009-2017 amyLabs && Yupe! team
 * @package yupe.modules.backup.install
 * @since 0.1
 *
 */
return [
    'module'    => [
        'class' => 'application.modules.backup.BackupModule',
    ],
    'import'    => [],
    'component' => [],
    'rules'     => [
        '/backup' => 'backup/backup/index',
    ],
];