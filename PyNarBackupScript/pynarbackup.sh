#!/bin/sh
# $1=veritabanı kullanıcı adı, $2= veritabanı şifresi

# veritabanını yedekle
mysqldump -u $1 -p$2 restfulapi > /var/www/dump.sql

if [ $? -eq 0 ] 
then 
  echo "Veritabani yedegi basariyla alindi. Dizin: /var/www/dump.sql" 
else 
  echo "Veritabani yedegi alinamadi"
  exit
fi

echo "Tar dosyası oluşturuluyor. Lütfen /var/www dizini üzerinde değişiklik gerçekleştirmeyin!"

tar czf pynar-backup.tar.gz /var/www/

if [ $? -eq 0 ] 
then 
  echo "Yedek basariyla alindi. Dizin: /pynar-backup.tar.gz" 
else 
  echo "Yedek alma basarisiz."
  exit
fi
