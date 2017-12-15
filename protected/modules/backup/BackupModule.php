<?php
/**
 * BackupModule основной класс модуля backup
 *
 * @author Master_C
 * @link http://oqila.uz
 * @package yupe.modules.backup
 * @since 0.1
 */

class BackupModule  extends yupe\components\WebModule
{
    public $path = __dir__ . DIRECTORY_SEPARATOR . "data";

    const VERSION = '1';

    public function getPath()
    {
        return $this->path;
    }

    /**
     * Массив с именами модулей, от которых зависит работа данного модуля
     *
     * @return array
     */
    public function getDependencies()
    {
        return parent::getDependencies();
    }

    /**
     * Работоспособность модуля может зависеть от разных факторов: версия php, версия Yii, наличие определенных модулей и т.д.
     * В этом методе необходимо выполнить все проверки.
     *
     * @return array или false
     */
    public function checkSelf()
    {
        return parent::checkSelf();
    }

    /**
     * Каждый модуль должен принадлежать одной категории, именно по категориям делятся модули в панели управления
     *
     * @return string
     */
    public function getCategory()
    {
        return Yii::t('BackupModule.backup', 'OqilaCMS');
    }

    /**
     * массив лейблов для параметров (свойств) модуля. Используется на странице настроек модуля в панели управления.
     *
     * @return array
     */
    public function getParamsLabels()
    {
        return parent::getParamsLabels();
    }

    /**
     * массив параметров модуля, которые можно редактировать через панель управления (GUI)
     *
     * @return array
     */
    public function getEditableParams()
    {
        return parent::getEditableParams();
    }

    /**
     * массив групп параметров модуля, для группировки параметров на странице настроек
     *
     * @return array
     */
    public function getEditableParamsGroups()
    {
        return parent::getEditableParamsGroups();
    }

    /**
     * если модуль должен добавить несколько ссылок в панель управления - укажите массив
     *
     * @return array
     */
    public function getNavigation()
    {
        return [
            ['label' => Yii::t('BackupModule.backup', 'Backup')],
            [
                'icon' => 'fa fa-fw fa-list-alt',
                'label' => Yii::t('BackupModule.backup', 'Index'),
                'url' => ['/backup/backupBackend/index']
            ],
            [
                'icon' => 'fa fa-fw fa-plus',
                'label' => Yii::t('BackupModule.backup', 'Create'),
                'url' => ['/backup/backupBackend/create']
            ],
        ];
    }

    /**
     * текущая версия модуля
     *
     * @return string
     */
    public function getVersion()
    {
        return Yii::t('BackupModule.backup', self::VERSION);
    }

    /**
     * веб-сайт разработчика модуля или страничка самого модуля
     *
     * @return string
     */
    public function getUrl()
    {
        return Yii::t('BackupModule.backup', 'http://yupe.ru');
    }

    /**
     * Возвращает название модуля
     *
     * @return string.
     */
    public function getName()
    {
        return Yii::t('BackupModule.backup', 'Backup');
    }

    /**
     * Возвращает описание модуля
     *
     * @return string.
     */
    public function getDescription()
    {
        return Yii::t('BackupModule.backup', 'Описание модуля "backup"');
    }

    /**
     * Имя автора модуля
     *
     * @return string
     */
    public function getAuthor()
    {
        return Yii::t('BackupModule.backup', 'yupe team');
    }

    /**
     * Контактный email автора модуля
     *
     * @return string
     */
    public function getAuthorEmail()
    {
        return Yii::t('BackupModule.backup', 'team@yupe.ru');
    }

    /**
     * Ссылка, которая будет отображена в панели управления
     * Как правило, ведет на страничку для администрирования модуля
     *
     * @return string
     */
    public function getAdminPageLink()
    {
        return '/backup/backupBackend/index';
    }

    /**
     * Название иконки для меню админки, например 'user'
     *
     * @return string
     */
    public function getIcon()
    {
        return "fa fa-fw fa-pencil";
    }

    /**
      * Возвращаем статус, устанавливать ли галку для установки модуля в инсталяторе по умолчанию:
      *
      * @return bool
      **/
    public function getIsInstallDefault()
    {
        return parent::getIsInstallDefault();
    }

    /**
     * Инициализация модуля, считывание настроек из базы данных и их кэширование
     *
     * @return void
     */
    public function init()
    {
        parent::init();

        if( !is_dir($this->path) )
        {
            mkdir($this->path);
        }
        
        $this->setImport(
            [
                'backup.models.*',
                'backup.components.*',
            ]
        );
    }

    /**
     * Массив правил модуля
     * @return array
     */
    public function getAuthItems()
    {
        return [
            [
                'name' => 'Backup.BackupManager',
                'description' => Yii::t('BackupModule.backup', 'Manage backup'),
                'type' => AuthItem::TYPE_TASK,
                'items' => [
                    [
                        'type' => AuthItem::TYPE_OPERATION,
                        'name' => 'Backup.BackupBackend.Index',
                        'description' => Yii::t('BackupModule.backup', 'Index')
                    ],
                ]
            ]
        ];
    }
    
    public function getData() {
        $data = [];
        $dir = scandir($this->path);
        unset($dir[0]);
        unset($dir[1]);
        foreach ($dir as $key => $file) {
            $data[$key]['id'] = $file;
            $data[$key]['create_time'] = date('Y-m-d H:i:s', filectime($this->path . DIRECTORY_SEPARATOR . $file));
            $data[$key]['size'] = (filesize($this->path . DIRECTORY_SEPARATOR . $file) / 1024) . " kb";
        }
        return $data;
    }
    
