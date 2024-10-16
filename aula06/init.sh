#!/bin/bash

# Iniciar o MySQL em segundo plano
service mysql start

# Verificar se o banco de dados WordPress já existe
if [ ! -d /var/lib/mysql/wordpress ]; then
    echo "Inicializando banco de dados WordPress..."
    mysql -e "CREATE DATABASE wordpress;"
    mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'password';"
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"
    
    # Configurar o wp-config.php automaticamente
    if [ ! -f /var/www/html/wp-config.php ]; then
        cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
        sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
        sed -i "s/username_here/wpuser/" /var/www/html/wp-config.php
        sed -i "s/password_here/password/" /var/www/html/wp-config.php
    fi
fi

# Iniciar o Apache (WordPress) em primeiro plano
apache2-foreground
