<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\bootstrap5\ActiveForm;
use common\widgets\AjaxForm;
use yii\web\JsExpression;
use backend\models\Menu;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model backend\models\Booking */
/* @var $form yii\widgets\ActiveForm */
$model->payment_type = (empty($model->payment_type)) ? 'Full' : $model->payment_type;
$dnone = ($model->payment_type == 'Partial') ? 'block' : 'none';

$model->menu = explode(",", $model->menu);
$menuData = Menu::find()->joinWith('menuCategory')->where(['IN', 'menu.id', $model->menu])->orderBy(['categories.position' => SORT_ASC, 'menu.english' => SORT_ASC])->all();

$menu = ArrayHelper::map($menuData, 'id', function($element) {
            $category = '' . $element->menuCategory->id . '-' . $element->menuCategory->gujarati . ' (' . ucfirst($element->menuCategory->english) . ')';
            $item_list = ucfirst($element->english) . ' ';
//            return $item_list . ' : ' . $category;
            return $item_list;
        }, function($element) {
            return $element->menuCategory->id . '-' . $element->menuCategory->gujarati . ' (' . ucfirst($element->menuCategory->english) . ')';
        });

$html_menu_list = '';
if ($menu) {
    $menu_category = array_keys($menu);
    $menu_name = array_values($menu);
    if ($menu_category) {
        for ($i = 0; $i < count($menu_category); $i++) {
            $menu_name_keys = array_keys($menu_name[$i]);
            $menu_name_values = array_values($menu_name[$i]);
            if ($menu_name_keys) {
                $html_menu_list .= '<div class="card"><div class="card-header">B_Cat_No-'.($i+1).'.<span class="ms-3 text-bold">' . $menu_category[$i] . '</span></div><div class="card-body"><ul class="list-group list-group-numbered">';
                for ($j = 0; $j < count($menu_name_keys); $j++) {
                    $html_menu_list .= '<li class="list-group-item ml-4"><span class="ms-3 text-bold">' . $menu_name_keys[$j] . '- ' . $menu_name_values[$j] . '</span></li>';
                }
                $html_menu_list .= '</ul></div></div></div>';
            }
        }
    }
}
?>

<div class="booking-form">
    <div class="row">
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Name</span>: <?= $model->name ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Email</span>: <?= $model->email ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Phone</span>: <?= $model->phone ?> <?= ($model->mobile) ? ', ' . $model->mobile : '' ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">People</span>: <?= $model->people ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Booking Time</span>: <?= date('d-M-Y H:i', strtotime($model->datetime)) ?></p>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold">Total price</span>: <?= $model->total_price . ' &#8377;' ?></p>
        </div>
        <div class="col-md-6">
            <p class="font-weight-600 m-2 text-secondary"><span class="font-weight-bold"><?= ($model->partial_price >= 1) ? 'Total Pending Price (Partial)' : 'Total Pay Price'; ?></span>: <?= ($model->total_price - $model->partial_price) . ' &#8377;' ?></p>
        </div>
    </div>
    <?php if ($model->status != 'Paid') { ?>
        <hr>

        <?php $form = ActiveForm::begin(['id' => 'myform']); ?>

        <?php if ($model->status == 'Pending') { ?>
            <div class="row">
                <div class="col-md-12">
                    <?= $form->field($model, 'total_price')->textInput(['type' => 'number']) ?>
                </div>
                <div class="col-md-12">
                    <?php
                    /* $form->field($model, "menu")->widget(Select2::classname(), [
                      'data' => $menu,
                      'options' => ['placeholder' => '--Select--', 'multiple' => true],
                      'showToggleAll' => false,
                      'pluginOptions' => [
                      'allowClear' => false,
                      ],
                      ]); */
                    ?>
                </div>
            </div>
            <?php
        } else {
            echo $html_menu_list;
        }
        ?>
        <?php if ($model->status == 'Booked' || $model->status == 'Partial') { ?>
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'payment_type')->inline()->radioList(['Full' => 'Full', 'Partial' => 'Partial',], ['separator' => ' ', 'tabindex' => 3]) ?>
                </div>
                <div class="col-md-6" id="partial_div" style="display: <?= $dnone ?>;">
                    <?= $form->field($model, 'partial_price')->textInput(['type' => 'number']) ?>
                </div>
            </div>
        <?php } ?>

        <div class="form-group text-center">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-bs-dismiss' => 'modal']) ?>
        </div>
        <?php ActiveForm::end(); ?>

    <?php } else { ?>
        <div class="form-group text-end mt-4">
            <?= Html::button('Close', ['class' => 'btn btn-danger', 'data-bs-dismiss' => 'modal']) ?>
        </div>
    <?php } ?>
</div>
<?php
AjaxForm::widget([
    'id' => 'myform',
    'enableAjaxSubmit' => true,
    'ajaxSubmitOptions' => [
        'beforeSend' => new JsExpression('function() {
                $(\'.loader_div\').show();
            }'),
        'success' => new JsExpression('function(response) {
                if(response.result == 1){
                    $(\'#formmodal\').modal(\'hide\');
                    $.pjax.reload({container: "#gridtable-pjax"});
                }else{
                    $(\'.field-booking-partial_price\').find(\'.invalid-feedback\').html(response.message);
                    $(\'.field-booking-partial_price\').find(\'.invalid-feedback\').css("display","block");
                }
            }'),
        'complete' => new JsExpression('function() {
                $(\'.loader_div\').hide();
            }')
    ],
]);
?>
<script>
    $(function () {
        $('input:radio[name="Booking[payment_type]"]').change(function () {
            if ($(this).val() == 'Partial') {
                $("#partial_div").css('display', 'block');
            } else {
                $("#partial_div").css('display', 'none');
            }
        });
    });

    function printData(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        document.getElementById('printContents').style.display = "block";
        document.getElementById('printContents').innerHTML = printContents;
        var allElements = document.body.children;
        for (var i = 0; i < allElements.length; i++) {
            if (allElements[i].getAttribute('id') !== "printContents") {
                allElements[i].style.display = "none";
            }
        }
        window.print();
//        for (var i = 0; i < allElements.length; i++) {
//            if (allElements[i].getAttribute('id') !== "printContents") {
//                allElements[i].style.display = "block";
//            } else {
//                allElements[i].style.display = "none";
//            }
//        }
    }

//    function printDiv(divName) {
//        var printContents = document.getElementById(divName).innerHTML;
//        var originalContents = document.body.innerHTML;
//        document.body.innerHTML = printContents;
//        window.print();
//        document.body.innerHTML = originalContents;
//    }
</script>