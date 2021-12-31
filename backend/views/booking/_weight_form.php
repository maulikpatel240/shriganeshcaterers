<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\bootstrap5\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use backend\models\Menu;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model backend\models\Booking */
/* @var $form yii\widgets\ActiveForm */
$submit_class = ($model->weight) ? 'btn btn-success' : 'btn btn-danger';
$model->unit = [
    $model->id => $model->unit
];

if(strtotime($model->created_at) > strtotime('2021-11-16 12:00:00')){
    $unitdata = [
        'કિલોગ્રામ' => 'કિલોગ્રામ',
        'ગ્રામ' => 'ગ્રામ',
        'લિટર' => 'લિટર',
        'અન્ય' => 'અન્ય',
        'પેકેટ' => 'પેકેટ',
        'નંગ' => 'નંગ',
        'પદ્દા' => 'પડા',
        'બોટલ' => 'બોટલ',
        'ડબ્બા' => 'ડબ્બા',
        'ડઝન' => 'ડઝન'
    ];
}else{
    $unitdata = [
        'Kilogram' => 'કિલોગ્રામ',
        'Gram' => 'ગ્રામ',
        'Litre' => 'લિટર',
        'Other' => 'અન્ય',
        'Packet' => 'પેકેટ',
        'Nang' => 'નંગ',
        'Padda' => 'પડદા',
        'Bottle' => 'બોટલ',
        'Dabba' => 'ડબ્બા',
        'Dozen' => 'ડઝન'
    ];
}


if(strtotime($model->created_at) > strtotime('2021-11-16 12:00:00') && strtotime($model->created_at) <= strtotime('2021-11-25 12:00:00')){
    $unitdata = [
        'કિલોગ્રામ' => 'કિલોગ્રામ',
        'ગ્રામ' => 'ગ્રામ',
        'લિટર' => 'લિટર',
        'અન્ય' => 'અન્ય',
        'પેકેટ' => 'પેકેટ',
        'નંગ' => 'નંગ',
        'પદ્દા' => 'પડા',
        'બોટલ' => 'બોટલ',
        'ડબ્બા' => 'ડબ્બા',
        'ડઝન' => 'ડઝન'
    ];
}elseif(strtotime($model->created_at) > strtotime('2021-11-25 12:00:00')){
    $unitdata = [
        'Kilogram' => 'Kilogram',
        'Gram' => 'Gram',
        'Litre' => 'Litre',
        'Other' => 'Other',
        'Packet' => 'Packet',
        'Nang' => 'Nang',
        'Padda' => 'Padda',
        'Bottle' => 'Bottle',
        'Dabba' => 'Dabba',
        'Dozen' => 'Dozen'
    ];
}else{
    $unitdata = [
        'Kilogram' => 'કિલોગ્રામ',
        'Gram' => 'ગ્રામ',
        'Litre' => 'લિટર',
        'Other' => 'અન્ય',
        'Packet' => 'પેકેટ',
        'Nang' => 'નંગ',
        'Padda' => 'પડદા',
        'Bottle' => 'બોટલ',
        'Dabba' => 'ડબ્બા',
        'Dozen' => 'ડઝન'
    ];
}
 $unitdata = [
        'Kilogram' => 'Kilogram',
        'Gram' => 'Gram',
        'Litre' => 'Litre',
        'Other' => 'Other',
        'Packet' => 'Packet',
        'Nang' => 'Nang',
        'Padda' => 'Padda',
        'Bottle' => 'Bottle',
        'Dabba' => 'Dabba',
        'Dozen' => 'Dozen'
    ];
?>
<style>
    [class*="field-bookingitems-"] {margin:0px !important;}
</style>
<?php $form = ActiveForm::begin(['action' => Url::to(['/booking/itemweight']), 'id' => 'myform' . $index]); ?>
<div class="row m-2">
    <div class="col-md-4 d-none">
        <?= $form->field($model, "booking_id[" . $model->id . "]")->hiddenInput(['value' => $model->booking_id, 'maxlength' => true, 'class' => 'form-control bookingitems-booking_id'])->label(false) ?>
        <?= $form->field($model, "menu_id[" . $model->id . "]")->textInput(['value' => $model->menu_id, 'maxlength' => true, 'class' => 'form-control bookingitems-menu_id'])->label(false) ?>
        <?= $form->field($model, "item_id[" . $model->id . "]")->textInput(['value' => $model->item_id, 'maxlength' => true, 'class' => 'form-control bookingitems-item_id'])->label(false) ?>
    </div>
    <div class="col-md-6  mb-2">
        <?= $form->field($model, "weight[" . $model->id . "]")->textInput(['value' => $model->weight, 'maxlength' => true, 'Placeholder' => '', 'class' => 'form-control bookingitems-weight text-primary text-bold'])->label(true) ?>
    </div>
    <div class="col-md-6  mb-2">
        <?= $form->field($model, "unit[" . $model->id . "]")->dropDownList($unitdata, ['prompt' => '---', 'class' => 'form-select bookingitems-unit'])->label(true) ?>
    </div>
    <div class="col-md-9 mb-2">
        <?= $form->field($model, "INR[" . $model->id . "]", ['template' => '<div class="input-group">
                                            {input}{error}{hint}
                                            <span class="input-group-text">₹ INR (Rupee)</span>
                                          </div>'])->textInput(['value' => $model->INR, 'maxlength' => true, 'Placeholder' => '₹', 'class' => 'form-control bookingitems-INR text-danger text-bold'])->label(false) ?>
    </div>
    <div class="col-md-3  text-start">
        <?php echo Html::submitButton('Save', ['class' => $submit_class]) ?>
    </div>
</div>
<?php ActiveForm::end(); ?>

<?php
AjaxForm::widget([
    'id' => 'myform' . $index,
    'enableAjaxSubmit' => true,
    'ajaxSubmitOptions' => [
        'beforeSend' => new JsExpression('function() {
                
            }'),
        'success' => new JsExpression('function(response) {
                if(response == 1){
                    toastr.success(\'success\');
                    $.pjax.reload({container: "#gridtable-pjax"});
                }
            }'),
        'complete' => new JsExpression('function() {
                
            }')
    ],
]);
?>