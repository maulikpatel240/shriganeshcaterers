<?php

namespace frontend\components;

use Yii;
use yii\base\Component;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
use yii\web\Response;
use yii\web\UploadedFile;
use backend\models\Config;

class SqlFunctions extends Component {

    public $_user = "";
    public $_baseUrl = "/";
    public $_basePath = "/";

    public function init() {
        parent::init();
        $this->_user = Yii::$app->user->identity;
        $this->_baseUrl = Url::base(true).'/';
        $this->_basePath = Url::base().'/';
    }
    
    function config($name=""){
        $config = Config::find()->where(['status' => 'Active','name' => $name])->asArray()->all();
    }
}
