# Gereken dosyalar
Pynar uygulaması
<br>
Pynar simgesi(pynar.ico)

# 1
Kurulum için kullanılacak bir klasör hazırla ve bu klasör içerisine "pynar" adlı bir klasör ekle.
![1](https://user-images.githubusercontent.com/43936380/116034719-71271e80-a66c-11eb-98e1-acdd0620164f.png)

# 2
"pynar" klasörü içerisine "DEBIAN" ve "usr" adlı iki klasör ekle.
![2](https://user-images.githubusercontent.com/43936380/116034723-74220f00-a66c-11eb-94d3-2c2128a605f1.png)

# 3
"pynar/DEBIAN" klasörü içerisine "control" adlı boş bir dosya ekle ve içerisine aşağıda verildiği gibi gerekli bilgileri yaz
![3](https://user-images.githubusercontent.com/43936380/116034741-7e440d80-a66c-11eb-85a2-ce45beb9070c.png)

# 4
"pynar/usr" klasörü içerisinde adları "share" ve "bin" olacak şekilde 2 klasör ekle
![4](https://user-images.githubusercontent.com/43936380/116034748-800dd100-a66c-11eb-9528-1d7b6795306e.png)

# 5
"pynar/usr/bin" klasörü içerisine "pynar" adlı boş bir dosya ekle, aşağıda verilen başlatma kodlarını bu dosya içerisine yaz, ve bu dosyanın uygulama olarak çalıştırılmasına izin ver.
![5_1](https://user-images.githubusercontent.com/43936380/116034753-82702b00-a66c-11eb-9000-4b7922421b18.png)
![5_2](https://user-images.githubusercontent.com/43936380/116034760-8439ee80-a66c-11eb-8cfd-046ef6fd8d93.png)

# 6
"pynar/usr/share" klasörü içerisine adları "applications" ve "pixmap" adlı iki klasör ekle, ve pynar uygulamasını bu klasöre kopyalayıp ismini "pynar" olarak değiştir.
![6](https://user-images.githubusercontent.com/43936380/116034767-869c4880-a66c-11eb-9850-f84c489dffed.png)

# 7
"pynar/usr/share/pixmap" klasörüne "pynar.ico" dosyasını kopyala.
![7](https://user-images.githubusercontent.com/43936380/116034778-89973900-a66c-11eb-9244-72a3e08aa6b3.png)

# 8
"pynar/usr/share/applications" klasörüne "pynar.desktop" adlı boş bir dosya ekle ve içerisine aşağıda verildiği gibi gerekli bilgileri yaz.
![8](https://user-images.githubusercontent.com/43936380/116034785-8c922980-a66c-11eb-8395-b8804ff5c0da.png)

# 9
En başta hazırlanan klasöre geri dön, bu klasörde terminali aç ve "dpkg-deb --build pynar" komutunu çalıştır.
![9](https://user-images.githubusercontent.com/43936380/116034792-8ef48380-a66c-11eb-8d4b-7c21f422db2b.png)
![9_2](https://user-images.githubusercontent.com/43936380/116034798-9156dd80-a66c-11eb-9ff2-c42ce1e07040.png)
