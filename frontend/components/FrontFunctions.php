<?php

namespace frontend\components;

use Yii;
use yii\base\Component;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
use yii\web\Response;
use yii\web\UploadedFile;

class FrontFunctions extends Component {

    public $_user = "";
    public $array;
    public $pairs;
    public $key;
    public $value;
    public $key_sorting = "ASC"; //ASC, DESC, Normal
    public $string = "", $model = "", $title = "", $cc = "", $extra_check = false, $language_id = false;
    public $_baseUrl = "/";
    public $_basePath = "/";

    public function init() {
        parent::init();
        $this->_user = Yii::$app->user->identity;
        $this->_baseUrl = Url::base(true) . '/';
        $this->_basePath = Url::base() . '/';
    }

    public function cookiedestory() {
        $key = Yii::$app->user->identityCookie['name'];
        $cookie = Yii::$app->request->cookies->getValue($key);
        if ($cookie) {
            $cookie = json_decode($cookie, true);
        }
        $result = array();
        $result['type'] = "";
        $result['result'] = false;
        if (Yii::$app->user->identity) {
            $result['type'] = Yii::$app->user->identity->type;
            if (isset($cookie[1]) && $cookie[1] != Yii::$app->user->identity->authkey) {
                $result['result'] = true;
            }
        }
        return $result;
    }

    function httpstatuscodes($code = "") {
        $http_status_codes = array(
            100 => Yii::t('app', "Continue"),
            101 => Yii::t('app', "Switching Protocols"),
            102 => Yii::t('app', "Processing"),
            200 => Yii::t('app', "OK"),
            201 => Yii::t('app', "Created"),
            202 => Yii::t('app', "Accepted"),
            203 => Yii::t('app', "Non-Authoritative Information"),
            204 => Yii::t('app', "No Content"),
            205 => Yii::t('app', "Reset Content"),
            206 => Yii::t('app', "Partial Content"),
            207 => Yii::t('app', "Multi-Status"),
            300 => Yii::t('app', "Multiple Choices"),
            301 => Yii::t('app', "Moved Permanently"),
            302 => Yii::t('app', "Found"),
            303 => Yii::t('app', "See Other"),
            304 => Yii::t('app', "Not Modified"),
            305 => Yii::t('app', "Use Proxy"),
            306 => Yii::t('app', "(Unused)"),
            307 => Yii::t('app', "Temporary Redirect"),
            308 => Yii::t('app', "Permanent Redirect"),
            400 => Yii::t('app', "Bad Request"),
            401 => Yii::t('app', "Unauthorized"),
            402 => Yii::t('app', "Payment Required"),
            403 => Yii::t('app', "Forbidden"),
            404 => Yii::t('app', "Not Found"),
            405 => Yii::t('app', "Method Not Allowed"),
            406 => Yii::t('app', "Not Acceptable"),
            407 => Yii::t('app', "Proxy Authentication Required"),
            408 => Yii::t('app', "Request Timeout"),
            409 => Yii::t('app', "Conflict"),
            410 => Yii::t('app', "Gone"),
            411 => Yii::t('app', "Length Required"),
            412 => Yii::t('app', "Precondition Failed"),
            413 => Yii::t('app', "Request Entity Too Large"),
            414 => Yii::t('app', "Request-URI Too Long"),
            415 => Yii::t('app', "Unsupported Media Type"),
            416 => Yii::t('app', "Requested Range Not Satisfiable"),
            417 => Yii::t('app', "Expectation Failed"),
            418 => Yii::t('app', "I'm a teapot"),
            419 => Yii::t('app', "Authentication Timeout"),
            420 => Yii::t('app', "Enhance Your Calm"),
            422 => Yii::t('app', "Unprocessable Entity"),
            423 => Yii::t('app', "Locked"),
            424 => Yii::t('app', "Failed Dependency"),
            424 => Yii::t('app', "Method Failure"),
            425 => Yii::t('app', "Unordered Collection"),
            426 => Yii::t('app', "Upgrade Required"),
            428 => Yii::t('app', "Precondition Required"),
            429 => Yii::t('app', "Too Many Requests"),
            431 => Yii::t('app', "Request Header Fields Too Large"),
            444 => Yii::t('app', "No Response"),
            449 => Yii::t('app', "Retry With"),
            450 => Yii::t('app', "Blocked by Windows Parental Controls"),
            451 => Yii::t('app', "Unavailable For Legal Reasons"),
            494 => Yii::t('app', "Request Header Too Large"),
            495 => Yii::t('app', "Cert Error"),
            496 => Yii::t('app', "No Cert"),
            497 => Yii::t('app', "HTTP to HTTPS"),
            499 => Yii::t('app', "Client Closed Request"),
            500 => Yii::t('app', "Internal Server Error"),
            501 => Yii::t('app', "Not Implemented"),
            502 => Yii::t('app', "Bad Gateway"),
            503 => Yii::t('app', "Service Unavailable"),
            504 => Yii::t('app', "Gateway Timeout"),
            505 => Yii::t('app', "HTTP Version Not Supported"),
            506 => Yii::t('app', "Variant Also Negotiates"),
            507 => Yii::t('app', "Insufficient Storage"),
            508 => Yii::t('app', "Loop Detected"),
            509 => Yii::t('app', "Bandwidth Limit Exceeded"),
            510 => Yii::t('app', "Not Extended"),
            511 => Yii::t('app', "Network Authentication Required"),
            598 => Yii::t('app', "Network read timeout error"),
            599 => Yii::t('app', "Network connect timeout error")
        );
        $status = "";
        if ($code) {
            $status = ["status" => $code, "message" => $http_status_codes[$code]];
        }
        return $status;
    }

