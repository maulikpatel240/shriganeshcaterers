<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use newerton\fancybox3\FancyBox;
/* @var $this yii\web\View */
/* @var $model backend\models\Gallery */
echo FancyBox::widget();
$imagesrc = Html::img(Yii::$app->urlManager->baseUrl . '/uploads/gallery/' . $model->image, ['width' => '100', 'height' => '100']);
$imagehtml = Html::a($imagesrc, Yii::$app->urlManager->baseUrl . '/uploads/gallery/' . $model->image, ['data-fancybox' => true]);
?>
<div class="gallery-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type',
            [
                'attribute' => 'value',
                'value' => $imagehtml,
                'format' => 'raw',
            ],
            'status',
            'status_at',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
