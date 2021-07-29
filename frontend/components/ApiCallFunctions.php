<?php

namespace frontend\components;

use Yii;
use yii\base\Component;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
use yii\web\Response;

class ApiCallFunctions extends Component {
    public $_user="";
    public $_lang="en";
    public $_langID=1;
    
    public function init()
    {
        parent::init();
        $this->_user = Yii::$app->user->identity;
        $this->_lang = Yii::$app->FrontFunctions->defaultlanguage();
        $this->_langID = Yii::$app->FrontFunctions->defaultlanguage(true);
    }
    function response($output = ""){
        $output = json_decode($output,true);
        return $output;
    }
    
    public function AppLanguagesApi($restapiData=array(),$method="get"){
        $user = $this->_user;
        if($user){
            $restapiData['authkey'] = $user->authkey;
            $restapiData['language_id'] = $this->_langID;
        }
        $restapiUrl = Yii::$app->params['REST_API_URL'] . 'beforeauth/app-languages';
        $output = Yii::$app->FrontFunctions->restapicalltocurl($restapiUrl, $restapiData, $method);
        return $this->response($output);
    }
}