    function response($output = "") {
        $output = json_decode(json_encode($output), true);
        $data = array();
        $message = "";
        $code = 404;
        $result = 0;
        if ($output && isset($output['message']) && empty($output['message'])) {
            $message = $output['message'];
        }

        if ($output && isset($output['result']) && $output['result'] == 1) {
            $code = 200;
            $result = $output['result'];
            if ($output && isset($output['data'])) {
                if ($output['data']) {
                    $data = $output['data'];
                }
            }
        }
        $response = $this->httpstatuscodes($code);
        $response['result'] = $result;
        if ($message) {
            $response['message'] = $message;
        }
        if ($data) {
            $response['data'] = $data;
        }
        return $response;
    }

    public function changeLanguage($lang = 'en-US') {
        global $sg, $sconfig;
        $getlang = (isset($_REQUEST['lang']) && $_REQUEST['lang']) ? $_REQUEST['lang'] : 'en';
        $langs = array_keys(json_decode($sconfig['language']['description'], true));

        $allowed_languages = $langs;

        $selected_language = in_array($lang, $allowed_languages) ? $lang : 'en-US';

        $session = Yii::$app->session;

        !$session->isActive ? $session->open() : $session->close();

        $session->set('language', $selected_language);
        \Yii::$app->language = Yii::$app->session->get('language');
        $session->close();

        if (\Yii::$app->language) {
            $langcountry = \Yii::$app->language;
            $langexp = explode('-', \Yii::$app->language);
            if ($langexp) {
                $lang = $langexp[0];
            }
        }
        return $langcountry;
        //return isset($_SERVER['HTTP_REFERER']) ? $this->redirect($_SERVER['HTTP_REFERER']) : $this->redirect(Yii::$app->homeUrl);
    }

    function sqlColumnTranslate($column = '', $key = '', $param = '') {
        global $sg, $sconfig;
        if ($param) {
            return (isset($column[$param . $sg['language']]) && $column[$param . $sg['language']]) ? $column[$param . $sg['language']] : $column[$key];
        }
        return (isset($column[$sg['language']]) && $column[$sg['language']]) ? $column[$sg['language']] : $column[$key];
    }

    function truncate($text, $length) {
        $length = abs((int) $length);
        if (strlen($text) > $length) {
            $text = preg_replace("/^(.{1,$length})(\s.*|$)/s", '\\1...', $text);
        }
        return($text);
    }

