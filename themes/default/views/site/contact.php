<?php

$form = $this->beginWidget(
    '\yupe\widgets\ActiveForm',
    [
        'id' => 'news-form',
        'enableAjaxValidation' => false,
        'enableClientValidation' => true,
        'type' => 'vertical',
        'htmlOptions' => ['class' => 'well', 'enctype' => 'multipart/form-data'],
    ]
);

?>





<section class="ls columns_padding_25 section_padding_top_250 section_padding_bottom_100">
    <div class="container">
        <div class="row">

            <div class="col-sm-8 to_animate" data-animation="scaleAppear">

                <h3 class="text-uppercase">Contact Form</h3>

                <?php echo CHtml::errorSummary($model); ?>
                <div class="col-sm-6">
                    <div class="contact-form-name">
                        <?= $form->textFieldGroup($model, 'name'); ?>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="contact-form-phone">
                    <?= $form->textFieldGroup($model, 'phone'); ?>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="contact-form-email">
                    <?= $form->textFieldGroup($model, 'email'); ?>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="contact-form-address">
                    <?= $form->textFieldGroup($model, 'address'); ?>
                    </div>
                </div>
                <div class="col-sm-12">

                    <div class="contact-form-message">
                    <?= $form->textAreaGroup($model, 'message'); ?>
                    </div>
                </div>

                <div class="col-sm-12">

                    <div class="contact-form-submit topmargin_10">
                        <button type="submit" id="contact_form_submit" name="contact_submit" class="theme_button color1 wide_button"><?= Yii::t('default','Send now!')?></button>
                    </div>
                </div>


                </form>
            </div>
            <!--.col-* -->

            <div class="col-sm-4 to_animate" data-animation="scaleAppear">

                <h3 class="text-uppercase">Contact Info</h3>

                <p>
                    <i class="fa fa-map-marker fontsize_18 highlight rightpadding_10" aria-hidden="true"></i> 4518 Spirit Drive, Deland, FL 32720
                </p>
                <p>
                    <i class="fa fa-phone fontsize_18 highlight rightpadding_10" aria-hidden="true"></i> 101 123 456 789
                </p>
                <p>
                    <i class="fa fa-envelope fontsize_18 highlight rightpadding_10" aria-hidden="true"></i> smartfarm@example.com
                </p>
                <p class="greylinks">
                    <i class="fa fa-internet-explorer fontsize_18 highlight rightpadding_10" aria-hidden="true"></i> <a href="#0">www.smart_farm.com</a>
                </p>

            </div>
            <!--.col-* -->

        </div>
        <!--.row -->

    </div>
    <!--.container -->

</section>

<?php $this->endWidget(); ?>