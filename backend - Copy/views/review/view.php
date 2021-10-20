<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\rating\StarRating;
/* @var $this yii\web\View */
/* @var $model backend\models\Review */
?>
<div class="review-view">
    <?=
    DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'email:email',
            'subject',
            'message:ntext',
            [
                'attribute' => 'rating',
                'format' => 'raw',
                'value' => function ($model) {
                    return StarRating::widget([
                        'name' => 'rating_21',
                        'value' => $model->rating,
                        'pluginOptions' => [
                            'size' => 'sm',
                            'readonly' => true,
                            'showClear' => false,
                            'showCaption' => false,
                        ],
                    ]);
                },
            ],
            'status',
            'status_at',
            'created_at',
            'updated_at',
        ],
    ])
    ?>

</div>
