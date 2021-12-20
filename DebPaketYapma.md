# Gereken dosyalar
Pynar uygulaması
<br>
Pynar simgesi(pynar.ico)

# 1
Kurulum için kullanılacak bir klasör hazırlanır ve bu klasör içerisine "pynar" adlı bir klasör eklenir.
![pynar](https://user-images.githubusercontent.com/43936380/132126318-10f6f194-0352-45d1-87b7-335584cb8083.png)


# 2
"pynar" klasörü içerisine "DEBIAN" ve "usr" adlı iki klasör eklenir.
![usrdebi](https://user-images.githubusercontent.com/43936380/132126334-06ad1881-0797-4a71-b849-9bb814bec44d.png)


# 3
"pynar/DEBIAN" klasörü içerisine "control" adlı boş bir dosya eklenir ve içerisine aşağıda verildiği gibi gerekli bilgiler yazılır.
>Package: Pynar<br>
>Version: 1.0<br>
>Section: custom<br>
>Priority: optional<br>
>Architecture: all<br>
>Essential: no<br>
>Installed-Size: 400000<br>
>Maintainer: Türkçe Python Editörü Geliştirme Projesi<br>
>Depends: zenity , fonts-noto-color-emoji, zenity-common<br>
>Description: Pynar Python Editörü<br>

![control](https://user-images.githubusercontent.com/43936380/132135520-85aafe16-9218-4d7b-9bac-f231e5dc7c29.png)


# 4
"pynar/usr" klasörü içerisinde adları "share" ve "bin" olacak şekilde 2 klasör eklenir.
![binshare](https://user-images.githubusercontent.com/43936380/132127855-767106af-a416-4de7-9ef1-4364f40b1b37.png)

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

![pynarbin](https://user-images.githubusercontent.com/43936380/146789071-d23ac805-bb80-4f35-87ce-7e16354a8f4f.png)
![pynarbin2](https://user-images.githubusercontent.com/43936380/132127922-9de0abcc-44f8-4a75-b3a0-fc1f375fff52.png)

# 6
"pynar/usr/share" klasörü içerisine adları "applications" ve "pixmap" adlı iki klasör eklenir, pynar uygulamasının klasörü buraya kopyalanır ve ismi "pynar" olarak değiştirilir.
![apppixpy](https://user-images.githubusercontent.com/43936380/132128074-9821c53b-370d-42c2-93d4-46db53aeb687.png)

# 7
"pynar/usr/share/pixmap" klasörüne "pynar.ico" dosyası kopyalanır.
![pynarico](https://user-images.githubusercontent.com/43936380/132128084-22ee8dd0-d557-4966-b8ec-c1f74abaf0a7.png)

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

![pynardesktop](https://user-images.githubusercontent.com/43936380/132128281-d9735f0d-cee2-4742-8dda-d4ce19f5750d.png)

# 9
En başta hazırlanan klasöre geri dönülür, bu klasörde terminal açılır ve "dpkg-deb --build pynar" komutu çalıştırılır.
![terminal](https://user-images.githubusercontent.com/43936380/132128303-0a02ba50-4b75-4deb-8a84-7936fd247177.png)
![terminal2](https://user-images.githubusercontent.com/43936380/132128514-e0fa4401-8b87-481a-9d34-7226bd7bc47c.png)
