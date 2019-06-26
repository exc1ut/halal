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

<section class="ls section_padding_top_250 section_padding_bottom_130 columns_padding_25">
				<div class="container">

					<div class="row">

						<div class="col-sm-7 col-md-8 col-lg-8">

							

							

							<h2>Billing Address</h2>

							<form class="form-horizontal checkout shop-checkout" role="form">
								
								<div class="form-group validate-required" id="billing_first_name_field">
                                    <?= $form->textFieldGroup($model, 'name'); ?>
								</div>
								<div class="form-group validate-required" id="billing_last_name_field">
                                    <?= $form->textFieldGroup($model, 'surname'); ?>
								</div>

								<div class="form-group" id="billing_company_field">
                                    <?= $form->textFieldGroup($model, 'phone'); ?>
								</div>
								<div class="form-group address-field validate-required" id="billing_address_fields">
                                    <?= $form->textFieldGroup($model, 'email'); ?>
								</div>
								<div class="form-group address-field validate-required" id="billing_city_field">
                                    <?= $form->textFieldGroup($model, 'address'); ?>
								</div>
								<div class="form-group">
                                    <?= $form->textAreaGroup($model, 'message'); ?>
                                </div>
                                <div class="place-order">
										<input type="submit" class="theme_button color1 right" name="checkout_place_order" id="place_order" value="Place order">
									</div>
							</form>

						</div>
						<!--eof .col-sm-8 (main content)-->


						


					</div>
				</div>
			</section>
            
            
<?php $this->endWidget(); ?>