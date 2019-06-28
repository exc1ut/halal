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

<section class="page_breadcrumbs ds parallax section_padding_top_250 section_padding_bottom_75">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center">
							<h2 class="highlight text-uppercase"><?=Yii::t('default','Contacts')?></h2>
						</div>
					</div>
				</div>
			</section>


<section id="map" class="ls" data-address="Terracina, LT, Italia">
    <!-- marker description and marker icon goes here -->
    <div class="map_marker_description">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2996.1280188231826!2d69.32643251492516!3d41.32782950764902!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38ae8abf6559df73%3A0xa9983bb6581c5995!2zT3FpbGEgLSDQodC-0LfQtNCw0L3QuNC1INC4INGA0LDQt9GA0LDQsdC-0YLQutCwINGB0LDQudGC0L7QsiDQsiDQotCw0YjQutC10L3RgtC1INC4INCyINCj0LfQsdC10LrQuNGB0YLQsNC90LU!5e0!3m2!1sen!2s!4v1561715582031!5m2!1sen!2s" width="100%" height="500px" frameborder="0" style="border:0" allowfullscreen></iframe>
    </div>
</section>

<section class="ls columns_padding_25 section_padding_top_100 section_padding_bottom_100">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3 class="module-header">Contact Form</h3>
            </div>
        </div>
        <div class="row">

            <div class="col-md-8 to_animate" data-animation="scaleAppear">

                <form class="contact-form columns_padding_5" method="post" action="http://webdesign-finder.com/html/smartfarm/">


                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="name">Full Name
                                <span class="required">*</span>
                            </label>
                            <i class="fa fa-user highlight2" aria-hidden="true"></i>
                            <?= $form->textField($model, 'name', [
                                'id' => 'name',
                                'type' => 'text',
                                'area-required' => 'true',
                                'size' => '30',
                                'class' => 'form-control',
                                'placeholder' => 'Name'
                            ]); ?>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="phone">Phone Number
                                <span class="required">*</span>
                            </label>
                            <i class="fa fa-phone highlight2" aria-hidden="true"></i>
                            <?= $form->textField($model, 'phone', [
                                'id' => 'phone',
                                'type' => 'text',
                                'area-required' => 'true',
                                'size' => '30',
                                'class' => 'form-control',
                                'placeholder' => 'Phone'
                            ]); ?>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="email">Email address
                                <span class="required">*</span>
                            </label>
                            <i class="fa fa-envelope highlight2" aria-hidden="true"></i>
                            <?= $form->textField($model, 'email', [
                                'id' => 'email',
                                'type' => 'text',
                                'area-required' => 'true',
                                'size' => '30',
                                'class' => 'form-control',
                                'placeholder' => 'Email'
                            ]); ?>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="subject">Subject
                                <span class="required">*</span>
                            </label>
                            <i class="fa fa-flag highlight2" aria-hidden="true"></i>
                            <?= $form->textField($model, 'subject', [
                                'id' => 'subject',
                                'type' => 'text',
                                'area-required' => 'true',
                                'size' => '30',
                                'class' => 'form-control',
                                'placeholder' => 'subject'
                            ]); ?>
                        </div>
                    </div>
                    <div class="col-sm-12">

                        <div class="contact-form-message form-group">
                            <label for="message">Message</label>
                            <i class="fa fa-comment highlight2" aria-hidden="true"></i>
                            <?= $form->textArea($model, 'message', [
                                'id' => 'message',
                                'type' => 'text',
                                'area-required' => 'true',
                                'class' => 'form-control',
                                'placeholder' => 'Message'
                            ]); ?>
                        </div>
                    </div>

                    <div class="col-sm-12 bottommargin_0">

                        <div class="contact-form-submit topmargin_10">
                            <button type="submit" id="contact_form_submit" name="contact_submit" class="theme_button color2 wide_button margin_0">Send message</button>
                        </div>
                    </div>


                </form>
            </div>

            <div class="col-md-4 to_animate" data-animation="scaleAppear">

                <ul class="list1 no-bullets no-top-border no-bottom-border">

                    <li>
                        <div class="media">
                            <div class="media-left">
                                <i class="rt-icon2-shop highlight2 fontsize_18"></i>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading grey">Postal Address:</h5>
                                PO Box 97845 Some str. 567, Los Angeles, California, United States
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="media">
                            <div class="media-left">
                                <i class="rt-icon2-phone5 highlight2 fontsize_18"></i>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading grey">Phone:</h5>
                                8(800) 123-12345
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="media">
                            <div class="media-left">
                                <i class="rt-icon2-stack4 highlight2 fontsize_18"></i>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading grey">Fax:</h5>
                                8(800) 123-12345
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="media">
                            <div class="media-left">
                                <i class="rt-icon2-mail highlight2 fontsize_18"></i>
                            </div>
                            <div class="media-body greylinks">
                                <h5 class="media-heading grey">Email:</h5>
                                <a href="mailto:your@mail.com">smartfarm@example.com</a>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</section>





<?php $this->endWidget(); ?>