    public function currentDateTime() {
        $format = 'Y-m-d H:i:s';
        return date($format);
    }

    public function currentDate() {
        $format = 'Y-m-d';
        return date($format);
    }

    public function currentTime($hour = '24') {
        $format = 'H:i:s';
        if ($hour == 12) {
            $format = 'H:i A';
        }
        return date($format);
    }

    public function DateTimeToLocal($date, $format = 'Y-m-d H:i:s') {
        return date($format, strtotime($date));
    }

    public function DateToLocal($date, $format = 'Y-m-d') {
        return date($format, strtotime($date));
    }

    public function TimeToLocal($date, $format = 'H:i:s', $hour = '24') {
        if ($hour == 12) {
            $format = 'H:i A';
        }
        return date($format, strtotime($date));
    }

    public function restapicalltocurl($url = '', $data = [], $method = 'post') {
        if ($url) {
            $json = "";
            if ($data && $method == 'post') {
                $curl = curl_init();
                curl_setopt($curl, CURLOPT_POST, 1);
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                curl_setopt($curl, CURLOPT_URL, $url);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
                curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
                curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-type: multipart/form-data"));
                $json = curl_exec($curl);
                if (!$json) {
                    die("Connection Failure");
                }
                curl_close($curl);
            } elseif ($method == 'get') {
                $curl = curl_init();
                curl_setopt($curl, CURLOPT_URL, $url);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
                curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
                curl_setopt($curl, CURLOPT_HTTPHEADER, array("Content-type: multipart/form-data"));
                $json = curl_exec($curl);
                if (!$json) {
                    die("Connection Failure");
                }
                curl_close($curl);
            }
            $output = Yii::$app->FrontFunctions->json_validate($json);
            return $output;
        } else {
            return false;
        }
    }

    public function json_validate($string) {
        $result = json_decode($string);

        // switch and check possible JSON errors
        switch (json_last_error()) {
            case JSON_ERROR_NONE:
                $error = ''; // JSON is valid // No error has occurred
                break;
            case JSON_ERROR_DEPTH:
                $error = 'The maximum stack depth has been exceeded.';
                break;
            case JSON_ERROR_STATE_MISMATCH:
                $error = 'Invalid or malformed JSON.';
                break;
            case JSON_ERROR_CTRL_CHAR:
                $error = 'Control character error, possibly incorrectly encoded.';
                break;
            case JSON_ERROR_SYNTAX:
                $error = 'Syntax error, malformed JSON.';
                break;
            // PHP >= 5.3.3
            case JSON_ERROR_UTF8:
                $error = 'Malformed UTF-8 characters, possibly incorrectly encoded.';
                break;
            // PHP >= 5.5.0
            case JSON_ERROR_RECURSION:
                $error = 'One or more recursive references in the value to be encoded.';
                break;
            // PHP >= 5.5.0
            case JSON_ERROR_INF_OR_NAN:
                $error = 'One or more NAN or INF values in the value to be encoded.';
                break;
            case JSON_ERROR_UNSUPPORTED_TYPE:
                $error = 'A value of a type that cannot be encoded was given.';
                break;
            default:
                $error = 'Unknown JSON error occured.';
                break;
        }

        if ($error !== '') {
            // throw the Exception or exit // or whatever :)
            //exit($error);
        }
        // everything is OK
        return $result;
    }

    public function uploadedfiledata($model = "", $param = 'image_url', $title = "") {
        if ($model) {
            $image_url = UploadedFile::getInstance($model, $param);
            if ($image_url) {
                $ext = explode('.', $image_url->name);
                $ext = end($ext);
                if ($title) {
                    $image_url_name = $title . "." . $ext;
                } else {
                    $image_url_name = $image_url->name;
                }
                $image_url = new \CURLFile($image_url->tempName, $image_url->type, $image_url_name);
                return $image_url;
            }
        }
    }

