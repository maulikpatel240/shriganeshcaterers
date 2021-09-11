<?php

namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\models\LoginForm;
use common\components\AppStart;
use backend\components\BaseController;
use backend\models\UploadExcel;
use yii\web\UploadedFile;
use backend\models\Booking;
use yii\data\Pagination;

/**
 * Site controller
 */
class SiteController extends BaseController {

    /**
     * {@inheritdoc}
     */
    public function behaviors() {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error', 'import', 'export', 'villagesxls', 'village'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
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
    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex() {
        if (empty(Yii::$app->BackFunctions->checkaccess(Yii::$app->controller->action->id, Yii::$app->controller->id))) {
            throw new \yii\web\HttpException('403', Yii::$app->params['permission_message']);
        }
        $booking = Booking::find()->where(['status' => 'Approved'])->count();
        $booking_paid = Booking::find()->where(['status' => 'Paid'])->count();
        return $this->render('index', ['booking' => $booking, 'booking_paid' => $booking_paid]);
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin() {
//        if (!Yii::$app->user->isGuest) {
//            return $this->goHome();
//        }
        $this->layout = 'beforelogin';
        //$password = "123456";
        //echo Yii::$app->security->generatePasswordHash($password);exit;
        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            $model->password = '';

            return $this->render('login', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout() {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function actionError() {
        if ($error = Yii::$app->errorHandler->error) {
            $this->render('error', $error);
        }
    }

}
