<!DOCTYPE html>
<html lang="<?= Yii::app()->language; ?>">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Language" content="ru-RU" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><?= $this->title; ?></title>
    <meta name="description" content="<?= $this->description; ?>" />
    <meta name="keywords" content="<?= $this->keywords; ?>" />
    <?php
	$cs = Yii::app()->getClientScript();
	$cs->registerCssFile('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800&display=swap&subset=cyrillic-ext');
    $cs->registerCssFile('https://fonts.googleapis.com/css?family=Vollkorn:400,600,700,900&dis play=swap&subset=cyrillic-ext');
    $cs->registerCssFile($this->mainAssets . '/css/animations.css');
    $cs->registerCssFile($this->mainAssets . '/css/fonts.css');
    $cs->registerCssFile($this->mainAssets . '/css/main.css');
    $cs->registerCssFile($this->mainAssets . '/css/shop.css');
    $cs->registerCssFile($this->mainAssets . '/css/style.css');

    $cs->registerScriptFile($this->mainAssets . '/js/vendor/modernizr-2.6.2.min.js', CClientScript::POS_HEAD);
    $cs->registerScriptFile($this->mainAssets . '/js/compressed.js', CClientScript::POS_END);
	$cs->registerScriptFile($this->mainAssets . '/js/main.js', CClientScript::POS_END);
	$cs->registerScriptFile($this->mainAssets . '/js/store.js', CClientScript::POS_END);
	$cs->registerScriptFile($this->mainAssets . '/js/bootstrap-notify.js', CClientScript::POS_END);
	$cs->registerScriptFile($this->mainAssets . '/js/myjs.js', CClientScript::POS_END);
	?>
	<script type="text/javascript">
        var yupeTokenName = '<?= Yii::app()->getRequest()->csrfTokenName;?>';
        var yupeToken = '<?= Yii::app()->getRequest()->getCsrfToken();?>';
        var yupeCartDeleteProductUrl = '<?= Yii::app()->createUrl('/cart/cart/delete/')?>';
        var yupeCartUpdateUrl = '<?= Yii::app()->createUrl('/cart/cart/update/')?>';
        var yupeCartWidgetUrl = '<?= Yii::app()->createUrl('/cart/cart/widget/')?>';
        var productVariantUrl = '<?= Yii::app()->createUrl('/store/product/getLinkedVariants')?>';
    </script>
</head>

<body>
<section class="modal modalWindow" id="popupOne"> 
<div class="align-middle">
<div class="container">
					
						<div class="row">
						<div class=" col-lg-4 col-sm-4">
							<div id="english" class="teaser main_bg_color offset_icon hover_icon rounded text-center">
								<div class="teaser_icon main_bg_color size_small round">
									<i class="fa fa-language" aria-hidden="true"></i>
								</div>
								<h4 class="text-uppercase">
									<a href="/en">
							ENGLISH
						</a>
								</h4>
								
							</div>
						</div>
						<div class=" col-lg-4 col-sm-4">
							<div id="russian" class="teaser main_bg_color2 offset_icon hover_icon rounded text-center">
								<div class="teaser_icon main_bg_color2 size_small round">
									<i class="fa fa-language" aria-hidden="true"></i>
								</div>
								<h4 class="text-uppercase">
									<a href="/ru">
							РУССКИЙ
						</a>
								</h4>
								
							</div>
						</div>
						<div class=" col-lg-4 col-sm-4">
							<div id="korean" class="teaser main_bg_color3 offset_icon hover_icon rounded text-center">
								<div  class="teaser_icon main_bg_color3 size_small round">
									<i class="fa fa-language" aria-hidden="true"></i>
								</div>
								<h4 class="text-uppercase">
									<a href="/kr">
									한국어
						</a>
								</h4>
								
							</div>
						</div>
						
					</div>
					</div>
				</div>
