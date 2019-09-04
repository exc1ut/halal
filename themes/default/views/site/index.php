<?php
$this->title = Yii::t('default','Halal Baraka');
$criteria = new CDbCriteria();
$criteria->with = 'category';
$criteria->compare('category.slug', 'banner');
$criteria->compare('category.lang', Yii::app()->language);
$images = Image::model()->findAll($criteria);


$certcriteria = new CDbCriteria();
$certcriteria->with = 'category';
$certcriteria->compare('category.slug', 'certification');
$certcriteria->compare('category.lang', Yii::app()->language);
$certs = Image::model()->findAll($certcriteria);
?>

<section class="intro_section section_padding_top_130  mobile-padding page_mainslider ds">
    <div class="flexslider vertical-nav" data-dots="true" data-nav="false">
        <ul class="slides">
            <?php foreach ($images as $image) : ?>
                <li>
                    <img src="<?= $image->getImageUrl(); ?>" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="slide_description_wrapper">
                                    <div class="slide_description">
                                        <div class="intro-layer" data-animation="fadeInUp">
                                            <h4 class="text-uppercase thin">
                                                <?= $image->alt; ?>
                                            </h4>
                                        </div>
                                        <div class="intro-layer" data-animation="fadeInUp">
                                            <h2 class="text-uppercase ">
                                                <?= $image->name; ?>
                                            </h2>
                                        </div>
                                        <div class="intro-layer animated fadeInUp" data-animation="fadeInUp" style="visibility: hidden;">
													<a href="<?= $image->description?>" class="theme_button color1">
											<?=Yii::t('default','Go to Shop')?>
										</a>
												</div>
                                        

                                    </div>
                                    <!-- eof .slide_description -->
                                </div>
                                <!-- eof .slide_description_wrapper -->
                            </div>
                            <!-- eof .col-* -->
                        </div>
                        <!-- eof .row -->
                    </div>
                    <!-- eof .container -->
                </li>
            <?php endforeach; ?>

        </ul>
    </div>
    <!-- eof flexslider -->

</section>

<section class="ls page_about background_cover section_padding_top_130 section_padding_bottom_150">
    <div class="container">
        <div class="row">
        <div class="col-md-6">
            <?php $this->widget(
                "application.modules.contentblock.widgets.ContentBlockWidget",
                ["code" => "about-" . Yii::app()->language, 'view' => 'about']
            );
            ?>
        </div>
            <div class="col-md-6">
                <img src="<?= $this->mainAssets . '/images/about_page.jpg' ?>" alt="">
            </div>
        </div>
    </div>
</section>
<?php $this->widget(
    "application.modules.store.widgets.LatestProducts",
    ['view' => 'products']

);
?>
<?php $this->widget(
    "application.modules.store.widgets.DiscountProducts",
    ['view' => 'products']

);
?>

<?php $this->widget(
    "application.modules.store.widgets.HotProducts",
    ['view' => 'products']

);
?>


<?php $this->widget(
    "application.modules.contentblock.widgets.ContentBlockWidget",
    ["code" => "statistics-". Yii::app()->language]
);
?>
<section class="certification padding-80">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h2 class="section_header">
                    <?= Yii::t('default', 'Our achievements'); ?>
                </h2>
            </div>
        </div>
        <div class="row">
        <div class="isotope_container isotope row masonry-layout columns_margin_bottom_20" data-filters=".isotope_filters">
        <?php foreach($certs as $cert) : ?>
<div class="isotope-item col-lg-6 col-md-6 col-sm-6">
    <div class="row">
        <div class="item-media col-sm-6">
            <div class="image-wrapper">
                <img src="<?= $cert->getImageUrl(); ?>" alt="">
                <div class="media-links">
                    <a href="<?= $cert->getImageUrl(); ?>" class="abs-link prettyPhoto" title="" data-gal="prettyPhoto[gal]"></a>
                </div>
                        </div>
        </div>
        <div class="item-content col-sm-6">
                    <p class="cert-text">
                        <?= $cert->description?>
                    </p>
        </div>
    </div>
</div>
<?php endforeach; ?>
</div>
            
        </div>

    </div>
</section>
