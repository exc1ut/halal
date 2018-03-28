<?php

/**
 * Mail application component
 * Класс компонента Mail:
 *
 * @category YupeApplicationComponent
 * @package  yupe.modules.mail.components
 * @author   YupeTeam <team@yupe.ru>
 * @license  BSD https://raw.github.com/yupe/yupe/master/LICENSE
 * @link     http://yupe.ru
 **/

namespace yupe\components;

use CApplicationComponent;

/**
 * Class Mail
 * @package yupe\components
 */
class Mail extends CApplicationComponent
{
    /**
     * @var \PHPMailer
     */
    private $_mailer;

    /**
     * Method to send mail: ("mail", "sendmail", or "smtp").
     * @var string
     */
    public $method = 'smtp';

    /**
     * Smtp settings. Associative array. Required on method = smtp.
     *
     * array(
     *      'host' => 'example.com',
     *      'username' => 'username',
     *      'password' => '*******'
     * );
     * @var array
     */
    public $smtp;

    /**
     * Layout of the email body
     * @var string
     */
    public $layout;

    /**
     *
     */
    public function init()
    {
        $this->_mailer = new \PHPMailer();
        $this->smtp = [
            'host' => 'smtp.yandex.ru',
            'login' => 'robot@oqila.uz',
            'password' => '8cHDqW4Nd6x7KgdM',
            'port' => 25,
            'debug' => 0
        ];
        switch ($this->method) {
            case 'smtp':
                
                $this->_mailer->SMTPDebug = 0;
                $this->_mailer->isSMTP();
                $this->_mailer->Host = 'smtp.yandex.ru';
                $this->_mailer->SMTPAutoTLS = true;
                $this->_mailer->SMTPAuth = true;
                $this->_mailer->Username = 'robot@oqila.uz';
                $this->_mailer->Password = '8cHDqW4Nd6x7KgdM';
                $this->_mailer->SMTPSecure = 'tls';
                $this->_mailer->Port = 25;  
                $this->_mailer->isHTML(true);
                break;
            case 'sendmail':
                $this->_mailer->isSendmail();

                break;
            default:
                $this->_mailer->isMail();
        }

        $this->_mailer->CharSet = \Yii::app()->charset;

        parent::init();
    }

    /**
     * @return \PHPMailer
     */
    public function getMailer()
    {
        return $this->_mailer;
    }

    /**
     * @return string
     */
    public function getSubject()
    {
        return $this->_mailer->Subject;
    }

    /**
     * @param $subject
     */
    public function setSubject($subject)
    {
        $this->_mailer->Subject = $subject;
    }

    /**
     * @param $address
     * @param string $name
     * @throws \phpmailerException
     */
    public function setFrom($address, $name = '')
    {
        $this->_mailer->setFrom($address, $name);
        $this->_mailer->addReplyTo($address, $name);
    }

    /**
     * @param $address
     * @param string $name
     */
    public function addAddress($address, $name = '')
    {
        $this->_mailer->addAddress($address, $name);
    }

    /**
     *
     */
    public function reset()
    {
        $this->init();
    }

    /**
     * Функция отправки сообщения:
     *
     * @param string $from - адрес отправителя
     * @param string|array $to - адрес(-а) получателя
     * @param string $theme - тема письма
     * @param string $body - тело письма
     * @param bool $isText - является ли тело письма текстом
     * @param array $replyTo добавляет заголовок Reply-To, формат [email => имя]
     *
     * @return bool отправилось ли письмо
     **/
    public function send($from, $to, $theme, $body, $isText = false, $replyTo = [])
    {
        $this->_mailer->clearAllRecipients();

        $this->setFrom('robot@oqila.uz', \Yii::app()->getModule('yupe')->siteName);

        if (is_array($to)) {
            foreach ($to as $email) {
                $this->addAddress($email);
            }
        } else {
            $this->addAddress($to);
        }

        $this->setSubject($theme);

        if ($isText) {
            $this->_mailer->Body = $body;
            $this->_mailer->isHTML(false);
        } else {
            $this->_mailer->msgHTML($body, \Yii::app()->basePath);
        }

        if (!empty($replyTo)) {
            $this->_mailer->clearReplyTos();
            foreach ($replyTo as $email => $name) {
                $this->_mailer->addReplyTo($email, $name);
            }
        }

        try {
            return $this->_mailer->send();
        } catch (\Exception $e) {
            \Yii::log($e->__toString(), \CLogger::LEVEL_ERROR, 'mail');

            return false;
        }
    }
}
