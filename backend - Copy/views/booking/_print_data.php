<?php

use backend\models\Menu;
use backend\models\BookingItems;


$BookingItems = BookingItems::find()->where(['booking_id' => $booking_id])->all();
$table = '';
$dataid = [];
if ($BookingItems) {
    $i = 0;
    foreach ($BookingItems as $value) {
        $menuid = explode(",", $value->menu_id);
        $dataidcheck = [];
        if ($menuid) {
            foreach ($menuid as $m) {
                $menuidArray = explode("-", $m);
                $dataidcheck[] = $menuidArray[0];
            }
        }
        if(in_array($menu_id, $dataidcheck)){
//            if ($dataidcheck) {
//                foreach ($dataidcheck as $dc) {
//                    $dataid[] = $dc;
//                }
//            }
            $dataid[] = $menu_id;
            $i++;
            $table .= '<tr>
                <td style="border: 1px; solid #ddd;">' . $i . '</td>
                <td style="border: 1px; solid #ddd;">' . $value->itemCategory->id . '-' . $value->itemCategory->gujarati . ' (' . $value->itemCategory->english . ')' . '</td>
                <td style="border: 1px solid #ddd;">' . $value->item->id . '- ' . $value->item->gujarati . ' (' . ucfirst($value->item->english) . ')' . '</td>
                <td style="border: 1px solid #ddd;">' . $value->weight . '</td>
                <td style="border: 1px solid #ddd;">' . $value->unit . '</td>
            </tr>';
        }
    }
}
$dataidall = array_values(array_unique($dataid));
$multimenu = Menu::find()->where(['status' => 'Active'])->andWhere(['in', 'id', $dataidall])->all();

$singlemenu = Menu::find()->where(['status' => 'Active'])->andWhere(['id' => $menu_id])->one();

$category = '' . $singlemenu->menuCategory->id . '-' . $singlemenu->menuCategory->gujarati . ' (' . ucfirst($singlemenu->menuCategory->english) . ')';

?>
<style>
    #customers {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #customers td, #customers th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    #customers tr:nth-child(even){background-color: #f2f2f2;}

    #customers tr:hover {background-color: #ddd;}

    #customers th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #04AA6D;
        color: white;
    }
</style>
<h4 style="text-align: center"><?= $category ?></h4>
<h1 style="text-align: center">
    <?php
    if ($multimenu) {
        foreach ($multimenu as $m) {
            echo '<button type="button" style="font-size:24px;margin:4px;" class="btn btn-outline-success">' . $m->id . '- ' . ucfirst($m->english) . '</button>';
        }
    }
    ?>
</h1>
<table id="customers">
    <tr>
        <th style="border: 1px solid #ddd;">No</th>
        <th style="border: 1px solid #ddd;">Item Category</th>
        <th style="border: 1px solid #ddd;">Items</th>
        <th style="border: 1px solid #ddd;">Weight or Qty</th>
        <th style="border: 1px solid #ddd;">Unit</th>
    </tr>
    <?= $table ?>
</table>