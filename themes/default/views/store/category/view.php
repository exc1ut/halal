<?php
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
<div id="canvas">
    <div id="box_wrapper">

        <!-- template sections -->
        <section class="page_breadcrumbs ds parallax section_padding_top_250 section_padding_bottom_75">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <h2 class="highlight text-uppercase"><?= $category->getTitle() ?></h2>
                    </div>
                </div>
            </div>
        </section>

        <section class="ls section_padding_top_130 section_padding_bottom_130 columns_padding_25">
            <div class="container">
                <div class="row">

                    <div class="col-sm-12 col-md-12 col-lg-12">




                        <div class="columns-3">
                                 <?php $this->widget(
                                'bootstrap.widgets.TbListView',
                                [
                                    'dataProvider' => $dataProvider,
                                    'itemView' => '//store/product/_item',
                                    'summaryText' => '',
                                    'enableHistory' => true,
                                    'cssFile' => false,
                                ]
                            ); ?>



                        </div>
                        <!-- eof .columns-* -->


                    </div>
                    <!--eof .col-sm-8 (main content)-->





                </div>
            </div>
        </section>



    </div>
    <!-- eof #box_wrapper -->
</div>