<?php

namespace frontend\assets;

use yii\web\AssetBundle;

class PluginAsset extends AssetBundle {

    //public $sourcePath = '@web/';
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $depends = [
        'frontend\assets\AppAsset'
    ];
    //Page css and js
    public static $pluginsMap = [
        'blank' => [
            'css' => [
                'css/styles.css',
                ],
            'js' => [
                ],
        ],
        'main' => [
            'css' => [
                'plugins/animate.css/animate.min.css',
                'plugins/aos/aos.css',
                'plugins/bootstrap/css/bootstrap.min.css',
                'plugins/bootstrap-icons/bootstrap-icons.css',
                'plugins/boxicons/css/boxicons.min.css',
                'plugins/glightbox/css/glightbox.min.css',
                'plugins/swiper/swiper-bundle.min.css',
                'css/style.css',
                ],
            'js' => [
                'plugins/aos/aos.js',
                'plugins/bootstrap/js/bootstrap.bundle.min.js',
                'plugins/glightbox/js/glightbox.min.js',
                'plugins/isotope-layout/isotope.pkgd.min.js',
                'plugins/swiper/swiper-bundle.min.js',
                'js/main.js',
                ],
        ],
        // 'home' => [
        //     'css' => [
        //         ['pages/afterlogin/css/calendar.css',['position' => \yii\web\View::POS_BEGIN]],
        //     ]
        // ]
    ];

    /**
     * add a plugins dynamically
     * @param $pluginsName
     * @return $this
     */
    public function add($pluginsName) {
        $pluginsName = (array) $pluginsName;

        foreach ($pluginsName as $name) {
            $plugins = $this->getpluginsConfig($name);
            if (isset($plugins['css'])) {
                foreach ((array) $plugins['css'] as $v) {
                    $this->css[] = $v;
                }
            }
            if (isset($plugins['js'])) {
                foreach ((array) $plugins['js'] as $v) {
                    $this->js[] = $v;
                }
            }
        }

        return $this;
    }

    /**
     * @param $name plugins name
     * @return array|null
     */
    private function getpluginsConfig($name) {
        return self::$pluginsMap[$name] ?? null ?? null;
    }

}
