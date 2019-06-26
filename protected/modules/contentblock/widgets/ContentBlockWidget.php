<?php
/**
 * Виджет для отрисовки блока контента:
 *
 * @category YupeWidgets
 * @package  yupe.modules.contentblock.widgets
 * @author   Yupe Team <team@yupe.ru>
 * @license  BSD http://ru.wikipedia.org/wiki/%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F_BSD
 * @link     http://yupe.ru
 *
 **/
Yii::import('application.modules.contentblock.models.ContentBlock');
Yii::import('application.modules.contentblock.ContentBlockModule');

/**
 * Class ContentBlockWidget
 */
class ContentBlockWidget extends yupe\widgets\YWidget
{
    /**
     * @var
     */
    public $code;
    /**
     * @var bool
     */
    public $silent = false;
    /**
     * @var string
     */
    public $view = 'contentblock';

    /**
     * @throws CException
     */
    public function init()
    {
        if (empty($this->code)) {
            throw new CException(
                Yii::t(
                    'ContentBlockModule.contentblock',
                    'Insert content block title for ContentBlockWidget!'
                )
            );
        }

        $this->silent = (bool)$this->silent;
    }

    /**
     * @throws CException
     */
    public function run()
    {
       $cacheName = "ContentBlock{$this->code}";

        $block = Yii::app()->getCache()->get($cacheName);

        if($block === false)
        {
            $block = ContentBlock::model()->findByAttributes(['code' => $this->code]);

            if(null === $block)
            {
                if($this->silent === false)
                {
                    throw new CException(Yii::t('ContentBlockModule.contentblock', 'Content block "{code}" was not found !', ['{code}' => $this->code]));
                }
                $block = new ContentBlock();
            }
            else
            {
                if($block->status != ContentBlock::STATUS_ACTIVE)
                    $block = new ContentBlock();
            }

            Yii::app()->getCache()->set($cacheName, $block);
        }

        $this->render($this->view, ['block' => $block]);
    }
}
