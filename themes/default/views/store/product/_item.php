<div class="col-lg-4 col-sm-6">
    <article class="vertical-item content-padding with_border color_border rounded">
        <div class="item-media top_rounded overflow_hidden">
            <img src="<?= "/uploads/store/product/" . $data->image ?>" alt="">
            <div class="media-links">
                <a href="<?= ProductHelper::getUrl($data); ?>" class="abs-link"></a>
            </div>
        </div>
        <div class="item-content">
            <header class="content-justify bottommargin_25">
                <div>
                    <h4 class="text-uppercase bottommargin_10">
                        <a href="<?= ProductHelper::getUrl($data); ?>">
                            <?= $data->name ?>
                        </a>
                    </h4>
                    <span><?= $data->create_time ?></span>
                </div>
                <div>
                    <p class="price-big highlight text-right">
                        <span class="amount text-left">$<?= $data->price ?></span>
                        <span class="price-text">per visitor</span>
                    </p>
                </div>
            </header>
            <div class="entry-content">
                <a href="contact.html" class="theme_button small_button inactive min_width_button">registration closed</a>
            </div>
        </div>
    </article>
</div>