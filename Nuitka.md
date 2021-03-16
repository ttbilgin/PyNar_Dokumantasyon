# Nuitka ile projeyi derleme
## 1. Windows için derleme
```
python -m nuitka 
--enable-plugin=qt-plugins,multiprocessing 
--include-qt-plugins=sensible,styles,sqldrivers 
--standalone 
--windows-icon-from-ico=pynar.ico 
--windows-disable-console 
--plugin-enable=tk-inter 
main.py
```


## 2. Linux/Pardus için derleme
