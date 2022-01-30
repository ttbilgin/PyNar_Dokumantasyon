# AppJar Yardım Dökümanı

## AppJar paketinin kurulumu

Ayarlar sekmesi altındaki kutu ikonuna tıklayarak Paket Yöneticisi açılır.

![139532096-74f54990-8b87-41ad-88c6-9a36899318d1](https://user-images.githubusercontent.com/56628866/142197857-48387968-c820-4a09-9fb0-31f61e9179e6.png)

Paket yöneticisine tıklandığında karşınıza kurulu paketleri görebildiğiniz veya yeni paketler kurabildiğiniz bir pencere çıkar.

![image](https://user-images.githubusercontent.com/56628866/142198242-40f9a83c-dcd9-4e50-8746-9fa280286697.png)

Arama kutusuna AppJar yazıp PyPl'dan Paket Bul butonuna tıklayın.

![image](https://user-images.githubusercontent.com/56628866/142198522-ebc65d4f-e3c0-4b03-a9cb-a6b2f44e17dd.png)

Paket bulunduğunda pencerenin sağ tarafında paketle ilgili bilgileri ve kur butonunu görebilirsiniz.

![image](https://user-images.githubusercontent.com/56628866/142198618-ff8d857b-7265-4552-8c41-d8b024793270.png)

Kur butonuna tıkladığınızda kurulum başlayacaktır. Kurulum bitene kadar bir süre bekleyiniz.

![image](https://user-images.githubusercontent.com/56628866/142198726-ae9276cb-95c8-4ed8-90b2-cb7f2290b088.png)

Kurulum bittiğinde İndirme başarılı yazan bir pencere çıkacaktır.

![image](https://user-images.githubusercontent.com/56628866/142198802-089a2694-700e-4771-b681-c9475c019f9f.png)

Paket Kullanıma hazır.

## Pencere

### Pencere Oluşturma

Pencere oluşturmak için AppJar kütüphanesinden gui (Görsel kullanıcı arayüzü) sınıfının içe aktarılması gerek. **p = gui()** yazarak p adında bir pencere oluşturabiliriz. gui() sınıfına ait **go()** metodu ise oluşturulan pencereyi başlatır.

**Örnek**

```python
#appJar kütüphanesinden gui sınıfını içe aktar
from appJar import gui 

#Sonra pencere objesini oluştur
p = gui()

#Son olarak pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692123-4df5584a-2d42-40de-bb82-e63f15117aac.png)


### Pencere Boyutu

Oluşturulan bir pencerenin boyutunu ayarlamak için gui() sınıfına ait **setSize()** metodu kullanılır. parametre olarak ilk önce pencerenin eni sonra da boyu aralarına virgül(,) konarak girilir.

**Örnek**

```python
from appJar import gui 
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692152-3b83cb37-ca59-4d2d-9521-964c72d3929a.png)

### Pencere Başlığı

Oluşturulan bir pencerenin başlığını ayarlamak için gui() sınıfına ait **setTitle()** metodu kullanılır.

**Örnek**

```python
from appJar import gui 
p = gui()
p.setSize(300,200)

#Pencerenin başlığını 'Başlık' olarak değiştir
p.setTitle("Başlık")

p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692212-aaca8552-74fc-459e-bd4f-4865211e023b.png)

### Pencere Arkaplan Rengi

Oluşturulan bir pencerenin Arkaplan rengini ayarlamak için gui() sınıfına ait **setBg()** metodu kullanılır. Parametre olarak temel renklerin isimleri ingilizce olarak girilir.

**Örnek**

```python
from appJar import gui 
p = gui()
p.setSize(300,200)

#Pencerenin arka plan rengini yeşil yap
p.setBg('green')

p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692270-afeb612c-888a-4261-bbee-ead08ce4b3a0.png)

## Girdi Araçları

Girdi araçları tıklayarak, sürükleyerek ya da yazarak yapılan kullanıcı etkilişimmlerini yakalamak için kullanılır. Genelde 3 temel fonksiyon vardır.

- ADD : Aracı ekler.
- GET : Aracın mevcut durumunu ya da içeriğini alır, kaydeder.
- SET : Aracın içindekini değiştirir.

Genel olarak önce bu üçünden biri yazılır hemen ardında ise ilgili aracın adı gelir.

### Buton 

Buton eklemek için gui() sınıfına ait **addButton()** metodu kullanılır. İki parametre alır, önce butonun başlığı girilir ardından butona tıklandığında çağıralacak fonksiyon.

**Örnek**


```python
def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Tıklandı' diye bir mesaj yazdır
    print('Tıklandı')

from appJar import gui 
p = gui()
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692617-cb6540c3-ee3a-4169-89a8-a8f04a2ba2c3.png)

Butona 3 defa tıklandığında alınacak olan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151692623-17ce31a1-c4ee-4805-8267-9b12c9fadfe7.png)

### Metin Kutusu

Metin kutusu eklemek için gui() sınıfına ait **addEntry()** metodu kullanılır. Metin kutusuna girilen bilgiyi almak için ise **getEntry()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Metin' başlıklı metin kutusundaki metni yazdır.
    print(p.getEntry('Metin'))

p = gui()
p.setSize(300,200)

#'Metin' başlıklı bir metin kutusu oluştur.
p.addEntry('Metin')

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692705-ff8535fc-304b-4247-ba94-7e3c92fda517.png)

Metin kutusuna 'Pynar' yazdıktan sonra butona tıklanırsa alınacak çıktı.

![image](https://user-images.githubusercontent.com/56628866/151692716-065ad6cd-fa27-4231-9ed2-3ebde7ba18e5.png)

### Çok Metin Kutusu

Çok metin kutusu eklemek için gui() sınıfına ait **addTextArea()** metodu kullanılır. Metin kutusuna girilen bilgiyi almak için ise **getTextArea()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Metin' başlıklı çok satırlı metin kutusundaki metni yazdır.
    print(p.getTextArea('Metin'))

p = gui()
p.setSize(300,200)

#'Metin' başlıklı bir çok satırlı metin kutusu oluştur.
p.addTextArea('Metin')

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692780-4f83c7bc-ac62-4fff-8d55-7027f3ff9bd2.png)

![image](https://user-images.githubusercontent.com/56628866/151692787-61bb6c6a-3763-406d-860b-02f4caa2f85c.png)

### Seçenek Düğmesi

Seçenek Düğmesi eklemek için gui() sınıfına ait **addRadioButton()** metodu kullanılır. Parametre olarak önce hangi başlıkla ilgii bir seçim olduğu girilir ardından ise seçeneğin adı girilir. Seçenek düğmelerinden seçilen bilgiyi almak için ise **getRadioButton()** metodu kullanılır. parametre olarak ise hangi başlıkla ilgili seçim isteniyorsa onun başlığı girilir.

```python
from appJar import gui

def press():#Buton tıklanınca çağrılacak olan fonksiyon
    print(p.getRadioButton('harf'))#Seçilen düğmeyi çıktı al

p = gui()
p.setSize(300,200)

#Seçenek düğmeleri ekleme.
#'Harf' başlıklı A, B, ve C seçenekleri ekle.
p.addRadioButton('harf', 'A')
p.addRadioButton('harf', 'B')
p.addRadioButton('harf', 'C')

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151692929-06175d23-f621-495d-b6ef-3d4d8b7772ed.png)

Seçim yapılıp butona tıklandıktan sonraki çıktı.

![image](https://user-images.githubusercontent.com/56628866/151692948-6575bc1a-16eb-4eab-ba70-57f784e5a515.png)

### Onay Kutusu

Onay kutusu eklemek için gui() sınıfına ait **addCheckBox()** metodu kullanılır. Kutucuk işaretli ise True işaretli değil ise False döndürür.

```python
from appJar import gui

def press():#Butona tıklanınca çağrılacak fonksiyon
    #Onay başlıklı onay düğmesi şıklıysa 'True', yoksa 'False' yazdır
    print(p.getCheckBox('Onay'))

#Pencereyi oluştur
p = gui()
p.setSize(300,200)

#'Onay' başlıklı bir onay düğmesi oluştur
p.addCheckBox('Onay')

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693018-c0291ae9-714c-4282-ade5-bc963a137064.png)

Kutuyu işaretlemeden butona tıklandığında alınacak çıktı.

![image](https://user-images.githubusercontent.com/56628866/151693028-19e3aa30-4b87-484d-b963-84dd77170c19.png)

### Seçenek Kutusu

Seçenek kutusu eklemek için gui() sınıfına ait **addOptionBox()** metodu kullanılır.

```python
from appJar import gui

def press():#Buton tıklanınca çağrılacak olan fonksiyon
    #'Seçenekler' başlıklı seçenek kutusundaki
    #seçilen ögeyi çıktı al
    print(p.getOptionBox('Seçenekler'))

p = gui()
p.setSize(300,200)

#'Seçenekler' başlıklı bir seçenek kutusu oluştur
#İkinci argümanda kutuda yer alacak değerler bulunmakta
#Bu değerlerden '-' ile başlayıp bitenler ayırma işlevi gördüğünden seçilemez
p.addOptionBox('Seçenekler', ['- Meyveler -', 'Elma', 'Portakal',
'Armut', '- Hayvanlar -', 'Köpek', 'Kedi', 'Tavşan'])

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693114-31241c80-fe6b-4baa-8d03-deea3e5ac0b5.png)

Kutuyu tıklanınca açılan menüden portakal seçildikten sonra butona basıldığında alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151693200-505057af-4e2a-42c9-8d49-773c65e8e78c.png)

![image](https://user-images.githubusercontent.com/56628866/151693208-f57035de-7a56-414a-a1d2-79cc3340cedc.png)

### Spin Kutusu

Spin kutusu eklemek için gui() sınıfına ait **addLabelSpinBox()** metodu kullanılır. Spin kutusu ok tuşları yardımı ile seçenekler arasında dolaşabileceğiniz bir kutudur. Aynı zamanda ilgili seçeneği Kutuya elle de girebilirsiniz. Eğer girilen seçenek kutuda yoksa kutu boş kalacaktır. Belli bir sayı aralığında seçimler isteniyorsa **addLabelSpinBoxRange()** metodu kullanılır.

```python
from appJar import gui

def press():#Buton tıklanınca çağrılacak olan fonksiyon
    #'Seçenekler' ve 'Numaralar' başlıklı spin
    #kutularında seçilen ögelerin çıktısını al
    print(p.getSpinBox('Seçenekler'))
    print(p.getSpinBox('Numaralar'))

p = gui()
p.setSize(300,200)

#'Seçenekler' başlıklı ve 'A','B','C','D' değerleri bulunan Spin kutusu ekle.
p.addLabelSpinBox('Seçenekler', ['A', 'B', 'C', 'D'])

#'Numaralar' başlıklı ve içerisinde 1'den 10'a kadar sayılar olan Spin kutusu ekle.
p.addLabelSpinBoxRange('Numaralar', 1, 10)

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693277-24dfbd59-8e7c-4d42-ba92-fa4e928ffa3e.png)

![image](https://user-images.githubusercontent.com/56628866/151693280-9c163214-cc65-473f-af3e-be650015518c.png)

### Liste Kutusu

Liste kutusu eklemek için gui() sınıfına ait **addListBox()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Liste' başlıklı liste kutusundaki seçilen ögeyi yazdır.
    print(p.getListBox('Liste'))

p = gui()
p.setSize(300,200)

#Liste isimli ve 'A,B,C,D' içerikli bir liste kutusu oluştur
p.addListBox('Liste', ['A','B','C','D'])

p.addButton('Buton', press)
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693342-bcb85fcc-9ccd-4c00-9e96-5f1384c22a9c.png)

![image](https://user-images.githubusercontent.com/56628866/151693347-fec499f2-3948-4e9b-b2f8-82da8cf68672.png)

### Çoklu Liste Kutusu

Çoklu liste kutusu eklemek için gui() sınıfına ait **addListBox()** metodu kullanılır. Fakat çoklu seçim özelliğini etkinleştirmek için **setListBoxMulti()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Liste' başlıklı liste kutusundaki seçilen ögeyi yazdır.
    print(p.getListBox('Liste'))

p = gui()

#Liste isimli ve 'A,B,C,D' içerikli bir liste kutusu oluştur
p.addListBox('Liste', ['A','B','C','D'])

#'Liste' başlıklı liste kutusunu çoklu seçimli hale getir.
p.setListBoxMulti('Liste', multi = True)

p.addButton('Buton', press)
p.go()
```

'CTRL' tuşuna basılı tutarak birden fazla seçim yapabilirsiniz.

![image](https://user-images.githubusercontent.com/56628866/151693507-74c3cb9a-a5a5-40e7-ac59-546a3edca066.png)

![image](https://user-images.githubusercontent.com/56628866/151693515-9ea3502b-76e6-45bf-bcda-78d76078f1f2.png)

## Çıktı Araçları

Çıktı araçları kullanıcıya bilgi göstermek için kullanılır.

- ADD : Aracı ekler.
- GET : Aracın mevcut durumunu ya da içeriğini alır, kaydeder.
- SET : Aracın içindekini değiştirir.

Genel olarak önce bu üçünden biri yazılır hemen ardında ise ilgili aracın adı gelir.

### Metin 

Metin çıktı kutusu eklemek için gui() sınıfına ait **addLabel()** metodu kullanılır.

```python
from appJar import gui
p = gui()
p.setSize(300,200)

#'Merhaba' başlıklı bir metin ekle.
p.addLabel('Merhaba')

p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693585-76e9d055-af2c-4b7b-b74d-a7e8b25e3f2b.png)


### Çok Satırlı Metin 

Çok satırlı metin çıktı kutusu eklemek için gui() sınıfına ait **addMessage()** metodu kullanılır.

```python
from appJar import gui 
p = gui()
p.setSize(400,300)

# 'Pynar' başlıklı ve üzerinde uzun bir metin yazılı bir
#çok satırlı metin oluştur.
p.addMessage('Pynar', '''PyNar, Türkiye’nin ilk Tamamen
Türkçe arayüze sahip Python kod editörüdür.

PyNar Editörü TÜBİTAK Açık Kaynak Yazılımlar Çağrı Programı
“1003 Türkçe Arayüz ve Destek Sistemleri” çağrısı
kapsamında geliştirilmektedir.

PyNar, bir kod editörü olmasının yanı sıra Entegre bir
Chatbot’a sahiptir. Chatbot, makine öğrenmesi destekli olup
kullanıcının hatalarında düzeltme önerileri sunmaktadır.''')

p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693737-62a58ec6-dfbd-47a5-b926-0ef1b2687c6b.png)

## Karma Örnek

Buton ve Metin kutusu kullanarak bir etiketi değiştiren örnek uygulamalı bir kod.

```python
def press():#Buton her tıklandığında çağrılacak olan fonksiyon
    #Metinkutusu isimli metin kutusundaki metni 'yazi' değişkenine aktar
    yazi = p.getEntry('Metinkutusu')

    #'Etiket' başlıklı etiketteki metni 'yazi' değişkenindeki yazı olarak ayarla
    p.setLabel('Etiket', yazi)
    
from appJar import gui

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#Pencerenin başlığını 'Birleşik Örnek' olarak ayarla
p.setTitle('Birleşik Örnek')

#Pencereye 'Etiket' başlıklı bir etiket ekle
p.addLabel('Etiket')

#Pencereye 'Metinkutusu' başlıklı bir metin kutusu ekle
p.addEntry('Metinkutusu')

#Pencereye 'Tıkla' başlıklı bir buton ekle,
#ve bu buton her tıklandığında 'press' fonksiyonunu çağır
p.addButton('Tıkla', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151693801-f97e46c3-c787-43d2-955c-4978616b5fe4.png)

Metin kutusuna girilen metin butona tıklandığında etiketi değiştirecektir.

![image](https://user-images.githubusercontent.com/56628866/151693823-4f18edfb-869a-4c2d-8515-5514f4270379.png)

## Açılır Pencereler 

Açılır Pencereler bir etkileşim sonucu ya da bir bilgiyi sunmak için açılan fazladan küçük pencerelerdir.

### Mesaj Penceresi 

Mesaj penceresi eklemek için gui() sınıfına ait **infoBox()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Pencere' başlıklı ve içinde
    #'Merhaba!' yazan bir açılır pencere göster
    p.infoBox('Pencere', 'Merhaba!', parent=None)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694390-8a1bbf64-83e8-492a-a2d9-7491150419a4.png)

Oluşturulan pencere butona tıklandığında ortaya çıkacaktır.

![image](https://user-images.githubusercontent.com/56628866/151694398-5b8d470b-5aba-45a1-aad8-53b6d221dbb8.png)

### Hata Penceresi 

Hata penceresi eklemek için gui() sınıfına ait **errorBox()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fon5ksiyon
    #'Hata' başlıklı ve içinde
    #'Hata!' yazan bir açılır pencere göster
    p.errorBox('Hata', 'Hata!', parent=None)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694431-fcec3ba0-5076-4786-aef5-aab98f7a7b9c.png)

### Uyarı Penceresi 

Uyarı penceresi eklemek için gui() sınıfına ait **warningBox()** metodu kullanılır.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Uyarı' başlıklı ve içinde
    #'Uyarı!' yazan bir açılır pencere göster
    p.warningBox('Uyarı', 'Uyarı!', parent=None)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694453-d3aa95e2-112a-475b-b6d5-210f02de74c1.png)

### Soru Penceresi 

Soru penceresi eklemek için gui() sınıfına ait **questionBox()** metodu kullanılır. **questionBox()** metodu seçim yapıldıktan sonra bir boolean değeri döndürür.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Soru' başlıklı ve içinde
    #'Mesaj' yazan bir açılır pencere göster
    #Ve basılan butonu bool değişkenine aktar(Evet->True, Hayır->False)    
    bool = p.questionBox('Soru', 'Mesaj', parent=None)
    #bool değişkenini yazdır
    print(bool)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694556-c58aad7b-05a4-4abf-bed8-03d87ed5c42c.png)

'Evet'i seçtikten sonra alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151694568-ecd515a5-e22c-4451-87cd-9f068d7f5606.png)


### Onay Penceresi 

Onay penceresi eklemek için gui() sınıfına ait **okBox()** metodu kullanılır. **okBox()** metodu seçim yapıldıktan sonra bir boolean değeri döndürür.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Onay' başlıklı ve içinde
    #'Mesaj' yazan bir açılır pencere göster
    #Ve basılan butonu bool değişkenine aktar(Tamam->True, İptal->False)    
    bool = p.okBox('Onay', 'Mesaj', parent=None)
    #bool değişkenini yazdır
    print(bool)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694610-e270abc7-fb07-4df4-b555-e9d1707ef5b0.png)

'Tamam'ı seçtikten sonra alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151694568-ecd515a5-e22c-4451-87cd-9f068d7f5606.png)

### Yeniden Dene Penceresi 

Yeniden Dene penceresi eklemek için gui() sınıfına ait **retryBox()** metodu kullanılır. **retryBox()** metodu seçim yapıldıktan sonra bir boolean değeri döndürür.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #'Yeniden dene' başlıklı ve içinde
    #'Mesaj' yazan bir açılır pencere göster
    #Ve basılan butonu bool değişkenine aktar(Yeniden dene->True, İptal->False)    
    bool = p.retryBox('Yeniden dene', 'Mesaj', parent=None)
    #bool değişkenini yazdır
    print(bool)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694643-e72b035e-b149-4e5f-affb-03878123a12f.png)

'Yeniden dene'yi seçtikten sonra alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151694568-ecd515a5-e22c-4451-87cd-9f068d7f5606.png)


### Metin Kutusu Penceresi 

Metin Kutusu penceresi eklemek için gui() sınıfına ait **stringBox()** metodu kullanılır. **stringBox()** metodu içine yazılan metni string olarak döndürür.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #Metin penceresi başlıklı ve içinde
    #'Mesaj' yazan bir açılır pencere göster
    #Ve pencereye yazılan metni 'metin' değişkenine aktar
    metin = p.stringBox('Metin penceresi', 'Mesaj', parent=None)
    #metin değişkenini yazdır
    print(metin)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694702-cacf29bf-6e1b-4dfd-ad5f-1088963123d8.png)

Metin kutusunun içine Pynar yazıp onayladıktan sonra alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151694747-b44a7531-c744-4376-b2ee-4500e16154cf.png)

### Sayı Kutusu Penceresi 

Sayı Kutusu penceresi eklemek için gui() sınıfına ait **integerBox()** metodu kullanılır. **integerBox()** metodu içine yazılan değeri integer olarak döndürür. Eğer mesaj kutusuna tam sayı bir değer yazılmazsa hata verecektir.

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #Sayı penceresi başlıklı ve içinde
    #'Mesaj' yazan bir açılır pencere göster
    #Ve pencereye yazılan sayıyı 'sayi' değişkenine aktar
    sayi = p.integerBox('Sayı penceresi', 'Mesaj', parent=None)
    #metin değişkenini yazdır
    print(sayi)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694793-0af9873e-45ed-492f-87f4-c24051b6e9fe.png)

Sayı kutusunun içine 123 yazıp onayladıktan sonra alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151694800-d22b2f44-a2a3-4d4b-8d31-bd64880a917f.png)

Eğer bir metin yazılırsa aşağıdaki gibi hata verecektir.

![image](https://user-images.githubusercontent.com/56628866/151694825-46125835-12cd-4dca-828f-14632fd52820.png)

![image](https://user-images.githubusercontent.com/56628866/151694831-43aedc1b-7fcd-4355-acec-e7bf9d09be4a.png)


### Ondalıklı Sayı Kutusu Penceresi 

Ondalıklı Sayı Kutusu penceresi eklemek için gui() sınıfına ait **floatBox()** metodu kullanılır. **floatBox()** metodu içine yazılan değeri float olarak döndürür. 

```python
from appJar import gui

def press():#Butona tıklandığı zaman çağrılacak fonksiyon
    #Sayı penceresi başlıklı ve içinde
    #'Mesaj' yazan bir açılır pencere göster
    #Ve pencereye yazılan sayıyı 'sayi' değişkenine aktar
    sayi = p.floatBox('Sayı penceresi', 'Mesaj', parent=None)
    #metin değişkenini yazdır
    print(sayi)

#Pencereyi oluştur
p = gui()

#Pencerenin en,boy uzunluklarını 300,200 olarak ayarla
p.setSize(300,200)

#'Buton' başlıklı bir buton ekle ve
#Bu butona her tıklandığında 'press' fonksiyonunu çalıştır
p.addButton('Buton', press)

#Pencereyi başlat
p.go()
```

![image](https://user-images.githubusercontent.com/56628866/151694428-1e803d23-c2fa-4163-8b6e-4c971d545500.png)

![image](https://user-images.githubusercontent.com/56628866/151694899-36994d60-7fc5-4ca0-8f78-8105cc9da00d.png)

Sayı kutusunun içine 15.7596 yazıp onayladıktan sonra alınan çıktı.

![image](https://user-images.githubusercontent.com/56628866/151694906-2fe98439-4ae7-405f-a3d6-9452203aed9a.png)

