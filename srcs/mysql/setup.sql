CREATE DATABASE wordpress;

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_pass';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost' IDENTIFIED BY 'admin_pass';

CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost' IDENTIFIED BY 'wp_pass';

FLUSH PRIVILEGES;
