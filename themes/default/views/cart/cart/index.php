<?php
/* @var $this CartController */
/* @var $positions Product[] */
/* @var $order Order */
/* @var $coupons Coupon[] */

$mainAssets = Yii::app()->getTheme()->getAssetsUrl();

Yii::app()->getClientScript()->registerScriptFile($mainAssets . '/js/store.js');
Yii::app()->getClientScript()->registerCssFile($mainAssets . '/css/cart-frontend.css');

$this->title = Yii::t('CartModule.cart', 'Cart');
$this->breadcrumbs = [
    Yii::t("CartModule.cart", 'Catalog') => ['/store/product/index'],
    Yii::t("CartModule.cart", 'Cart')
];
?>


<script type="text/javascript">
    var yupeCartDeleteProductUrl = '<?= Yii::app()->createUrl('/cart/cart/delete/') ?>';
    var yupeCartUpdateUrl = '<?= Yii::app()->createUrl('/cart/cart/update/') ?>';
    var yupeCartWidgetUrl = '<?= Yii::app()->createUrl('/cart/cart/widget/') ?>';
    var yupeCartEmptyMessage = '<h1><?= Yii::t("CartModule.cart", "Cart is empty"); ?></h1><?= Yii::t("CartModule.cart", "There are no products in cart"); ?>';
</script>

<div class="row ">
    <div class="container">
        <div id="cart-body section-padding-top-250" style="padding-top:150px" class="col-sm-12">
            <?php if (Yii::app()->cart->isEmpty()) : ?>
                <h1><?= Yii::t("CartModule.cart", "Cart is empty"); ?></h1>
                <?= Yii::t("CartModule.cart", "There are no products in cart"); ?>
            <?php else : ?>
                <?php
                $form = $this->beginWidget(
                    'bootstrap.widgets.TbActiveForm',
                    [
                        'action' => ['/order/order/create'],
                        'id' => 'order-form',
                        'enableAjaxValidation' => false,
                        'enableClientValidation' => true,
                        'clientOptions' => [
                            'validateOnSubmit' => true,
                            'validateOnChange' => true,
                            'validateOnType' => false,
                            'beforeValidate' => 'js:function(form){$(form).find("button[type=\'submit\']").prop("disabled", true); return true;}',
                            'afterValidate' => 'js:function(form, data, hasError){$(form).find("button[type=\'submit\']").prop("disabled", false); return !hasError;}',
                        ],
                        'htmlOptions' => [
                            'hideErrorMessage' => false,
                            'class' => 'order-form',
                        ]
                    ]
                );
                ?>
                <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th><?= Yii::t("CartModule.cart", "Product"); ?></th>
                            <th><?= Yii::t("CartModule.cart", "Amount"); ?></th>
                            <th class="text-center"><?= Yii::t("CartModule.cart", "Price"); ?></th>
                            <th class="text-center"><?= Yii::t("CartModule.cart", "Sum"); ?></th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($positions as $position) : ?>
                            <tr class="cart-position">
                                <td class="col-sm-5">
                                    <?php $positionId = $position->getId(); ?>
                                    <?= CHtml::hiddenField('OrderProduct[' . $positionId . '][product_id]', $position->id); ?>
                                    <input type="hidden" class="position-id" value="<?= $positionId; ?>" />

                                    <div class="media">
                                        <?php $productUrl = ProductHelper::getUrl($position); ?>
                                        <a class="img-thumbnail pull-left" href="<?= $productUrl; ?>">
                                            <img class="media-object" src="<?= $position->getProductModel()->getImageUrl(72, 72); ?>">
                                        </a>

                                        <div class="media-body">
                                            <h4 class="media-heading">
                                                <a href="<?= $productUrl; ?>"><?= $position->name; ?></a>
                                            </h4>
                                            <?php foreach ($position->selectedVariants as $variant) : ?>
                                                <h6><?= $variant->attribute->title; ?>: <?= $variant->getOptionValue(); ?></h6>
                                                <?= CHtml::hiddenField('OrderProduct[' . $positionId . '][variant_ids][]', $variant->id); ?>
                                            <?php endforeach; ?>
                                            <span>
                                                <?= Yii::t("CartModule.cart", "Status"); ?>:
                                            </span>
                                            <span class="text-<?= $position->in_stock ? "success" : "warning"; ?>">
                                                <strong><?= $position->in_stock ? Yii::t("CartModule.cart", "In stock") : Yii::t("CartModule.cart", "Not in stock"); ?></strong>
                                            </span>
                                        </div>
                                    </div>
                                </td>
                                <td class="col-sm-2">




                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button data-target="#cart_<?= $positionId; ?>" class="btn btn-default cart-quantity-decrease" type="button">-
                                            </button>
                                        </div>
                                        <?= CHtml::textField(
                                            'OrderProduct[' . $positionId . '][quantity]',
                                            $position->getQuantity(),
                                            ['id' => 'cart_' . $positionId, 'class' => 'position-count']
                                        ); ?>

                                        <div class="input-group-btn">
                                            <button class="btn btn-default cart-quantity-increase" type="button" data-target="#cart_<?= $positionId; ?>"> +
                                            </button>
                                        </div>
                                    </div>



                                </td>
                                <td class="col-sm-2 text-center">
                                    <strong>
                                        <span class="position-price"><?= $position->getPrice(); ?></span>
                                        <?= Yii::t("CartModule.cart", Yii::app()->getModule('store')->currency); ?>
                                    </strong>
                                </td>
                                <td class="col-sm-2 text-center">
                                    <strong>
                                        <span class="position-sum-price"><?= $position->getSumPrice(); ?></span>
                                        <?= Yii::t("CartModule.cart", Yii::app()->getModule('store')->currency); ?>
                                    </strong>
                                </td>
                                <td class="col-sm-1 text-right">
                                    <a href="#" class="remove fontsize_20 cart-delete-product" title="Remove this item">
                                        <i class="fa fa-trash-o"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                        <tr>
                            <td>  </td>
                            <td colspan="2">
                                <h5><?= Yii::t("CartModule.cart", "Subtotal"); ?></h5>
                            </td>
                            <td colspan="2" style="text-align: right;">
                                <h4>
                                    <strong id="cart-full-cost">
                                        <?= round(Yii::app()->cart->getCost(),2); ?>
                                    </strong>
                                    <?= Yii::t("CartModule.cart", Yii::app()->getModule('store')->currency); ?>
                                </h4>
                            </td>
                        </tr>
                        <tr>
                            <td>  </td>
                            <td colspan="2">
                                <h4><?= Yii::t("CartModule.cart", "Total"); ?></h4>
                            </td>
                            <td colspan="2" style="text-align: right;">
                                <h4><strong id="cart-full-cost-with-shipping">0</strong> <?= Yii::t("CartModule.cart", Yii::app()->getModule('store')->currency); ?></h4>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align: right;">

                                <a href="/order" class="theme_button color1">
                                    <?= Yii::t("CartModule.cart", "Create order and proceed to payment"); ?>
                                    <span class="glyphicon glyphicon-play"></span>
                                    </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>
                <?php $this->endWidget(); ?>
            <?php endif; ?>
        </div>
    </div>
</div>