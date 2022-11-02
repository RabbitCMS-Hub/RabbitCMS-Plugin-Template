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
Class My_Special_Plugin
	Private PLUGIN_CODE, PLUGIN_DB_NAME, PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_CREDITS, PLUGIN_GIT, PLUGIN_DEV_URL, PLUGIN_FILES_ROOT, PLUGIN_ICON, PLUGIN_REMOVABLE, PLUGIN_ROOT, PLUGIN_FOLDER_NAME, PLUGIN_AUTOLOAD
	Public Property Get class_register()
		' EKLENTI KAYIT SINIFI
	End Property

	Public sub LoadPanel()
		' EKLENTI PANEL ALT PROGRAMI
	End Sub

	Private Sub class_initialize()
		' EKLENTI SINIF ALT PROGRAM BAŞLANGICI
	End Sub

	Private sub class_terminate()
		' EKLENTI SINIF ALT PROGRAM SON
	End Sub

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
		' EKLENTI ALT MÜLKLERİN EXPORT EDİLMESİ
	End Property
End Class 
%>
```
</details>

# Kullanılabilir Nitelikler (Property)
## **Genel** Nitelikler
Oluşturulacak eklentinin RabbitCMS tarafından tanımlanması için aşağıda belirtilen genel nitelikler mutlaka bulunmalı ve değiştirilmemelidir. Bu nitelikler mevcut değişkenlerin değerlerini almak için kullanılabilir.

Bu niteliklerin tanımlanması için *Class* yapınızın altında *class_initialize()* Subroutine (Alt Program) içinde tanımlanır.

|Nitelik Çağrısı|Nitelik Değişkeni|Veri Türü|Açıklama|
|--|--|:--:|--|
|**PluginCode()**|**PLUGIN_CODE**|String|Eklentinizin RabbitCMS tarafından çağırılması için kullanılacak isimdir. Benzersiz olması önemlidir. Eklenti kodunuzun kullanılıp kullanılmadığını kontrol etmek için [RabbitCMS Hub](https://github.com/RabbitCMS-Hub/) kabul görmüş eklenti isimlerini kontrol edebilirsiniz.|
|**PluginName()**|**PLUGIN_NAME**|String|Eklentinizi tanımlayan ve eklenti listesinde görünecek olan adıdır. 40 karakterden kısa tutulması önemlidir.|
|**PluginVersion()**|**PLUGIN_VERSION**|String|Eklentinizin GitHub versiyonudur. GitHub üstünde geliştirdiğiniz ve Sürüm olarak çıkarttığınız paketlerde kullanılacak etiketi kontrol eder. Sürüm etiketlerinizi v1.0.1 gibi kullanımanız önemlidir. (v harfi küçük ve sonrasında 2 nokta ile ayrılmış 3 hane kullanılması önerilir.)|
|**PluginGit()**|**PLUGIN_GIT**|String|Eklentinizin genel GitHub adresidir. RabbitCMS bu adreste bulunan Sürüm'leri kontrol eder ve bir güncelleme geldiyse, ilgili sürüm dosyasını kullanarak eklentiyi günceller.|
|**PluginDevURL()**|**PLUGIN_DEV_URL**|String|Eklenti geliştiricisine ait web sayfası olarak tanımlanır. Dilerseniz "mailto:" şeklinde e-posta adresi girebilirsiniz.|
|**PluginFolder()**|**PLUGIN_CODE**|String|Eklentinizin ana klasörünü ifade eder. Ana klasör genel olarak GitHub uzantınız olmalıdır. https://github.com/RabbitCMS-Hub/RabbitCMS-Plugin-Template adresinde bulunacak eklentiniz|
|**PluginIcon()**|**PLUGIN_ICON**|String|lorem ipsum dolor|
|**PluginRemovable()**|**PLUGIN_REMOVABLE**|Boolean|lorem ipsum dolor|
|**PluginCredits()**|**PLUGIN_CREDITS**|CCCCC|lorem ipsum dolor|
|**PluginFolderName()**|**PLUGIN_FOLDER_NAME**|String|lorem ipsum dolor|
|**PluginDBTable()**|**PLUGIN_DB_NAME**|String|lorem ipsum dolor|
|**PluginAutoload()**|**PLUGIN_AUTOLOAD**|Boolean|lorem ipsum dolor|

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