</section>
    <div id="canvas">
        <div id="box_wrapper">
        <section class="page_topline ds table_section table_section_sm section_padding_top_5 section_padding_bottom_5">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 text-center text-sm-left">
							<div class="small-text">
									<i class="fa fa-phone"></i>
								<span class="grey inline-block rightpadding_5">+99890 777 777 77</span>
								
							</div>
						</div>
						<div class="col-sm-4 text-center text-sm-right">
							<a class="social-icon color-icon soc-instagram" href="#" title="Instagram"></a>
							<a class="social-icon color-icon soc-youtube" href="#" title="Youtube"></a>
							<a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
							<a class="social-icon color-icon soc-telegram" href="#" title="Telegram"></a>	
						</div>
					</div>
				</div>
			</section>
        <header class="page_header header_transparent toggler_right section_padding_20">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 display_table">
                        <div class="header_left_logo display_table_cell">
								<a href="/" class="logo top_logo">
									<img src="<?= $this->mainAssets . '/images/logo.png'?>" alt="">
								</a>
							</div>

							<div class="header_mainmenu display_table_cell text-right">
								<!-- main nav start -->
								<nav class="mainmenu_wrapper">
                                <?php $this->widget('application.modules.menu.widgets.MenuWidget', ['name' => 'top-menu-uz']); ?>
								</nav>
								<!-- eof main nav -->
								<!-- header toggler -->
								<span class="toggle_menu">
									<span></span>
								</span>
							</div>
						</div>
					</div>
				</div>
				
			</header>
            
            <?= $content; ?>
        </div>
    </div>
	
	<footer>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="footer-logo-text">
					<img src="<?= $this->mainAssets . '/images/logo.png'?>" alt="">
					
                    <p><?= Yii::t('default', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,'); ?></p>
                </div>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-3 contact-info">
                <h2>
				<?= Yii::t('default', 'Our contacts'); ?>
                
                </h2>
                <div class="footer-phone">
                    <img src="<?= $this->mainAssets . '/images/044-call-1.png'?>" alt="">
                    <span>
                        +777 777 77 77
                    </span>
                </div>
                <div>
					<img src="<?= $this->mainAssets . '/images/location.png'?>" alt="">
					
					<span><?= Yii::t('default', 'Lorem Ipsum is simply'); ?></span>
				</div>
				<div>
					<img src="<?= $this->mainAssets . '/images/mail.png'?>" alt="">
					<span>
						info@example.com					
					</span>	
				</div>


				<div class="bottom-contact-info">
					<h2>
					<?= Yii::t('default', 'Follow Us'); ?>
					</h2>
					<div class="footer-icon">
					<img src="<?= $this->mainAssets . '/images/telegram.png'?>" alt="">
					<img src="<?= $this->mainAssets . '/images/facebook.png'?>" alt="">
					<img src="<?= $this->mainAssets . '/images/instagram.png'?>" alt="">
					<img src="<?= $this->mainAssets . '/images/youtube.png'?>" alt="">
					</div>
				</div>
            </div>
            <div class="col-sm-1">
										
			</div>
            <div class="col-sm-4 footer-contact">
				<form action="/" method="post">
				
				<input type="hidden" value="<?= Yii::app()->getRequest()->getCsrfToken();?>" name="OQILACMS_TOKEN">
				
				<h3 class="text-uppercase footer-contact-header"><?= Yii::t('default', 'Contact Form'); ?></h3>

                                <div class="col-sm-6">
                    <div class="contact-form-name">
                        <div class="form-group"><label class="control-label" for="Contact_name"> <?= Yii::t('default', 'Name'); ?> </label><input class="form-control" placeholder="Name" name="name" id="Contact_name" type="text"><div class="help-block error" id="Contact_name_em_" style="display:none"></div></div>                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="contact-form-phone">
                    <div class="form-group"><label class="control-label" for="Contact_phone"><?= Yii::t('default', 'Phone'); ?> </label><input class="form-control" placeholder="Phone" name="phone" id="Contact_phone" type="text"><div class="help-block error" id="Contact_phone_em_" style="display:none"></div></div>                    </div>
                </div>
                <div class="col-sm-12">

                    <div class="contact-form-message">
                    <div class="form-group"><label class="control-label" for="Contact_message"><?= Yii::t('default', 'Message'); ?></label><textarea class="form-control" placeholder="Message" name="message" id="Contact_message"></textarea><div class="help-block error" id="Contact_message_em_" style="display:none"></div></div>                    </div>
                </div>

                <div class="col-sm-12">

                    <div class="contact-form-submit topmargin_10">
                        <button type="submit" id="contact_form_submit" name="contact_submit" class="theme_button color1 wide_button"><?= Yii::t('default', 'Send now!'); ?></button>
                    </div>
                </div>


                
				</form>
			</div>
			
        </div>
    </div>
</footer>
    <div class='notifications top-right' id="notifications">
	</div>
</body>

</html>