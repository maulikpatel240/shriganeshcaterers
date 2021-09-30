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
?>

<?php $form = ActiveForm::begin(['action'=>Url::to(['/booking/itemweight']),'id' => 'myform'.$index]); ?>
<div class="row">
    <div class="col-md-4 d-none">
        <?= $form->field($model, "booking_id")->hiddenInput(['maxlength' => true])->label(false) ?>
        <?= $form->field($model, "menu_id")->textInput(['maxlength' => true])->label(false) ?>
        <?= $form->field($model, "item_id")->textInput(['maxlength' => true])->label(false) ?>
    </div>
    <div class="col-md-4">
        <?= $form->field($model, "weight")->textInput(['maxlength' => true, 'Placeholder' => 'weight'])->label(false) ?>
    </div>
    <div class="col-md-4">
        <?= $form->field($model, "unit")->dropDownList(['Kilogram' => 'Kilogram', 'Gram' => 'Gram', 'Litre' => 'Litre', 'Other' => 'Other'], ['prompt' => '--Select Unit--', 'class' => 'form-select'])->label(false) ?>
    </div>
    <div class="col-md-4">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>
</div>
<?php ActiveForm::end(); ?>

<?php
AjaxForm::widget([
    'id' => 'myform'.$index,
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