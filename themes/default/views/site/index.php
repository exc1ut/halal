<?php
$this->title = Yii::app()->getModule('yupe')->siteName;
$criteria = new CDbCriteria();
$criteria->with = 'category';
$criteria->compare('category.slug', 'banner');
$criteria->compare('category.lang', Yii::app()->language);
$images = Image::model()->findAll($criteria);
?>

<section class="intro_section page_mainslider ds">
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
                                            <h4 class="text-uppercase">
                                                <?= $image->alt; ?>
                                            </h4>
                                        </div>
                                        <div class="intro-layer" data-animation="fadeInUp">
                                            <h2 class="text-uppercase thin">
                                                <?= $image->name; ?>
                                            </h2>
                                        </div>
                                        <a href="events-left.html" class="theme_button color1">
											Go to shop
										</a>

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
            <?php $this->widget(
                "application.modules.contentblock.widgets.ContentBlockWidget",
                ["code" => "about-" . Yii::app()->language, 'view' => 'about']
            );
            ?>
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
    ["code" => "statistics-uz"]);
?>