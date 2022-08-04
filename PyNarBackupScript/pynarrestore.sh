#!/bin/bash
# $1=veritabanı kullanıcı adı, $2= veritabanı şifresi

apt -y update && apt -y upgrade

export DEBIAN_FRONTEND=noninteractive 

packagelist=(
    python3-pip
    python3
    apache2
    libssl-dev
    pkg-config
    libonig-dev
)

apt-get install -y ${packagelist[@]}

systemctl enable apache2.service

a2enmod rewrite

systemctl restart apache2.service

apt-get install -y mysql-server

mysql_secure_installation

cd /

usermod -aG sudo www-data
usermod -aG root www-data

echo "Tar dosyası çıkarılıyor..."

# tar dosyası çıkarılıyor
tar -xf $3

pip3 install -r /var/www/pynar.org/api/scripts/requirements.txt

if [ $? -eq 0 ] 
then 
  echo "Tar dosyasını çıkarma başarılı." 
else 
  echo "Tar dosyasını çıkarma başarısız oldu!"
  exit
fi

echo "Veri tabanı oluşturuluyor..."

# restfulapi veritabanı oluşturuluyor
mysql -u $1 -p$2 -e "create database restfulapi"

if [ $? -eq 0 ] 
then 
  echo "Veri tabanı oluşturuldu." 
else 
  echo "Veri tabanı oluşturma başarısız oldu!"
  exit
fi

echo "Veritabanına script ile veriler yükleniyor..."

# restfulapi veritabanı üzerine şema ve veriler yerleştiriliyor
mysql -u $1 -p$2 restfulapi < /var/www/dump.sql

if [ $? -eq 0 ] 
then 
  echo "Veri tabanına veriler başarıyla aktarıldı." 
else 
  echo "Veri tabanına veriler aktarılamadı!"
  exit
fi

echo "Restorasyon tamamlandı."

echo "SERTİFİKASYON İŞLEMLERİ BAŞLATILIYOR..."

sudo apt-get update && sudo apt-get upgrade

sudo apt install python3 python3-venv libaugeas0

sudo python3 -m venv /opt/certbot/ && sudo /opt/certbot/bin/pip install --upgrade pip

sudo /opt/certbot/bin/pip install certbot certbot-apache

sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

sudo certbot --apache -d pynar.org -d www.pynar.org
