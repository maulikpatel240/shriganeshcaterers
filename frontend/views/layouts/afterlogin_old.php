<?php
/* @var $this \yii\web\View */
/* @var $content string */

use frontend\assets\AppAsset;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;
use yii\widgets\Breadcrumbs;

//use common\widgets\Alert;
AppAsset::register($this);
$pagebundle = \frontend\assets\PluginAsset::register($this)->add(['afterlogin']);
$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
$backendUrl = Yii::$app->urlManagerBackEnd->baseUrl;

$_baseUrl = Url::base(true) . '/';
$_basePath = Url::base() . '/';
$_lang = Yii::$app->FrontFunctions->defaultlanguage();
$_langID = Yii::$app->FrontFunctions->defaultlanguage(true);

$message = "";
if (Yii::$app->user->identity && isset(Yii::$app->user->identity->message)) {
    $message = Yii::$app->user->identity->message;
}
if (empty(Yii::$app->user->identity)) {
    Yii::$app->user->logout();
    Yii::$app->session->setFlash('error', $message);
    return Yii::$app->getResponse()->redirect(Yii::$app->urlManager->createUrl(['/']));
}
$user = Yii::$app->user->identity;
$_module = Yii::$app->FrontFunctions->AppModules($user->module_id);
$_moduleUrl = $_baseUrl . $_module['unique_name'] . '/';
$_modulePath = $_basePath . $_module['unique_name'] . '/';
$_staffUrl = $_baseUrl . $_module['unique_name'] . '/staff/';
$_staffPath = '/' . $_module['unique_name'] . '/staff/';
$_ownerUrl = $_baseUrl . $_module['unique_name'] . '/owner/';
$_ownerPath = '/' . $_module['unique_name'] . '/owner/';
$moduleType = $user->type == 'Owner' ? 'owner' : 'staff';
$moduleTypeUrl = $_moduleUrl . $moduleType . '/';
$moduleTypePath = '/' . $_module['unique_name'] . '/' . $moduleType . '/';

$findme = '&';
$current_url = Yii::$app->request->url;
$current_url = Yii::$app->FrontFunctions->removeurlvar($current_url, 'lang');
$posqs = substr_count($current_url, '?');
$posand = substr_count($current_url, '&');

$languagemodelDefault = Yii::$app->FrontFunctions->defaultlanguage(false, 'Default');
$languagemodel = Yii::$app->FrontFunctions->defaultlanguage(false, 'All');

