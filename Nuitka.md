# Nuitka ile projeyi derleme

## Derleme Öncesi yapılması gerekenler ##
<<python_kurulum_dizini>> \Lib\site-packages\TurkishStemmer\ _ _ _init_ _ _.py
dosyası içindeki 420. satırı şu şekilde değiştiriniz.

Eskisi: ``` path_to_file = os.path.join(os.path.dirname(__file__), "resources", path) ```

Yenisi: ``` path_to_file = os.path.join("Data","resources", path) ```

## Nuitka kurulumu ##
```
pip install nuitka
```
## 1. Windows için derleme
### a) mingw ile derleme
```
nuitka --enable-plugin=pyqt5,multiprocessing,numpy --include-qt-plugins=sensible,styles,sqldrivers --standalone main.py --windows-icon-from-ico=pynar.ico --windows-disable-console --mingw64
```
### b) MSVC 2019 ile derleme 
```
nuitka --enable-plugin=pyqt5,multiprocessing,numpy --include-qt-plugins=sensible,styles,sqldrivers --standalone main.py --windows-icon-from-ico=pynar.ico --windows-disable-console --msvc=14.2
```

## 2. Linux/Pardus için derleme

Bu yönerge Nuitka 1.1.3 ve Pardus 21.3 veya Debian 10 ve 11 sürümleri için hazırlanmıştır. 

```
sudo apt-get install build-essential
sudo apt-get install python3-dev patchelf
pip3 install orderedset
pip3 install -U PyYAML
```
emoji paketi içinde gelen data_dict.py dosyasının içinde unicode olmayan yorum satırları derleme işlemine engel olmaktadır. Bu sebeple aşağdaki data_dict.py dosyası şu dosya ile değiştirilmelidir.
```
<<python_kurulum_dizini>> \Lib\site-packages\emoji\unicode_codes\data_dict.py
```
Bu işlemler tamamlandıktan sonra derleme için aşağıdaki komut kullanılabilir.
```
python3 -m nuitka --enable-plugin=pyqt5,numpy --include-qt-plugins=sensible,styles,sqldrivers --standalone --lto=no main.py
```

# Derleme sonrası klasör ve dosya düzeltmeleri
## 1.Pynar klasörleri
Pynar'ın kaynak kod klasöründe bulunan:
```
Bin
Config
Data
images
Log
qssfiles
```
klasörleri uygulamanın bulunduğu konumda oluşan main.dist klasörü içine atılır.

## 2. Ad değiştirme ve çalıştırma

Öncelikle kurulum dosyası yapılması isteniyorsa proje klasörü içinde oluşan main.dist klasörü içindeki main.exe'nin ismi pynar.exe olarak değiştirilir. Programı çalıştırmak içinse aynı dosyanın çalıştırılması yeterlidir.
