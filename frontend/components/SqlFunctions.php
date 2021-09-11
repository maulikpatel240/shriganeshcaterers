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
use backend\models\Custompages;
use backend\models\Categories;
use backend\models\Menu;
use backend\models\EventCategories;
use backend\models\Gallery;

class SqlFunctions extends Component {

    public $_user = "";
    public $_baseUrl = "/";
    public $_basePath = "/";

    public function init() {
        parent::init();
        $this->_user = Yii::$app->user->identity;
        $this->_baseUrl = Url::base(true) . '/';
        $this->_basePath = Url::base() . '/';
    }

    function config($condition = "") {
        if($condition){
            return Config::find()->where(['status' => 'Active'])->andWhere($condition)->asArray()->one();
        }
        return Config::find()->where(['status' => 'Active'])->asArray()->all();
    }

    function custompages($condition = "") {
        if($condition){
            return Custompages::find()->where(['status' => 'Active'])->andWhere($condition)->asArray()->one();
        }
        return Custompages::find()->where(['status' => 'Active'])->asArray()->all();
    }
    
    function categories($condition = "") {
        if($condition){
            return Categories::find()->where(['status' => 'Active'])->andWhere($condition)->asArray()->one();
        }
        return Categories::find()->where(['status' => 'Active'])->asArray()->all();
    }
    
    function menu($condition = "") {
        if($condition){
            return Menu::find()->where(['status' => 'Active'])->andWhere($condition)->asArray()->one();
        }
        return Menu::find()->where(['status' => 'Active'])->asArray()->all();
    }
    
    function eventCategories($condition = "") {
        if($condition){
            return EventCategories::find()->where(['status' => 'Active'])->andWhere($condition)->asArray()->one();
        }
        return EventCategories::find()->where(['status' => 'Active'])->asArray()->all();
    }
    
    function gallery($condition = "", $limit = '') {
        if($condition){
            if($limit == 'all'){
                return Gallery::find()->where(['status' => 'Active'])->andWhere($condition)->orderBy(['id' => SORT_DESC])->asArray()->all();
            }
            return Gallery::find()->where(['status' => 'Active'])->andWhere($condition)->orderBy(['id' => SORT_DESC])->asArray()->one();
        }
        if($limit && $limit != 'all'){
            return Gallery::find()->where(['status' => 'Active'])->orderBy(['id' => SORT_DESC])->limit($limit)->asArray()->all();
        }
        return Gallery::find()->where(['status' => 'Active'])->orderBy(['id' => SORT_DESC])->asArray()->all();
    }
}
