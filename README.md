-----------------------------------------------------
#: RabbitCMS Plugin Template | RabbitCMS => @5.4.0 :#
-----------------------------------------------------
RabbitCMS Plugin Template

![alt text](https://repository-images.githubusercontent.com/458203468/f61be3bd-3cc5-490f-b1b2-78333b6e737c "RabbitCMS Core")

# Dökümantasyon / Documentation
## Kullanılabilir **Genel** Nitelikler
> Oluşturulacak eklentinin RabbitCMS tarafından tanımlanması için aşağıda belirtilen genel nitelikler mutlaka bulunmalı ve değiştirilmemelidir. Bu nitelikler mevcut değişkenlerin değerlerini almak için kullanılabilir.

Bu niteliklerin tanımlanması için *Class* yapınızın altında *class_initialize()* Subroutine (Alt Program) içinde tanımlanır.

### PluginCode()
**PLUGIN_CODE**=*String*"
Eklentinizin RabbitCMS tarafından çağırılması için kullanılacak isimdir. Benzersiz olması önemlidir. Eklenti kodunuzun kullanılıp kullanılmadığını kontrol etmek için [RabbitCMS Hub](https://github.com/RabbitCMS-Hub/) kabul görmüş eklenti isimlerini kontrol edebilirsiniz. 

### PluginName()
**PLUGIN_NAME**="*String*"
Eklentinizi tanımlayan ve eklenti listesinde görünecek olan adıdır. 40 karakterden kısa tutulması önemlidir.

### PluginVersion()
**PLUGIN_VERSION**="*String*"
Eklentinizin GitHub versiyonudur. GitHub üstünde geliştirdiğiniz ve Sürüm olarak çıkarttığınız paketlerde kullanılacak etiketi kontrol eder. Sürüm etiketlerinizi v1.0.1 gibi kullanımanız önemlidir. (v harfi küçük ve sonrasında 2 nokta ile ayrılmış 3 hane kullanılması önerilir.)

### PluginGit()
**PLUGIN_GIT**="*String*"
Eklentinizin genel GitHub adresidir. RabbitCMS bu adreste bulunan Sürüm'leri kontrol eder ve bir güncelleme geldiyse, ilgili sürüm dosyasını kullanarak eklentiyi günceller.

### PluginDevURL()
**PLUGIN_DEV_URL**="*String*"
Eklenti geliştiricisine ait web sayfası olarak tanımlanır. Dilerseniz "mailto:" şeklinde e-posta adresi girebilirsiniz.

### PluginFolder()
**PLUGIN_CODE**="*String*"
Eklentinizin ana klasörünü ifade eder. Ana klasör genel olarak GitHub uzantınız olmalıdır. https://github.com/RabbitCMS-Hub/RabbitCMS-Plugin-Template adresinde bulunacak eklentiniz

### PluginIcon()
**PLUGIN_ICON**="*String*"

### PluginRemovable()
**PLUGIN_REMOVABLE**="*Boolean*"

### PluginCredits()
**PLUGIN_CREDITS**="*String*"
### PluginRoot()

### PluginFolderName()
**PLUGIN_FOLDER_NAME**="*String*"

### PluginDBTable()
**PLUGIN_DB_NAME**="*String*"

### PluginAutoload()
**PLUGIN_AUTOLOAD**="*Boolean*"

## Örnek Kullanım
```asp
<%
Private Sub class_initialize()
	'/*
	'-----------------------------------------------------------------------------------
	' REQUIRED: PluginTemplate Main Variables
	'-----------------------------------------------------------------------------------
	'*/
	PLUGIN_CODE  			= "PLUGIN_TEMPLATE"
	PLUGIN_NAME 			= "RabbitCMS Plugin Template"
	PLUGIN_VERSION 			= "1.0.0"
	PLUGIN_GIT 				= "https://github.com/RabbitCMS-Hub/plugin-template"
	PLUGIN_DEV_URL 			= "https://adjans.com.tr"
	PLUGIN_ICON 			= "zmdi-pin-help"
	PLUGIN_CREDITS 			= "@badursun Anthony Burak DURSUN"
	PLUGIN_FOLDER_NAME 		= "Whatsapp-Widget-Plugin"
	PLUGIN_DB_NAME 			= "plugin_template_db"
	PLUGIN_REMOVABLE 		= True
	PLUGIN_AUTOLOAD 		= True
	PLUGIN_ROOT 			= PLUGIN_DIST_FOLDER_PATH(This)
	PLUGIN_FILES_ROOT 		= PLUGIN_VIRTUAL_FOLDER(This)
	'/*
	'-----------------------------------------------------------------------------------
	' REQUIRED: PluginTemplate Main Variables
	'-----------------------------------------------------------------------------------
	'*/
End Sub
%>
```

# Release / Changelog
### 01/11/2022 @1.0.0
- [x] Plugin yapısı oluşturuldu.
- [x] 
- [x] 
- [x] 
- [x] 
- [x] 
- [x] 