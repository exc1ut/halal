<div class="col-lg-4 col-sm-6">
    <article class="vertical-item content-padding with_border color_border rounded">
        <div class="item-media top_rounded overflow_hidden">
            <img src="<?= "/uploads/store/product/" . $data->image ?>" alt="">
            <div class="media-links">
                <a href="<?= ProductHelper::getUrl($data); ?>" class="abs-link"></a>
            </div>
        </div>
        <div class="item-content">
            <header class="bottommargin_25 ">
                <div>
                    <h4 class="text-uppercase bottommargin_10">
                        <a href="<?= ProductHelper::getUrl($data); ?>">
                            <?= $data->name ?>
                        </a>
                    </h4>
                    <div class="product-description">
                        <?= $data->short_description ?>
                    </div>
                </div>
                <div class="price-basket">
                    <p class="price highlight text-left">
                        <span class="amount text-left"><?= number_format($data->price) ?>$</span><br>
                        <?php if($data->discount_price):?>
                        <span class="discount"><?= number_format($data->discount_price) ?>$</span>
                        <?php endif; ?>
                    </p>
                    <a href="<?= ProductHelper::getUrl($data); ?>" class="theme_button color1 small_button min_width_button"><?= Yii::t('default', 'Add to cart'); ?></a>
                </div>
            </header>
            
        </div>
    </article>
</div>