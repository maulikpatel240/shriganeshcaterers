<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\BlogsCategories */

$this->title = $model->english;
$this->params['breadcrumbs'][] = ['label' => 'Blogs Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="blogs-categories-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'english',
            'gujarati',
            'hindi',
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
