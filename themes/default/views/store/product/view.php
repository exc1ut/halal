<?php

/* @var $product Product */

$this->title = $product->getMetaTitle();
$this->description = $product->getMetaDescription();
$this->keywords = $product->getMetaKeywords();
$this->canonical = $product->getMetaCanonical();

$this->breadcrumbs = array_merge(
    [Yii::t("StoreModule.store", 'Catalog') => ['/store/product/index']],
    $product->category ? $product->category->getBreadcrumbs(true) : [],
    [CHtml::encode($product->name)]
);
?>
<!-- <div class="row" xmlns="http://www.w3.org/1999/html">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="title"><?= CHtml::encode($product->getTitle()); ?></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 product-feature">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="thumbnails">
                            <div class="image-preview">
                                <img src="<?= StoreImage::product($product); ?>" id="main-image"
                                     alt="<?= CHtml::encode($product->getImageAlt()); ?>"
                                     title="<?= CHtml::encode($product->getImageTitle()); ?>"
                                >
                            </div>
                            <div class="row">
                                <div class="col-xs-4 col-md-4">
                                    <a href="<?= $product->getImageUrl(); ?>" class="thumbnail">
                                        <img src="<?= $product->getImageUrl(50, 50); ?>"
                                             alt="<?= CHtml::encode($product->getImageAlt()); ?>"
                                             title="<?= CHtml::encode($product->getImageTitle()); ?>" />
                                    </a>
                                </div>
                                <?php foreach ($product->getImages() as $key => $image): { ?>
                                    <div class="col-xs-4 col-md-4">
                                        <a href="<?= $image->getImageUrl(); ?>" class="thumbnail">
                                            <img src="<?= $image->getImageUrl(50, 50); ?>"
                                                 alt="<?= CHtml::encode($image->alt) ?>"
                                                 title="<?= CHtml::encode($image->title) ?>" />
                                        </a>
                                    </div>
                                <?php } endforeach; ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">

                        <?php if($product->isInStock()):?>
                            <span class="label label-success"><?= Yii::t("StoreModule.store", "In stock");?></span>
                            <?php if($product->quantity):?>
                                <span><?= $product->quantity; ?> <?= Yii::t("StoreModule.store", "in stock"); ?></span>
                            <?php endif;?>
                        <?php else:?>
                            <span class="label label-danger"><?= Yii::t("StoreModule.store", "Not in stock");?></span>
                        <?php endif;?>

                        <div class="properties">
                            <?php foreach ($product->getAttributeGroups() as $groupName => $items): { ?>
                                <div class="propertyGroup">
                                    <h4>
                                        <span><?= CHtml::encode($groupName); ?></span>
                                    </h4>
                                    <table>
                                        <tbody>
                                            <?php
                                            foreach ($items as $attribute): {
                                                $value = $product->attribute($attribute);

                                                if (empty($value)) continue;
                                            ?>
                                                <tr>
                                                    <td class="key">
                                                        <span><?= CHtml::encode($attribute->title); ?></span>
                                                    </td>
                                                    <td class="value">
                                                        <?= AttributeRender::renderValue($attribute, $product->attribute($attribute)); ?>
                                                    </td>
                                                </tr>
                                            <?php } endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php } endforeach; ?>
                        </div>
                        <br/>
                        <h4><?= Yii::t("StoreModule.store", "Description"); ?></h4>
                        <?= $product->short_description; ?>
                        <?php if($product->getVariantsGroup()):?>
                            <hr/>
                            <h4><?= Yii::t("StoreModule.store", "Variants"); ?></h4>
                        <?php endif;?>

                        <form action="<?= Yii::app()->createUrl('cart/cart/add'); ?>" method="post">
                            <input type="hidden" name="Product[id]" value="<?= $product->id; ?>"/>
                            <?= CHtml::hiddenField(
                                Yii::app()->getRequest()->csrfTokenName,
                                Yii::app()->getRequest()->csrfToken
                            ); ?>
                            <table class="table table-condensed">
                                <?php foreach ($product->getVariantsGroup() as $title => $variantsGroup): { ?>
                                    <tr>
                                        <td style="padding: 0;">
                                            <?= CHtml::encode($title); ?>
                                        </td>
                                        <td>
                                            <?=
                                            CHtml::dropDownList(
                                                'ProductVariant[]',
                                                null,
                                                CHtml::listData($variantsGroup, 'id', 'optionValue'),
                                                ['empty' => '', 'class' => 'form-control', 'options' => $product->getVariantsOptions()]
                                            ); ?>
                                        </td>
                                    </tr>
                                <?php } endforeach; ?>
                            </table>
                            <div>
                                <input type="hidden" id="base-price" value="<?= round($product->getResultPrice(), 2); ?>"/>

                                <p>
                                    <?= Yii::t("StoreModule.store", "Price"); ?>:
                                    <?= round($product->getBasePrice(), 2); ?> <?= Yii::t("StoreModule.store", Yii::app()->getModule('store')->currency); ?>
                                </p>

                                <p>
                                    <?= Yii::t("StoreModule.store", "Fix price with discount"); ?>:
                                    <?= round($product->getDiscountPrice(), 2); ?>
                                    <?= Yii::t("StoreModule.store", Yii::app()->getModule('store')->currency); ?>
                                </p>

                                <p>
                                    <?= Yii::t("StoreModule.store", "Discount"); ?>: <?= round($product->discount); ?>%
                                </p>

                                <p>
                                    <?= Yii::t("StoreModule.store", "Total price"); ?>: <span
                                        id="result-price"><?= round($product->getResultPrice(), 2); ?></span>
                                    <?= Yii::t("StoreModule.store", Yii::app()->getModule('store')->currency); ?>
                                </p>
                            </div>

                            <?php if (Yii::app()->hasModule('order')): ?>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                                <button class="btn btn-default product-quantity-decrease" type="button">-
                                                </button>
                                            </div>
                                            <input type="text" class="text-center form-control" value="1"
                                                   name="Product[quantity]" id="product-quantity"/>

                                            <div class="input-group-btn">
                                                <button class="btn btn-default product-quantity-increase" type="button">+
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <button class="btn btn-success pull-left" id="add-product-to-cart"
                                                data-loading-text="<?= Yii::t("StoreModule.store", "Adding"); ?>">
                                            <?= Yii::t("StoreModule.store", "Add to cart"); ?>
                                        </button>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </form>
                        <br>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <ul class="nav nav-tabs" id="myTab">
            <?php if (!empty($product->description)): ?>
                <li>
                    <a href="#description" data-toggle="tab"><?= Yii::t("StoreModule.store", "Description"); ?></a>
                </li>
            <?php endif; ?>
            <?php if (!empty($product->data)): ?>
                <li><a href="#data" data-toggle="tab"><?= Yii::t("StoreModule.store", "Data"); ?></a></li>
            <?php endif; ?>
            <li><a href="#attributes" data-toggle="tab"><?= Yii::t("StoreModule.store", "Characteristics"); ?></a></li>
            <?php if (Yii::app()->hasModule('comment')): ?>
                <li><a href="#comments-tab" data-toggle="tab"><?= Yii::t("StoreModule.store", "Comments"); ?></a></li>
            <?php endif; ?>
        </ul>

        <div class="tab-content">
            <?php if (!empty($product->description)): ?>
                <div class="tab-pane" id="description">
                    <?= $product->description; ?>
                </div>
            <?php endif; ?>
            <?php if (!empty($product->data)): ?>
                <div class="tab-pane" id="data">
                    <?= $product->data; ?>
                </div>
            <?php endif; ?>
            <div class="tab-pane" id="attributes">
                <table>
                    <tr>
                        <td><b><?= Yii::t("StoreModule.store", "Producer"); ?>:</b></td>
                        <td><?= CHtml::encode($product->getProducerName()); ?></td>
                    </tr>
                    <tr>
                        <td><b><?= Yii::t("StoreModule.store", "SKU"); ?>:</b></td>
                        <td><?= CHtml::encode($product->sku); ?></td>
                    </tr>
                    <tr>
                        <td><b><?= Yii::t("StoreModule.store", "Length"); ?>:</b></td>
                        <td><?= round($product->length, 2); ?> <?= Yii::t("StoreModule.store", "m"); ?></td>
                    </tr>
                    <tr>
                        <td><b><?= Yii::t("StoreModule.store", "Width"); ?>:</b></td>
                        <td><?= round($product->width, 2); ?> <?= Yii::t("StoreModule.store", "m"); ?></td>
                    </tr>
                    <tr>
                        <td><b><?= Yii::t("StoreModule.store", "Height"); ?>:</b></td>
                        <td><?= round($product->height, 2); ?> <?= Yii::t("StoreModule.store", "m"); ?></td>
                    </tr>
                    <tr>
                        <td><b><?= Yii::t("StoreModule.store", "Weight"); ?>:</b></td>
                        <td><?= round($product->weight, 2); ?> <?= Yii::t("StoreModule.store", "kg"); ?></td>
                    </tr>
                </table>
            </div>
            <?php if (Yii::app()->hasModule('comment')): ?>
                <div class="tab-pane" id="comments-tab">
                    <?php $this->widget('application.modules.comment.widgets.CommentsWidget', [
                        'redirectTo' => ProductHelper::getUrl($product),
                        'model' => $product,
                    ]); ?>
                </div>
            <?php endif; ?>
        </div>
    </div>
    <div class="col-sm-12">
        <?php $this->widget('application.modules.store.widgets.LinkedProductsWidget', ['product' => $product, 'code' => null,]); ?>
    </div>
