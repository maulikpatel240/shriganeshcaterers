<?php
use \kartik\datecontrol\Module;
$config = [
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '02rGNWbxYXvWUIo8emSjtgvleZNZPbhN',
        ],
    ],
    'modules' => [
        'datecontrol' =>  [
             'class' => 'kartik\datecontrol\Module',

             // format settings for displaying each date attribute (ICU format example)
             'displaySettings' => [
                 Module::FORMAT_DATE => 'dd-MM-yyyy',
                 Module::FORMAT_TIME => 'hh:mm:ss a',
                 Module::FORMAT_DATETIME => 'dd-MM-yyyy hh:mm:ss a', 
             ],

             // format settings for saving each date attribute (PHP format example)
             'saveSettings' => [
                 Module::FORMAT_DATE => 'php:U', // saves as unix timestamp
                 Module::FORMAT_TIME => 'php:H:i:s',
                 Module::FORMAT_DATETIME => 'php:Y-m-d H:i:s',
             ],

             // set your display timezone
             'displayTimezone' => 'Asia/Kolkata',

             // set your timezone for date saved to db
             'saveTimezone' => 'UTC',

             // automatically use kartik\widgets for each of the above formats
             'autoWidget' => true,

             // default settings for each widget from kartik\widgets used when autoWidget is true
             'autoWidgetSettings' => [
                 Module::FORMAT_DATE => ['type'=>2, 'pluginOptions'=>['autoclose'=>true]], // example
                 Module::FORMAT_DATETIME => [], // setup if needed
                 Module::FORMAT_TIME => [], // setup if needed
             ],

             // custom widget settings that will be used to render the date input instead of kartik\widgets,
             // this will be used when autoWidget is set to false at module or widget level.
             'widgetSettings' => [
                 Module::FORMAT_DATE => [
                     'class' => 'yii\jui\DatePicker', // example
                     'options' => [
                         'dateFormat' => 'php:d-M-Y',
                         'options' => ['class'=>'form-control'],
                     ]
                 ]
             ]
             // other settings
         ]
     ]
];

if (!YII_ENV_TEST) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'allowedIPs' => ['*'],
    ];
}

return $config;
