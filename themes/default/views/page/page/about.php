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

<section class="ls page_about background_cover section_padding_top_250 section_padding_bottom_150">
    <div class="container">
        <div class="row">
		<?php $this->widget(
                "application.modules.contentblock.widgets.ContentBlockWidget",
                ["code" => "about-" . Yii::app()->language, 'view' => 'about']
            );
            ?>


        <div class="col-md-6">
            <img src="<?= $this->mainAssets . '/images/sosiska.png' ?>" alt="">
        </div>
    </div>
</section>













