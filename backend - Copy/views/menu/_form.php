<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap5\ActiveForm;
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
        jQuery(this).html("No: " + (index + 1));
    });
    
});
jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {

    });
});
';
$this->registerJs($js);

$url = \Yii::$app->urlManager->baseUrl . '/images/flags/';

$Categories = ArrayHelper::map(Categories::find()->asArray()->all(), 'id', function($item) {
            return $item['id'] . '-' . $item['gujarati'] . ' (' . $item['english'] . ')';
        });
$itemsData = Items::find()->all();
$items = ArrayHelper::map($itemsData, 'id', function($element) {
            $category = '' . $element->itemCategory->id . '-' . $element->itemCategory->gujarati . ' (' . $element->itemCategory->english . ')';
            $item_list = '' . $element->id . '-' . $element->gujarati . ' (' . $element->english . ')';
            return $item_list . ' : ' . $category;
        }, function($element) {
            return $element->itemCategory->id . '-' . $element->itemCategory->gujarati . ' (' . $element->itemCategory->english . ')';
        });
?>
<style>
    .ms-container .ms-list{
        height: 300px !important;
    }
</style>
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
                        <div class="row">
                            <div class="col-md-4">
                                <?= $form->field($model, "english")->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-md-8">
                                <?= $form->field($model, "description_english")->textArea(['maxlength' => true]) ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <?= $form->field($model, "gujarati")->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-md-8">
                                <?= $form->field($model, "description_gujarati")->textArea(['maxlength' => true]) ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <?=
                $form->field($model, "items")->widget(Select2::classname(), [
                    'data' => $items,
                    'options' => ['placeholder' => '--Select--', 'multiple' => true],
                    'showToggleAll' => false,
                    'pluginOptions' => [
                        'allowClear' => false,
                    ],
                ]);
                ?>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6 m-auto">
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
                'english',
                'gujarati',
                'hindi',
                'description_english',
                'description_gujarati',
                'description_hindi',
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
                            <div class="card border border-secondary">
                                <div class="card-header bg-secondary">
                                    <div class="float-end">
                                        <button type="button" class="remove-item btn btn-danger btn-sm"><i class="fas fa-times"></i></button>
                                    </div>
                                    <span class="panel-title-address">No: <?= ($key + 1) ?></span>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <?= $form->field($value, "[$key]english")->textInput(['maxlength' => true]) ?>
                                        </div>
                                        <div class="col-md-8">
                                            <?= $form->field($value, "[$key]description_english")->textArea(['maxlength' => true]) ?>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <?= $form->field($value, "[$key]gujarati")->textInput(['maxlength' => true]) ?>
                                        </div>
                                        <div class="col-md-8">
                                            <?= $form->field($value, "[$key]description_gujarati")->textArea(['maxlength' => true]) ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <?=
                                            $form->field($value, "[$key]items")->widget(Select2::classname(), [
                                                'data' => $items,
                                                'options' => ['placeholder' => '--Select--', 'multiple' => true],
                                                'showToggleAll' => false,
                                                'pluginOptions' => [
                                                    'allowClear' => false,
                                                ],
                                            ]);
                                            ?>
                                        </div>
                                        <div class="col-sm-12 col-md-4 col-lg-4 m-auto">
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
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="panel-footer mb-2">
                <button type="button" class="float-end add-item btn btn-success btn-sm"><i class="fa fa-plus"></i> Add</button>
                <div class="clearfix"></div>
            </div>
        </div>
        <?php DynamicFormWidget::end(); ?>
    <?php } ?>
    <div class="form-group text-center">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-bs-dismiss' => 'modal']) ?>
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
<script>
    function multisearchbox(ms, e) {
        var that = e,
                $selectableSearch = that.$selectableUl.prev(),
                $selectionSearch = that.$selectionUl.prev(),
                selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

        that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                .on('keydown', function (e) {
                    if (e.which === 40) {
                        that.$selectableUl.focus();
                        return false;
                    }
                });

        that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                .on('keydown', function (e) {
                    if (e.which == 40) {
                        that.$selectionUl.focus();
                        return false;
                    }
                });
    }

</script>