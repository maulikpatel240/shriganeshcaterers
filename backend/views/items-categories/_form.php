<?php

use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;

/* @var $this yii\web\View */
/* @var $model backend\models\PagesCategories */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pages-categories-form">

    <?php $form = ActiveForm::begin(['id' => 'myform']); ?>

    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <?= $form->field($model, 'english')->textInput(['maxlength' => true]) ?>
            <?= $form->field($model, 'gujarati')->textInput(['maxlength' => true]) ?>
            <?= $form->field($model, 'hindi')->textInput(['maxlength' => true]) ?>
        </div>

    </div>
    <div class="form-group text-center">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-dismiss' => 'modal']) ?>
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
<script>
    function readURL(input) {
        var extension = input.files[0].name.substr((input.files[0].name.lastIndexOf('.') + 1));
        var img_extention = '<?= json_encode(Yii::$app->params['image_extention']) ?>';
        var jsonArray = JSON.parse(img_extention);

        if (jQuery.inArray(extension, jsonArray) != '-1') {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('.image-upload-wrap').hide();

                    $('.file-upload-image').attr('src', e.target.result);
                    $('.file-upload-content').show();

                    $('.image-title').html(input.files[0].name);
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                removeUpload();
            }
            $('.field-states-image').find('.invalid-feedback').html('');
            $('.field-states-image').find('.invalid-feedback').css('display', 'none');
        } else {
            var invalid_error = 'Only files with these extensions are allowed: <?= implode(',', Yii::$app->params['image_extention']); ?>';
            $('.field-states-image').find('.invalid-feedback').html(invalid_error);
            $('.field-states-image').find('.invalid-feedback').css('display', 'block');
            //alert(invalid_error);
            var $el = $('#states-image');
            $el.wrap('<form>').closest('form').get(0).reset();
            $el.unwrap();
        }

    }

    function removeUpload() {
        $('.file-upload-input').replaceWith($('.file-upload-input').clone());
        $('.file-upload-content').hide();
        $('.image-upload-wrap').show();
    }
    $('.image-upload-wrap').bind('dragover', function () {
        $('.image-upload-wrap').addClass('image-dropping');
    });
    $('.image-upload-wrap').bind('dragleave', function () {
        $('.image-upload-wrap').removeClass('image-dropping');
    });
</script>