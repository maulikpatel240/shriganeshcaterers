<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\widgets\DetailView;
use yii\widgets\Breadcrumbs;
use kartik\grid\GridView;
use kartik\export\ExportMenu;
use backend\models\Menu;
use backend\models\Categories;
use backend\models\Items;
use backend\models\ItemsCategories;
use backend\models\BookingItems;
use yii\bootstrap5\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;

/* @var $this yii\web\View */
/* @var $model backend\models\Booking */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Bookings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);

if ($searchModel && $searchModel->category_id) {
    $MenuData = ArrayHelper::map(Menu::find()->where(['status' => 'Active', 'menu_category_id' => $searchModel->category_id])->asArray()->all(), 'id', 'english');
} else {
    $MenuData = ArrayHelper::map(Menu::find()->where(['status' => 'Active'])->asArray()->all(), 'id', 'english');
}
if ($searchModel && $searchModel->item_category_id) {
    $ItemsData = ArrayHelper::map(Items::find()->where(['status' => 'Active', 'item_category_id' => $searchModel->item_category_id])->asArray()->all(), 'id', 'gujarati');
} else {
    $ItemsData = ArrayHelper::map(Items::find()->where(['status' => 'Active'])->asArray()->all(), 'id', 'gujarati');
}
$saveallbtn = ($model->status != 'Paid') ? '<div class="text-end me-5">' . Html::Button('Save All', ['class' => 'btn btn-warning', 'id' => 'weightFormSubmit', 'onclick' => 'weightFormSubmit(this);', 'data-url' => Url::to(['booking/itemweight'], true)]) . '</div>' : '';
$gridColumns = [
    [
        'class' => 'kartik\grid\SerialColumn',
        'contentOptions' => ['class' => 'kartik-sheet-style'],
        'width' => '36px',
        'header' => 'No',
        'headerOptions' => ['class' => 'kartik-sheet-style']
    ],
    [
        'attribute' => 'category_id',
        'label' => 'Menu Cateogory',
        'vAlign' => 'middle',
        'hAlign' => 'left',
        'format' => 'raw',
        'filter' => ArrayHelper::map(Categories::find()->where(['status' => 'Active'])->asArray()->all(), 'id', 'english'),
        'filterInputOptions' => ['class' => 'form-select'],
        'value' => function ($model, $key, $index, $widget) {
            return $model->category->english;
        },
    ],
    [
        'attribute' => 'menu_id',
        'label' => 'Menu',
        'vAlign' => 'middle',
        'hAlign' => 'left',
        'format' => 'raw',
        'filter' => $MenuData,
        'filterInputOptions' => ['class' => 'form-select'],
        'value' => function ($model, $key, $index, $widget) {
            return $model->menu->english;
        },
    ],
    [
        'attribute' => 'item_id',
        'label' => 'Items',
        'vAlign' => 'middle',
        'hAlign' => 'left',
        'format' => 'raw',
        'filter' => $ItemsData,
        'filterInputOptions' => ['class' => 'form-select'],
        'value' => function ($model, $key, $index, $widget) {
            return '<strong>' . $model->item->gujarati . '</strong>';
        },
    ],
    [
        'attribute' => 'item_category_id',
        'label' => 'Item Category',
        'vAlign' => 'middle',
        'hAlign' => 'left',
        'format' => 'raw',
        'filter' => ArrayHelper::map(ItemsCategories::find()->where(['status' => 'Active'])->asArray()->all(), 'id', 'gujarati'),
        'filterInputOptions' => ['class' => 'form-select'],
        'value' => function ($model, $key, $index, $widget) {
            return $model->itemCategory->gujarati;
        },
    ],
    [
        'attribute' => 'weight',
        'label' => 'Weight',
        'format' => 'raw',
        'filter' => false,
        'value' => function ($model, $key, $index, $widget) {
            if ($model->booking->status == 'Paid') {
                return $model->weight;
            } else {
                return '<div class="d-none">' . $model->weight . '</div>' . \Yii::$app->view->renderFile('@app/views/booking/_weight_form.php', ['model' => $model, 'key' => $key, 'index' => $index]);
            }
        },   
        'pageSummary' => 'Total',
    ],
    [
        'attribute' => 'unit',
        'label' => 'Unit',
        'vAlign' => 'left',
        'hAlign' => 'left',
        'format' => 'raw',
        'filter' => false,
        'hidden' => true, 
        'value' => function ($model, $key, $index, $widget) {
            return isset($model->unit[$model->id])?$model->unit[$model->id]:'';
        },
    ],
    [
        'class' => 'kartik\grid\FormulaColumn', 
        'attribute' => 'INR',
        'label' => 'INR',
        'format' => 'raw',
        'filter' => false,
        'hidden' => false, 
        'value' => function ($model, $key, $index, $widget) {
            return $model->INR;
        },
        'pageSummary' => true        
    ],            
];
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
                        'label' => Yii::t('yii', 'Booking'),
                        'url' => Url::to(['/booking'], true),
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
                <div class="card">
                    <div class="card-body">
                        <?=
                        DetailView::widget([
                            'model' => $model,
                            'attributes' => [
                                'id',
                                'booking_id',
                                'name',
                                'email:email',
                                'phone',
                                'mobile',
                                [
                                    'attribute' => 'datetime',
                                    'format' => 'html',
                                    'value' => '<span class="text-bold text-warning">' . Yii::$app->BackFunctions->DateTimeToLocal($model->datetime, 'd-M, Y h:i a  (d-m-Y H:i)') . '</span>',
                                ],
                                'people',
                                'message:ntext',
                                'created_at',
                            ],
                        ])
                        ?>
                    </div>
                </div>
                <div class="booking-items-index">
                    <?php
