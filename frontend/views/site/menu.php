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
            <h2><?= Yii::t('app', 'Menu') ?></h2>
            <ol>
                <li><a href="<?= $base_url; ?>"><?= Yii::t('app', 'Home') ?></a></li>
                <li><?= Yii::t('app', 'Menu') ?></li>
            </ol>
        </div>
    </div>
</section>
<section class="inner-page menu section-bg" id="menu">
    <div class="container" data-aos="fade-up" data-aos-delay="100">

        <?php if ($categories) { ?>
            <div class="row" data-aos="fade-up" data-aos-delay="100">
                <div class="col-lg-12 d-flex justify-content-center">
                    <ul id="menu-flters">
                        <li data-filter="*" class="filter-active"><?= Yii::t('app', 'All') ?></li>
                        <?php foreach ($categories as $cat) { ?>
                            <li data-filter=".filter-<?= $cat['id'] ?>"><?= $cat[$sg['language']]; ?></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
            <?php if ($menus) { ?>
                <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">
                    <?php foreach ($menus as $menu) { ?>
                        <div class="col-lg-6 menu-item filter-<?= $menu['menu_category_id'] ?>">
                            <img src="<?= $base_url . '/uploads/menu/' . $menu['image'] ?>" class="menu-img" alt="">
                            <div class="menu-content">
                                <a><?= ucfirst($menu[$sg['language']]); ?></a><span></span>
                            </div>
                            <div class="menu-ingredients">
                                <?= Yii::$app->FrontFunctions->truncate($menu['description_' . $sg['language']], 100); ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
                <?php
            } else {
                echo '<div class="col-12">' . Yii::t('app', 'No records found') . '</div>';
            }
        } else {
            echo '<div class="col-12">' . Yii::t('app', 'No records found') . '</div>';
        }
        ?>
    </div>
</section>