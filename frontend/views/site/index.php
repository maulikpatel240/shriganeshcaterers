<?php
/* @var $this yii\web\View */

use yii\bootstrap5\ActiveForm;
use yii\helpers\Url;
use yii\helpers\Html;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use kartik\rating\StarRating;

$this->title = 'Project';
global $sg, $sconfig;
$base_url = $sg['base_url'];
$aboutus = Yii::$app->SqlFunctions->custompages(['page_name' => 'aboutus']);
?>
<!-- ======= About Section ======= -->
<?php if ($aboutus) { ?>
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">
            <div class="row">
                <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
                    <div class="about-img">
                        <img src="<?= $base_url . '/uploads/custompage/' . $aboutus['image'] ?>" alt="">
                    </div>
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                    <?= Yii::$app->FrontFunctions->sqlColumnTranslate($aboutus, 'page_content_english', 'page_content_') ?>
                </div>
            </div>
        </div>
    </section>
<?php } ?>
<!-- End About Section -->

<!-- ======= Why Us Section ======= -->
<section id="why-us" class="why-us">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2><?= Yii::t('app', 'Why Us') ?></h2>
            <p><?= Yii::t('app', 'Why Choose Our Cateres') ?></p>
        </div>

        <div class="row">

            <div class="col-lg-4">
                <div class="box h-100" data-aos="zoom-in" data-aos-delay="100">
                    <span>01</span>
                    <h4><?= Yii::t('app', 'Quality') ?></h4>
                    <p><?= Yii::t('app', 'Food quality is an important factor in the success of a food product.') ?></p>
                </div>
            </div>

            <div class="col-lg-4 mt-4 mt-lg-0">
                <div class="box h-100" data-aos="zoom-in" data-aos-delay="200">
                    <span>02</span>
                    <h4><?= Yii::t('app', 'Service') ?></h4>
                    <p><?= Yii::t('app', 'Food service or catering industry defines those businesses, institutions, and companies.') ?></p>
                </div>
            </div>

            <div class="col-lg-4 mt-4 mt-lg-0">
                <div class="box h-100" data-aos="zoom-in" data-aos-delay="300">
                    <span>03</span>
                    <h4><?= Yii::t('app', 'Safety') ?></h4>
                    <p><?= Yii::t('app', 'Food safety refers to routines in the preparation, handling and storage of food meant to prevent foodborne illness and injury.') ?></p>
                </div>
            </div>

        </div>

    </div>
</section><!-- End Why Us Section -->

