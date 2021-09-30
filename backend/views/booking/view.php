<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\widgets\DetailView;
use yii\widgets\Breadcrumbs;
use kartik\grid\GridView;
use backend\models\Menu;
use backend\models\Items;
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
                                'datetime',
                                'people',
                                'message:ntext',
                                'created_at',
                            ],
                        ])
                        ?>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="booking-items-index">
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
                                'columns' => [
                                    [
                                        'class' => 'kartik\grid\SerialColumn',
                                        'contentOptions' => ['class' => 'kartik-sheet-style'],
                                        'width' => '36px',
                                        'header' => 'No',
                                        'headerOptions' => ['class' => 'kartik-sheet-style']
                                    ],
                                    [
                                        'attribute' => 'menu_id',
                                        'label' => 'Menu',
                                        'vAlign' => 'middle',
                                        'hAlign' => 'left',
                                        'format' => 'raw',
                                        'filter' => ArrayHelper::map(Menu::find()->where(['status' => 'Active'])->asArray()->all(), 'id', 'english'),
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
                                        'filter' => ArrayHelper::map(Items::find()->where(['status' => 'Active'])->asArray()->all(), 'id', 'gujarati'),
                                        'value' => function ($model, $key, $index, $widget) {
                                            return $model->item->gujarati;
                                        },
                                    ],
                                    [
                                        'attribute' => 'weight',
                                        'label' => 'Weight',
                                        'vAlign' => 'middle',
                                        'hAlign' => 'left',
                                        'format' => 'raw',
                                        'filter' => false,
                                        'value' => function ($model, $key, $index, $widget) {
                                            return \Yii::$app->view->renderFile('@app/views/booking/_weight_form.php', ['model' => $model, 'key'=>$key, 'index'=>$index]);
                                        },
                                    ],
                                //'unit',
                                //'created_at',
                                //'updated_at',
                                // ['class' => 'yii\grid\ActionColumn'],
                                ],
                            ]);
                            ?>
                            <?php   ?>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
