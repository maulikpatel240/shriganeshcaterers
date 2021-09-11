<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\DetailView;
use newerton\fancybox3\FancyBox;
use backend\models\Items;

echo FancyBox::widget();
$imagesrc = Html::img(Yii::$app->urlManager->baseUrl . '/uploads/menu/' . $model->image, ['width' => '100', 'height' => '100']);
$imagehtml = Html::a($imagesrc, Yii::$app->urlManager->baseUrl . '/uploads/menu/' . $model->image, ['data-fancybox' => true]);
$items = $model->items ? explode(',', $model->items) : '';
$itemname = '';
if($items){
    $itemdata = Items::find()->where(['in', 'id', $items])->asArray()->all();
    $itemname = ArrayHelper::getColumn($itemdata, 'english');
}
?>
<div class="menu-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'attribute' => 'image',
                'value' => $imagehtml,
                'format' => 'raw',
            ],
            'english',
            'gujarati',
            'hindi',
            [
                'attribute' => 'menu_category_id',
                'label' => 'Category',
                'value' => $model->menuCategory->english,
                'format' => 'raw',
            ],
            [
                'attribute' => 'items',
                'value' => $itemname ? implode(', ', $itemname) : '',
                'format' => 'raw',
            ],
            'status',
            [                      // the owner name of the model
                'attribute' => 'status_at',
                'value' => Yii::$app->BackFunctions->DateTimeToLocal($model->status_at, 'd-m-Y H:i:s'),
            ],
            [                      // the owner name of the model
                'attribute' => 'created_at',
                'value' => Yii::$app->BackFunctions->DateTimeToLocal($model->status_at, 'd-m-Y H:i:s'),
            ],
            [                      // the owner name of the model
                'attribute' => 'updated_at',
                'value' => Yii::$app->BackFunctions->DateTimeToLocal($model->status_at, 'd-m-Y H:i:s'),
            ]
        ],
    ]) ?>

</div>
