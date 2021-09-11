<?php

use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;

/* @var $this yii\web\View */
/* @var $model backend\models\Booking */
/* @var $form yii\widgets\ActiveForm */
$model->payment_type = (empty($model->payment_type)) ? 'Full' : $model->payment_type;
$dnone = ($model->payment_type == 'Partial') ? 'block' : 'none';
?>

<div class="booking-form">
    <div class="row">
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Name</span>: <?= $model->name ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Email</span>: <?= $model->email ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Phone</span>: <?= $model->phone ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">People</span>: <?= $model->people ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Booking Time</span>: <?= date('d-M-Y H:i', strtotime($model->datetime)) ?></p>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Total price</span>: <?= $model->total_price . ' &#8377;' ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold"><?= ($model->partial_price >= 1) ? 'Total Pending Price (Partial)' : 'Total Pay Price'; ?></span>: <?= ($model->total_price - $model->partial_price) . ' &#8377;' ?></p>
        </div>
    </div>
    <?php if ($model->status != 'Paid') { ?>
        <hr>

        <?php $form = ActiveForm::begin(['id' => 'myform']); ?>
        <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'total_price')->textInput(['type' => 'number']) ?>
            </div>
        </div>
        <?php if ($model->status == 'Approved') { ?>
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'payment_type')->inline()->radioList(['Full' => 'Full', 'Partial' => 'Partial',], ['separator' => ' ', 'tabindex' => 3]) ?>
                </div>
                <div class="col-md-6" id="partial_div" style="display: <?= $dnone ?>;">
                    <?= $form->field($model, 'partial_price')->textInput(['type' => 'number']) ?>
                </div>
            </div>
        <?php } ?>

        <div class="form-group text-center">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-dismiss' => 'modal']) ?>
        </div>
        <?php ActiveForm::end(); ?>

    <?php }else{ ?>
        <div class="form-group text-right mt-4">
            <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-dismiss' => 'modal']) ?>
        </div>
    <?php } ?>
</div>
<?php
AjaxForm::widget([
    'id' => 'myform',
    'enableAjaxSubmit' => true,
    'ajaxSubmitOptions' => [
        'beforeSend' => new JsExpression('function() {
                $(\'.loader_div\').show();
            }'),
        'success' => new JsExpression('function(response) {
                if(response.result == 1){
                    $(\'#formmodal\').modal(\'hide\');
                    $.pjax.reload({container: "#gridtable-pjax"});
                }else{
                    $(\'.field-booking-partial_price\').find(\'.invalid-feedback\').html(response.message);
                    $(\'.field-booking-partial_price\').find(\'.invalid-feedback\').css("display","block");
                }
            }'),
        'complete' => new JsExpression('function() {
                $(\'.loader_div\').hide();
            }')
    ],
]);
?>
<script>
    $(function () {
        $('input:radio[name="Booking[payment_type]"]').change(function () {
            if ($(this).val() == 'Partial') {
                $("#partial_div").css('display', 'block');
            } else {
                $("#partial_div").css('display', 'none');
            }
        });
    });
</script>