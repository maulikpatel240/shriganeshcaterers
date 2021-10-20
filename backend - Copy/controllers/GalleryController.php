<?php

namespace backend\controllers;

use Yii;
use backend\models\Gallery;
use backend\models\GallerySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\components\BaseController;
use yii\web\UploadedFile;
use yii\helpers\Url;
/**
 * GalleryController implements the CRUD actions for Gallery model.
 */
class GalleryController extends BaseController
{
    const ACTIVE = 'Active';
    const INACTIVE = 'Inactive';
    const DELETE = 'Delete';
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
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
        $searchModel = new GallerySearch();
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
            $model->status = ($model->status == self::ACTIVE) ? self::INACTIVE : self::ACTIVE;
            $model->status_at = Yii::$app->BackFunctions->currentDateTime();
            return $model->save();
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
        if (Yii::$app->request->isAjax) {
            return $this->renderAjax('view', [
                        'model' => $this->findModel($id),
            ]);
        }
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
            $model = new Gallery();
            if (\Yii::$app->request->post()) {
                $model->image = UploadedFile::getInstances($model, 'image');
                foreach ($model->image as $file) {
                    //$model->upload();
                    $saveTo = Yii::getAlias('@webroot') . '/uploads/gallery/' . $file->baseName . '.' . $file->extension;
                    if ($file->saveAs($saveTo)) {
                        $model2 = new Gallery(['value' => $file->baseName . '.' . $file->extension]);
                        $model2->save(false);
                    }
                }
                Yii::$app->session->setFlash('success', 'Success uploaded !');
                return true;
            }
//            $model = new Gallery();
//            if ($model->load(Yii::$app->request->post())) {
//                $model->image = UploadedFile::getInstance($model, 'image');
//                $gallery = $_FILES['Gallery'];
//                $name_img = $gallery['name']['image'];
//                $type_img = $gallery['type']['image'];
//                $tmp_name = $gallery['tmp_name']['image'];
//                $error_img = $gallery['error']['image'];
//                $size_img = $gallery['size']['image'];
//                $imagedatanew = [];
//                if($name_img){
//                    for($i=0; $i<count($name_img); $i++){
//                        $imagedata = [];
//                        $imagedata['name'] =  $name_img[$i];
//                        $imagedata['type'] =  $type_img[$i];
//                        $imagedata['tmp_name'] =  $tmp_name[$i];
//                        $imagedata['error'] =  $error_img[$i];
//                        $imagedata['size'] =  $size_img[$i];
//                        //$imagedatanew[] = $imagedata;
////                        $modelnew = new Gallery();
////                        $filename = $name_img[$i];
////                        $modelnew->image = $filename;
////                        $modelnew->save();
////                        echo '<pre>'; print_r($modelnew);echo '</pre>';exit;
//                    }
//                }
//                $model->image = $imagedata;
//                $model->image = UploadedFile::getInstance($model, 'image');
//                
//                echo '<pre>'; print_r($model);echo '</pre>';exit;
//                foreach ($model->image as $file) 
//                {
//                $path = 'uploads/gallery/' . $file->baseName . '.' . $file->extension;
//                echo '<pre>'; print_r($path);echo '</pre>';
//               // file->saveAs($path);
//                }
//                exit;
//                if ($model->image) {
//                    $model->upload();
//                }
//                $model->video = UploadedFile::getInstance($model, 'video');
//                if ($model->image) {
//                    $model->upload();
//                }
//                $model->status_at = Yii::$app->BackFunctions->currentDateTime();
//                $model->created_at = Yii::$app->BackFunctions->currentDateTime();
//                $model->updated_at = Yii::$app->BackFunctions->currentDateTime();
//                $model->save();
//                return $model->id;
//            }
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
            if ($model->load(Yii::$app->request->post())) {
                $model->image = UploadedFile::getInstance($model, 'image');
                if($model->image){
                    $model->deleteImage($model->getOldAttribute('image'));
                    $model->upload();
                }else{
                    $model->image = $model->getOldAttribute('image');
                }
                $model->updated_at = Yii::$app->BackFunctions->currentDateTime();
                $model->save();
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
     * Finds the Gallery model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Gallery the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Gallery::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