$profileoutput = Yii::$app->ApiCallFunctions->GetProfileApi();
$profiledataMsg = $profileoutput['message'];
$profiledata = array();
$staffdata = array();
$image_url = "";
if ($profileoutput['status'] == 200) {
    $profiledata = $profileoutput['data'];
    if ($profiledata && isset($profiledata['staffdata'])) {
        $staffdata = $profiledata['staffdata'][0];
        $image_url = $staffdata['image_url'];
    }
    if ($profiledata && isset($profiledata['ownerdata'])) {
        $image_url = Yii::$app->params['DEFAULT_BELOCUM_CLINIC_IMG'];
    }
}
$name = "";
if ($moduleType == "staff") {
    if (strlen($user->full_name) > 20) {
        $name = substr($user->full_name, 0, 20) . '...';
    } else {
        $name = $user->full_name;
    }
} else {
    $email = strstr($user->email, '@', true);
    if (strlen($email) > 20) {
        $name = substr($email, 0, 20) . '...';
    } else {
        $name = $email;
    }
}
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php $this->registerCsrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
        <!--<script src="<?php echo Yii::$app->request->baseUrl; ?>/plugins/jquery/jquery.min.js"></script>-->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <script type="text/javascript">
            var bootboxynconfirm_label = '<?= Yii::t('app', 'Yes') ?>';
            var bootboxyncancel_label = '<?= Yii::t('app', 'No') ?>';
            var paramimgext = '<?= implode(',', Yii::$app->params['IMAGE_EXTENTION']) ?>';
            var paramimgext_array = paramimgext.split(',');
            var baseUrl = '<?= $_baseUrl ?>';
            var restapiUrl = '<?= Yii::$app->params['REST_API_URL'] ?>';
            var success_msg = "<?= Yii::t('app', 'Success') ?>";
            var error_msg = "<?= Yii::t('app', 'Error') ?>";
            var btnOK = "<?= Yii::t('app', 'Ok') ?>";
            var timeFormat = "<?= Yii::$app->params['TIME_FORMAT'] ?>";
            var dateFormat = "<?= Yii::$app->params['DATE_FORMAT'] ?>";
            var datetimeFormat = "<?= Yii::$app->params['DATETIME_FORMAT'] ?>";
            var stepping = <?= Yii::$app->params['STEPPING'] ?>;
            var steppingchange = <?= Yii::$app->params['STEPPINGCHANGE'] ?>;
            var locale = "<?= $_lang ?>";
        </script>
        <style>
            .custom-file-label::after{content:"<?= Yii::t('app', 'Browse') ?>"}
        </style>
    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed p-0">
        <?php $this->beginBody() ?>
        <?php if ($user) { ?>   
            <div class="wrapper" id="wrapper">
                <!-- Navbar -->
                <nav class="main-header navbar navbar-expand navbar-white navbar-light shadow">
                    <!-- Left navbar links -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <a href="<?php echo $moduleTypeUrl; ?>" class="nav-link"><?= Yii::t('app', 'Home') ?></a>
                        </li>

                    </ul>
                    <!-- Right navbar links -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Notifications Dropdown Menu -->
                        <?php /* if ($user->module_id != 6) { ?>
                          <li class="nav-item ">
                          <a class="nav-link header-icon" href="<?php echo $moduleTypeUrl . 'notification'; ?>">
                          <i class="far fa-bell"></i>
                          <!--<span class="badge badge-warning navbar-badge">15</span>-->
                          </a>
                          </li>
                          <?php } */ ?>
                        <li class="nav-item dropdown mr-2">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <?= ($languagemodelDefault) ? $languagemodelDefault : "English"; ?>
                            </a>

                            <?php if ($languagemodel) { ?>
                                <div class="dropdown-menu dropdown-menu-md dropdown-menu-right" >
                                    <?php
                                    $htmllang = "";
                                    foreach ($languagemodel as $langvalue) {
                                        if ($posqs && $posand) {
                                            $langand = '&';
                                        } elseif (empty($posqs) && empty($posand)) {
                                            $langand = '?';
                                        } else {
                                            $langand = '&';
                                        }

                                        $langvalue['key_backend'] = strtolower($langvalue['key_name']) . '-' . $langvalue['key_name'];
                                        $htmllang .= '<a href="' . $current_url . $langand . 'lang=' . $langvalue['key_backend'] . '" class="dropdown-item">' . $langvalue['display_name'] . '</a>';
                                    }
                                    echo $htmllang;
                                    ?>
                                </div>
                            <?php } ?>
                        </li>
                        <li class="nav-item dropdown user-menu">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="<?= $image_url ?>" onerror="this.onerror=null;this.src='<?= Yii::$app->params['DEFAULT_ERROR_IMG'] ?>';" class="user-image rounded-circle" alt="User Image">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right" >
                                <!-- User image -->
                                <li class="user-header bg-default">
                                    <img src="<?= $image_url ?>" class="img-circle" alt="User Image" onerror="this.onerror=null;this.src='<?= Yii::$app->params['DEFAULT_ERROR_IMG'] ?>';">

                                    <p>
                                        <?php
                                        $name = "";
                                        if ($moduleType == "staff") {
                                            if (strlen($user->full_name) > 20) {
                                                $name = substr($user->full_name, 0, 20) . '...';
                                            } else {
                                                $name = $user->full_name;
                                            }
                                        } else {
                                            $email = strstr($user->email, '@', true);
                                            if (strlen($email) > 20) {
                                                $name = substr($email, 0, 20) . '...';
                                            } else {
                                                $name = $email;
                                            }
                                        }
                                        echo $name;
                                        ?>
                                        <!--<small>Member since Nov. 2012</small>-->
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <a href="<?php echo $_staffUrl . 'profile'; ?>" class="btn btn-default btn-flat">Profile</a>
                                    <div class="float-right"> 
                                        <?php
                                        echo Html::beginForm([$moduleTypePath . 'logout'], 'post')
                                        . Html::submitButton(
                                                '<i class="nav-icon fas fa-sign-out-alt"></i> ' . Yii::t('app', 'Logout'),
                                                ['class' => 'btn btn-default btn-flat float-right']
                                        )
                                        . Html::endForm();
                                        ?>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- /.navbar -->
                <!-- Main Sidebar Container -->
                <aside class="main-sidebar sidebar-dark-light elevation-4">
                    <!-- Brand Logo -->
                    <a href="<?php echo $moduleTypeUrl; ?>" class="brand-link">
                        <img src="<?=$_baseUrl . 'images/sidebar/logo_ic.svg'?>" alt="" class="brand-image img-circle elevation-3"
                             style="opacity: .8">
                        <span class="brand-text font-weight-light">BeLocum</span>
                    </a>

                    <!-- Sidebar -->
                    <div class="sidebar">
                        <!-- Sidebar user panel (optional) -->
                        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                            <div class="image">
                                <img src="<?= $image_url ?>" onerror="this.onerror=null;this.src='<?= Yii::$app->params['DEFAULT_ERROR_IMG'] ?>';" class="img-circle elevation-2" alt="User Image" />
                            </div>
                            <div class="info text-sm">
                                <a class="d-block">
                                    <?php
                                    $name = "";
                                    if ($moduleType == "staff") {
                                        if (strlen($user->full_name) > 20) {
                                            $name = substr($user->full_name, 0, 20) . '...';
                                        } else {
                                            $name = $user->full_name;
                                        }
                                    } else {
                                        $email = strstr($user->email, '@', true);
                                        if (strlen($email) > 20) {
                                            $name = substr($email, 0, 20) . '...';
                                        } else {
                                            $name = $email;
                                        }
                                    }
                                    echo $name;
                                    ?>
                                </a>
                            </div>
                        </div>

                        <!-- Sidebar Menu -->
                        <nav class="mt-2">
                            <ul class="nav nav-pills nav-sidebar flex-column nav-legacy" data-widget="treeview" role="menu" data-accordion="false">
                                <!-- Add icons to the links using the .nav-icon class
                                     with font-awesome or any other icon font library -->
                                <li class="nav-item">
                                    <a href="<?php echo $moduleTypeUrl; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'dashboard') ? 'active' : ''; ?>">
                                        <i class="nav-icon fas fa-tachometer-alt"></i>
                                        <p><?= Yii::t('app', 'Dashboard') ?></p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?php echo $moduleTypeUrl . 'profile'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'profile') ? 'active' : ''; ?>">
                                        <i class="nav-icon fas fa-user"></i>
                                        <p><?= Yii::t('app', 'Profile') ?></p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?php echo $moduleTypeUrl . 'aboutus'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'aboutus') ? 'active' : ''; ?>">
                                        <i class="nav-icon fas fa-info-circle"></i>
                                        <p><?= Yii::t('app', 'About') ?></p>
                                    </a>
                                </li>
                                <?php if ($user->module_id != 6) { ?>
                                    <li class="nav-item">
                                        <a href="<?php echo $moduleTypeUrl . 'history'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'history') ? 'active' : ''; ?>">
                                            <i class="nav-icon fas fa-calendar-alt"></i>
                                            <p><?= Yii::t('app', 'History') ?></p>
                                        </a>
                                    </li>
                                <?php } ?>
                                <?php if ($moduleType == "owner") { ?>
                                    <li class="nav-item">
                                        <a href="<?php echo $moduleTypeUrl . 'payment'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'payment') ? 'active' : ''; ?>">
                                            <i class="nav-icon fas fa-money-bill"></i>
                                            <p><?= Yii::t('app', 'Payment') ?></p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<?php echo $moduleTypeUrl . 'locum'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'locum') ? 'active' : ''; ?>">
                                            <i class="nav-icon fas fa-stethoscope"></i>
                                            <p><?= Yii::t('app', 'My Locum') ?></p>
                                        </a>
                                    </li>
                                <?php } ?>
                                <li class="nav-item">
                                    <a href="<?php echo $moduleTypeUrl . 'settings'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'settings') ? 'active' : ''; ?>">
                                        <i class="nav-icon fas fa-cog"></i>
                                        <p><?= Yii::t('app', 'Settings') ?></p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?php echo $moduleTypeUrl . 'promocode'; ?>" class="nav-link <?php echo ($controller == $_module['unique_name'] . '/' . $moduleType && $action == 'promocode') ? 'active' : ''; ?>">
                                        <i class="nav-icon fas fa-tags"></i>
                                        <p><?= Yii::t('app', 'Promocode') ?></p>
                                    </a>
                                </li>

                            </ul>
                        </nav>
                        <!-- /.sidebar-menu -->
                    </div>
                    <!-- /.sidebar -->
                </aside>

                <div class="content-wrapper">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="theme_loader_fix loader_div">
                                <div class="cell preloader5 loader-block divbox">
                                    <div class="circle-5 l"></div>
                                    <div class="circle-5 m"></div>
                                    <div class="circle-5 r"></div>
                                </div>
                            </div>
                            <div id="section-content">
                                <?= $content ?>
                            </div>
                        </div>
                    </section>
                </div>

                <footer class="main-footer">
                    Copyright &copy; <?php echo date('Y'); ?> BeLocum
                </footer>
            </div>

        <?php } else { ?>  
            <?= $content ?>
        <?php } ?>
        <a href="javascript:void(0);" class="btn btn-primary scrollToTop d-none" id="scrollToTop"><i class="fas fa-arrow-up "></i></a>
            <?php $this->endBody() ?>
        <script type="text/javascript">
        <?php
        if (\Yii::$app->getSession()->getFlash('success') != '') {
            echo 'alertmessage("success","' . \Yii::$app->getSession()->getFlash('success') . '");';
        } else
        if (\Yii::$app->getSession()->getFlash('error') != '') {
            echo 'alertmessage("error","' . \Yii::$app->getSession()->getFlash('error') . '");';
        } else
        if (\Yii::$app->getSession()->getFlash('info') != '') {
            echo 'alertmessage("info","' . \Yii::$app->getSession()->getFlash('info') . '");';
        } else
        if (\Yii::$app->getSession()->getFlash('warning') != '') {
            echo 'alertmessage("warning","' . \Yii::$app->getSession()->getFlash('warning') . '");';
        } else {
            echo "";
        }
        ?>
            function alertmessage(type, message) {
                if (type == "success") {
                    toastr.success(message);
                } else if (type == "error") {
                    toastr.error(message);
                } else if (type == "info") {
                    toastr.info(message);
                } else if (type == "warning") {
                    toastr.warning(message);
                }
            }
            $(document).ready(function () {
                $('.theme_loader_fix').fadeOut('slow', function () {
                    $(this).hide();
                });
            });
            var btnscrollup = $('.scrollToTop');
            $(window).scroll(function () {
                if ($(window).scrollTop() > 300) {
                    btnscrollup.removeClass('d-none');
                } else {
                    btnscrollup.addClass('d-none');
                }
            });

            btnscrollup.on('click', function (e) {
                e.preventDefault();
                $('html, body').animate({scrollTop: 0}, '300');
            });
            function sessionpopup() {
                $.ajax({
                    url: "<?= $_moduleUrl . 'site/sessionpopup' ?>", // Url to which the request is send
                    type: "POST",
                    data: {'<?= Yii::$app->request->csrfParam; ?>': '<?= Yii::$app->request->csrfToken; ?>'},
                    success: function (response)
                    {
                        if (response) {

                        }
                    }
                });
            }
            function switchchange(status, id, checkvalue) {
                $.ajax({
                    url: "<?= $_moduleUrl . 'site/switchchange' ?>",
                    method: 'post',
                    data: {status: status, id: id, checkvalue: checkvalue},
                    beforeSend: function () {
                        $('.loader_review' + id).show();
                    },
                    complete: function () {
                        $('.loader_review' + id).hide();
                    },
                    success: function (response) {
                        Swal.fire(
                                '',
                                response.message,
                                'success'
                                );
                    }
                });
            }
        </script>
    </body>
</html>
<?php $this->endPage() ?>