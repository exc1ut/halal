<section class="ls discount-price section-padding-top-80 section_padding_bottom_130">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h2 class="section_header">
					<?= Yii::t('default', 'Discount products'); ?>
				</h2>
			</div>
		</div>

		<div class="row columns_margin_bottom_20">
			<?php foreach ($products as $product) : ?>
				<?php $this->controller->renderPartial('//store/product/_item', ['data' => $product,
				'']); ?>
			<?php endforeach; ?>
		</div>
	</div>
</section>