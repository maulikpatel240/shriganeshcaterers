<?php

namespace frontend\components;

use Yii;
use yii\web\Controller;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
use yii\web\Response;
use yii\web\UploadedFile;

class BaseController extends Controller {

    public function init() {
        parent::init();
        global $sg;
        $sg = array();
        $sg['base_url'] = $sg['site_url'] = Url::base(true).'/git/shriganeshcaterers';
        $sg['base_path'] = $sg['site_path'] = '/git/shriganeshcaterers/';
        $user = Yii::$app->user->identity;
        $sg['user'] = $user;
    }
}
