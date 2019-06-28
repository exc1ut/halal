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


<section class="ls page_about background_cover section_padding_top_250 section_padding_bottom_150">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
							<h2 class="section_header">
                            <?= $model->title?>
								<span class="small"><?= $model->title_short?></span>
							</h2>
							<?= $model->body?>
			</div>


        <div class="col-md-6">
            <img src="<?= $this->mainAssets . '/images/sosiska.png' ?>" alt="">
        </div>
    </div>
</section>













