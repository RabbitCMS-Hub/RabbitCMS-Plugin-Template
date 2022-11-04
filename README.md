-----------------------------------------------------
#: RabbitCMS Plugin Template | RabbitCMS => @5.4.0 :#
-----------------------------------------------------
RabbitCMS Plugin Template

![alt text](https://repository-images.githubusercontent.com/458203468/f61be3bd-3cc5-490f-b1b2-78333b6e737c "RabbitCMS Core")

# Dökümantasyon
Bu template ile RabbitCMS için eklenti oluşturabilirsiniz. Daha detaylı döküman için [RabbitCMS Plugin Oluşturma Dökümanı](https://github.com/RabbitCMS-Hub/RabbitCMS-Plugin-Olusturma-Dokumani) inceleyebilirsiniz.


# Eklenti Sınıfı **Genel** Yapısı
Eklentiler, programlamanın temeli olan ve mantıksal düzende en iyi rutini bize sağlayan OOP (Nesne Yönelimli Programlama) şeklinde bir *Class* yapısında geliştirilir. Bu yapıda mutlaka bulunması gereken Mülkler (Property), Alt Programlar (Sub) taslak şablona belirtilmiştir. Taslak şablonun ana mülk ve alt programlarını değiştirmeden kendi eklentinizi oluşturabilirsiniz.

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

# Güncellemeler
## 01/11/2022 @1.0.0
- [x] Plugin yapısı oluşturuldu.
