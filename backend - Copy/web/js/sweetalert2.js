/**
 * Swal alert
 * ------------------
 * You should not use this file in production.
 * This file is for demo purposes only.
 */

/* eslint-disable camelcase */
var isset = function (variable) {
    return typeof (variable) !== "undefined" && variable !== null && variable !== '';
}

var alertData = [];//error,success,warnig, danger
var icon = '';//error,success,warnig, danger
var title = 'Shri Ganesh Caterers';//Oops...
var text = '';
var type = '';
var html = '';//You can use <b>bold text</b>
var footer = '';//<a href>Why do I have this issue?</a>
var imageUrl = '';//https://placeholder.pics/svg/300x1500
var imageHeight = ''; //1500
var imageAlt = '';//A tall image
var confirmButtonText = 'Ok';
var cancelButtonText = (isset(cancelButtonText))?cancelButtonText:'Cancel';
var confirmButtonInfo = 'btn btn-info waves-effect mr-2';
var confirmButtonDanger = 'btn btn-danger waves-effect';
var showClass_popup = 'animate__animated animate__bounceIn';
var hideClass_popup = 'animate__animated animate__fadeOutUp';
function sweetAlert(alertData,type) {
    text = '';
    html = '';
    title = 'Shri Ganesh Caterers';
    imageUrl = '';
    if(type == 'text'){
         text = alertData;
    } else if(type == 'html'){
         html = alertData;
    }else if(type == 'title'){
         title = alertData;
    }
    if (isset(alertData['title'])) {
        title = alertData['title'];
    }
    if (isset(alertData['text'])) {
        text = alertData['text'];
    }
    if (isset(alertData['html'])) {
        html = alertData['html'];
    }
    if (isset(alertData['imageUrl'])) {
        imageUrl = alertData['imageUrl'];
        title = '';
    }
    return Swal.fire({
        title: title,
        text: text,
        html: html,
        imageUrl: imageUrl,
        customClass: {
            confirmButton: confirmButtonInfo,
        },
        focusConfirm: false,
        buttonsStyling: false,
        cancelButtonText: cancelButtonText,      
        showClass: {
            popup: showClass_popup,
        },
        hideClass: {
            popup: hideClass_popup
        }
    });
}

function sweetAlerthtml(alertData) {
    text = '';
    html = '';
    title = 'Shri Ganesh Caterers';
    if (isset(alertData['title'])) {
        title = alertData['title'];
    }
    if (isset(alertData['text'])) {
        text = alertData['text'];
    }
    if (isset(alertData['html'])) {
        html = alertData['html'];
    }
    return Swal.fire({
        title: title,
        text: text,
        html: html,
        customClass: {
            confirmButton: confirmButtonInfo,
        },
        focusConfirm: false,
        buttonsStyling: false,
        cancelButtonText: cancelButtonText,  
        showClass: {
            popup: showClass_popup,
        },
        hideClass: {
            popup: hideClass_popup

        }
    });
}

function confirmationAlert(btn,text,type,confirmButtonText) {
    textdata = '';
    html = '';
    title = 'Shri Ganesh Caterers';
    if ($(btn).attr('confirmOK') == '1') {
        $('.loader_main').show();
        return true;
    }
    if(type == 'text'){
         textdata = text;
    } else if(type == 'html'){
         html = text;
    }else if(type){
         title = type;
    }else{
        textdata = text;
    }
    if (isset(confirmButtonText)) {
        confirmButtonText = confirmButtonText;
    }else{
        confirmButtonText = 'Ok';
    }
    Swal.fire({
        title: title,
        text: textdata,
        html: html,
        icon: 'warning',
        showCancelButton: true,
        customClass: {
            confirmButton: 'btn btn-info waves-effect mr-2',
            cancelButton: 'btn btn-danger waves-effect',
        },
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,      
        buttonsStyling: false
      }).then((result) => {
        if (result.value) {
            $(btn).attr('confirmOK', '1');
            btn.click();
        }  else if (result.dismiss === Swal.DismissReason.cancel) {
            $(btn).attr('confirmOK', '0');
          } 
      });
    return false;
    
}

function confirmationAlertyn(btn,text,type) {
    if ($(btn).attr('confirmOK') == '1') {
        $('.loader_main').show();
        return true;
    }
    if(type == 'text'){
         text = text;
    } else if(type == 'html'){
         html = text;
    }else if(type){
         title = type;
    }else{
        text = text;
    }
    confirmButtonText = bootboxynconfirm_label;
    cancelButtonText = bootboxyncancel_label;
    Swal.fire({
        title: title,
        text: text,
        html: html,
        icon: 'warning',
        showCancelButton: true,
        customClass: {
            confirmButton: 'btn btn-info waves-effect mr-2',
            cancelButton: 'btn btn-danger waves-effect',
        },
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,      
        buttonsStyling: false
      }).then((result) => {
        if (result.value) {
            $(btn).attr('confirmOK', '1');
            btn.click();
        }  else if (result.dismiss === Swal.DismissReason.cancel) {
            $(btn).attr('confirmOK', '0');
          } 
      });
    return false;
    
}