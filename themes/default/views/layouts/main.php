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
    $cs->registerCssFile($this->mainAssets . '/css/animations.css');
    $cs->registerCssFile($this->mainAssets . '/css/fonts.css');
    $cs->registerCssFile($this->mainAssets . '/css/main.css');
    $cs->registerCssFile($this->mainAssets . '/css/shop.css');
    $cs->registerCssFile($this->mainAssets . '/css/style.css');

    $cs->registerScriptFile($this->mainAssets . '/js/vendor/modernizr-2.6.2.min.js', CClientScript::POS_HEAD);
    $cs->registerScriptFile($this->mainAssets . '/js/compressed.js', CClientScript::POS_END);
    $cs->registerScriptFile($this->mainAssets . '/js/main.js', CClientScript::POS_END);
    ?>
</head>

<body>
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
								<a href="index.html" class="logo top_logo">
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
				<div class="ls ms search_form_wrapper hidden-xs hidden-sm">
					<div class="container">
						<div class="row columns_margin_top_20 columns_margin_bottom_20">
							<div class="col-sm-12">

								<div class="widget_search">
									<form method="get" class="searchform" action="http://webdesign-finder.com/">
										<div class="form-group margin_0">
											<label class="sr-only" for="headeer-widget-search">Search for:</label>
											<input id="headeer-widget-search" type="text" value="" name="search" class="form-control" placeholder="Type search keyword here">
										</div>
										<button type="submit" class="theme_button">Search</button>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</header>
            
            <?= $content; ?>
        </div>
    </div>
    <div class='container'>
        <div class="row">
            <div class="col-lg-12">
                <p>This is footer</p>
                <ul class="nav nav-pills nav-stacked">

                    <li>© 2016 - <?= date('Y'); ?></li>
                </ul>
            </div>
        </div>
        <!-- footer end -->
    </div>
    <div class='notifications top-right' id="notifications"></div>

</body>

</html>