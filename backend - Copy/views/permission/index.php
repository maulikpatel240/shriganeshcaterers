<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\widgets\Pjax;
use kartik\grid\GridView;
use yii\widgets\Breadcrumbs;
use yii\bootstrap5\Modal;
use backend\models\Modules;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\RoleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Permissions';
//List Index page
if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
    throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
}
//Create
$createBtn = "";
if (!empty(Yii::$app->BackFunctions->checkaccess('create', Yii::$app->controller->id))) {
    $createBtn = Html::a('<i class="fas fa-plus"></i>', FALSE, ['value' => Url::to(['permission/create']), 'title' => 'Create Permission', 'class' => 'showModalButton btn btn-primary']);
}
//Export
$exportBtn = '';
if (!empty(Yii::$app->BackFunctions->checkaccess('export', Yii::$app->controller->id))) {
    $exportBtn = '{export}';
}
//Apply dropdwon status, delete
$applydropdwon = "";
if (!empty(Yii::$app->BackFunctions->checkaccess('status', Yii::$app->controller->id)) && !empty(Yii::$app->BackFunctions->checkaccess('delete', Yii::$app->controller->id))) {
    $applydropdwon = Html::dropDownList('apply', '', ['' => '--Select--', 'Active' => 'Active', 'Inactive' => 'Inactive', 'Delete' => 'Delete'], ['class' => 'form-control', 'id' => 'applyoption']);
} elseif (!empty(Yii::$app->BackFunctions->checkaccess('status', Yii::$app->controller->id)) && empty(Yii::$app->BackFunctions->checkaccess('delete', Yii::$app->controller->id))) {
    $applydropdwon = Html::dropDownList('apply', '', ['' => '--Select--', 'Active' => 'Active', 'Inactive' => 'Inactive'], ['class' => 'form-control', 'id' => 'applyoption']);
} elseif (empty(Yii::$app->BackFunctions->checkaccess('status', Yii::$app->controller->id)) && !empty(Yii::$app->BackFunctions->checkaccess('delete', Yii::$app->controller->id))) {
    $applydropdwon = Html::dropDownList('apply', '', ['' => '--Select--', 'Delete' => 'Delete'], ['class' => 'form-control', 'id' => 'applyoption']);
}
$applyafter = "";
if (!empty(Yii::$app->BackFunctions->checkaccess('status', Yii::$app->controller->id)) || !empty(Yii::$app->BackFunctions->checkaccess('delete', Yii::$app->controller->id))) {
    $applySubmit = Html::button('Apply', ['class' => 'btn btn-primary', 'id' => 'applysubmit', 'onclick' => 'applyjs(this);']);
    $applyafter = '<div class="row">'
            . '<div class="col-md-2 col-lg-2 col-sm-6">' . $applydropdwon
            . '</div>'
            . '<div class="col-md-3 col-lg-3 col-sm-6">' . $applySubmit
            . '</div>'
            . '</div>';
}
?>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1><?= Html::encode($this->title) ?></h1>
            </div>
            <div class="col-sm-6">
                <?php
                $this->params['breadcrumbs'] = array();
                $this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => false];
                echo Breadcrumbs::widget([
                    'tag' => 'ol',
                    'options' => ['class' => 'breadcrumb float-sm-end'],
                    'homeLink' => [
                        'label' => Yii::t('yii', 'Home'),
                        'url' => Yii::$app->homeUrl,
                    ],
                    'itemTemplate' => '<li class="breadcrumb-item">{link}</li>', // template for all links
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                ]);
                ?>
            </div>
        </div>
    </div>
