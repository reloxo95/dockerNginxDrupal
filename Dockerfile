#Base de arquitectura del sistema
FROM resin/rpi-raspbian:latest

#Actualizamos los repositorios
RUN sudo apt-get -y update

#Instalamos php y derivados
RUN sudo apt-get -y install php5 php5-fpm php5-gd

#Instalamos el ngix y git
RUN sudo apt-get -y install nginx nginx-common nginx-full git nano wget

#Compiamos el nuevo archivo de configuracion
RUN sudo rm /etc/nginx/sites-available/default
RUN wget https://www.dropbox.com/s/gj7ikkoyz0cpdnl/default?dl=0
RUN sudo mv default?dl=0 default
RUN sudo cp default /etc/nginx/sites-available/
RUN sudo /etc/init.d/nginx start

#Arrancamos el servidor NGINX
#RUN sudo systemctl restart nginx
#RUN sudo systemctl restart php5-fpm

