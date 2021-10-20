<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CustompagesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="custompages-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'image') ?>

    <?= $form->field($model, 'page_name_english') ?>

    <?= $form->field($model, 'page_title_english') ?>

    <?= $form->field($model, 'page_content_english') ?>

    <?php // echo $form->field($model, 'page_name_gujarati') ?>

    <?php // echo $form->field($model, 'page_title_guajrati') ?>

    <?php // echo $form->field($model, 'page_content_guajrati') ?>

    <?php // echo $form->field($model, 'page_name_hindi') ?>

    <?php // echo $form->field($model, 'page_title_hindi') ?>

    <?php // echo $form->field($model, 'page_content_hindi') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'status_at') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
