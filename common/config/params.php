<?php

$params = [
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
    'senderEmail' => 'noreply@example.com',
    'senderName' => 'Example.com mailer',
    'user.passwordResetTokenExpire' => 3600,
    'jsmapkey' => 'AIzaSyD9y1Y7qeldE5S8MkKvj9762Rri32WZoVM', //belocumapp@gmail.com
    'FACEBOOK_CLIENT_ID' => '316360892157237', //live Client account key
    'GOOGLE_CLIENT_ID' => '278562745220-h8an4bp0rv751kslecionfh9ilr2sckh.apps.googleusercontent.com', //live Client account key belocumapp@gmail.com
    'bsVersion' => '4.4.1', //for yii export,
    'cache_time' => 7200,
    'real_path' => 'C:\xampp\htdocs\vandemission',
    'image_extention' => array("jpg", "jpeg", "png", 'bmp'),
    'cheque_extention' => array("doc", "docx", "xls", "xlsx", "csv", "ppt", "pdf", "DOC", "DOCX", "XLS", "XLSX", "CSV", "PPT", "PDF"),
    'video_extention' => array('mp4', '3gp', 'mov', 'm4v', 'mpg', 'flv', 'avi', 'mkv', 'wmv', 'webm'),
    'document_extention' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'pdf'),
    'default_user_img' => '/img/default_user.jpg',
    'default_error_img' => '/img/default_user.jpg'
];

return $params;
