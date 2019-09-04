<?php
$this->title = Yii::t('default','Contacts');
$form = $this->beginWidget(
    '\yupe\widgets\ActiveForm',
    [
        'id' => 'news-form',
        'enableAjaxValidation' => false,
		'enableClientValidation' => true,
		'clientOptions' => [
			'validateOnSubmit' => true
		],
        'type' => 'vertical',
        'htmlOptions' => ['class' => 'well', 'enctype' => 'multipart/form-data'],
    ]
);
$header = '<p>'.Yii::t('default','Please fix the following input errors:').'</p>';
?>

<section class="page_breadcrumbs ds parallax section_padding_top_250 section_padding_bottom_75">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h2 class="highlight text-uppercase"><?= Yii::t('default', 'Contacts') ?></h2>
            </div>
        </div>
    </div>
</section>




<section class="ls section_padding_top_100 section_padding_bottom_75">
    <div class="container">
        
        <div class="row">
            <div class="col-sm-12">
                <section id="map" class="ls ms section_padding_top_75" data-address="Terracina, LT, Italia">
                    <!-- marker description and marker icon goes here -->
                    <div class="map_marker_description">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2996.1280188231826!2d69.32643251492516!3d41.32782950764902!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38ae8abf6559df73%3A0xa9983bb6581c5995!2zT3FpbGEgLSDQodC-0LfQtNCw0L3QuNC1INC4INGA0LDQt9GA0LDQsdC-0YLQutCwINGB0LDQudGC0L7QsiDQsiDQotCw0YjQutC10L3RgtC1INC4INCyINCj0LfQsdC10LrQuNGB0YLQsNC90LU!5e0!3m2!1sen!2s!4v1561715582031!5m2!1sen!2s" width="100%" height="500px" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </section>
            </div>
        </div>

        <div class="row topmargin_40">
            <div class="col-sm-4 to_animate" data-animation="pullDown">
                <div class="teaser text-center">
                    <div class="teaser_icon highlight2 size_normal">
                        <i class="rt-icon2-phone5"></i>
                    </div>

                    <p>
                        <span class="grey">Phone:</span> +12 345 678 9123<br>
                        <span class="grey">Fax:</span> +12 345 678 9123
                    </p>

                </div>
            </div>
            <div class="col-sm-4 to_animate" data-animation="pullDown">
                <div class="teaser text-center">
                    <div class="teaser_icon highlight2 size_normal">
                        <i class="rt-icon2-location2"></i>
                    </div>

                    <p>
                        PO Box 54378<br>
                        4321 Your Address,<br>
                        Your City, Your Country
                    </p>

                </div>
            </div>
            <div class="col-sm-4 to_animate" data-animation="pullDown">
                <div class="teaser text-center">
                    <div class="teaser_icon highlight2 size_normal">
                        <i class="rt-icon2-mail"></i>
                    </div>

                    <p>smartfarm@example.com</p>

                </div>
            </div>

        </div>

        <div class="row topmargin_40">
            <div class="col-sm-12 to_animate">
                <form class="contact-form columns_padding_5" method="post" action="http://webdesign-finder.com/html/smartfarm/">
                    <div class="row">
                        <?= CHtml::errorSummary($model,$header); ?>
                    </div>
                    <div class="row">

                        <div class="col-sm-6">
                            <p class="form-group">
                                <label for="name">Full Name <span class="required">*</span></label>
                                <i class="fa fa-user highlight2" aria-hidden="true"></i>
                                <?= $form->textField($model, 'name', [
                                    'id' => 'name',
                                    'type' => 'text',
                                    'area-required' => 'true',
                                    'size' => '30',
                                    'class' => 'form-control',
                                    'placeholder' => Yii::t('default','Name'),
                                ]); ?>
                            </p>
                            <p class="form-group">
                                <label for="email">Email address<span class="required">*</span></label>
                                <i class="fa fa-envelope highlight2" aria-hidden="true"></i>
                                <?= $form->textField($model, 'email', [
                                    'id' => 'email',
                                    'type' => 'text',
                                    'area-required' => 'true',
                                    'size' => '30',
                                    'class' => 'form-control',
                                    'placeholder' => Yii::t('default','Email')
                                ]); ?>
                            </p>
                            <p class="form-group">
                                <label for="subject">Subject<span class="required">*</span></label>
                                <i class="fa fa-flag highlight2" aria-hidden="true"></i>
                                <?= $form->textField($model, 'subject', [
                                    'id' => 'subject',
                                    'type' => 'text',
                                    'area-required' => 'true',
                                    'size' => '30',
                                    'class' => 'form-control',
                                    'placeholder' => Yii::t('default','Subject')
                                ]); ?>
                            </p>
                        </div>
                        <div class="col-sm-6">

                            <p class="contact-form-message form-group">
                                <label for="message">Message</label>
                                <i class="fa fa-comment highlight2" aria-hidden="true"></i>
                                <?= $form->textArea($model, 'message', [
                                    'id' => 'message',
                                    'type' => 'text',
                                    'area-required' => 'true',
                                    'class' => 'form-control',
                                    'placeholder' => Yii::t('default','Message')
                                ]); ?>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">

                            <p class="contact-form-submit text-center topmargin_10">
                                <button type="submit" id="contact_form_submit" name="contact_submit" class="theme_button wide_button color2"><?= Yii::t('default','Send now!') ?></button>
                            </p>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</section>



<script>

(function($) {
    $.fn.goTo = function() {
        $('html, body').animate({
            scrollTop: ($(this).offset().top - 100 ) + 'px'
        }, 'fast');
        return this; // for chaining...
    }
})(jQuery);

if($('.errorSummary')){
    $('.errorSummary').goTo();
}

</script>

<?php $this->endWidget(); ?>