<?php

use yii\helpers\Html;
use yii\bootstrap5\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use kartik\file\FileInput;

/* @var $this yii\web\View */
/* @var $model backend\models\Gallery */
/* @var $form yii\widgets\ActiveForm */
$initialPreview = array();
?>

<div class="gallery-form">

    <?php $form = ActiveForm::begin(['id' => 'myform', 'options' => ['enctype' => 'multipart/form-data']]); ?>

    <?=
    $form->field($model, 'image[]')->widget(FileInput::classname(), [
        'options' => ['accept' => 'image/*', 'multiple' => true],
        'pluginOptions' => [
            'previewFileType' => 'image',
            'showCaption' => false,
            'showUpload' => false,
            'browseClass' => 'btn btn-default btn-sm',
            'browseLabel' => ' Pick image',
            'browseIcon' => '<i class="glyphicon glyphicon-picture"></i>',
            'removeClass' => 'btn btn-danger btn-sm',
            'removeLabel' => ' Delete',
            'removeIcon' => '<i class="fa fa-trash"></i>',
            'previewSettings' => [
                'image' => ['width' => '138px', 'height' => 'auto']
            ],
            'initialPreview' => $initialPreview,
            'layoutTemplates' => ['footer' => ''],
            'maxFileCount' => 10
        ]
    ]);
    ?>

    <?=
    $form->field($model, 'video[]')->widget(FileInput::classname(), [
        'options' => ['accept' => 'video/*', 'multiple' => true],
        'pluginOptions' => [
            'showPreview' => false,
            'showCaption' => true,
            'showUpload' => false,
            'maxFileCount' => 10
        ]
    ]);
    ?>
    <div class="form-group text-center">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-bs-dismiss' => 'modal']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php
if ($model->isNewRecord) {
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
}
?>
<script>
    $(document).ready(function () {
        $('.invalid-feedback').css('display', 'block');
    });
</script>