<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wp_pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'gYC{(ldZ8,y<ex !tBL0 +*ep3XgCSof*JJV~S6m?Ay:#js+m65mHsMPk,S^Q(1L');
define('SECURE_AUTH_KEY',  'j6v]>-4 ^j+)<s5n,Yg)Q@c1<1g4r+.|`AnyIdT7:y~sj@%q%}pD?jtv3R@^Ol,?');
define('LOGGED_IN_KEY',    'c #D)|78+KNGnKS}3u1D5ydkHO4V)7zn:T,7qgi7N`!GMmy%^qDd 3ItEdKLrU~@');
define('NONCE_KEY',        'R>Hy5)tg_dRLZbLY:#5RU&$b1?lWm;K{bT-(9|XG]6->!b u+,-Pu~/~?pa3FV:d');
define('AUTH_SALT',        '@O|Hdty>z?$xxd5^+TZc;/b[1W<rN34s!mz1+GSG4`J?=69N$UUjTQ*V5Li!CN9-');
define('SECURE_AUTH_SALT', 'I.Y+,)o*|]O1ZT^RpQt>,Q DM{DFmh_bi)ec;|$O>)#uu.wn_<,v>fpI7E>W%uo:');
define('LOGGED_IN_SALT',   'DXcQt*S+g2>;P?{^z.N19|Q3LI#{>C.We>ufSNrO)$8g=f6~F`G=Gnz{jCJ!bNtC');
define('NONCE_SALT',       't:JM4R?+xHelrTh{];oWBwp!isg3G6crU>BjSb%.>u~|{@0L%T7-XJUGKUZ3Vnrf');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
