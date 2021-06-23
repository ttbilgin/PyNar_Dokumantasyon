# Nuitka ile projeyi derleme
## 1. Windows için derleme
```
py -m nuitka --enable-plugin=qt-plugins,multiprocessing,numpy --include-qt-plugins=sensible,styles,sqldrivers --standalone main.py --windows-icon-from-ico=pynar.ico --windows-disable-console --mingw64
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
klasörleri derlenen uygulamanın bulunduğu klasöre atılır.

## 2. qt.conf Dosyası
Pynar uygulamasının bulunduğu klasörde qt.conf adlı bir dosya oluşturulur ve aşağıdaki satırlar yazılır:

```
[Paths]
Prefix=PyQt5/Qt
```


## 3. resources Klasörü
Pynar uygulamasının bulunduğu klasör içerisinde PyQt5/Qt klasörüne gidilir ve bu klasörde "resources" adlı bir klasör yapılır. Ardından ana klasördeki:
```
icudtl.dat
qtwebengine_devtools_resources.pak
qtwebengine_resources_100p.pak
qtwebengine_resources_200p.pak
qtwebengine_resources.pak
```
dosyaları "resources" klasörüne taşınır.
