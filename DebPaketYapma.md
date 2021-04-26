# Gereken dosyalar
Pynar uygulaması
<br>
Pynar simgesi(pynar.ico)

# 1
Kurulum için kullanılacak bir klasör hazırla ve bu klasör içerisine "pynar" adlı bir klasör ekle.

# 2
"pynar" klasörü içerisine "DEBIAN" ve "usr" adlı iki klasör ekle.

# 3
"pynar/DEBIAN" klasörü içerisine "control" adlı boş bir dosya ekle ve içerisine aşağıda verildiği gibi gerekli bilgileri yaz

# 4
"pynar/usr" klasörü içerisinde adları "share" ve "bin" olacak şekilde 2 klasör ekle

# 5
"pynar/usr/bin" klasörü içerisine "pynar" adlı boş bir dosya ekle, aşağıda verilen başlatma kodlarını bu dosya içerisine yaz, ve bu dosyanın uygulama olarak çalıştırılmasına izin ver.

# 6
"pynar/usr/share" klasörü içerisine adları "applications" ve "pixmap" adlı iki klasör ekle, ve pynar uygulamasını bu klasöre kopyalayıp ismini "pynar" olarak değiştir.

# 7
"pynar/usr/share/pixmap" klasörüne "pynar.ico" dosyasını kopyala.

# 8
"pynar/usr/share/applications" klasörüne "pynar.desktop" adlı boş bir dosya ekle ve içerisine aşağıda verildiği gibi gerekli bilgileri yaz.

# 9
En başta hazırlanan klasöre geri dön, bu klasörde terminali aç ve "dpkg-deb --build pynar" komutunu çalıştır.
