<?php
define( 'DB_NAME', getenv('MYSQL_DATABASE') );

define( 'DB_USER', trim(file_get_contents(getenv('MYSQL_USER_FILE'))) );
define( 'DB_PASSWORD', trim(file_get_contents(getenv('MYSQL_PASSWORD_FILE'))) );

define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';
define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