</div>

<?php Yii::app()->getClientScript()->registerScript(
    "product-images",
    <<<JS
        $(".thumbnails").simpleGal({mainImage: "#main-image"});
        $("#myTab li").first().addClass('active');
        $(".tab-pane").first().addClass('active');
JS
); ?> -->



<section class="ls section_padding_top_250 section_padding_bottom_130 columns_padding_25">
				<div class="container">
					<div class="row">

						<div class="col-sm-12">


							<div itemscope="" itemtype="http://schema.org/Product" class="product type-product row columns_padding_25">

								<div class="col-sm-6">
									<div class="item-media images muted_background text-center rounded overflow_hidden">

										<a href="<?= StoreImage::product($product); ?>" itemprop="image" class="woocommerce-main-image zoom prettyPhoto" data-gal="prettyPhoto[product-gallery]">
											<img src="<?= StoreImage::product($product); ?>" class="attachment-shop_single wp-post-image" alt="" title="">
										</a>

										<div class="cs main_color3 entry-meta media-meta vertical-center text-center">
											<div class="price weight-black fontsize_30">
												<span>
													<span class="amount">$<?= round($product->getResultPrice(), 2); ?></span>
												</span>
											</div>
										</div>
									</div>
									<!--eof .images -->
									
									<!-- eof .images -->
								</div>

								<div class="summary entry-summary col-sm-6">


									<h1 itemprop="name" class="product_title text-uppercase"><?= $product->getTitle()?></h1>


									<div>
										<p><?= $product->description; ?></p>
									</div>

									

									<hr class="divider_30">

									

										

										
										

                                    <form action="<?= Yii::app()->createUrl('cart/cart/add'); ?>" method="post">
                            <input type="hidden" name="Product[id]" value="<?= $product->id; ?>"/>
                            <?= CHtml::hiddenField(
                                Yii::app()->getRequest()->csrfTokenName,
                                Yii::app()->getRequest()->csrfToken
                            ); ?>
                            
                            <?php if (Yii::app()->hasModule('order')): ?>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                                <button class="btn btn-default product-quantity-decrease" type="button">-
                                                </button>
                                            </div>
                                            <input type="text" class="text-center form-control" value="1"
                                                   name="Product[quantity]" id="product-quantity"/>

                                            <div class="input-group-btn">
                                                <button class="btn btn-default product-quantity-increase" type="button">+
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                <div class="col-sm-6">
                                    <div class="text-center">
                                        <button class="btn btn-success pull-center" id="add-product-to-cart"
                                                data-loading-text="<?= Yii::t("StoreModule.store", "Adding"); ?>">
                                            <?= Yii::t("StoreModule.store", "Add to cart"); ?>
                                        </button>
                                        </div>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </form>
								 


								</div>
								<!-- .summary.col- -->

							</div>
							<!-- .product.row -->


						</div>
						<!--eof .col-sm-8 (main content)-->

					</div>
				</div>
			</section>

