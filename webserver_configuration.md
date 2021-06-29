
# UBUNTU 20.04 LTS ÜZERİNDE UYGULAMA DAĞITMAK

## APACHE2 KURULUMU

Ubuntu 20.04 LTS içerisinde varsayılan olarak apache2 modülü kurulu olarak gelir. Kontrol etmek için bash içerisinde;

    apache2 -v
    
komutunu girin ve çıkan sonuç aşağıdaki sonuca benzer olmalıdır.

    Server version: Apache/2.4.41 (Ubuntu)
    Server built:   2020-08-12T19:46:17
    
#### Apache2 MODÜLÜNÜ MANUEL KURMAK

Öncelikle sunucunuzda yeni güncellemeler mevcut ise onları güncelleyerek başlayın.

    sudo apt update
    sudo apt upgrade
    
Daha sonra ```apt``` yardımı ile apache2 modülünü sunucunuza kurun.

    sudo apt install apache2
    
Kurulum başarıyla gerçekleştikten sonra apache2 modülünü etkinleştireceğiz.

    sudo systemctl is-enabled apache2.service

Komutunu girdiğinizde geriye ```enabled``` yanıtı dönüyorsa aşağıdaki komutu es geçebilirsiniz. Enabled gelmiyorsa;

    sudo systemctl enable apache2.service
    
Komutu ile apache2 modülünü etkinleştiriyoruz.  
.HTACCESS dosyalarındaki kuralların aktif olması için aşağıdaki komutu uyguluyoruz.

    sudo a2enmod rewrite

Bu komut uygulandıktan sonra server yeniden başlatılmalıdır.

    sudo systemctl restart apache2.service

### İşinize yarayabilecek komutlar

Kurulum tamamlandı servisinizin durumunu görmek için aşağıdaki komutu kullanabilirsiniz.

    sudo systemctl status apache2.service
    
Apache servisini başlatmak için;

    sudo systemctl start apache2.service
    
Apache servisini durdurmak için;

    sudo systemctl stop apache2.service
    
Apache servisini yeniden başlatmak için;

    sudo systemctl restart apache2.service
    
Apache servisini yeniden yüklemek için;

    sudo systemctl reload apache2.service
    sudo apt-get update
    sudo apt-get upgrade
    

## MYSQL KURULUMU

Web servisimiz MySQL uyumlu olduğu içinm server üzerine kuracağız.

    sudo apt update
    sudo apt install mysql-server

Kurulum tamamlandıktan sonra bir takım konfigürasyonlar yapacağız.
    
    sudo mysql_secure_installation

Karşınıza aşağıdaki gibi bir çıktı gelecek bu çıktılara sırasıyla, ```Y``` ve ```2``` seçeneklerini seçerek ilerleyin.

    Securing the MySQL server deployment.

    Connecting to MySQL using a blank password.

    VALIDATE PASSWORD COMPONENT can be used to test passwords
    and improve security. It checks the strength of password
    and allows the users to set only those passwords which are
    secure enough. Would you like to setup VALIDATE PASSWORD component?

    Press y|Y for Yes, any other key for No: Y

    There are three levels of password validation policy:

    LOW    Length >= 8
    MEDIUM Length >= 8, numeric, mixed case, and special characters
    STRONG Length >= 8, numeric, mixed case, special characters and dictionary                  file

    Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG:
     2

Daha sonrasında güçlü bir parola girin. Gelecek sorulara ```Y``` yanıtı vererek ilerleyebilirsiniz.(Sıfırdan bir kurulum yapılıyorsa)

Git repository ile sunucuya yüklediğiniz ```restfulapi.sql``` dosyasını MySQL server içerisine dahil edeceğiz.

1. Bash üzerinde ```mysql -u root -p``` komutu ile mysql içerisine girin.
2. Mysql içerisinde ```source /<dizin>/restfulapi.sql;``` komutunu çalıştırın.
3. Sorunsuz bir şekilde içeri aktarıldıysa ```SHOW DATABASES;``` komutu ile listelediğinizde "restfulapi" veritabanını görebilirsiniz.

    
Uygulama dağıtımı tamamlandı, tebrikler!


## UYGULAMAYI APACHE2 İLE SUNMAK

Apache PHP diline direkt olarak destek vermektedir. Dolayısıyla ```/var/www``` dizini altında oluşturacağınız site klasörünün içerisine tüm siteyi kopyalayınız.

Kopyalama işlemi bittikten sonra ```api``` dizini altında ```config.php``` dosyasının içerisindeki aşağıda belirtilen üç değişkeni değiştirin.

    define('DATABASE_CONFIG', [
        'host' => 'localhost',
        'user' => 'root',
        'pass' => '',
        'dbname' => 'restfulapi'   
    ]);

    define('MAIL_CONFIG', [
        'host' => '',
        'user' => '',
        'pass' => '',
    ]);

    define('JWT_SECRET', 'secret');