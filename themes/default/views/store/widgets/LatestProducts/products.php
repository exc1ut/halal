<section class="ls last-added-products section-padding-top-80 section_padding_bottom_130">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h2 class="section_header">
					<?= Yii::t('default', 'Latest products'); ?>
				</h2>
			</div>
		</div>

		<div class="row">
			<?php foreach ($products as $product) : ?>
				<?php $this->controller->renderPartial('//store/product/_item', ['data' => $product]); ?>
			<?php endforeach; ?>
		</div>
	</div>
</section>