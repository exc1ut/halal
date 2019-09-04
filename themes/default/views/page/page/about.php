<?php
/* @var $model Page */
/* @var $this PageController */

if ($model->layout) {
    $this->layout = "//layouts/{$model->layout}";
}

$this->title = $model->title;
$this->breadcrumbs = $this->getBreadCrumbs();
$this->description = $model->description ?: Yii::app()->getModule('yupe')->siteDescription;
$this->keywords = $model->keywords ?: Yii::app()->getModule('yupe')->siteKeyWords;

$certcriteria = new CDbCriteria();
$certcriteria->with = 'category';
$certcriteria->compare('category.slug', 'certification');
$certcriteria->compare('category.lang', Yii::app()->language);
$certs = Image::model()->findAll($certcriteria);
?>


<section class="page_breadcrumbs ds parallax section_padding_top_250 section_padding_bottom_75">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center">
							<h2 class="highlight text-uppercase"><?=Yii::t('default','About us')?></h2>
						</div>
					</div>
				</div>
			</section>

<section class="ls page_about background_cover section_padding_top_250">
    <div class="container">
        <div class="row">
		
        <div class="col-md-6">
            <?= $model->body; ?>
        </div>

        <div class="col-md-6">
            <img src="<?= $this->mainAssets . '/images/about_page.jpg' ?>" alt="">
        </div>
    </div>
</section>

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













