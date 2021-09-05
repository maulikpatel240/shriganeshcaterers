<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Custompages */

$this->title = $model->page_name_english;
?>
<div class="custompages-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'image',
            'page_name_english',
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
