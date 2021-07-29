<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use newerton\fancybox3\FancyBox;
/* @var $this yii\web\View */
/* @var $model backend\models\Carousel */

$this->title = $model->title;

echo FancyBox::widget();
$imagesrc = Html::img(Yii::$app->urlManager->baseUrl . '/uploads/carousel/' . $model->image, ['width' => '100', 'height' => '100']);
$imagehtml = Html::a($imagesrc, Yii::$app->urlManager->baseUrl . '/uploads/carousel/' . $model->image, ['data-fancybox' => true]);

?>
<div class="carousel-view">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'description:ntext',
            [
                'attribute' => 'image',
                'value' => $imagehtml,
                'format' => 'raw',
            ],
            'status',
            'status_at',
            'created_at',
            'updated_at',
            'lang_key',
        ],
    ]) ?>

</div>
