<?php
/* @var $this yii\web\View */

use yii\bootstrap5\ActiveForm;
use yii\helpers\Url;
use yii\helpers\Html;
use common\widgets\AjaxForm;
use yii\web\JsExpression;

$this->title = 'Project';
global $sg, $sconfig;
$base_url = $sg['base_url'];
?>
<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2><?= Yii::t('app', 'Booking order') ?></h2>
            <ol>
                <li><a href="<?= $base_url; ?>"><?= Yii::t('app', 'Home') ?></a></li>
                <li><?= Yii::t('app', 'Booking order') ?></li>
            </ol>
        </div>
    </div>
</section>
<section class="inner-page book-a-table section-bg" id="book-a-table">
    <div class="container" data-aos="fade-up" data-aos-delay="100">
        <?php $form = ActiveForm::begin(['action' => Url::to($base_url . '/site/booking'), 'id' => 'mybookingform', 'options' => ['role' => "form", 'class' => "php-email-form", 'data-aos' => "fade-up", 'data-aos-delay' => "100"]]); ?>
        <div class="row">
            <div class="col-lg-4 col-md-6 ">
                <?= $form->field($BookingModel, 'name')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', 'Your Name')])->label(false); ?>
            </div>
            <div class="col-lg-4 col-md-6 mt-3 mt-md-0">
                <?= $form->field($BookingModel, 'email')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', 'Your Email')])->label(false); ?>
            </div>
            <div class="col-lg-4 col-md-6 mt-3 mt-md-0">
                <?= $form->field($BookingModel, 'phone')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', 'Your Phone')])->label(false); ?>
            </div>
            <div class="col-lg-4 col-md-6 mt-3">
                <?= $form->field($BookingModel, 'date')->textInput(['type' => "date", 'maxlength' => true, 'placeholder' => Yii::t('app', 'Date')])->label(false); ?>
            </div>
            <div class="col-lg-4 col-md-6 mt-3">
                <?= $form->field($BookingModel, 'time')->textInput(['type' => "time", 'maxlength' => true, 'placeholder' => Yii::t('app', 'Time')])->label(false); ?>
            </div>
            <div class="col-lg-4 col-md-6 mt-3">
                <?= $form->field($BookingModel, 'people')->textInput(['maxlength' => true, 'placeholder' => Yii::t('app', '# of people')])->label(false); ?>
            </div>
        </div>
        <div class="form-group mt-3">
            <?= $form->field($BookingModel, 'menu')->textInput(['placeholder' => Yii::t('app', 'Menu')])->label(false); ?>
            <?= $form->field($BookingModel, 'message')->textArea(['rows' => 5, 'placeholder' => Yii::t('app', 'Message')])->label(false); ?>
        </div>
        <div class="mb-3">
            <div class="loading"><?= Yii::t('app', 'Loading') ?></div>
            <div class="error-message"></div>
            <div class="sent-message"><?= Yii::t('app', 'Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!') ?></div>
        </div>
        <div class="text-center"><?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => '']) ?></div>
        <?php ActiveForm::end(); ?>
    </div>
</section>