    public function array_remove_by_value($array, $value) {
        return array_values(array_diff($array, array($value)));
    }

    public function get_times($default = '19:00', $interval = '+30 minutes', $endtime = "") {

        $output = array();

        $current = strtotime('00:00');
        $end = strtotime('23:59');

        while ($current <= $end) {
            $time = date('H:i', $current);
            $sel = ( $time == $default ) ? ' selected' : '';

            $output[$time] = $time;
            $current = strtotime($interval, $current);
            if ($endtime && $endtime == $time) {
                break;
            }
        }

        return $output;
    }

    // Array Search Function
//    Ex. // Array Data Of Users
//	$userdb = array (
//		array ('uid' => '100','name' => 'Sandra Shush','url' => 'urlof100' ),
//		array ('uid' => '5465','name' => 'Stefanie Mcmohn','url' => 'urlof100' ),
//		array ('uid' => '40489','name' => 'Michael','url' => 'urlof40489' ),
//	);
//	
//	// Obtain The Key Of The Array
//	$arrayKey = searchArrayKeyVal("uid", '100', $userdb);
    public function searchArrayKeyVal($sKey, $id, $array) {
        foreach ($array as $key => $val) {
            if ($val[$sKey] == $id) {
                return $key;
            }
        }
        return false;
    }

    public function multiSearch(array $array, array $pairs, $key_sorting = "ASC") {
        $found = array();
        foreach ($array as $aKey => $aVal) {
            $coincidences = 0;
            foreach ($pairs as $pKey => $pVal) {
                if (array_key_exists($pKey, $aVal) && $aVal[$pKey] == $pVal) {
                    $coincidences++;
                }
            }
            if ($coincidences == count($pairs)) {
                if ($key_sorting == "ASC") {
                    $found[] = $aVal;
                } else {
                    $found[$aKey] = $aVal;
                }
            }
        }

        return $found;
    }

    public function removeElementWithValue($array, $key, $value) {
        foreach ($array as $subKey => $subArray) {
            if ($subArray[$key] == $value) {
                unset($array[$subKey]);
            }
        }
        return $array;
    }

    public function removeElementWithValuebyGetID($array, $key, $value) {
        $getkeyvalue = array();
        foreach ($array as $subKey => $subArray) {
            if ($subArray[$key] == $value) {
                unset($array[$subKey]);
            }
        }
        return array_values($array);
    }

    public function getarraycolumn($array = array(), $key = "", $string = true) {
        if ($array && $key) {
            $array = array_column($array, $key);
            foreach ($array AS $index => $value) {
                if ($string) {
                    $array[$index] = "'" . $value . "'";
                }
            }
        }
        return $array;
    }

    public function check_cc($cc, $extra_check = false) {
//        $cards = array(
//            "4111 1111 1111 1111",
//        );
//
//        foreach($cards as $c){
//            $check = check_cc($c, true);
//            if($check!==false)
//                echo $c." - ".$check;
//            else
//                echo "$c - Not a match";
//            echo "<br/>";
//        }
        $cards = array(
            "visa" => "(4\d{12}(?:\d{3})?)",
            "amex" => "(3[47]\d{13})",
            "jcb" => "(35[2-8][89]\d\d\d{10})",
            "maestro" => "((?:5020|5038|6304|6579|6761)\d{12}(?:\d\d)?)",
            "solo" => "((?:6334|6767)\d{12}(?:\d\d)?\d?)",
            "mastercard" => "(5[1-5]\d{14})",
            "switch" => "(?:(?:(?:4903|4905|4911|4936|6333|6759)\d{12})|(?:(?:564182|633110)\d{10})(\d\d)?\d?)",
        );
        $names = array("Visa", "American Express", "JCB", "Maestro", "Solo", "Mastercard", "Switch");
        $matches = array();
        $pattern = "#^(?:" . implode("|", $cards) . ")$#";
        $result = preg_match($pattern, str_replace(" ", "", $cc), $matches);
        if ($extra_check && $result > 0) {
            $result = (validatecard($cc)) ? 1 : 0;
        }
        return ($result > 0) ? $names[sizeof($matches) - 2] : false;
    }

