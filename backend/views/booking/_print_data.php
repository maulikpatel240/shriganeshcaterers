<?php

use backend\models\Menu;
use backend\models\BookingItems;

$singlemenu = Menu::find()->where(['status' => 'Active'])->andWhere(['id' => $menu_id])->one();
$category = $singlemenu->menuCategory->gujarati . ' (' . ucfirst($singlemenu->menuCategory->english) . ')';

$BookingItems = BookingItems::find()->joinWith('menuCategory')->where(['booking_items.booking_id' => $booking_id, 'booking_items.menu_id'=>$menu_id])->orderBy(['categories.position' => SORT_ASC])->all();
$table = '';
$dataid = [];
if ($BookingItems) {
    $i = 0;
    foreach ($BookingItems as $key => $value) {
        $i++;
//        if ($key > 0) {
//            $prev = $BookingItems[$key - 1];
//            if($prev->menu_id != $value->menu_id){
//                $table .= '<tr>
//                    <td style="border: 1px solid #ddd;" colspan="5">' . $value->menu->id . '- ' . $value->menu->english . ' (' . $value->menuCategory->id . '-' . $value->menuCategory->gujarati . ')' . '</td>
//                </tr>';
//            }
//        }
        $table .= '<tr>
            <td style="border: 1px solid #ddd;">' . ($key+1) . '</td>
            <td style="border: 1px solid #ddd;">' . $value->itemCategory->gujarati . ' (' . $value->itemCategory->english . ')' . '</td>
            <td style="border: 1px solid #ddd;">' . $value->item->gujarati . ' (' . ucfirst($value->item->english) . ')' . '</td>
            <td style="border: 1px solid #ddd;">' . $value->weight . '</td>
            <td style="border: 1px solid #ddd;">' . $value->unit . '</td>
        </tr>';
    }
}

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

<h4 style="border: 1px solid #ddd; background:#ddd;">
   <?= '<div style="font-size: 20px; font-weight: bold; float: left">'.ucfirst($singlemenu->english).'</div> <div style="font-size: 18px;float: right;">'.$category.'</div>'?>
</h4>
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