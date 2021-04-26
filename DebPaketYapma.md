# Gereken dosyalar
Pynar uygulaması
<br>
Pynar simgesi(pynar.ico)

# 1
Kurulum için kullanılacak bir klasör hazırlanır ve bu klasör içerisine "pynar" adlı bir klasör eklenir.
![1](https://user-images.githubusercontent.com/43936380/116034719-71271e80-a66c-11eb-98e1-acdd0620164f.png)

# 2
"pynar" klasörü içerisine "DEBIAN" ve "usr" adlı iki klasör eklenir.
![2](https://user-images.githubusercontent.com/43936380/116034723-74220f00-a66c-11eb-94d3-2c2128a605f1.png)

# 3
"pynar/DEBIAN" klasörü içerisine "control" adlı boş bir dosya eklenir ve içerisine aşağıda verildiği gibi gerekli bilgiler yazılır.
>Package: PyNar<br>
>Version: 1.0<br>
>Section: custom<br>
>Priority: optional<br>
>Architecture: all<br>
>Essential: no<br>
>Installed-Size: 400000<br>
>Maintainer: PyNar<br>
>Description: PyNar<br>

![3](https://user-images.githubusercontent.com/43936380/116034741-7e440d80-a66c-11eb-85a2-ce45beb9070c.png)

# 4
"pynar/usr" klasörü içerisinde adları "share" ve "bin" olacak şekilde 2 klasör eklenir.
![4](https://user-images.githubusercontent.com/43936380/116034748-800dd100-a66c-11eb-9528-1d7b6795306e.png)

# 5
"pynar/usr/bin" klasörü içerisine "pynar" adlı boş bir dosya eklenir, aşağıda verilen başlatma kodlarını bu dosya içerisine yazılır, ve bu dosyanın uygulama olarak çalıştırılmasına izin verilir.
>#!/bin/bash<br>
>desktop_path=$(xdg-user-dir DESKTOP)<br>
>if [ -e $desktop_path/pynar ]; then<br>
>    :<br>
>else<br>
>    cp /usr/share/applications/pynar.desktop $desktop_path<br>
>    chmod +x $desktop_path/pynar.desktop<br>
>    gio set $desktop_path/pynar.desktop metadata::trusted true<br>
>fi<br>
>if [ -d ~/pynar/ ]; then<br>
>    :<br>
>else<br>
>    cp -r /usr/share/pynar ~/ &<br>
>    (<br>
>	echo "10" ; sleep 1<br>
>	echo "20" ; sleep 1<br>
>	echo "50" ; sleep 1<br>
>	echo "75" ; sleep 1<br>
>	echo "100" ; sleep 1<br>
>	) |<br>
>	zenity --progress \<br>
>	  --title="Kurulum Sihirbazı" \<br>
>   --text="PyNar Editör İlk Çalıştırma için hazırlanıyor..." \<br>
>	  --width 400 \<br>
>	  --percentage=0<br>
>fi<br>
>~/pynar/main<br>

![5_1](https://user-images.githubusercontent.com/43936380/116034753-82702b00-a66c-11eb-9000-4b7922421b18.png)
![5_2](https://user-images.githubusercontent.com/43936380/116034760-8439ee80-a66c-11eb-8cfd-046ef6fd8d93.png)

# 6
"pynar/usr/share" klasörü içerisine adları "applications" ve "pixmap" adlı iki klasör eklenir, pynar uygulamasının klasörü buraya kopyalanır ve ismi "pynar" olarak değiştirilir.
![6](https://user-images.githubusercontent.com/43936380/116034767-869c4880-a66c-11eb-9850-f84c489dffed.png)

# 7
"pynar/usr/share/pixmap" klasörüne "pynar.ico" dosyası kopyalanır.
![7](https://user-images.githubusercontent.com/43936380/116034778-89973900-a66c-11eb-9244-72a3e08aa6b3.png)

# 8
"pynar/usr/share/applications" klasörüne "pynar.desktop" adlı boş bir dosya eklenir ve içerisine aşağıda verildiği gibi gerekli bilgiler yazılır.
>[Desktop Entry]<br>
>Version=1.0<br>
>Name=pynar<br>
>Comment=pynar<br>
>Exec=pynar %U<br>
>Icon=/usr/share/pixmap/pynar.ico<br>
>Terminal=false<br>
>StartupWMClass=pynar<br>
>Type=Application<br>
>Categories=Education<br>
>MimeType=.py<br>

![8](https://user-images.githubusercontent.com/43936380/116034785-8c922980-a66c-11eb-8395-b8804ff5c0da.png)

# 9
En başta hazırlanan klasöre geri dönülür, bu klasörde terminal açılır ve "dpkg-deb --build pynar" komutu çalıştırılır.
![9](https://user-images.githubusercontent.com/43936380/116034792-8ef48380-a66c-11eb-8d4b-7c21f422db2b.png)
![9_2](https://user-images.githubusercontent.com/43936380/116034798-9156dd80-a66c-11eb-9ff2-c42ce1e07040.png)
