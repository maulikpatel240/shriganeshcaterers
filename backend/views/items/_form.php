<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap4\ActiveForm;
use common\widgets\dynamicform\DynamicFormWidget;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use kartik\select2\Select2;
use backend\models\ItemsCategories;

/* @var $this yii\web\View */
/* @var $model backend\models\PagesCategories */
/* @var $form yii\widgets\ActiveForm */
$js = '
jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        jQuery(this).html("No: " + (index + 1));
    });
    
});
jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {

    });
});
';
$this->registerJs($js);

$ItemsCategories = ArrayHelper::map(ItemsCategories::find()->asArray()->all(), 'id', 'english');
?>

<div class="pages-categories-form">

    <?php $form = ActiveForm::begin(['id' => 'myform']); ?>

    <?=
    $form->field($model, "item_category_id")->widget(Select2::classname(), [
        'data' => $ItemsCategories,
        'options' => ['placeholder' => '--Select--'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]);
    ?>
    <?php if (!$model->isNewRecord) { ?>
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <?= $form->field($model, 'english')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'gujarati')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'hindi')->textInput(['maxlength' => true]) ?>
            </div>
        </div>
    <?php } else { ?>
        <?php
        DynamicFormWidget::begin([
            'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
            'widgetBody' => '.container-items', // required: css class selector
            'widgetItem' => '.item', // required: css class
            'limit' => Yii::$app->params['MODULE_DYNAMIC_FORM_LIMIT'], // the maximum times, an element can be cloned (default 999)
            'min' => Yii::$app->params['MIN_DYNAMIC_FORM'], // 0 or 1 (default 1)
            'insertButton' => '.add-item', // css class
            'deleteButton' => '.remove-item', // css class
            'model' => $modelItems[0],
            'countmodel' => count($modelItems),
            'formId' => 'myform',
            'formFields' => [
                'english',
                'gujarati',
                'hindi',
            ],
        ]);
        ?>

        <div class="panel panel-default">
            <div class="panel-heading mb-2">
                <div class="clearfix"></div>
            </div>
            <div class="panel-body container-items">
                <?php foreach ($modelItems as $key => $value): ?>
                    <div class="item panel panel-default shadow p-3 mb-3">

                        <div class="panel-body">
                            <?php
                            // necessary for update action.
//                        if (!$value->isNewRecord) {
//                            echo Html::activeHiddenInput($value, "[{$i}]id");
//                        }
                            ?>
                            <div class="card border border-secondary">
                                <div class="card-header bg-secondary">
                                    <div class="float-right">
                                        <button type="button" class="remove-item btn btn-danger btn-sm"><i class="fas fa-times"></i></button>
                                    </div>
                                    <span class="panel-title-address">No: <?= ($key + 1) ?></span>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <?= $form->field($value, "[$key]english")->textInput(['maxlength' => true]) ?>
                                        </div>
                                        <div class="col-md-4">
                                            <?= $form->field($value, "[$key]gujarati")->textInput(['maxlength' => true]) ?>
                                        </div>
                                        <div class="col-md-4">
                                            <?= $form->field($value, "[$key]hindi")->textInput(['maxlength' => true]) ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="panel-footer mb-2">
                <button type="button" class="float-right add-item btn btn-success btn-sm"><i class="fa fa-plus"></i> Add</button>
                <div class="clearfix"></div>
            </div>
        </div>
        <?php DynamicFormWidget::end(); ?>
    <?php } ?>
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