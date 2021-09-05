<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap4\ActiveForm;
use common\widgets\dynamicform\DynamicFormWidget;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use kartik\select2\Select2;
use backend\models\Categories;
use backend\models\Items;
use kartik\file\FileInput;

/* @var $this yii\web\View */
/* @var $model backend\models\PagesCategories */
/* @var $form yii\widgets\ActiveForm */
$js = '
    $(".optionvalue-img").on("filecleared", function(event) {
    var regexID = /^(.+?)([-\d-]{1,})(.+)$/i;
    var id = event.target.id;
    var matches = id.match(regexID);
    if (matches && matches.length === 4) {
        var identifiers = matches[2].split("-");
        $("#optionvalue-" + identifiers[1] + "-deleteimg").val("1");

    }

});


jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        
    });
    
});
jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {

    });
});
';
$this->registerJs($js);

$Categories = ArrayHelper::map(Categories::find()->asArray()->all(), 'id', 'english');
$items = ArrayHelper::map(Items::find()->asArray()->all(), 'id', 'english');
?>

<div class="pages-menu-form">

    <?php $form = ActiveForm::begin(['id' => 'myform']); ?>
    <?=
    $form->field($model, 'menu_category_id')->widget(Select2::classname(), [
        'data' => $Categories,
        'options' => ['placeholder' => '--Select--'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]);
    ?>
    <?php
    if (!$model->isNewRecord) {
        $model->items = explode(',', $model->items);
        ?>
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                        <?= $form->field($model, 'gujarati')->textInput(['maxlength' => true]) ?>
                        <?= $form->field($model, 'hindi')->textInput(['maxlength' => true]) ?>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <?= $form->field($model, 'description_english')->textArea(['maxlength' => true]) ?>
                        <?= $form->field($model, 'description_gujarati')->textArea(['maxlength' => true]) ?>
                        <?= $form->field($model, 'description_hindi')->textArea(['maxlength' => true]) ?>
                    </div>
                </div>
                <?=
                $form->field($model, "items")->widget(Select2::classname(), [
                    'data' => $items,
                    'options' => ['placeholder' => '--Select--', 'multiple' => true],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
                ?>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6">
                <div class="file-upload">
                    <?php
                    $image_upload_wrap_div = ($model->image) ? 'display: none;' : 'display: block;';
                    $file_upload_content_div = ($model->image) ? 'display: block;' : 'display: none;';
                    $image_url = ($model->image) ? Yii::$app->urlManager->baseUrl . '/uploads/menu/' . $model->image : '#';
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
            'model' => $modelMenu[0],
            'countmodel' => count($modelMenu),
            'formId' => 'myform',
            'formFields' => [
                'name',
                'gujarati',
                'hindi',
                'items',
                'image',
            ],
        ]);
        ?>

        <div class="panel panel-default">
            <div class="panel-heading mb-2">
                <div class="clearfix"></div>
            </div>
            <div class="panel-body container-items">
                <?php foreach ($modelMenu as $key => $value): ?>
                    <div class="item panel panel-default shadow p-3 mb-3">

                        <div class="panel-body">
                            <?php
                            // necessary for update action.
//                        if (!$value->isNewRecord) {
//                            echo Html::activeHiddenInput($value, "[{$i}]id");
//                        }
                            ?>
                            <div class="row">
                                <div class="col-md-4">
                                    <?= $form->field($value, "[$key]name")->textInput(['maxlength' => true]) ?>
                                </div>
                                <div class="col-md-4">
                                    <?= $form->field($value, "[$key]gujarati")->textInput(['maxlength' => true]) ?>
                                </div>
                                <div class="col-md-4">
                                    <?= $form->field($value, "[$key]hindi")->textInput(['maxlength' => true]) ?>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <?=
                                    $form->field($value, "[$key]items")->widget(Select2::classname(), [
                                        'data' => $items,
                                        'options' => ['placeholder' => '--Select--', 'multiple' => true],
                                        'pluginOptions' => [
                                            'allowClear' => true
                                        ],
                                    ]);
                                    ?>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6">
                                    <?php
                                    $value_image = $value->image;
                                    $image_upload_wrap_div = ($value_image) ? 'display: none;' : 'display: block;';
                                    $file_upload_content_div = ($value_image) ? 'display: block;' : 'display: none;';
                                    $image_url = ($value_image) ? Yii::$app->urlManager->baseUrl . '/uploads/menu/' . $value_image : '#';
                                    $image_name = ($value_image) ? $value_image : 'Uploaded Image';
                                    ?>
                                    <?php
                                    //$modelImage = Image::findOne(['id' => $modelOptionValue->image_id]);
                                    $initialPreview = [];
                                    if ($value_image) {
                                        $pathImg = $image_url;
                                        $initialPreview[] = Html::img($pathImg, ['class' => 'file-preview-image']);
                                    }
                                    ?>

                                    <?=
                                    $form->field($value, "[$key]image")->label(false)->widget(FileInput::classname(), [
                                        'options' => [
                                            'multiple' => false,
                                            'accept' => 'image/*',
                                            'class' => 'optionvalue-img'
                                        ],
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
                                            'layoutTemplates' => ['footer' => '']
                                        ]
                                    ])
                                    ?>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="float-right">
                                <button type="button" class="remove-item btn btn-danger btn-xs"><i class="fas fa-times"></i></button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="panel-footer mb-2">
                <button type="button" class="float-right add-item btn btn-success btn-xs"><i class="fa fa-plus"></i> Add</button>
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
if (!$model->isNewRecord) {
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