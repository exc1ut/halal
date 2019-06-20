<section class="ls section_padding_top_130 section_padding_bottom_130">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h2 class="section_header">
                    <span class="small">
                        <?= Yii::t('default', 'Upcoming'); ?>
                    </span>
                    <?= Yii::t('default', 'Camp Events'); ?>
                </h2>
            </div>
        </div>

        <div class="row columns_margin_bottom_20">


            <? foreach ($products as $product) : ?>
            <?php $this->controller->renderPartial('//store/product/_item', ['data' => $product]); ?>
            <? endforeach; ?>
        </div>
    </div>
</section>