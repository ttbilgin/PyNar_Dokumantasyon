# Sıfırdan Sertifika Almak

İlk önce sistemdeki güncellemeleri gerçekleştiriniz.  

    sudo apt-get update && sudo apt-get upgrade

Öncelikle `pip` yardımıyla `certbot` aracını sunucu üzerine kurunuz. Pip kurulu değilse aşağıdaki komut ile kurabilirsiniz.

    sudo apt install python3 python3-venv libaugeas0
  
Daha sonra cerbot için sanal ortamı ayarlayınız ve içerisindeki pip aracını güncelleyiniz.

    sudo python3 -m venv /opt/certbot/ && sudo /opt/certbot/bin/pip install --upgrade pip
  
Apache2 üzerine certbotu kurmak için aşağıdaki komutlar kullanabilirsiniz. - sunucu üzerinde Apache2 olduğunu varsayıyorum

    sudo /opt/certbot/bin/pip install certbot certbot-apache
  
Eğer ki nginx varsa aşağıdaki komutu kullanın.
  
    sudo /opt/certbot/bin/pip install certbot certbot-nginx
  
Certbot için bir link oluşturunuz.

    sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
  
Artık aşağıdaki komut ile sertifikasyonu gerçekleştirebilirsiniz.

    sudo certbot --apache -d pynar.org -d www.pynar.org
  
HTTPS yönlendirme seçeneğinde 'evet' seçmenizi tavsiye ederim.

# Sertifika Güncelleme

Sertifikalarınızın süresi bitmesine yakın uyarı mailleri gelecektir bu sorunu çözmek için aşağıdaki komut ile zorlayarak güncelleme gerçekleştirebilirsiniz.

    certbot --force-renewal
