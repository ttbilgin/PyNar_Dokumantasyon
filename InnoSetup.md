![image](https://user-images.githubusercontent.com/43936380/111608321-20f5aa80-87ea-11eb-814a-4d57ee354c91.png)<br>
Inno Setup aç, ilk çıkran ekrana veya ekrandan çıkılırsa üstteki menüden "File->New" seç, "Create a new script file using the Script Wizard" şıkkını seç ve "OK"e bas.<br>

![image](https://user-images.githubusercontent.com/43936380/111608551-65814600-87ea-11eb-9c43-e4b40335e89a.png)<br>
Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111608821-b2fdb300-87ea-11eb-9796-1db451346b33.png)<br>
Gelen satırlara uygun isimleri gir, Örnek: "Pynar - 0.2.1 - BTÜ - www.pynar.org", ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111609159-12f45980-87eb-11eb-88f0-f76eb4ef257d.png)<br>
Üstteki seçenekte "Custom"ı seç ve "{userappdata}" ifadesini ilk kutuya yaz, ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111611801-e55cdf80-87ed-11eb-9c67-672edc8829f5.png)<br>
![image](https://user-images.githubusercontent.com/43936380/111609470-623a8a00-87eb-11eb-98dc-523c0f46e0c5.png)<br>
![image](https://user-images.githubusercontent.com/43936380/111610786-c6118280-87ec-11eb-880c-1b38c52ef77d.png)<br>
![image](https://user-images.githubusercontent.com/43936380/111612163-44baef80-87ee-11eb-988c-089977da3f16.png)<br>

Üstteki seçenekte "Browse"a tıklayıp PyNar'ın .exe dosyasını seç, "Allow user to start the application..." şıkkını kaldır. "Add file(s)..."a tıkla ve Pynar klasörü içerisindeki "main.exe" hariç bütün dosyaları (klasörler değil) seç. Sonra Pynar içerisindeki her klasör için "Add folder..."a tıkla ve klasörü seç, ve Evet'e tıkla. Next'e tıkla.<br>
"Associate..." şıkkını işaretle, alttaki kutucuğa ".py" yaz ve Next'e tıkla.

![image](https://user-images.githubusercontent.com/43936380/111612372-7469f780-87ee-11eb-85bf-dcd234e328f7.png)<br>
"Create a shortcut to the main executable..." şıkkını kaldır, bunun dışındaki bütün şıkları seç, Start Menu ismi gerekirse değiştir ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111612591-ab400d80-87ee-11eb-8fde-2aeb887266d5.png)<br>
Lisans ve Bilgi dosyalarını seç ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111612775-df1b3300-87ee-11eb-9691-74c108380d34.png)<br>
"Non administrative..." şıkkını seç, diğer şıkların seçili olmadığından emin ol ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111612951-0eca3b00-87ef-11eb-8730-58469e3bad44.png)"<br>
Dillerden Türkçe'yi (Turkish) seç ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111613036-273a5580-87ef-11eb-9d99-f2c10255caeb.png)
İsteniyorsa kurulum dosyasının yolunu ve ismini seç, ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111613164-476a1480-87ef-11eb-8bd7-776d1dcb5c32.png)
"Yes, use #define..." şıkkının seçili olduğundan emin ol ve Next'e tıkla.<br>

![image](https://user-images.githubusercontent.com/43936380/111613243-5c46a800-87ef-11eb-9f43-00344661d7c2.png)
Son olarak Finish'e tıkla.<br>

"Would you like to compile" sorusuna Hayır de.<br>

Setup bölümünde:<br> 
	1-Defaultgroupname satırını 'DefaultGroupName= PyNar Editör' olacak şekilde değiştir.<br>
	2-Bölümün alt kısmına aşağıdaki satırları ekle.<br>
	DisableWelcomePage=no<br>
	DisableDirPage=no<br><br>
	UsePreviousTasks=no<br>

satırlarını ekle.<br>

Tasks bölümündeki satırın sonundaki ";Flags : unchecked" kısmını sil.<br>
Tasks bölümünün altına aşağıdaki ifadeleri ekle:<br>

"""<br>
[Types]<br>
Name: "typical"; Description: "Typical"<br>
Name: "custom"; Description: "Custom"; Flags: iscustom<br>

[Components]<br>
Name: "Pynar"; Description: "PyNar uygulaması"; Types: typical custom; Flags: fixed<br>
Name: "Python"; Description: "Python 3.9.2 32 bit"; Types: typical<br>

[Dirs]<br>
Name: "{app}\Log"<br>
"""<br>
Files bölümünde:
	1-Bütün satırların sonuna ";Components: PyNar" ekle.
	2-Klasörler için 'Destdir: "{app}" ifadesine "\(klasör ismi)" ekle. Örnek sonuç : 'DestDir: "{app}\PyQt5"'
	3- En alt satıra alttaki satırı ekle ve Python kurulum dosyasının yolunu yaz:
	'Source: "(Buraya python yükleme dosyasının yolu yazılmalı.)"; DestDir: "{tmp}"; Flags: ignoreversion; Components: Python'

Registerdaki bütün satırları aşağıdaki satırlarla değiş:
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocKey}"; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Dosyanın elt altına aşağıdaki satırları ekle:
"""
Run
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked; Components: Python; Check: pythoninstall 

Code
Function pythoninstall(): Boolean;
var
  Something : Integer;
begin
  if (Exec(ExpandConstant('{tmp}\pythoninstall.exe'), '/quiet InstallLauncherAllUsers=0 InstallAllUsers=0 Include_test=0 SimpleInstall=1 AssociateFiles=0 PrependPath=1', '', SW_SHOW, ewWaitUntilTerminated, Something)) then
  begin  
    Result:=False;
  end
  else begin
    Msgbox('Python yüklenemedi.', mbInformation, MB_OK);
    Result:=False;
  end;
end;
"""

