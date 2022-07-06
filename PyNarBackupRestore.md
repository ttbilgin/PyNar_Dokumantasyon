# Backup alma

Backup almak için herhangi bir dizin içerisinde aşağıdaki komutu çalıştırın

    ./pynarbackup.sh <veritabanı_kullanıcı_adı> <veritabanı_kullanıcı_şifresi>
  
Örnek olarak:
  
    ./pynarbackup.sh root 123
  
Bu script çalıştırdığınız dizin içerisinde `pynar-backup.tar.gz` adında bir tarball oluşturacak ve sonlanacaktır.

# Restore etme

Tarball üzerinden restore etmek için aşağıdaki komutu çalıştırın

    ./pynarrestore.sh <veritabanı_kullanıcı_adı> <veritabanı_kullanıcı_şifresi> <tarball_dosya_yolu>
  
Örnek olarak:

    ./pynarrestore.sh root 123 /var/pynar-backup.tar.gz
  
Bu script çalıştırıldığında `/var/www` dizini altına tüm verileri yerleştirecek ve veritabanında şemayı oluşturarak verileri ekledikten sonra sonlanacaktır.
