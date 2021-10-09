<?php

namespace backend\controllers;

use Yii;
use backend\models\Booking;
use backend\models\BookingSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\components\BaseController;
use backend\models\BookingItems;
use backend\models\BookingItemsSearch;
use backend\models\Menu;
use backend\models\Items;
/**
 * BookingController implements the CRUD actions for Booking model.
 */
class BookingController extends BaseController {

    const ACTIVE = 'Approved';
    const INACTIVE = 'Pending';
    const PARTIAL = 'Partial';
    const PAID = 'Paid';
    const DELETE = 'Delete';

    /**
     * {@inheritdoc}
     */
    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Categories models.
     * @return mixed
     */
    public function actionIndex() {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(['site/login']);
        }
        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        $pageSize = Yii::$app->params['PAGE_SIZE'];
        $searchModel = new BookingSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $pageSize);
        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Cities model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionStatusupdate($id) {
        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        if (Yii::$app->request->isAjax) {
            $model = $this->findModel($id);
            $model->scenario = 'payment';
            $partial_price = ($model->partial_price == null) ? 0 : $model->partial_price;
            if ($model->load(Yii::$app->request->post())) {
                $postdata = Yii::$app->request->post();
                $output = [];
                if($model->partial_price > $model->total_price){
                    $output['result'] = 0;
                    $output['message'] = 'Partial Price must be no greater than total price.';
                }else{
                    if ($model->status != 'Pending') {
                        $booking_partial_price = (isset($postdata['Booking']['partial_price']) && $postdata['Booking']['partial_price']) ? number_format($postdata['Booking']['partial_price'], 2, '.', '') : 0; 
                        $model->partial_price = $partial_price + $booking_partial_price;
                        $model->total_price = number_format($model->total_price, 2, '.', '');
                        if ($model->payment_type == 'Partial') {
                            $model->total_pay_price = $model->total_price - $model->partial_price;
                            $model->status = 'Partial';
                            if($model->partial_price == $model->total_price){
                                $model->partial_price = '0.00';
                                $model->status = 'Paid';
                                $model->total_pay_price = $model->total_price;
                            }
                        } else {
                            $model->partial_price = '0.00';
                            $model->total_pay_price = $model->total_price;
                            $model->status = 'Paid';
                        }
                        $model->total_pay_price = ($model->total_pay_price) ? number_format($model->total_pay_price, 2, '.', '') : '';
                        $model->paid_at = Yii::$app->BackFunctions->currentDateTime();
                    } elseif ($model->status == 'Pending') {
                        $model->status = "Booked";
                        //$model->menu = ($postdata['Booking']['menu']) ? implode(",", $postdata['Booking']['menu']) : '';
                    }
                    if(!$model->save()){echo '<pre>'; print_r($model->getErrors());echo '</pre>';exit;}
                    $output['result'] = 1;
                    $output['message'] = 'success';
                }
                return $this->asJson($output);
            }
            return $this->renderAjax('_payment_form', [
                        'model' => $model,
            ]);
//            $model->status = ($model->status == self::ACTIVE) ? self::INACTIVE : self::ACTIVE;
//            $model->status_at = Yii::$app->BackFunctions->currentDateTime();
//            return $model->save();
        }
    }

    public function actionApplystatus() {
        if (Yii::$app->request->isAjax) {
            if (isset($_POST['applyoption'])) {
                if ($_POST['applyoption'] == self::ACTIVE) {
                    if (empty(Yii::$app->BackFunctions->checkaccess('statusupdate', Yii::$app->controller->id))) {
                        throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
                    }
                    if (isset($_POST['keylist']) && $_POST['keylist']) {
                        foreach ($_POST['keylist'] as $id) {
                            $model = $this->findModel($id);
                            $model->status = self::ACTIVE;
                            $model->status_at = Yii::$app->BackFunctions->currentDateTime();
                            $model->save();
                        }
                    }
                } elseif ($_POST['applyoption'] == self::INACTIVE) {
                    if (empty(Yii::$app->BackFunctions->checkaccess('statusupdate', Yii::$app->controller->id))) {
                        throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
                    }
                    if (isset($_POST['keylist']) && $_POST['keylist']) {
                        foreach ($_POST['keylist'] as $id) {
                            $model = $this->findModel($id);
                            $model->status = self::INACTIVE;
                            $model->status_at = Yii::$app->BackFunctions->currentDateTime();
                            $model->save();
                        }
                    }
                } elseif ($_POST['applyoption'] == self::PAID) {
                    if (empty(Yii::$app->BackFunctions->checkaccess('statusupdate', Yii::$app->controller->id))) {
                        throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
                    }
                    if (isset($_POST['keylist']) && $_POST['keylist']) {
                        foreach ($_POST['keylist'] as $id) {
                            $model = $this->findModel($id);
                            $model->status = self::PAID;
                            $model->status_at = Yii::$app->BackFunctions->currentDateTime();
                            $model->save();
                        }
                    }
                } elseif ($_POST['applyoption'] == self::DELETE) {
                    if (empty(Yii::$app->BackFunctions->checkaccess('delete', Yii::$app->controller->id))) {
                        throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
                    }
                    if (isset($_POST['keylist']) && $_POST['keylist']) {
                        foreach ($_POST['keylist'] as $id) {
                            $this->findModel($id)->delete();
                        }
                    }
                }
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * Displays a single Role model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(['site/login']);
        }
        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        $model = $this->findModel($id);
        $searchModel = new BookingItemsSearch($model);
        $pageSize = Yii::$app->params['PAGE_SIZE'];
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $pageSize);
        return $this->render('view', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                    'model' => $model,
        ]);
    }

    public function actionItemweight(){
        if (Yii::$app->user->isGuest) {
            return false;
        }
        $request = Yii::$app->request;
        if ($request->isAjax) {
            $BookingItems = $request->post('BookingItems', '');
            $booking_id = $request->post('booking_id', '');
            $menu_id = $request->post('menu_id', '');
            $item_id = $request->post('item_id', '');
            $weight = $request->post('weight', '');
            $unit = $request->post('unit', '');
            $INR = $request->post('INR', '');
            if($BookingItems){
                $booking_id = $BookingItems['booking_id'];
                $menu_id = $BookingItems['menu_id'];
                $item_id = $BookingItems['item_id'];
                $weight = $BookingItems['weight'];
                $unit = $BookingItems['unit'];
                $INR = $BookingItems['INR'];
                $model = BookingItems::find()->where(['booking_id'=>$booking_id, 'menu_id' => $menu_id, 'item_id' => $item_id])->one();
                if ($model && $model->load(Yii::$app->request->post())) {
                    $model->booking_id = $model->booking_id[$model->id];
                    $model->menu_id = $model->menu_id[$model->id];
                    $model->item_id = $model->item_id[$model->id];
                    $model->weight = $model->weight[$model->id];
                    $model->unit = $model->unit[$model->id];
                    $model->INR = $model->INR[$model->id];
                    if(!$model->save()){echo '<pre>'; print_r($model->getErrors());echo '</pre>';exit;}
                    return true;
                }
            }elseif($booking_id){
                for($i=0; $i<count($booking_id); $i++){
                    $model = BookingItems::find()->where(['booking_id'=>$booking_id[$i], 'menu_id' => $menu_id[$i], 'item_id' => $item_id[$i]])->one();
                    $model->booking_id = $booking_id[$i];
                    $model->menu_id = $menu_id[$i];
                    $model->item_id = $item_id[$i];
                    $model->weight = $weight[$i];
                    $model->unit = $unit[$i];
                    $model->INR = $INR[$i];
                    if(!$model->save()){echo '<pre>'; print_r($model->getErrors());echo '</pre>';exit;}
                }
            }
            return true;
            
        }
        return false;
    }
    /**
     * Creates a new Role model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        if (Yii::$app->user->isGuest) {
            return false;
        }
        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        if (Yii::$app->request->isAjax) {
            $model = new Booking();
            $model->scenario = 'backend';
            if ($model->load(Yii::$app->request->post())) {
                $model->datetime = $model->date . ' ' . $model->time;
                $model->menu = ($model->menu) ? implode(",", $model->menu) : '';
                $model->status_at = Yii::$app->BackFunctions->currentDateTime();
                $model->created_at = Yii::$app->BackFunctions->currentDateTime();
                $model->updated_at = Yii::$app->BackFunctions->currentDateTime();
                $model->save();
                if (strlen($model->id) == 1) {
                    $bookingid = 'GC000' . $model->id;
                } elseif (strlen($model->id) == 2) {
                    $bookingid = 'GC00' . $model->id;
                } elseif (strlen($model->id) == 3) {
                    $bookingid = 'GC0' . $model->id;
                } elseif (strlen($model->id) >= 4) {
                    $bookingid = 'GC' . $model->id;
                }
                $model->booking_id = $bookingid;
                $model->save();
                $booking_menu = explode(",", $model->menu);
                if ($booking_menu) {
                    foreach ($booking_menu as $value) {
                        $menu_data = Menu::find()->where(['id' => $value])->one();
                        if ($menu_data) {
                            $menu_items = explode(",", $menu_data->items);
                            foreach ($menu_items as $items) {
                                $items_data = Items::find()->where(['id' => $items])->one();
                                if($items_data){
                                    $BookingItemsModel_update = BookingItems::find()->where(['booking_id'=>$model->id, 'menu_id' => $menu_data->id, 'item_id' => $items_data->id])->count();
                                    if(empty($BookingItemsModel_update)){
                                        $BookingItemsModel = new BookingItems();
                                        $BookingItemsModel->scenario = 'viewdata';
                                        $BookingItemsModel->booking_id = $model->id;
                                        $BookingItemsModel->menu_id = $menu_data->id;
                                        $BookingItemsModel->category_id = $menu_data->menuCategory->id;
                                        $BookingItemsModel->item_id = $items_data->id;
                                        $BookingItemsModel->item_category_id = $items_data->itemCategory->id;
                                        $BookingItemsModel->weight = "";
                                        $BookingItemsModel->unit = "";
                                        $BookingItemsModel->created_at = Yii::$app->BackFunctions->currentDateTime();
                                        $BookingItemsModel->updated_at = Yii::$app->BackFunctions->currentDateTime();
                                        if(!$BookingItemsModel->save()){
                                            echo '<pre>'; print_r($BookingItemsModel->getErrors());echo '</pre>';exit;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                return $model->id;
            }
            return $this->renderAjax('create', [
                        'model' => $model
            ]);
        }
    }

    /**
     * Updates an existing Role model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        if (Yii::$app->user->isGuest) {
            return false;
        }
        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        if (Yii::$app->request->isAjax) {
            $model = $this->findModel($id);
            $model->date = date('Y-m-d', strtotime($model->datetime));
            $model->time = date('H:i', strtotime($model->datetime));
            $beforeMenu = explode(",", $model->menu);
            if ($model->load(Yii::$app->request->post())) {
                $postdata = Yii::$app->request->post();
                $model->datetime = $model->date . ' ' . $model->time;
                if ($beforeMenu) {
                    foreach ($beforeMenu as $bvalue) {
                        if(!in_array($bvalue, $postdata['Booking']['menu'])){
                            BookingItems::deleteAll(['booking_id'=>$model->id, 'menu_id' => $bvalue]);
                        }
                    }
                }
                $model->menu = ($postdata['Booking']['menu']) ? implode(",", $postdata['Booking']['menu']) : '';
                $model->updated_at = Yii::$app->BackFunctions->currentDateTime();
                $model->status = "Booked";
                if(!$model->save()) {echo '<pre>'; print_r($model->getErrors());echo '</pre>';exit;}
                $booking_menu = explode(",", $model->menu);
                if ($booking_menu) {
                    foreach ($booking_menu as $value) {
                        $menu_data = Menu::find()->where(['id' => $value])->one();
                        if ($menu_data) {
                            $menu_items = explode(",", $menu_data->items);
                            foreach ($menu_items as $items) {
                                $items_data = Items::find()->where(['id' => $items])->one();
                                if($items_data){
                                    $BookingItemsModel_update = BookingItems::find()->where(['booking_id'=>$model->id, 'menu_id' => $menu_data->id, 'item_id' => $items_data->id])->count();
                                    if(empty($BookingItemsModel_update)){
                                        $BookingItemsModel = new BookingItems();
                                        $BookingItemsModel->scenario = 'viewdata';
                                        $BookingItemsModel->booking_id = $model->id;
                                        $BookingItemsModel->menu_id = $menu_data->id;
                                        $BookingItemsModel->category_id = $menu_data->menuCategory->id;
                                        $BookingItemsModel->item_id = $items_data->id;
                                        $BookingItemsModel->item_category_id = $items_data->itemCategory->id;
                                        $BookingItemsModel->weight = "";
                                        $BookingItemsModel->unit = "";
                                        $BookingItemsModel->created_at = Yii::$app->BackFunctions->currentDateTime();
                                        $BookingItemsModel->updated_at = Yii::$app->BackFunctions->currentDateTime();
                                        if(!$BookingItemsModel->save()){
                                            echo '<pre>'; print_r($BookingItemsModel->getErrors());echo '</pre>';exit;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                return $model->id;
            }

            return $this->renderAjax('update', [
                        'model' => $model
            ]);
        }
    }

    /**
     * Deletes an existing Role model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(['site/login']);
        }

        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Booking model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Booking the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Booking::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

}
