CREATE DATABASE wordpress;
CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO $DB_USER@'%';

/* Clears the priviliege cache on the MariaDB database for the changes to take effect*/
FLUSH PRIVILEGES;

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$ROOT_PASSWORD');