<?php
/* @var $category StoreCategory */
$category_title = "";
switch($category->getTitle()){
    case "Snag types": $category_title = Yii::t('default','Snag types');break;
    case "Sausage types": $category_title = Yii::t('default','Sausage types');break;
    case "Raw materials": $category_title = Yii::t('default','Raw materials');break;
    case "Equipments": $category_title = Yii::t('default','Equipments');break;
    case "Private label projects": $category_title = Yii::t('default','Private label projects');break;
}
$this->title =  $category_title;
$this->description = $category->getMetaDescription();
$this->keywords =  $category->getMetaKeywords();
$this->canonical = $category->getMetaCanonical();

$this->breadcrumbs = [Yii::t("StoreModule.store", "Catalog") => ['/store/product/index']];

$this->breadcrumbs = array_merge(
    $this->breadcrumbs,
    $category->getBreadcrumbs(true)
);

?>
<div id="canvas">
    <div id="box_wrapper">

        <!-- template sections -->
        <section class="page_breadcrumbs ds parallax section_padding_top_250 section_padding_bottom_75">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <h2 class="highlight text-uppercase"><?= $category_title ?></h2>
                    </div>
                </div>
            </div>
        </section>

        <section class="ls store_category section_padding_top_130 section_padding_bottom_130 columns_padding_25">
            <div class="container">
                <div class="row">

                    <div class="col-sm-12 col-md-12 col-lg-12">



                        <div class="row">
                        <div class="columns-3">
                                 <?php $this->widget(
                                'bootstrap.widgets.TbListView',
                                [
                                    'dataProvider' => $dataProvider,
                                    'itemView' => '//store/product/_item',
                                    'summaryText' => '',
                                    'enableHistory' => true,
                                    'cssFile' => false,
                                    'emptyText' => Yii::t('default','No results found')
                                ]
                            ); ?>



                        </div>
                        <!-- eof .columns-* -->

                        </div>
                    </div>
                    <!--eof .col-sm-8 (main content)-->





                </div>
            </div>
        </section>



    </div>
    <!-- eof #box_wrapper -->
</div>