//                    echo ExportMenu::widget([
//                        'dataProvider' => $dataProvider,
//                        'columns' => $gridColumns,
//                        'exportConfig' => [
//                            ExportMenu::FORMAT_TEXT => false,
//                            ExportMenu::FORMAT_HTML => false,
//                            ExportMenu::FORMAT_EXCEL => false,
//                            ExportMenu::FORMAT_PDF => [
//                                'pdfConfig' => [
//                                    'methods' => [
//                                        'SetTitle' => 'Grid Export - Krajee.com',
//                                        'SetSubject' => 'Generating PDF files via yii2-export extension has never been easy',
//                                        'SetHeader' => ['Krajee Library Export||Generated On: ' . date("r")],
//                                        'SetFooter' => ['|Page {PAGENO}|'],
//                                        'SetAuthor' => 'Kartik Visweswaran',
//                                        'SetCreator' => 'Kartik Visweswaran',
//                                        'SetKeywords' => 'Krajee, Yii2, Export, PDF, MPDF, Output, GridView, Grid, yii2-grid, yii2-mpdf, yii2-export',
//                                    ]
//                                ]
//                            ],
//                        ],
//                        'dropdownOptions' => [
//                            'label' => 'Export All',
//                            'class' => 'btn btn-outline-secondary btn-default'
//                        ]
//                    ]) . "<hr>\n";
                    ?>
                    <?=
                    GridView::widget([
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
                        'columns' => $gridColumns,
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
                        'showPageSummary' => true,
                        'panel' => [
                            'type' => GridView::TYPE_PRIMARY,
                            'heading' => Html::encode($this->title),
                            'after' => $saveallbtn,
                            'footer' => '',
                        ],
                        'persistResize' => false,
                        'toggleDataOptions' => ['minCount' => 10],
                        'exportConfig' => [
                            GridView::EXCEL => true,
                        //GridView::PDF => true
                        ],
                        'itemLabelSingle' => 'Booking Item List',
                        'itemLabelPlural' => 'Booking Items List',
                    ]);
                    ?>
                    <?php ?>

                </div>
            </div>
        </div>
    </div>
</section>
<script>

    function weightFormSubmit(e) {
        var booking_id_Array = [];
        $('.bookingitems-booking_id').each(function (e) {
            booking_id_Array.push(this.value);
        });
        var menu_id_Array = [];
        $('.bookingitems-menu_id').each(function (e) {
            menu_id_Array.push(this.value);
        });
        var item_id_Array = [];
        $('.bookingitems-item_id').each(function (e) {
            item_id_Array.push(this.value);
        });
        var weight_Array = [];
        $('.bookingitems-weight').each(function (e) {
            weight_Array.push(this.value);
        });
        var unit_Array = [];
        $('.bookingitems-unit').each(function (e) {
            unit_Array.push(this.value);
        });
        var INR_Array = [];
        $('.bookingitems-INR').each(function (e) {
            INR_Array.push(this.value);
        });
        var booking_id = booking_id_Array;
        var menu_id = menu_id_Array;
        var item_id = item_id_Array;
        var weight = weight_Array;
        var unit = unit_Array;
        var INR = INR_Array;
        var data = {
            booking_id: booking_id,
            menu_id: menu_id,
            item_id: item_id,
            weight: weight,
            unit: unit,
            INR: INR
        }

        $.ajax({
            url: $(e).data('url'),
            type: 'post',
            data: data,
            beforeSend: function () {

            },
            success: function (response) {

            },
            complete: function () {
                $.pjax.reload({container: "#gridtable-pjax"});
            }
        });
    }
</script>
