#Base de arquitectura del sistema
FROM resin/rpi-raspbian

#Quien lo crea/mantiene
MAINTAINER Christian Lopez <clopezrodriguez@hotmail.com>

#Actualizamos los repositorios
RUN sudo apt-get -y update

#Instalamos php y librerias para que funcione con sqlite
RUN sudo apt-get -y install php5 php5-fpm php5-gd php5-cli sqlite php5-sqlite wget

#Instalamos el ngix
RUN sudo apt-get -y install nginx nginx-common nginx-full

#Exponemos el puerto 8080 al exterior 
EXPOSE 9999

#Copiamos el nuevo archivo de configuracion de nginx
RUN sudo rm /etc/nginx/sites-available/default
RUN wget https://www.dropbox.com/s/gj7ikkoyz0cpdnl/default?dl=0
RUN sudo mv default?dl=0 default
RUN sudo cp default /etc/nginx/sites-available/

#RUN sudo /etc/init.d/nginx start

#Copiamos el nuevo archivo de configuracion de php-fpm para que drupal corra sin problemas
RUN sudo rm /etc/php5/fpm/php.ini
RUN wget https://www.dropbox.com/s/93b8h66hvc6v3hj/php.ini?dl=0
RUN sudo mv php.ini?dl=0 php.ini
RUN sudo cp php.ini /etc/php5/fpm/

#Insertamos un drupal8 basico sin sin instalar
RUN sudo rm -R /var/www/html
ADD https://ftp.drupal.org/files/projects/drupal-8.2.3.tar.gz /var/www/

WORKDIR /var/www/
RUN tar -zxvf drupal-8.2.3.tar.gz
RUN mv drupal-8.2.3 html 

RUN echo "Terminado"
