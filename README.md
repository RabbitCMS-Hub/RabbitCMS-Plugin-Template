-----------------------------------------------------
#: RabbitCMS Plugin Template | RabbitCMS => @5.4.0 :#
-----------------------------------------------------
RabbitCMS Plugin Template

![alt text](https://repository-images.githubusercontent.com/458203468/f61be3bd-3cc5-490f-b1b2-78333b6e737c "RabbitCMS Core")

# Dökümantasyon
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in elit eget lectus imperdiet gravida sit amet euismod magna. Sed rhoncus, dolor quis porttitor placerat, velit orci tincidunt dui, vitae maximus magna turpis sit amet est. Nunc at feugiat ipsum, vel euismod erat. Sed facilisis finibus eros nec aliquet. Ut fermentum, leo sit amet pellentesque maximus, sapien diam eleifend dui, a molestie mi est in dolor. Aenean ac rhoncus tortor. Vestibulum sed varius lectus, non fermentum magna. Sed vitae quam nibh. In ut orci mauris. Ut consequat, arcu id sagittis pretium, enim orci imperdiet velit, ac pretium eros felis pretium nunc. Fusce quis risus mi.



# Eklenti Sınıfı **Genel** Yapısı
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in elit eget lectus imperdiet gravida sit amet euismod magna. Sed rhoncus, dolor quis porttitor placerat, velit orci tincidunt dui, vitae maximus magna turpis sit amet est. Nunc at feugiat ipsum, vel euismod erat. Sed facilisis finibus eros nec aliquet. Ut fermentum, leo sit amet pellentesque maximus, sapien diam eleifend dui, a molestie mi est in dolor. Aenean ac rhoncus tortor. Vestibulum sed varius lectus, non fermentum magna. Sed vitae quam nibh. In ut orci mauris. Ut consequat, arcu id sagittis pretium, enim orci imperdiet velit, ac pretium eros felis pretium nunc. Fusce quis risus mi.

<details>
	<summary>
		<a class="btnfire small stroke"><em class="fas fa-chevron-circle-down"></em>&nbsp;&nbsp;Örnek Kodu Göster</a> 
	</summary>

```asp
<%
Class ClassName
	' REQUIRED: Plugin Variables
	Private PLUGIN_CODE, PLUGIN_DB_NAME, PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_CREDITS, PLUGIN_GIT, PLUGIN_DEV_URL, PLUGIN_FILES_ROOT, PLUGIN_ICON, PLUGIN_REMOVABLE, PLUGIN_ROOT, PLUGIN_FOLDER_NAME, PLUGIN_AUTOLOAD

	' REQUIRED: Register Class
	Public Property Get class_register()
		DebugTimer ""& PLUGIN_CODE &" class_register() Start"

		' Check Register
		If CheckSettings("PLUGIN:"& PLUGIN_CODE &"") = True Then 
			DebugTimer ""& PLUGIN_CODE &" class_registered"
			Exit Property
		End If

		' Plugin Database
		Dim PluginTableName
			PluginTableName = "tbl_plugin_" & PLUGIN_DB_NAME
    	
    	If TableExist(PluginTableName) = False Then
			DebugTimer ""& PLUGIN_CODE &" table creating"
    		
    		Conn.Execute("SET NAMES utf8mb4;") 
    		Conn.Execute("SET FOREIGN_KEY_CHECKS = 0;") 
    		
    		Conn.Execute("DROP TABLE IF EXISTS `"& PluginTableName &"`")

    		q="CREATE TABLE `"& PluginTableName &"` ( "
    		q=q+"  `ID` int(11) NOT NULL AUTO_INCREMENT, "
    		q=q+"  `FILENAME` varchar(255) DEFAULT NULL, "
    		q=q+"  `FULL_PATH` varchar(255) DEFAULT NULL, "
    		q=q+"  `COMPRESS_DATE` datetime DEFAULT NULL, "
    		q=q+"  `COMPRESS_RATIO` double(255,0) DEFAULT NULL, "
    		q=q+"  `ORIGINAL_FILE_SIZE` bigint(20) DEFAULT 0, "
    		q=q+"  `COMPRESSED_FILE_SIZE` bigint(20) DEFAULT 0, "
    		q=q+"  `EARNED_SIZE` bigint(20) DEFAULT 0, "
    		q=q+"  `ORIGINAL_PROTECTED` int(1) DEFAULT 0, "
    		q=q+"  PRIMARY KEY (`ID`), "
    		q=q+"  KEY `IND1` (`FILENAME`) "
    		q=q+") ENGINE=MyISAM DEFAULT CHARSET=utf8; "
			Conn.Execute(q)

    		Conn.Execute("SET FOREIGN_KEY_CHECKS = 1;") 

			' Create Log
    		Call PanelLog(""& PLUGIN_CODE &" için database tablosu oluşturuldu", 0, ""& PLUGIN_CODE &"", 0)

			' Register Settings
			DebugTimer ""& PLUGIN_CODE &" class_register() End"
    	End If

		' Plugin Settings
		a=GetSettings("PLUGIN:"& PLUGIN_CODE &"", PLUGIN_CODE&"_")
		a=GetSettings(""&PLUGIN_CODE&"_PLUGIN_NAME", PLUGIN_NAME)
		a=GetSettings(""&PLUGIN_CODE&"_CLASS", "ClassName")
		a=GetSettings(""&PLUGIN_CODE&"_REGISTERED", ""& Now() &"")
		a=GetSettings(""&PLUGIN_CODE&"_CODENO", "0")
		a=GetSettings(""&PLUGIN_CODE&"_FOLDER", PLUGIN_FOLDER_NAME)

		' Register Settings
		DebugTimer ""& PLUGIN_CODE &" class_register() End"
	End Property
	' REQUIRED: Register Class End

	' REQUIRED: Plugin Settings Panel
	Public sub LoadPanel()
		' Sub Page
		If Query.Data("Page") = "SHOW:CachedFiles" Then
			Call PluginPage("Header")

			Call PluginPage("Footer")
			Call SystemTeardown("destroy")
		End If

		' Main Page
		With Response
			'------------------------------------------------------------------------------------------
				PLUGIN_PANEL_MASTER_HEADER This()
			'------------------------------------------------------------------------------------------
			.Write "<div class=""row"">"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("select", ""& PLUGIN_CODE &"_OPTION_1", "Buraya Title", "0#Seçenek 1|1#Seçenek 2|2#Seçenek 3", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("number", ""& PLUGIN_CODE &"_OPTION_2", "Buraya Title", "", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write 			QuickSettings("tag", ""& PLUGIN_CODE &"_OPTION_3", "Buraya Title", "", TO_DB)
			.Write "    </div>"
			.Write "</div>"
		End With
	End Sub

	' REQUIRED: Plugin Class Initialize
	Private Sub class_initialize()
		' REQUIRED: PluginTemplate Main Variables
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

		' REQUIRED: Register Plugin to CMS
		class_register()

		' REQUIRED: Hook Plugin to CMS Auto Load Location WEB|API|PANEL
		If PLUGIN_AUTOLOAD_AT("WEB") = True Then 
			' Cms.BodyData = Init()
			' Cms.FooterData = "<add-footer-html>Hello World!</add-footer-html>"
		End If
	End Sub

	' REQUIRED: Plugin Class Terminate
	Private sub class_terminate()

	End Sub

	' REQUIRED: Plugin Manager Exports
	Public Property Get PluginCode() 		: PluginCode = PLUGIN_CODE 					: End Property
	Public Property Get PluginName() 		: PluginName = PLUGIN_NAME 					: End Property
	Public Property Get PluginVersion() 	: PluginVersion = PLUGIN_VERSION 			: End Property
	Public Property Get PluginGit() 		: PluginGit = PLUGIN_GIT 					: End Property
	Public Property Get PluginDevURL() 		: PluginDevURL = PLUGIN_DEV_URL 			: End Property
	Public Property Get PluginFolder() 		: PluginFolder = PLUGIN_FILES_ROOT 			: End Property
	Public Property Get PluginIcon() 		: PluginIcon = PLUGIN_ICON 					: End Property
	Public Property Get PluginRemovable() 	: PluginRemovable = PLUGIN_REMOVABLE 		: End Property
	Public Property Get PluginCredits() 	: PluginCredits = PLUGIN_CREDITS 			: End Property
	Public Property Get PluginRoot() 		: PluginRoot = PLUGIN_ROOT 					: End Property
	Public Property Get PluginFolderName() 	: PluginFolderName = PLUGIN_FOLDER_NAME 	: End Property
	Public Property Get PluginDBTable() 	: PluginDBTable = IIf(Len(PLUGIN_DB_NAME)>2, "tbl_plugin_"&PLUGIN_DB_NAME, "") 	: End Property
	Public Property Get PluginAutoload() 	: PluginAutoload = PLUGIN_AUTOLOAD 			: End Property

	Private Property Get This()
		This = Array(PluginCode, PluginName, PluginVersion, PluginGit, PluginDevURL, PluginFolder, PluginIcon, PluginRemovable, PluginCredits, PluginRoot, PluginFolderName, PluginDBTable, PluginAutoload)
	End Property

End Class 
%>
```
</details>

# Kullanılabilir Nitelikler (Property)
## **Genel** Nitelikler
> Oluşturulacak eklentinin RabbitCMS tarafından tanımlanması için aşağıda belirtilen genel nitelikler mutlaka bulunmalı ve değiştirilmemelidir. Bu nitelikler mevcut değişkenlerin değerlerini almak için kullanılabilir.

Bu niteliklerin tanımlanması için *Class* yapınızın altında *class_initialize()* Subroutine (Alt Program) içinde tanımlanır.

|Nitelik Çağrısı|Nitelik Değişkeni|Veri Türü|Açıklama|
|:--:|--|--|--|
|PluginCode()|PLUGIN_CODE|String|Eklentinizin RabbitCMS tarafından çağırılması için kullanılacak isimdir. Benzersiz olması önemlidir. Eklenti kodunuzun kullanılıp kullanılmadığını kontrol etmek için [RabbitCMS Hub](https://github.com/RabbitCMS-Hub/) kabul görmüş eklenti isimlerini kontrol edebilirsiniz.|
|PluginName()|PLUGIN_NAME|String|Eklentinizi tanımlayan ve eklenti listesinde görünecek olan adıdır. 40 karakterden kısa tutulması önemlidir.|
|PluginVersion()|**PLUGIN_VERSION**|String|Eklentinizin GitHub versiyonudur. GitHub üstünde geliştirdiğiniz ve Sürüm olarak çıkarttığınız paketlerde kullanılacak etiketi kontrol eder. Sürüm etiketlerinizi v1.0.1 gibi kullanımanız önemlidir. (v harfi küçük ve sonrasında 2 nokta ile ayrılmış 3 hane kullanılması önerilir.)|
|AAAAAAAA|BBBBBB|CCCCC|DDDDDD|
|AAAAAAAA|BBBBBB|CCCCC|DDDDDD|
|AAAAAAAA|BBBBBB|CCCCC|DDDDDD|
|AAAAAAAA|BBBBBB|CCCCC|DDDDDD|

### PluginGit()
**PLUGIN_GIT** = "*String*" 
> Eklentinizin genel GitHub adresidir. RabbitCMS bu adreste bulunan Sürüm'leri kontrol eder ve bir güncelleme geldiyse, ilgili sürüm dosyasını kullanarak eklentiyi günceller.

### PluginDevURL()
**PLUGIN_DEV_URL** = "*String*" 
> Eklenti geliştiricisine ait web sayfası olarak tanımlanır. Dilerseniz "mailto:" şeklinde e-posta adresi girebilirsiniz.

### PluginFolder()
**PLUGIN_CODE** = "*String*" 
> Eklentinizin ana klasörünü ifade eder. Ana klasör genel olarak GitHub uzantınız olmalıdır. https://github.com/RabbitCMS-Hub/RabbitCMS-Plugin-Template adresinde bulunacak eklentiniz

### PluginIcon()
**PLUGIN_ICON** = "*String*" 
> 

### PluginRemovable()
**PLUGIN_REMOVABLE** = "*Boolean*" 
> 

### PluginCredits()
**PLUGIN_CREDITS** = "*String*"
> 

### PluginFolderName()
**PLUGIN_FOLDER_NAME** = "*String*"
> 

### PluginDBTable()
**PLUGIN_DB_NAME** = "*String*"
> 

### PluginAutoload()
**PLUGIN_AUTOLOAD** = "*Boolean*"
> 

## Örnek Kullanım

<details>
	<summary>
		<a class="btnfire small stroke"><em class="fas fa-chevron-circle-down"></em>&nbsp;&nbsp;Örnek Kodu Göster</a> 
	</summary>

```asp
<%
Private Sub class_initialize()
	'/*
	'-----------------------------------------------------------------------------------
	' REQUIRED: PluginTemplate Main Variables
	'-----------------------------------------------------------------------------------
	'*/
	PLUGIN_CODE 			= "PLUGIN_TEMPLATE"
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
</details>


# Kullanılabilir Fonksiyonlar (Function)
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in elit eget lectus imperdiet gravida sit amet euismod magna. Sed rhoncus, dolor quis porttitor placerat, velit orci tincidunt dui, vitae maximus magna turpis sit amet est. Nunc at feugiat ipsum, vel euismod erat. Sed facilisis finibus eros nec aliquet. Ut fermentum, leo sit amet pellentesque maximus, sapien diam eleifend dui, a molestie mi est in dolor. Aenean ac rhoncus tortor. Vestibulum sed varius lectus, non fermentum magna. Sed vitae quam nibh. In ut orci mauris. Ut consequat, arcu id sagittis pretium, enim orci imperdiet velit, ac pretium eros felis pretium nunc. Fusce quis risus mi.

# Kullanılabilir Sabitler (Const)
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in elit eget lectus imperdiet gravida sit amet euismod magna. Sed rhoncus, dolor quis porttitor placerat, velit orci tincidunt dui, vitae maximus magna turpis sit amet est. Nunc at feugiat ipsum, vel euismod erat. Sed facilisis finibus eros nec aliquet. Ut fermentum, leo sit amet pellentesque maximus, sapien diam eleifend dui, a molestie mi est in dolor. Aenean ac rhoncus tortor. Vestibulum sed varius lectus, non fermentum magna. Sed vitae quam nibh. In ut orci mauris. Ut consequat, arcu id sagittis pretium, enim orci imperdiet velit, ac pretium eros felis pretium nunc. Fusce quis risus mi.

|Sabit|Veri Türü|Açıklama|
|:--:|--|--|
|TO_FILE|Boolean|QuickSettings değerinin web.config dosyasına yazılmasını sağlar.|
|TO_DB|Boolean|QuickSettings değerinin veritabanına yazılmasını sağlar.|
|PLUGIN_USER_AGENT|String|XMLHTTP isteklerinde kullanılabilecek User-Agent değerini döner.|
|ALLOWED_IMAGE_TYPE|Array|Upload için izin verilen imaj uzantılarını döner. Ör: ".jpg"|
|ALLOWED_FILE_TYPE|Array|Upload için izin verilen dosya uzantılarını döner. Ör: ".zip"|
|DOMAIN_URL|String|CMS'in çalıştığı alan adını tam döner. Ör: "https://rabbit-cms.com/" |
|:--:|--|--|
|PAYMENT_PATH|String|Ödeme Safyası için ilgili dilde tam path döner. Ör: "/tr/payments/"|
|CART_PATH|String|Ödeme Safyası için ilgili dilde tam path döner. Ör: "/tr/cart/"|
|ACCOUNT_PATH|String|Ödeme Safyası için ilgili dilde tam path döner. Ör: "/tr/accounts/"|
|PRODUCTS_PATH|String|Ödeme Safyası için ilgili dilde tam path döner. Ör: "/tr/products/"|
|PRODUCT_DETAILS_PATH|String|Ödeme Safyası için ilgili dilde tam path döner. Ör: "/tr/product-details/"|
|CONTACTUS_PATH|String|Ödeme Safyası için ilgili dilde tam path döner. Ör: "/tr/iletisim/"|
|PAGES_PATH|String|Statik Sayfalar için ilgili dilde tam path döner. Ör: "/tr/pages/..."|
|:--:|--|--|
|Cms.Unvan()|String|CMS'in sahiplik bilgisi: Ünvan bilgisi döner|
|Cms.EPosta()|String|CMS'in sahiplik bilgisi: E-Posta bilgisi döner|
|Cms.Telefon(1)|String|CMS'in sahiplik bilgisi: Telefon 1 bilgisi döner|
|Cms.Telefon(2)|String|CMS'in sahiplik bilgisi: Telefon2 bilgisi döner|
|Cms.Adres()|String|CMS'in sahiplik bilgisi: Adres bilgisi döner|
|:--:|--|--|
|CRONITOR_STATUS|Int|CronTask sisteminin aktiflik durumunu 1 veya 0 olarak döner.|


# Veri Saklama ve Çağırma (Settings)
Panel sisteminizde kullanacağınız veritabanı veri saklama ve çağırma yordamı **QuickSettings(QuickType[string], Key[string], Title[string], CustomVals[string], SaveToLocal[Const])** niteliğidir.

# Eklenti Simgesi (Icon)
http://byrushan.com/projects/super-admin/app/2.1/icons.html adresinden eklentiniz için bir simge seçebilirsiniz.

## Örnek Kullanım

<details>
	<summary>
		<a class="btnfire small stroke"><em class="fas fa-chevron-circle-down"></em>&nbsp;&nbsp;Örnek Kodu Göster</a> 
	</summary>

```asp
<%
	Response.Write QuickSettings("input", ""& PLUGIN_CODE &"_OPTION_1", "Label Etiket", "", TO_DB)
%>
```
</details>

## QuickSettings Değişkenleri
QuickSettings yordamını farklı inputlar oluşturmak için kullanabilirsiniz. Bunlar;
### QuickType [string]
|QuickType Anahtarı|Açıklama|Ek Bilgiler|
|:--:|--|--|
|color|aaaa|ek bilgileri|
|file-explorer|aaaa|ek bilgileri|
|input|aaaa|ek bilgileri|
|passwordgenerator|aaaa|ek bilgileri|
|tag|aaaa|ek bilgileri|
|inputPrice|aaaa|ek bilgileri|
|currencyList|aaaa|ek bilgileri|
|currencyListMultiple|aaaa|ek bilgileri|
|select|aaaa|ek bilgileri|
|multiselect|aaaa|ek bilgileri|
|number|aaaa|ek bilgileri|
|textarea|aaaa|ek bilgileri|
|checkbox|aaaa|ek bilgileri|
|fileajax|aaaa|ek bilgileri|
|pagelist|aaaa|ek bilgileri|
|datetime|aaaa|ek bilgileri|

### Key [string]
### Title [string]
### CustomVals [string]
### SaveToLocal [Const]


# Eklenti Paneli (Panels)
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in elit eget lectus imperdiet gravida sit amet euismod magna. Sed rhoncus, dolor quis porttitor placerat, velit orci tincidunt dui, vitae maximus magna turpis sit amet est. Nunc at feugiat ipsum, vel euismod erat. Sed facilisis finibus eros nec aliquet. Ut fermentum, leo sit amet pellentesque maximus, sapien diam eleifend dui, a molestie mi est in dolor. Aenean ac rhoncus tortor. Vestibulum sed varius lectus, non fermentum magna. Sed vitae quam nibh. In ut orci mauris. Ut consequat, arcu id sagittis pretium, enim orci imperdiet velit, ac pretium eros felis pretium nunc. Fusce quis risus mi.

# Sürüm Güncellemeleri
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in elit eget lectus imperdiet gravida sit amet euismod magna. Sed rhoncus, dolor quis porttitor placerat, velit orci tincidunt dui, vitae maximus magna turpis sit amet est. Nunc at feugiat ipsum, vel euismod erat. Sed facilisis finibus eros nec aliquet. Ut fermentum, leo sit amet pellentesque maximus, sapien diam eleifend dui, a molestie mi est in dolor. Aenean ac rhoncus tortor. Vestibulum sed varius lectus, non fermentum magna. Sed vitae quam nibh. In ut orci mauris. Ut consequat, arcu id sagittis pretium, enim orci imperdiet velit, ac pretium eros felis pretium nunc. Fusce quis risus mi.

### 01/11/2022 @1.0.0
- [x] Plugin yapısı oluşturuldu.
- [x] 
- [x] 
- [x] 
- [x] 
- [x] 
- [x] 