</section>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <?php
                echo GridView::widget([
                    'id' => 'gridtable',
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'pjax' => true, // pjax is set to always true for this demo
                    'pjaxSettings' => [
                        'neverTimeout' => true,
                        'options' => [
                            'id' => 'gridtable-pjax',
                        ]
                    ],
                    'containerOptions' => ['style' => 'overflow: auto'], // only set when $responsive = false
                    'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                    'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                    'columns' => [
                        [
                            'class' => 'kartik\grid\SerialColumn',
                            'contentOptions' => ['class' => 'kartik-sheet-style'],
                            'width' => '36px',
                            'header' => 'No',
                            'headerOptions' => ['class' => 'kartik-sheet-style']
                        ],
                        [
                            'class' => 'kartik\grid\CheckboxColumn',
                            'headerOptions' => ['class' => 'kartik-sheet-style'],
                        ],
//                                    [
//                                        'class' => 'kartik\grid\ExpandRowColumn',
//                                        'width' => '50px',
//                                        'value' => function ($model, $key, $index, $column) {
//                                            return GridView::ROW_COLLAPSED;
//                                        },
//                                        // uncomment below and comment detail if you need to render via ajax
//                                        // 'detailUrl' => Url::to(['/site/book-details']),
//                                        'detail' => function ($model, $key, $index, $column) {
//                                            return Yii::$app->controller->renderPartial('_expand-row-details', ['model' => $model]);
//                                        },
//                                        'headerOptions' => ['class' => 'kartik-sheet-style'],
//                                        'expandOneOnly' => true
//                                    ],
                        [
                            'attribute' => 'name',
                            'vAlign' => 'middle',
                            'hAlign' => 'left'
                        ],
                        [
                            'attribute' => 'controller',
                            'vAlign' => 'middle',
                            'hAlign' => 'left'
                        ],
                        [
                            'attribute' => 'action',
                            'vAlign' => 'middle',
                            'hAlign' => 'left'
                        ],
                        [
                            'attribute' => 'module_id',
                            'label' => 'Module',
                            'filter' => ArrayHelper::map(Modules::find()->where(['status' => 'Active'])->andWhere(['!=', 'functionality', 'none'])->andWhere(['!=', 'title', ''])->asArray()->all(), 'id', 'title'),
                            'format' => 'raw',
                            'value' => function ($model, $key, $index, $widget) {
                                return $model->module->title;
                            }
                        ],
                        [
                            'class' => 'kartik\grid\ActionColumn',
                            'header' => 'Action',
                            'headerOptions' => ['width' => '80'],
                            'width' => '130px',
                            'template' => '{update} {delete}',
                            'buttons' => [
                                'update' => function ($url, $model) {
                                    if (!empty(Yii::$app->BackFunctions->checkaccess('update', Yii::$app->controller->id))) {
                                        return Html::a(
                                                        '<span class="fas fa-pencil-alt"></span>',
                                                        FALSE,
                                                        [
                                                            'value' => Url::to(['permission/update', 'id' => $model->id]),
                                                            'title' => 'Edit Permission',
                                                            'class' => 'showModalButton ms-1 me-1 text-primary',
                                                            'data-pjax' => '0',
                                                        ]
                                        );
                                    }
                                    return;
                                },
                                'delete' => function ($url) {
                                    if (!empty(Yii::$app->BackFunctions->checkaccess('delete', Yii::$app->controller->id))) {
                                        return Html::a(
                                                        '<span class="fas fa-trash-alt"></span>',
                                                        $url,
                                                        [
                                                            'title' => 'Delete Permission',
                                                            'class' => 'ms-1 me-1 text-danger',
                                                            'data-method' => "post",
                                                            'data-confirm' => "Are you sure to delete?",
                                                            'data-toggle' => "tooltip",
                                                            'data-pjax' => '0',
                                                        ]
                                        );
                                    }
                                    return;
                                }
                            ],
                        ],
                    ],
                    // set your toolbar
                    'toolbar' => [
                        [
                            'content' =>
                            $createBtn .
                            Html::a('<i class="fas fa-redo"></i>', ['index'], [
                                'class' => 'btn btn-outline-secondary',
                                'title' => 'Reset',
                                'data-pjax' => 1,
                            ]),
                            'options' => ['class' => 'btn-group me-2']
                        ],
                        $exportBtn,
                        '{toggleData}',
                    ],
                    'toggleDataContainer' => ['class' => 'btn-group me-2'],
                    // set export properties
                    'export' => [
                        'fontAwesome' => true,
                        'icon' => 'fas fa-share-square'
                    ],
                    'pager' => [
                        'options' => ['class' => 'pagination justify-content-center align-self-center'],
                    ],
                    // parameters from the demo form
                    'bordered' => true,
                    'striped' => false,
                    'condensed' => true,
                    'responsive' => true,
                    'responsiveWrap' => false,
                    'hover' => true,
                    'showPageSummary' => false,
                    'panel' => [
                        'type' => GridView::TYPE_PRIMARY,
                        'heading' => Html::encode($this->title),
                        'after' => $applyafter,
                        'footer' => ''
                    ],
                    'persistResize' => false,
                    'toggleDataOptions' => ['minCount' => 10],
                    'exportConfig' => [
                        GridView::EXCEL => true
                    ],
                    'itemLabelSingle' => 'Permission',
                    'itemLabelPlural' => 'Permissions',
                ]);
                ?>
            </div>
        </div>
    </div>
</section>
<?php
Modal::begin([
    'title' => 'Permission',
    'id' => 'formmodal',
    'size' => 'modal-lg',
    'clientOptions' => ['backdrop' => 'static', 'keyboard' => FALSE],
    'closeButton' => ['id' => 'close-button'],
]);
echo \Yii::$app->view->renderFile('@app/views/temp/loader.php', ['theme_loader' => 'div', 'loader' => 'loader_div', 'display' => 'none']);
echo "<div id='modalContent'></div>";
Modal::end();
?>
<script type="text/javascript">
    function applyjs(e) {
        var keys = $('#gridtable').yiiGridView('getSelectedRows');
        var applyoption = $('#applyoption').val();
        $.post({
            url: '<?= Yii::$app->homeUrl . 'permission/applystatus' ?>',
            dataType: 'json',
            data: {keylist: keys, applyoption: applyoption},
            success: function (response) {
                //alert('I did it! Processed checked rows.')
                $.pjax.reload({container: "#gridtable-pjax"});
            },
        });
    }
    $(document).on('click', '.showModalButton', function () {
        document.getElementById('formmodal-label').innerHTML = $(this).attr('title');
        $.ajax({
            url: $(this).attr('value'),
            beforeSend: function () {
                $('#formmodal').find('#modalContent').html('');
                $('.loader_div').show();
            },
            success: function (response) {
                $('#formmodal').modal('show').find('#modalContent').html(response);
            },
            complete: function () {
                $('.loader_div').hide();
                $('#formmodal').modal('hide');
            }
        });
    });
    $(document).on("submit", "#permissionForm", function () {
        var data;
        var data = new FormData(this);
        var url = $(this).attr('action');
        $.ajax({
            url: url, // Url to which the request is send
            type: "POST", // Type of request to be send, called as method
            data: data,
            contentType: false, // The content type used when sending data to the server.
            cache: false, // To unable request pages to be cached
            processData: false, // To send DOMDocument or non processed data file it is set to false
            dataType: 'json',
            beforeSend: function () {
                $('.loader_div').show();
            },
            complete: function () {
                $('.loader_div').hide();
                $('#formmodal').modal('hide');
            },
            success: function (response)   // A function to be called if request succeeds
            {
                $.pjax.reload({container: "#gridtable-pjax"});
            }
        });
        return false;
    });
</script>
