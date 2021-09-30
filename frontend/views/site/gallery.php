<?php
/* @var $this yii\web\View */

use yii\bootstrap5\ActiveForm;
use yii\helpers\Url;
use yii\helpers\Html;
use common\widgets\AjaxForm;
use yii\web\JsExpression;

$this->title = 'Project';
global $sg, $sconfig;
$base_url = $sg['base_url'];
?>
<section class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2><?= Yii::t('app', 'Gallery') ?></h2>
            <ol>
                <li><a href="<?= $base_url; ?>"><?= Yii::t('app', 'Home') ?></a></li>
                <li><?= Yii::t('app', 'Gallery') ?></li>
            </ol>
        </div>
    </div>
</section>
<section class="inner-page gallery p-0" id="gallery">
    <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">
        <div class="row g-0">
            <?php
            if ($gallery) {
                foreach ($gallery as $gal) {
                    ?>
                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item">
                            <a href="<?= $base_url . '/uploads/gallery/' . $gal['value'] ?>" class="gallery-lightbox" data-gall="gallery-item">
                                <img src="<?= $base_url . '/uploads/gallery/' . $gal['value'] ?>" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>
                    <?php
                }
            } else {
                echo '<div class="col-12">' . Yii::t('app', 'No records found') . '</div>';
            }
            ?>
        </div>
    </div>
</section>