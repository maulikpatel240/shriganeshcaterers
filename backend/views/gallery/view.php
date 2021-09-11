<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Gallery */

?>
<div class="gallery-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type',
            'value',
            'status',
            'status_at',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
