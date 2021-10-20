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
                        'actions' => ['login', 'error', 'import'],
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
    
    public function actionImport() {
        $this->layout = 'beforelogin';
        $model = new UploadExcel();
        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, 'file');
            //      if ($model->upload()) {
            //        print <<<EOT
            //< script > alert ('upload succeeded ') < / script >
            //EOT;
            //      } else {
            //        print <<<EOT
            //< script > alert ('upload failed ') < / script >
            //EOT;
            //      }
            if (!$model->upload()) {
                print <<<EOT
                < script > alert ('upload failed ') < / script >
               EOT;
            }
        }
        $ok = 0;
        if ($model->load(Yii::$app->request->post())) {
            $data = [];
            $file = UploadedFile::getInstance($model, 'file');
            if ($file) {
                $filename = 'uploads/files/' . $file->name;
                $file->saveAs($filename);

                if (in_array($file->extension, array('xls', 'xlsx'))) {
                    $data = \moonland\phpexcel\Excel::widget([
                            'mode' => 'import', 
                            'fileName' => $filename, 
                            'setFirstRecordAsKeys' => true, // if you want to set the keys of record column with first record, if it not set, the header with use the alphabet column on excel. 
                            'setIndexSheetByName' => true, // set this if your excel data with multiple worksheet, the index of array will be set with the sheet name. If this not set, the index will use numeric. 
                            'getOnlySheet' => 'menu', // you can set this property if you want to get the specified sheet from the excel data with multiple worksheet.
                    ]);
                    //echo '<pre>'; print_r($data);echo '</pre>';exit;
                    //prev(array)
                    //Yii::$app->cacheBackend->set('pincode', $data);
                    //Yii::$app->cacheBackend->set('villages', $data);
                    //$data = $data['Report'];
                    //echo '<pre>'; print_r($data);echo '</pre>';exit;
                    return $this->render('import_exel', ['data' => $data]);
                }
            }
        } else {
            return $this->render('import_exel', ['model' => $model]);
        }
    }
}
