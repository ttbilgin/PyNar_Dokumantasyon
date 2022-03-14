# Nuitka ile projeyi derleme

## Derleme Öncesi yapılması gerekenler ##
<<python_kurulum_dizini>> \Lib\site-packages\TurkishStemmer\__init__.py  dosyası içindeki 420. satırı şu şekilde değiştiriniz.

Eskisi: ``` path_to_file = os.path.join(os.path.dirname(__file__), "resources", path) ```

Yenisi: ``` path_to_file = os.path.join("Data","resources", path) ```

## Nuitka kurulumu ##
```
pip install nuitka
```
## 1. Windows için derleme
```
nuitka --enable-plugin=qt-plugins,multiprocessing,numpy --include-qt-plugins=sensible,styles,sqldrivers --standalone main.py --windows-icon-from-ico=pynar.ico --windows-disable-console --mingw64
```


## 2. Linux/Pardus için derleme
```
sudo apt-get install -y qt5-style-plugins
sudo apt-get install -y chrpath
sudo apt-get install -y ccache
cd /usr/lib/x86_64-linux-gnu/qt5/
sudo cp -r /usr/share/qt5/*  .
python3 -m nuitka --enable-plugin=qt-plugins,numpy --include-qt-plugins=sensible,styles,sqldrivers --standalone main.py
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

## 2. çalıştırma

Proje klasörü içinde oluşan main.dist klasörü içindeki main.exe çift tıklanarak çalıştırılır.
