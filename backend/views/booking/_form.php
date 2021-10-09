<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap5\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use backend\models\Menu;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model backend\models\Booking */
/* @var $form yii\widgets\ActiveForm */

$menuData = Menu::find()->all();
$menu = ArrayHelper::map($menuData, 'id', function($element) {
            $category = '' . $element->menuCategory->id . '-' . $element->menuCategory->gujarati . ' (' . $element->menuCategory->english . ')';
            $item_list = $element->english . ' ';
            return $item_list . ' : ' . $category;
        }, function($element) {
            return $element->menuCategory->id . '-' . $element->menuCategory->gujarati . ' (' . $element->menuCategory->english . ')';
        });
if ($model->menu) {
    $model->menu = explode(",", $model->menu);
}
?>

<div class="booking-form">

    <?php $form = ActiveForm::begin(['id' => 'myform']); ?>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6">
                    <?=
                    $form->field($model, 'phone')->widget(\yii\widgets\MaskedInput::class, [
                        'mask' => '999-999-9999',
                    ])
                    ?>
                </div>
                <div class="col-md-6">
                    <?=
                    $form->field($model, 'mobile')->widget(\yii\widgets\MaskedInput::class, [
                        'mask' => '999-999-9999',
                    ])
                    ?>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'people')->textInput() ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'date')->textInput(['type' => 'date']) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'time')->textInput(['type' => 'time']) ?>
        </div>
        <div class="col-md-12">
            <?= $form->field($model, 'total_price')->textInput(['type' => 'number']) ?>
        </div>
        <?=
        $form->field($model, "menu")->widget(Select2::classname(), [
            'data' => $menu,
            'options' => ['placeholder' => '--Select--', 'multiple' => true],
            'showToggleAll' => false,
            'pluginOptions' => [
                'allowClear' => false,
            ],
        ]);
        ?>
        <div class="col-md-12">
            <?= $form->field($model, 'message')->textarea(['rows' => 2]) ?>
        </div>
    </div>

    <div class="form-group text-center">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-bs-dismiss' => 'modal']) ?>
    </div>

    <?php ActiveForm::end(); ?>

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
                $.pjax.reload({container: "#gridtable-pjax"});
            }'),
        'complete' => new JsExpression('function() {
                $(\'.loader_div\').hide();
                $(\'#formmodal\').modal(\'hide\');
            }')
    ],
]);
?>