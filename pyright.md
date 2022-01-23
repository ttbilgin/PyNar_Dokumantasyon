# pyright code checker'ı derleme

## 1. Adım: Kurulum için gerekenler.

### WINDOWS için NodeJS

Nodejs motorunu [buradan](https://nodejs.org/en/) setup aracını indirerek bilgisayarınıza kurabilirsiniz.

### UBUNTU 20.04 için NodeJS 

NODEJS KURARKEN ROOT KULLANICISI OLARAK OTURUM AÇINIZ

NVM(Node Version Manager) kurulumu için çalıştırınız.

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

NVM başarıyla kurulduktan sonra NVM'i kullanabilmek için aşağıdaki komutu çalıştırın ya da sunucunuzu yeniden başlatınız.

    source ~/.bashrc
    
veya
    
    reboot
    
Daha sonra kuracağınız NodeJS sürümünü bulmak için aşağıdaki komutu çalıştırabilirsiniz.(Eğer sürümünüzü biliyorsanız komutu çalıştırmanıza gerek yok.)

    nvm ls-remote
    
Nodejs sürümünüzü bulduktan sonra aşağıdaki komut ile sunucunuza kurabilirsiniz.(V14.15.1 tavsiye edilir)

    nvm install <nodejs_sürümü>
    
NodeJS kurulduktan sonra 'node' komutu ile test edebilirsiniz.

NodeJS root için kurulduğunda diğer kullanıcıların da kullanabilmesini sağlamak için aşağıdaki betiği çalıştırınız.

    n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

## 2. Adım: pyright'ın indirilmesi

Github üzerinden sunulan son sürümünü kendi bilgisayarınıza [buradan](https://github.com/microsoft/pyright/releases/latest) indirebilirsiniz.

## 3. Adım: Türkçe tercüme dosyasının oluşturulması ve düzenlenmesi

```./packages/pyright-internal/src/localization``` dizini içerisine [package.nls.tr.json](https://github.com/ttbilgin/PyNar_Dokumantasyon/blob/main/pyright/package.nls.tr.json) dosyasını ve [package.nls.tr.json](https://github.com/ttbilgin/PyNar_Dokumantasyon/blob/main/pyright/findDiff.js) dosyasını kopyalayınız.

Ardından ```node findDiff.js``` komutu çalıştırınız. Kod sorunsuz çalıştıktan sonra ekranda yeni eklenen keyleri gösterecektir. Bu keyleri aynı dizinde script tarafından oluşturulmuş olan ```package.nls.tr-updated.json``` dosyasının içerisinde aşağıdaki gibi tercüme ediniz. 

    "annotatedParamCountMismatch": "Parameter annotation count mismatch: expected {expected} but received {received}"
        =>
    "annotatedParamCountMismatch": "Parametre ek açıklama sayısı uyuşmazlığı: {expected} bekleniyordu ancak {received} alındı"

Tercüme işleminden sonra eski ```package.nls.tr.json``` dosyasını siliniz ve  ```package.nls.tr-updated.json``` dosyasının adını ```package.nls.tr.json``` olarak güncelleyiniz.

    rm package.nls.tr.json
    mv package.nls.tr-updated.json package.nls.tr.json

Daha sonrasında ```import trStrings = require('./package.nls.tr.json')``` kod parçasını ```localize.ts``` dosyasının üst kısmına yerleştirerek dosyayı dahil ediniz.

```localize.ts``` dosyası içerisinde ```defaultLocale``` değişkenini ```const defaultLocale = 'tr'``` şeklinde güncelleyiniz.

```localize.ts``` dosyası içerisinde ```stringMapsByLocale``` JSON nesnesine ```'tr': trStrings``` kolonunu dahil edin.

Bu işlemler sonucunda ```localize.ts``` içerisindeki ilgili kısımlar aşağıdaki gibi olmalıdır.

    const defaultLocale = 'tr';
    const stringMapsByLocale: { [locale: string]: any } = {
        de: deStrings,
        'en-us': enUsStrings,
        es: esStrings,
        fr: frStrings,
        ja: jaStrings,
        ru: ruStrings,
        'zh-cn': zhCnStrings,
        'zh-tw': zhTwStrings,
        'tr': trStrings
    };



## 4. Adım: pyright'in Windows, Linux ve MacOS için derlenmiş paketinin oluşturulması

4.1 ```./``` ana dizininde aşağıdaki komut yardımı ile paketleri kurunuz.

    npm i

4.2 ```./packages/pyright-internal``` dizini içerisinde aşağıdaki komutları sırasıyla çalıştırınız.

    npm i
    npm run build

İşlemler tamamlandığında çıktı olarak aynı dizin içerisinde ```out``` klasörü oluşmalıdır.

4.3 ```./packages/pyright``` dizini içerisinde aşağıdaki komutları sırasıyla çalıştırınız.

    npm i
    npm run build

İşlemler tamamlandığında çıktı olarak aynı dizin içerisinde ```dist``` klasörü oluşmalıdır.

Test etmek için örnek olarak hatalı bir python dosyası oluşturduktan sonra ```./packages/pyright``` dizini içerisinde aşağıdaki komutu çalıştırabilirsiniz.

    node index.js <hatalı_dosya_yolu>

4.4 Daha sonra aşağıdaki komut ile global olarak ```pkg``` paketini kurunuz.

    npm i -g pkg

Derlenmiş paketlerin oluşturulması için ```./packages/pyright``` dizini içerisinde aşağıdaki komutu çalıştırmanız yeterlidir.

    pkg .

Derlenmiş dosyaları test etmek için hatalı bir python dosyası oluşturduktan sonra aşağıdaki komutu çalıştırabilirsiniz.

    ./<derlenmiş_dosya> <hatalı_dosya_yolu>

Herhangi bir hata ile karşılaşmadıysanız derleme başarıyla tamamlanmış anlamına gelmektedir.

Dil dosyasında herhangi bir değişiklik yaptığınızda 4.2'den itibaren adımları sırasıyla tekrarlayınız.