    public function tohtmlcode($string = "") {
        $messageString = "";
        if ($string) {
            $htmlcode = Htmlcode::find()->where(['status' => 'Active'])->andWhere(['!=', 'named_code', ""])->all();
            $htmlcodeArray = ArrayHelper::map($htmlcode, 'charkey', 'named_code');
            //$combine=array_combine(Yii::$app->params['specialCharacter'],Yii::$app->params['htmlcodeCharacter']);
            $messageString = strtr($string, $htmlcodeArray);
            //print_r($messageString);exit;
        }
        return $messageString;
    }

    function removeurlvar($url, $varname) {
        list($urlpart, $qspart) = array_pad(explode('?', $url), 2, '');
        parse_str($qspart, $qsvars);
        unset($qsvars[$varname]);
        $newqs = http_build_query($qsvars);
        return $urlpart . '?' . $newqs;
    }

    function checkfile($file = "", $type = 'image') {
        if (isset($file->postname) && $file->postname) {
            $file = $file->postname;
        }
        $output = array();
        $typeArrayExt = array();
        if ($type == 'image') {
            $typeArrayExt = Yii::$app->params['IMAGE_EXTENTION'];
        }
        $output['result'] = false;
        $output['typeArrayExt'] = $typeArrayExt;
        $output['ext'] = "";
        if ($file) {
            $extexplode = explode(".", $file);
            if ($extexplode) {
                $ext = end($extexplode);
                if (in_array($ext, $typeArrayExt)) {
                    $output['result'] = true;
                    $output['ext'] = $ext;
                }
            }
        }
        return $output;
    }

    public function ImageSrcHtml($image_url = "", $imagearray = array(), $_module = array()) {
        $image_width_class = "";
        if ($imagearray && isset($imagearray['width']) && $imagearray['width']) {
            $width = $imagearray['width'];
            $image_width_class = 'width-px-' . $width; //px
        }
        $image_height_class = "";
        if ($imagearray && isset($imagearray['height']) && $imagearray['height']) {
            $height = $imagearray['height'];
            $image_height_class = 'height-px-' . $height; //px
        }
        $caption = "";
        if ($imagearray && isset($imagearray['caption']) && $imagearray['caption']) {
            $caption = 'data-caption="' . $imagearray['caption'] . '"';
        }
        $class = "";
        if ($imagearray && isset($imagearray['class']) && $imagearray['class']) {
            $class = $imagearray['class'] . ' ' . $image_width_class . ' ' . $image_height_class;
        } else {
            $class = 'img-responsive mb-3 ' . $image_width_class . ' ' . $image_height_class;
        }
        $id = "";
        if ($imagearray && isset($imagearray['id']) && $imagearray['id']) {
            $id = 'id="' . $imagearray['id'] . '"';
        } else {
            $id = "";
        }
        if ($imagearray && isset($imagearray['not_available_error']) && $imagearray['not_available_error']) {
            $error_img = Yii::$app->params['DEFAULT_NOT_AVAILABLE_IMG'];
        } elseif ($imagearray && isset($imagearray['user_error']) && $imagearray['user_error']) {
            $error_img = Yii::$app->params['DEFAULT_USER_IMG'];
        } else {
            $error_img = Yii::$app->params['DEFAULT_ERROR_IMG'];
        }
        $onerror = "this.onerror=null;this.src='" . $this->_baseUrl . $error_img . "';";

        $html = "";

        if ($imagearray && isset($imagearray['fancybox']) && $imagearray['fancybox']) {
            $html .= '<a href="' . $image_url . '" data-fancybox ' . $caption . '>
                <img src="' . $image_url . '" onerror="' . $onerror . '" class="' . $class . '" ' . $id . '>
            </a>';
        } else {
            $html .= '<img src="' . $image_url . '" onerror="' . $onerror . '" class="' . $class . '" ' . $id . '>';
        }
        return $html;
    }

}
