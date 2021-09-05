<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use newerton\fancybox3\FancyBox;
/* @var $this yii\web\View */
/* @var $model backend\models\BlogsCategories */

$this->title = $model->english;

echo FancyBox::widget();
$imagesrc = Html::img(Yii::$app->urlManager->baseUrl . '/uploads/event-category/' . $model->image, ['width' => '100', 'height' => '100']);
$imagehtml = Html::a($imagesrc, Yii::$app->urlManager->baseUrl . '/uploads/event-category/' . $model->image, ['data-fancybox' => true]);

?>
<div class="blogs-categories-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'english',
            'gujarati',
            'hindi',
            [
                'attribute' => 'image',
                'value' => $imagehtml,
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
