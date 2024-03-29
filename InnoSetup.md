# InnoSetup ile PyNar kurulumu hazırlama
Bu kılavuz InnoSetup 6.1.2 versiyonu için hazırlanmıştır.
## Script Wizard aşaması
### 1
![image](https://user-images.githubusercontent.com/43936380/111608321-20f5aa80-87ea-11eb-814a-4d57ee354c91.png)<br>
Inno Setup programı başlatılır, ilk çıkran ekrana veya ekrandan çıkılırsa üstteki menüden "File->New" seçilir, "Create a new script file using the Script Wizard" şıkkı seçilir ve "OK"e basılır.<br>
### 2
![image](https://user-images.githubusercontent.com/43936380/111608551-65814600-87ea-11eb-9c43-e4b40335e89a.png)<br>
Next'e tıklanır.<br>
### 3
![image](https://user-images.githubusercontent.com/43936380/132123789-5bf296c8-f0b7-4e39-bf77-461475598443.png)<br>
Gelen satırlara uygun isimler girilir ve Next'e tıklanır.<br>
### 4
![image](https://user-images.githubusercontent.com/43936380/111609159-12f45980-87eb-11eb-88f0-f76eb4ef257d.png)<br>
Üstteki seçenekte "Custom" seçilir ve "{userappdata}" ifadesi ilk kutuya yazılır, ve Next'e tıklanır.<br>

### 5
![image](https://user-images.githubusercontent.com/43936380/111611801-e55cdf80-87ed-11eb-9c67-672edc8829f5.png)<br>
![image](https://user-images.githubusercontent.com/43936380/111609470-623a8a00-87eb-11eb-98dc-523c0f46e0c5.png)<br>
![image](https://user-images.githubusercontent.com/43936380/111610786-c6118280-87ec-11eb-880c-1b38c52ef77d.png)<br>
![image](https://user-images.githubusercontent.com/43936380/111612163-44baef80-87ee-11eb-988c-089977da3f16.png)<br>
Üstteki seçenekte "Browse" tıklanır, PyNar'ın .exe dosyası seçilir, "Allow user to start the application..." şıkkı kaldırılır. "Add file(s)..."a tıklanır ve Pynar klasörü içerisindeki "main.exe" hariç bütün dosyalar (klasörler değil) seçilir. Sonra Pynar içerisindeki her klasör için "Add folder..." tıklanır, klasör seçilir, ve Evet'e tıklanır. Sonra da Next'e tıklanır.<br>
"Associate..." şıkkı işaretlenir, alttaki kutucuğa ".py" yazılır ve Next'e tıklanır.

### 6
![image](https://user-images.githubusercontent.com/43936380/111612372-7469f780-87ee-11eb-85bf-dcd234e328f7.png)<br>
"Create a shortcut to the main executable..." şıkkı kaldırılır, bunun dışındaki bütün şıklar seçilir, Start Menu ismi gerekirse değiştirilir ve Next'e tıklanır.<br>
### 7
![image](https://user-images.githubusercontent.com/43936380/111612591-ab400d80-87ee-11eb-8fde-2aeb887266d5.png)<br>
Lisans ve Bilgi dosyalar seçilir ve Next'e tıklanır.<br>
### 8
![image](https://user-images.githubusercontent.com/43936380/111612775-df1b3300-87ee-11eb-9691-74c108380d34.png)<br>
"Non administrative..." şıkkı seçilir, diğer şıkların seçili olmadığından emin olunur ve Next'e tıklanır.<br>
### 9
![image](https://user-images.githubusercontent.com/43936380/111612951-0eca3b00-87ef-11eb-8730-58469e3bad44.png)<br>
Dillerden Türkçe (Turkish) seçilir ve Next'e tıklanır.<br>
### 10
![image](https://user-images.githubusercontent.com/43936380/111613036-273a5580-87ef-11eb-9d99-f2c10255caeb.png)<br>
İsteniyorsa kurulum dosyasının yolu ve ismi seçilir, ve Next'e tıklanır.<br>
### 11
![image](https://user-images.githubusercontent.com/43936380/111613164-476a1480-87ef-11eb-8bd7-776d1dcb5c32.png)<br>
"Yes, use #define..." şıkkının seçili olduğundan emin olunur ve Next'e tıklanır.<br>
### 12
![image](https://user-images.githubusercontent.com/43936380/111613243-5c46a800-87ef-11eb-9f43-00344661d7c2.png)<br>
Son olarak Finish'e tıklanır.<br>
"Would you like to compile" sorusuna Hayır denilir.<br>

## Script dosyasını doğrudan değiştirme
### 1
Setup bölümünde:<br> 
	<ol>
	<li>Defaultgroupname satırı 'DefaultGroupName= PyNar Editör' olacak şekilde değiştirilir.</li>
	<li>Bölümün alt kısmına aşağıdaki satırları eklenir.</li>
	</ol>
	```
	DisableWelcomePage=no
	```
	```
	DisableDirPage=no
	```
	```
	UsePreviousTasks=no
	```
### 2
Tasks bölümündeki satırın sonundaki ";Flags : unchecked" kısmı silinir ve bölümünün altına aşağıdaki ifadeler eklenir:<br>

```
[Types]
Name: "typical"; Description: "Typical"
Name: "custom"; Description: "Custom"; Flags: iscustom

[Components]
Name: "Pynar"; Description: "PyNar uygulaması"; Types: typical custom; Flags: fixed
Name: "Python"; Description: "Python 3.9.2 32 bit"; Types: typical

[Dirs]
Name: "{app}\Log"

```
### 3
Files bölümünde:
	<ol>
	<li>Bütün satırların sonuna ";Components: PyNar" eklenir.</li>
	<li>Klasörler için 'Destdir: "{app}" ifadesine "\(klasör ismi)" eklenir.</li>
	<li>Altta verilen satırda <Python kurulum yeri> yazan yere Python kurulum dosyası yerine bilgisayarda bulunan kurulum dosyasının yolu yazılır, ve böllümün altına eklenir</li>
	</ol>
	```Source: "<Python kurulum dosyası yeri>"; DestDir: "{tmp}"; Flags: ignoreversion; Components: Python```

### 4
Registerdaki bütün satırlar aşağıdaki satırlarla değiştirilir:
```
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocKey}"; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
```
### 5
Son olarak, dosyanın elt altına aşağıdaki satırlar eklenir:

```
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
```

### 6
Ek olarak her dosya için bir satır yazılması istenmiyorsa [Files] kısmının altında pythoninstall dosyası hariç bütün satırlar silinip yerine sadece:<br>
`Source: "C:\pynar\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Pynar <br>`
yazılabilir. Burada C:\pynar ifadesi yerine pynar klasörünün yolu yazılır.
![resim](https://user-images.githubusercontent.com/43936380/158245270-f82c1d57-1591-464f-91f2-9b9c27c874e2.png)
