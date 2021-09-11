<?php

namespace frontend\components;

use Yii;
use yii\web\Controller;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
use yii\web\Response;
use yii\web\UploadedFile;
use backend\models\Config;

class BaseController extends Controller {

    public function init() {
        parent::init();
        global $sg, $sconfig;
        $sg = array();
        $sg['base_url'] = $sg['site_url'] = Url::base(true) . '/git/shriganeshcaterers';
        $sg['base_path'] = $sg['site_path'] = '/git/shriganeshcaterers/';
        $user = Yii::$app->user->identity;
        $sg['user'] = $user;
        $configdata = Config::find()->where(['status' => 'Active'])->asArray()->all();
        $sconfig = ArrayHelper::index($configdata, 'name');
        $lang = (Yii::$app->session->get('language'))?Yii::$app->session->get('language'):'en-IN';
        $sg['lang'] = (isset($_REQUEST['lang']) && $_REQUEST['lang']) ? Yii::$app->FrontFunctions->changeLanguage($_REQUEST['lang']) : $lang;
        $sg['language'] = (isset(Yii::$app->params['LANGUAGE'][$sg['lang']]) && Yii::$app->params['LANGUAGE'][$sg['lang']]) ? Yii::$app->params['LANGUAGE'][$sg['lang']] : '';
    }

}
