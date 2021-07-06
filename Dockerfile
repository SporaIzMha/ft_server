FROM debian:buster
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install vim
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3
RUN apt-get -y install php-mysql
RUN apt-get -y install php-fpm
RUN apt-get -y install php-pdo
RUN apt-get -y install php-gd
RUN apt-get -y install php-cli
RUN apt-get -y install php-mbstring
RUN apt-get -y install php-zip
RUN apt-get -y install php-xmlrpc
RUN apt-get -y install php-xml
RUN apt-get -y install php-soap
RUN apt-get -y install php-intl
WORKDIR /etc/nginx/sites-available/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled
WORKDIR /var/www/web
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN chown -R www-data:www-data /var/www/web/wordpress
WORKDIR /var/www/web/wordpress
COPY ./srcs/wp-config.php .
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages/ /var/www/web/phpmyadmin
COPY ./srcs/config.inc.php /var/www/web/phpmyadmin
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  -subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=21School/CN=localhost"
COPY ./srcs/start.sh ./
EXPOSE 80 443
CMD bash ./start.sh