<!-- ======= Menu Section ======= -->
<section id="menu" class="menu section-bg">
    <div class="container" data-aos="fade-up">
        <div class="section-title">
            <h2><?= Yii::t('app', 'Menu') ?></h2>
            <p><?= Yii::t('app', 'Check Our Tasty Menu') ?></p>
        </div>
        <?php if ($categories) { ?>
            <div class="row" data-aos="fade-up" data-aos-delay="100">
                <div class="col-lg-12 d-flex justify-content-center">
                    <ul id="menu-flters">
                        <li class=""><a class="btn-menu animated fadeInUp" href="<?=$base_url.'/menu?tab=all'?>"><?= Yii::t('app', 'All') ?></a></li>
                        <?php foreach ($categories as $cat) { ?>
                        <li class=""><a class="btn-menu animated fadeInUp"  href="<?=$base_url.'/menu?tab='.$cat[$sg['language']]?>"><?= $cat[$sg['language']]; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        <?php } ?>
    </div>
</section><!-- End Menu Section -->

<!-- ======= Specials Section ======= -->
<section id="specials" class="specials">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2><?= Yii::t('app', 'Specials') ?></h2>
            <p><?= Yii::t('app', 'Check Our Specials') ?></p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
            <div class="col-lg-3">
                <ul class="nav nav-tabs flex-column">
                    <li class="nav-item">
                        <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Modi sit est</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Unde praesentium sed</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Pariatur explicabo vel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Nostrum qui quasi</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#tab-5">Iusto ut expedita aut</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-9 mt-4 mt-lg-0">
                <div class="tab-content">
                    <div class="tab-pane active show" id="tab-1">
                        <div class="row">
                            <div class="col-lg-8 details order-2 order-lg-1">
                                <h3>Architecto ut aperiam autem id</h3>
                                <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                                <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
                            </div>
                            <div class="col-lg-4 text-center order-1 order-lg-2">
                                <img src="<?= $base_url; ?>/img/specials-1.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <div class="row">
                            <div class="col-lg-8 details order-2 order-lg-1">
                                <h3>Et blanditiis nemo veritatis excepturi</h3>
                                <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                                <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt sunt est. Non aliquid repellendus itaque accusamus eius et velit ipsa voluptates. Optio nesciunt eaque beatae accusamus lerode pakto madirna desera vafle de nideran pal</p>
                            </div>
                            <div class="col-lg-4 text-center order-1 order-lg-2">
                                <img src="<?= $base_url; ?>/img/specials-2.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-3">
                        <div class="row">
                            <div class="col-lg-8 details order-2 order-lg-1">
                                <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                                <p class="fst-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui natus non sunt dicta dolor et. In asperiores velit quaerat perferendis aut</p>
                                <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque necessitatibus illo rerum eum ut. Commodi ipsam minima molestiae sed laboriosam a iste odio. Earum odit nesciunt fugiat sit ullam. Soluta et harum voluptatem optio quae</p>
                            </div>
                            <div class="col-lg-4 text-center order-1 order-lg-2">
                                <img src="<?= $base_url; ?>/img/specials-3.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-4">
                        <div class="row">
                            <div class="col-lg-8 details order-2 order-lg-1">
                                <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                                <p class="fst-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                                <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                            </div>
                            <div class="col-lg-4 text-center order-1 order-lg-2">
                                <img src="<?= $base_url; ?>/img/specials-4.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-5">
                        <div class="row">
                            <div class="col-lg-8 details order-2 order-lg-1">
                                <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                                <p class="fst-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                                <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus. Omnis recusandae ut non quam ut quod eius qui. Ipsum quia odit vero atque qui quibusdam amet. Occaecati sed est sint aut vitae molestiae voluptate vel</p>
                            </div>
                            <div class="col-lg-4 text-center order-1 order-lg-2">
                                <img src="<?= $base_url; ?>/img/specials-5.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section><!-- End Specials Section -->

<!-- ======= Events Section ======= -->
<section id="events" class="events">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2><?= Yii::t('app', 'Events') ?></h2>
            <p><?= Yii::t('app', 'The True Role of Food & Beverage in Meetings and Events') ?></p>
        </div>

        <div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
            <div class="swiper-wrapper">
                <?php
                if ($eventCategories) {
                    foreach ($eventCategories as $ecat) {
                        ?>
                        <div class="swiper-slide">
                            <div class="row event-item">
                                <div class="col-lg-6">
                                    <img src="<?= $base_url . '/uploads/event-category/' . $ecat['image'] ?>" class="img-fluid" alt="">
                                </div>
                                <div class="col-lg-6 pt-4 pt-lg-0 content">
                                    <h3><?= $ecat[$sg['language']] ?></h3>
                                    <p>
                                        <?= Yii::$app->FrontFunctions->truncate(nl2br($ecat['description_' . $sg['language']]), 2000); ?>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                }
                ?>

            </div>
            <div class="swiper-pagination"></div>
        </div>

    </div>
</section><!-- End Events Section -->

<!-- ======= Chefs Section ======= -->
<section id="chefs" class="chefs">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2><?= Yii::t('app', 'Owner') ?></h2>
            <p><?= Yii::t('app', 'Our Proffesional Owner') ?></p>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-6 m-auto">
                <div class="member" data-aos="zoom-in" data-aos-delay="100">
                    <img src="<?= $base_url . '/uploads/settings/' . $sconfig['owner_photo']['value']; ?>" class="img-fluid" alt="">
                    <div class="member-info">
                        <div class="member-info-content">
                            <h4><?= $sconfig['owner_name']['value']; ?></h4>
                            <span><?= Yii::t('app', 'Owner') ?></span>
                        </div>
                        <!--<div class="social">
                            <a href=""><i class="bi bi-twitter"></i></a>
                            <a href=""><i class="bi bi-facebook"></i></a>
                            <a href=""><i class="bi bi-instagram"></i></a>
                            <a href=""><i class="bi bi-linkedin"></i></a>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>

    </div>
</section><!-- End Chefs Section -->

<!-- ======= Contact Section ======= -->
<section id="contact" class="contact">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2><?= Yii::t('app', 'Contact') ?></h2>
            <p><?= Yii::t('app', 'Contact Us') ?></p>
        </div>
    </div>

    <div data-aos="fade-up">
        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
    </div>

    <div class="container" data-aos="fade-up">

        <div class="row mt-5">

            <div class="col-lg-4">
                <div class="info">
                    <div class="address">
                        <i class="bi bi-geo-alt"></i>
                        <h4><?= Yii::t('app', 'Location') ?>:</h4>
                        <p><?= $sconfig['location']['value']; ?></p>
                    </div>

                    <div class="open-hours">
                        <i class="bi bi-clock"></i>
                        <h4><?= Yii::t('app', 'Open Hours') ?>:</h4>
                        <p>
                            <?= Yii::t('app', 'Monday-Sunday') ?>:<br>
                            24 <?= Yii::t('app', 'Hours') ?>
                        </p>
                    </div>

                    <div class="email">
                        <i class="bi bi-envelope"></i>
                        <h4><?= Yii::t('app', 'Email') ?>:</h4>
                        <p><?= $sconfig['email']['value']; ?></p>
                    </div>

                    <div class="phone">
                        <i class="bi bi-phone"></i>
                        <h4><?= Yii::t('app', 'Call') ?>:</h4>
                        <p><?= $sconfig['phone']['value']; ?></p>
                    </div>

                </div>

            </div>

            <div class="col-lg-8 mt-5 mt-lg-0">
                <?php $form = ActiveForm::begin(['action' => Url::to($base_url . '/site/review'), 'id' => 'mycontactform', 'options' => ['role' => "form", 'class' => "php-email-form"]]); ?>
                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($ReviewModel, 'name')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', 'Your Name')])->label(false); ?>
                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0">
                        <?= $form->field($ReviewModel, 'email')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', 'Your Email')])->label(false); ?>
                    </div>
                </div>
                <div class="form-group mt-3">
                    <?= $form->field($ReviewModel, 'subject')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', 'Subject')])->label(false); ?>
                </div>
                <div class="form-group mt-3">
                    <?= $form->field($ReviewModel, 'message')->textArea(['maxlength' => true, 'rows' => "3", 'placeholder' => Yii::t('app', 'Message')])->label(false); ?>
                </div>
                <div class="form-group text-center">
                    <?=
                    $form->field($ReviewModel, 'rating')->widget(StarRating::classname(), [
                        'options' => ['class' => 'd-none'],
                        'pluginOptions' => [
                            'size' => 'sm',
                            'stars' => 5,
                            'step' => 1,
                            'showCaption' => false,
                            'showClear' => false,
                        ]
                    ])->label(false);
                    ?>
                </div>
                <div class="my-3">
                    <div class="loading"><?= Yii::t('app', 'Loading') ?></div>
                    <div class="error-message"></div>
                    <div class="sent-message"><?= Yii::t('app', 'Your message has been sent. Thank you!') ?></div>
                </div>
                <div class="text-center"><?= Html::submitButton(Yii::t('app', 'Send Message'), ['class' => '']) ?></div>
                <?php ActiveForm::end(); ?>

            </div>

        </div>

    </div>
</section><!-- End Contact Section -->
<?php
AjaxForm::widget([
    'id' => 'mybookingform',
    'enableAjaxSubmit' => true,
    'ajaxSubmitOptions' => [
        'beforeSend' => new JsExpression('function() {
                $(\'#mybookingform .loading\').show();
            }'),
        'success' => new JsExpression('function(response) {
                $(\'#mybookingform .sent-message\').show();
                setTimeout(function() { $("#mybookingform .sent-message").hide(); }, 5000);
            }'),
        'complete' => new JsExpression('function() {
                $(\'#mybookingform .loading\').hide();
                $(\'#mybookingform\')[0].reset();
            }')
    ],
]);

AjaxForm::widget([
    'id' => 'mycontactform',
    'enableAjaxSubmit' => true,
    'ajaxSubmitOptions' => [
        'beforeSend' => new JsExpression('function() {
                $(\'#mycontactform .loading\').show();
            }'),
        'success' => new JsExpression('function(response) {
                $(\'#mycontactform .sent-message\').show();
                setTimeout(function() { $("#mycontactform .sent-message").hide(); }, 5000);
            }'),
        'complete' => new JsExpression('function() {
                $(\'#mycontactform .loading\').hide();
                $(\'#mycontactform\')[0].reset();
            }')
    ],
]);
?>