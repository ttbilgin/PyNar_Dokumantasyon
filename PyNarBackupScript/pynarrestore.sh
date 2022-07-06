#!/bin/sh
# $1=veritabanı kullanıcı adı, $2= veritabanı şifresi, $3=tar dosyasının yolu

# root dizinine geçiliyor
cd /

echo "Tar dosyası çıkarılıyor..."

# tar dosyası çıkarılıyor
tar -xf $3

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
