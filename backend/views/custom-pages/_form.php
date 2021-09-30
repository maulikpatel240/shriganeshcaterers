<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap5\ActiveForm;
use kartik\editors\Summernote;

/* @var $this yii\web\View */
/* @var $model backend\models\Custompages */
/* @var $form yii\widgets\ActiveForm */
$readonly_page_name = (!$model->isNewRecord) ? true : false;
?>

<div class="custompages-form">

    <?php $form = ActiveForm::begin(['id' => 'myform']); ?>

    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-6 m-auto">
            <div class="file-upload">
                <?php
                $image_upload_wrap_div = ($model->image) ? 'display: none;' : 'display: block;';
                $file_upload_content_div = ($model->image) ? 'display: block;' : 'display: none;';
                $image_url = ($model->image) ? Yii::$app->urlManager->baseUrl . '/uploads/custompage/' . $model->image : '#';
                $image_name = ($model->image) ? $model->image : 'Uploaded Image';
                ?>
                <button class="file-upload-btn btn btn-outline-secondary" type="button" onclick="$('.file-upload-input').trigger('click')">Add Image</button>
                <div class="image-upload-wrap" style="<?= $image_upload_wrap_div; ?>">
                    <?= $form->field($model, 'image')->fileInput(['class' => 'file-upload-input', 'accept' => 'image/*', 'onchange' => 'readURL(this);'])->label(false); ?>
                    <div class="drag-text">
                        <h3>Drag and drop a file or select add Image</h3>
                    </div>
                </div>
                <div class="file-upload-content" style="<?= $file_upload_content_div; ?>">
                    <img class="file-upload-image" src="<?= $image_url ?>" alt="your image" />
                    <div class="image-title-wrap">
                        <button type="button" onclick="removeUpload()" class="remove-image btn btn-danger">Remove <span class="image-title"><?= $image_name ?></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12 bg-light">
            <?= $form->field($model, 'page_name')->textInput(['maxlength' => true, 'readonly' => $readonly_page_name]) ?>
            <div class="card border border-secondary bg-light">
                <div class="card-body">
                    <?= $form->field($model, 'page_title_english')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'page_content_english')->widget(Summernote::class, ['styleWithSpan' => true]) ?>
                </div>
            </div>
            <div class="card border border-secondary bg-light">
                <div class="card-body">
                    <?= $form->field($model, 'page_title_gujarati')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'page_content_gujarati')->widget(Summernote::class, ['styleWithSpan' => true]) ?>
                </div>
            </div>
            <div class="card border border-secondary bg-light">
                <div class="card-body">
                    <?= $form->field($model, 'page_title_hindi')->textInput(['maxlength' => true]) ?>

                    <?= $form->field($model, 'page_content_hindi')->widget(Summernote::class, ['styleWithSpan' => true]) ?>
                </div>
            </div>

        </div>
    </div>
    <div class="form-group text-center">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        <?= Html::a('Close', Url::to(['index']), ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

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