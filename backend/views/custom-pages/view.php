<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use newerton\fancybox3\FancyBox;
/* @var $this yii\web\View */
/* @var $model backend\models\Custompages */

$this->title = $model->page_name;

echo FancyBox::widget();
$imagesrc = Html::img(Yii::$app->urlManager->baseUrl . '/uploads/custompage/' . $model->image, ['width' => '100', 'height' => '100']);
$imagehtml = Html::a($imagesrc, Yii::$app->urlManager->baseUrl . '/uploads/custompage/' . $model->image, ['data-fancybox' => true]);
?>
<div class="custompages-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute' => 'image',
                'value' => $imagehtml,
                'format' => 'raw',
            ],
            'page_name',
            'page_title_english',
            'page_content_english:html',
            'page_name_gujarati',
            'page_title_guajrati',
            'page_content_guajrati:html',
            'page_name_hindi',
            'page_title_hindi',
            'page_content_hindi:html',
            'status',
            'status_at',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
