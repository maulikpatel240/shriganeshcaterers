<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use kmergen\bootstrap5\Nav;
use kmergen\bootstrap5\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);

$pagebundle = \frontend\assets\PluginAsset::register($this)->add(['main']);
global $sg, $sconfig;
$base_url = $sg['base_url'];
$langs = json_decode($sconfig['language']['description'], true);

$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;

$gallery = $base_url . '/gallery';
$ourmenu = $base_url . '/menu';
$booktable = $base_url . '/booking';
if ($controller == 'site' && $action == 'index') {
    $hero = '#hero';
    $about = '#about';
    $menu = '#menu';
    $specials = '#specials';
    $events = '#events';
    $chefs = '#chefs';
    $contact = '#contact';
}else{
    $hero = $base_url . '#hero';
    $about = $base_url . '#about';
    $menu = $base_url . '#menu';
    $specials = $base_url . '#specials';
    $events = $base_url . '#events';
    $chefs = $base_url . '#chefs';
    $contact = $base_url . '#contact';
}
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php $this->registerCsrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <link href="<?= $base_url ?>/img/favicon.png" rel="icon">
        <link href="<?= $base_url ?>/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <?php $this->head() ?>
    </head>
    <body>
        <?php $this->beginBody() ?>

        <!-- ======= Top Bar ======= -->
        <div id="topbar" class="d-flex align-items-center fixed-top">
            <div class="container d-flex justify-content-center justify-content-md-between">
                <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-phone d-flex align-items-center"><span><?= $sconfig['phone']['value']; ?></span></i>
                    <i class="bi bi-clock d-flex align-items-center ms-4"><span><?= $sconfig['email']['value']; ?></span></i>
                </div>
                <div class="languages d-none d-md-flex align-items-center">
                    <ul>
                        <?php
                        if ($langs) {
                            foreach ($langs as $key => $lang) {
                                if ($sg['lang'] == $key) {
                                    echo '<li>' . $lang . '</li>';
                                } else {
                                    echo '<li><a href="?lang=' . $key . '">' . $lang . '</a></li>';
                                }
                            }
                        }
                        ?>
                    </ul>
                </div>
            </div>
        </div>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="<?= $base_url ?>"><?= Yii::$app->FrontFunctions->sqlColumnTranslate($sconfig['site_name'], 'value'); ?></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="<?= $hero ?>"><?= Yii::t('app', 'Home') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $about ?>"><?= Yii::t('app', 'About') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $menu ?>"><?= Yii::t('app', 'Menu') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $specials ?>"><?= Yii::t('app', 'Specials') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $events ?>"><?= Yii::t('app', 'Events') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $gallery ?>"><?= Yii::t('app', 'Gallery') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $chefs ?>"><?= Yii::t('app', 'Owner') ?></a></li>
                        <li><a class="nav-link scrollto" href="<?= $contact ?>"><?= Yii::t('app', 'Contact') ?></a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <a href="<?= $booktable ?>" class="book-a-table-btn scrollto d-none d-lg-flex"><?= Yii::t('app', 'Booking order') ?></a>

            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <?php if ($controller == 'site' && $action == 'index') { ?>
            <section id="hero" class="d-flex align-items-center">
                <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
                    <div class="row">
                        <div class="col-lg-8">
                            <h1><?= Yii::t('app', 'Welcome to {site_name}', ['site_name' => '<span>' . Yii::$app->FrontFunctions->sqlColumnTranslate($sconfig['site_name'], 'value') . '</span>']) ?></h1>
                            <h2><?= Yii::t('app', 'Has provided excellent service for {age} years!', ['age' => Yii::$app->params['company_ageofyear']]) ?></h2>

                            <div class="btns">
                                <a href="<?= $ourmenu ?>" class="btn-menu animated fadeInUp scrollto"><?= Yii::t('app', 'Our Menu') ?></a>
                                <a href="<?= $booktable ?>" class="btn-book animated fadeInUp scrollto"><?= Yii::t('app', 'Booking order') ?></a>
                            </div>
                        </div>
                        <div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
                            <a href="<?= $sconfig['welcome_video_url']['value']; ?>" class="glightbox play-btn"></a>
                        </div>

                    </div>
                </div>
            </section><!-- End Hero -->
        <?php } ?>

        <main id="main">
            <?= Alert::widget() ?>
            <?= $content ?>
        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-6 col-md-6">
                            <div class="footer-info">
                                <h3><?= Yii::$app->FrontFunctions->sqlColumnTranslate($sconfig['site_name'], 'value'); ?></h3>
                                <p>
                                    <?= $sconfig['location']['value'] ?><br><br>
                                    <strong><?= Yii::t('app', 'Phone') ?> : </strong> <?= $sconfig['phone']['value'] ?><br>
                                    <strong><?= Yii::t('app', 'Email') ?> : </strong> <?= $sconfig['email']['value'] ?><br>
                                </p>
                                <div class="social-links mt-3">
                                    <?= ($sconfig['facebook_url']['value']) ? '<a href="' . $sconfig['facebook_url']['value'] . '" class="facebook"><i class="bx bxl-facebook"></i></a>' : ''; ?>
                                    <?= ($sconfig['instagram_url']['value']) ? '<a href="' . $sconfig['instagram_url']['value'] . '" class="instagram"><i class="bx bxl-instagram"></i></a>' : ''; ?>
                                    <?= ($sconfig['twitter_url']['value']) ? '<a href="' . $sconfig['twitter_url']['value'] . '" class="twitter"><i class="bx bxl-twitter"></i></a>' : ''; ?>
                                    <?= ($sconfig['linkin_url']['value']) ? '<a href="' . $sconfig['linkin_url']['value'] . '" class="linkedin"><i class="bx bxl-linkedin"></i></a>' : ''; ?>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4><?= Yii::t('app', 'Useful Links') ?></h4>
                            <ul>
                                <?php if ($controller == 'site' && $action == 'index') { ?>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="#hero"><?= Yii::t('app', 'Home') ?></a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="#about"><?= Yii::t('app', 'About') ?></a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="#menu"><?= Yii::t('app', 'Menu') ?></a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="#gallery"><?= Yii::t('app', 'Gallery') ?></a></li>
                                <?php } else { ?>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="<?= $base_url ?>#hero"><?= Yii::t('app', 'Home') ?></a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="<?= $base_url ?>#about"><?= Yii::t('app', 'About') ?></a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="<?= $base_url ?>#menu"><?= Yii::t('app', 'Menu') ?></a></li>
                                    <li><i class="bx bx-chevron-right"></i> <a class="" href="<?= $base_url ?>#gallery"><?= Yii::t('app', 'Gallery') ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4><?= Yii::t('app', 'Our Services') ?></h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a ><?= Yii::t('app', 'Birthday parties') ?></a></li>
                                <li><i class="bx bx-chevron-right"></i> <a ><?= Yii::t('app', 'Custom parties') ?></a></li>
                                <li><i class="bx bx-chevron-right"></i> <a ><?= Yii::t('app', 'Private parties') ?></a></li>
                                <li><i class="bx bx-chevron-right"></i> <a ><?= Yii::t('app', 'Wedding parties') ?></a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    <?= Yii::t('app', '&copy; Copyright {site_name}. All Rights Reserved', ['site_name' => '<strong><span>' . Yii::$app->FrontFunctions->sqlColumnTranslate($sconfig['site_name'], 'value') . '</span></strong>']) ?>
                </div>
                <!--<div class="credits">
                    Designed by <a href="https://bootstrapmade.com/">Vandemission</a>
                </div>-->
            </div>
        </footer><!-- End Footer -->

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