    public function getIgnore() {
        return [
            '.git',
            'public' . DIRECTORY_SEPARATOR . 'assets',
            'protected' . DIRECTORY_SEPARATOR . 'runtime'
       ];
    }
    
    public function ignored($file) {
        foreach ($this->getIgnore() as $value) {
            if (strpos($file, $value) === 0) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    public function createBackup() 
    {
        ini_set('max_execution_time', 900);
        $source = realpath(Yii::getPathOfAlias("public") . DIRECTORY_SEPARATOR . "..");
        $zip = new ZipArchive();
        $dumpName = Yii::app()->name . "_" . date('Y.m.d_H.m.s') . ".zip";
        if ($zip->open($this->getPath() . DIRECTORY_SEPARATOR . $dumpName, ZIPARCHIVE::CREATE) === true)
        {
            $zip->addEmptyDir('database');
            $zip->addEmptyDir('cms');
            $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);
            foreach ($files as $file) {
                $file = realpath($file);
                
                $needle = $source . DIRECTORY_SEPARATOR;
                $n = strpos($file, $needle);
                $newName= substr($file, $n + strlen($needle));
                
                if ($this->ignored($newName)) 
                {
                    if (is_dir($file)) 
                    {
                        if(file_exists($file . DIRECTORY_SEPARATOR . ".gitignore"))
                        {
                            $zip->addEmptyDir('cms' . DIRECTORY_SEPARATOR . $newName);
                            $zip->addFile($file, 'cms' . DIRECTORY_SEPARATOR . $newName);
                        }
                    }
                } else {
                    if (is_dir($file)) {
                        $zip->addEmptyDir('cms' . DIRECTORY_SEPARATOR . $newName);
                    } elseif(is_file($file)) {
                        $zip->addFile($file, 'cms' . DIRECTORY_SEPARATOR . $newName);
                    }
                }
            }
        }
        $zip->close();
//        $db = $this->createDbDump('localhost', 'root', '', 'oqilacms');
//        print_r($db);
    }
    
    private function createDbDump($host, $user, $pass, $name, $tables=false, $backup_name=false) 
    {
        $mysqli = new mysqli($host,$user,$pass,$name);
        $mysqli->select_db($name);
        $mysqli->query("SET NAMES 'utf8'");
        $queryTables = $mysqli->query('SHOW TABLES');
        
        while($row = $queryTables->fetch_row()) 
        {
            $target_tables[] = $row[0];
        } 
        
        if($tables !== false) 
        {
            $target_tables = array_intersect( $target_tables, $tables);
        } 
        
        $content = "SET SQL_MODE = \"NO_AUTO_VALUE_ON_ZERO\";\r\nSET time_zone = \"+00:00\";\r\n\r\n\r\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\r\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\r\n/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\r\n/*!40101 SET NAMES utf8 */;\r\n--\r\n-- Database: `".$name."`\r\n--\r\n\r\n\r\n";
        
        foreach($target_tables as $table){
            
            if (empty($table))
            {
                continue;
            } 
            
            $result = $mysqli->query('SELECT * FROM `'.$table.'`');
            $fields_amount=$result->field_count;
            $rows_num=$mysqli->affected_rows;
            $res = $mysqli->query('SHOW CREATE TABLE '.$table);
            $TableMLine=$res->fetch_row(); 
            $content .= "\n\n".$TableMLine[1].";\n\n";
            $TableMLine[1]=str_ireplace('CREATE TABLE `','CREATE TABLE IF NOT EXISTS `',$TableMLine[1]);
            
            for ($i = 0, $st_counter = 0; $i < $fields_amount;   $i++, $st_counter=0) {
                
                while($row = $result->fetch_row())  { //when started (and every after 100 command cycle):
                    
                    if ($st_counter%100 == 0 || $st_counter == 0 )
                    {
                        $content .= "\nINSERT INTO ".$table." VALUES";
                    }
                    
                    $content .= "\n(";
                    
                    for ($j=0; $j<$fields_amount; $j++)
                    {
                        $row[$j] = str_replace("\n","\\n", addslashes($row[$j]) );
                        
                        if (isset($row[$j]))
                        {
                            $content .= '"'.$row[$j].'"' ;
                        }
                        else
                        {
                            $content .= '""';
                        }
                        if ($j<($fields_amount-1))
                        {
                            $content.= ',';
                        }
                    }
                    
                    $content .=")";
                    //every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
                    if ( (($st_counter+1)%100==0 && $st_counter!=0) || $st_counter+1==$rows_num) 
                    {
                        $content .= ";";
                    }
                    else
                    {
                        $content .= ",";
                    }

                    $st_counter=$st_counter+1;
                }
            }
        
            $content .="\n\n\n";
        }
        
        $content .= "\r\n\r\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\r\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\r\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;";
        $backup_name = $backup_name ? $backup_name : $name . '_'.date('Y.m.d_H.i.s').'.sql';
        ob_get_clean();
//        header('Content-Type: application/octet-stream');
//        header("Content-Transfer-Encoding: Binary");
//        header('Content-Length: '. (function_exists('mb_strlen') ? mb_strlen($content, '8bit'): strlen($content)) );
//        header("Content-disposition: attachment; filename=\"".$backup_name."\""); 
//        echo $content; exit;
        if (!is_dir(__DIR__ . DIRECTORY_SEPARATOR . "temp")) {
            mkdir(__DIR__ . DIRECTORY_SEPARATOR . "temp");
        }
        $tempFolder = __DIR__ . DIRECTORY_SEPARATOR . "temp";
        $file = fopen($tempFolder . DIRECTORY_SEPARATOR . $backup_name, 'w');
        fwrite($file, $content);
        fclose($file);
        return $tempFolder . DIRECTORY_SEPARATOR . $backup_name;
    }
}
