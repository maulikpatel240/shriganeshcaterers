<?php

namespace frontend\controllers;

use Yii;
use yii\base\InvalidArgumentException;
use yii\helpers\Url;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use frontend\components\BaseController;
use backend\models\Booking;
use backend\models\Review;

/**
 * Site controller
 */
class SiteController extends BaseController {
    // public $_baseUrl = "/";
    // public $_basePath = "/";
    // public $_lang = "en";
    // public $_langID = 1;
    // public $_module = array();
    // public $_user = array();

    /**
     * {@inheritdoc}
     */
    public function behaviors() {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        //'actions' => ['login', 'error','index'],
                        'actions' => ['error', 'index', 'booking', 'gallery', 'review','menu'],
                        'allow' => true,
                    ],
                    [
                        //'actions' => ['logout', 'index'],
                        'actions' => ['index', 'booking', 'gallery', 'review', 'menu'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    // public function actions()
    // {
    //     return [
    //         'error' => [
    //             'class' => 'yii\web\ErrorAction',
    //         ],
    //         'captcha' => [
    //             'class' => 'yii\captcha\CaptchaAction',
    //             'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
    //         ],
    //     ];
    // }

    public function init() {
        parent::init();
        global $vm;
    }

    public function beforeAction($action) {

        return parent::beforeAction($action);
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex() {
        global $sg;
        $renderdata = array();
        $renderdata['categories'] = Yii::$app->SqlFunctions->categories();
        $renderdata['eventCategories'] = Yii::$app->SqlFunctions->eventCategories();
        //$renderdata['gallery'] = Yii::$app->SqlFunctions->gallery('', 8);
        $BookingModel = new Booking();
        $ReviewModel = new Review();
        $BookingModel->scenario = 'frontend';
        $renderdata['BookingModel'] = $BookingModel;
        $renderdata['ReviewModel'] = $ReviewModel;
        return $this->render('index', $renderdata);
    }

    public function actionBooking() {
        global $sg;
        $request = Yii::$app->request;

        $model = new Booking();
        $model->scenario = 'frontend';
        if ($request->isAjax && $model->load(Yii::$app->request->post())) {
            $model->datetime = $model->date . ' ' . $model->time;
            $model->status_at = Yii::$app->FrontFunctions->currentDateTime();
            $model->created_at = Yii::$app->FrontFunctions->currentDateTime();
            $model->updated_at = Yii::$app->FrontFunctions->currentDateTime();
            if (!$model->save()) {
                echo '<pre>';
                print_r($model->getErrors());
                echo '</pre>';
                exit;
            }
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
            return $model->id;
        }
        return $this->render('booking', ['BookingModel' => $model]);
    }

    public function actionReview() {
        global $sg;
        $request = Yii::$app->request;

        $model = new Review();
        if ($request->isAjax && $model->load(Yii::$app->request->post())) {
            $model->status = 'Active';
            $model->status_at = Yii::$app->FrontFunctions->currentDateTime();
            $model->created_at = Yii::$app->FrontFunctions->currentDateTime();
            $model->updated_at = Yii::$app->FrontFunctions->currentDateTime();
            if (!$model->save()) {
                echo '<pre>';
                print_r($model->getErrors());
                echo '</pre>';
                exit;
            }
            return $model->id;
        }
    }

    public function actionGallery() {
        global $sg;
        $request = Yii::$app->request;

        $gallery = Yii::$app->SqlFunctions->gallery(['type' => 'Image'], 'all');
        return $this->render('gallery', ['gallery' => $gallery]);
    }
    
    public function actionMenu() {
        global $sg;
        $request = Yii::$app->request;
        $renderdata = [];
        $renderdata['categories'] = Yii::$app->SqlFunctions->categories();
        $renderdata['menus'] = Yii::$app->SqlFunctions->menu();
        return $this->render('menu', $renderdata);
    }

    public function actionError() {
        $this->layout = 'blank';
        $exception = Yii::$app->errorHandler->exception;
        if ($exception !== null) {
            return $this->render('error', ['exception' => $exception]);
        }
    }

}
