<?php
// Uncomment to enable debug mode. Recommended for development.
defined('YII_DEBUG') or define('YII_DEBUG', false);

// Uncomment to enable dev environment. Recommended for development
defined('YII_ENV') or define('YII_ENV', 'prod');

if (empty($_ENV)) {
    $_ENV = $_SERVER;
    foreach ($_ENV as $key => $value) {
        if (strpos($key, '_PASS')) {
            $_ENV[$key] = base64_decode($value);
            if ($_ENV[$key] === false) {
                $_ENV[$key] = $value;
            }
        }
    }
}

return [
    'components' => [
        'db' => [
            'dsn'       => 'mysql:host=127.0.0.1;dbname=walle',
            'username'  => 'root',
            'password'  => 'walle',
        ],
        'mail' => [
            'transport' => [
                'host'       => 'smtp.qq.com',     # smtp 发件地址
                'username'   => '329483466@qq.com',  # smtp 发件用户名
                'password'   => 'guvbucedlqghcbbb',       # smtp 发件人的密码
                'port'       => '465',                       # smtp 端口
                'encryption' => 'ssl',                    # smtp 协议
            ],
            'messageConfig' => [
                'charset' => 'UTF-8',
                'from'    => [
                    '329483466@qq.com'=>'sys'
                ],  # smtp 发件用户名(须与mail.transport.username一致)
            ],
        ],
        'request' => [
            'cookieValidationKey' => 'PdXWDAfV5-gPJJWRar5sEN71DN0JcDRV',
        ],
    ],
    'language'   => isset($_ENV['WALLE_LANGUAGE']) ? $_ENV['WALLE_LANGUAGE'] : 'zh-CN', // zh-CN => 中文,  en => English
];