
<style> 
    /*@font-face {
       font-family: myFirstFont;
       src: url(https://localhost/vandemission/adminpanel/css/HARIKRISHNA.TTF);
    }
    
    * {
       font-family: HARIKRISHNA;
    }*/
    .gujarati{
        font-family: HARIKRISHNA;
    }
</style>
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Items;
use backend\models\Menu;
?>

<?php
if (isset($data) && $data) {
    ?>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">item_category_id</th>
                <th scope="col">gujarati</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($data as $key => $row) {
                $i_join = []; 
                for($i=0; $i<50; $i++){
                    $i_join_t = (isset($row[$i]) && $row[$i])?trim($row[$i]):"";
                    if($i_join_t){
                        $i_join_t1 = Items::find()->where(['gujarati'=>$i_join_t])->one();
                        if($i_join_t1){
                            $i_join[] = $i_join_t1->id;
                        }
                    }
                }      
                $row['i_join'] = ($i_join)?implode(',', $i_join):"";
                $modelNew = Menu::find()->where(['english' => $row['english']])->one();
                if (empty($modelNew)) {
                    $modelNew = new Menu();
                }
                $modelNew->menu_category_id = $row['menu_category_id'];
                $modelNew->english = $row['english'];
                $modelNew->gujarati = '';
                $modelNew->hindi = '';
                $modelNew->items = $row['i_join'];
                $modelNew->status_at = Yii::$app->BackFunctions->currentDateTime();
                $modelNew->created_at = Yii::$app->BackFunctions->currentDateTime();
                $modelNew->updated_at = Yii::$app->BackFunctions->currentDateTime();
                if(!$modelNew->save()){
                    echo '<pre>'; print_r($modelNew->getErrors());echo '</pre>';exit;
                }
               // echo '<pre>'; print_r($modelNew);echo '</pre>';
//                echo "INSERT INTO `items`(`item_category_id`,`gujarati`) VALUES ('".$row['id']."','".$row['item_category_id']."','".'<p class="gujarati">' . $row['gujarati'] . '</p>'."')<br>";
                /* Items add
                $icat = '';
                if($row['category'] == 'grocery'){
                    $icat = 1;
                }elseif($row['category'] == 'papernepkin'){
                    $icat = 4;
                }elseif($row['category'] == 'dairy'){
                    $icat = 3;
                }elseif($row['category'] == 'order'){
                    $icat = 5;
                }elseif($row['category'] == 'vegetable'){
                    $icat = 2;
                }elseif($row['category'] == 'kitchenware'){
                    $icat = 6;
                }  
                $modelNew = Items::find()->where(['gujarati'=>$row['gujarati']])->one();
                if(empty($modelNew)){
                    $modelNew = new Items();
                }
                $modelNew->item_category_id = $icat;
                $modelNew->english = $row['english'];
                $modelNew->gujarati = $row['gujarati'];
                $modelNew->hindi = '';
                $modelNew->status_at = Yii::$app->BackFunctions->currentDateTime();
                $modelNew->created_at = Yii::$app->BackFunctions->currentDateTime();
                $modelNew->updated_at = Yii::$app->BackFunctions->currentDateTime();
                $modelNew->save();
                */
                //echo "INSERT INTO `items`(`item_category_id`,`gujarati`) VALUES ('".$row['gujarati']."','".$icat ."')<br>";
               //echo '<pre>'; print_r($row);echo '</pre>';exit;
            }
            exit;
            ?>
        </tbody>
    </table>
    <?php
} else {
    $form = ActiveForm::begin([
                'id' => 'upload',
                'options' => ['enctype' => 'multipart/form-data'],
            ])
    ?>
    <?= $form->field($model, 'file')->fileInput(['multiple' => 'multiple']) ?>

    <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    <?php ActiveForm::end() ?>
<?php } ?>

