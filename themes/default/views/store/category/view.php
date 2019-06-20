<?php
$mainAssets = Yii::app()->getTheme()->getAssetsUrl();
Yii::app()->getClientScript()->registerCssFile($mainAssets . '/css/store-frontend.css');
Yii::app()->getClientScript()->registerScriptFile($mainAssets . '/js/store.js');
/* @var $category StoreCategory */

$this->title =  $category->getMetaTile();
$this->description = $category->getMetaDescription();
$this->keywords =  $category->getMetaKeywords();
$this->canonical = $category->getMetaCanonical();

$this->breadcrumbs = [Yii::t("StoreModule.store", "Catalog") => ['/store/product/index']];

$this->breadcrumbs = array_merge(
    $this->breadcrumbs,
    $category->getBreadcrumbs(true)
);

?>

<div class="row">
    <div class="col-xs-12">
        <h1><?= CHtml::encode($category->getTitle()); ?></h1>
    </div>
</div>


<div class="row">
    <form id="store-filter" name="store-filter" method="get">
    </form>
    <div class="col-sm-9">
        <section>

            <div class="grid">
                <?php $this->widget(
                    'bootstrap.widgets.TbListView',
                    [
                        'dataProvider' => $dataProvider,
                        'itemView' => '//store/product/_item',
                        'summaryText' => '',
                        'enableHistory' => true,
                        'cssFile' => false,
                        'itemsCssClass' => 'row items',
                        
                    ]
                ); ?>
            </div>
        </section>
    </div>
</div>

