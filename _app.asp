<%'/*
'**********************************************
'      /\      | (_)
'     /  \   __| |_  __ _ _ __  ___
'    / /\ \ / _` | |/ _` | '_ \/ __|
'   / ____ \ (_| | | (_| | | | \__ \
'  /_/    \_\__,_| |\__,_|_| |_|___/
'               _/ | Digital Agency
'              |__/
'**********************************************
'* Project  : RabbitCMS
'* Developer: <Anthony Burak DURSUN>
'* E-Mail   : badursun@adjans.com.tr
'* Corp     : https://adjans.com.tr
'**********************************************
' LAST UPDATE: 28.10.2022 15:33 @badursun
'**********************************************
' Class Structure for RabbitCMS PluginManagers
' 	- Private and Public Variables
' 	- class_register()
' 	- LoadPanel()
' 	- class_initialize()
' 	- class_terminate()
' 	- class_register()
' 	- GET PluginCode()
' 	- GET PluginName()
' 	- GET PluginVersion()
' 	- GET PluginCredits()
' 	- GET AutoLoad()

' 	- YOUR SUB/FUNC/PROPERTY
' 	- YOUR SUB/FUNC/PROPERTY
' 	- YOUR SUB/FUNC/PROPERTY
'**********************************************
' Response.Charset = "UTF-8"
' Response.Codepage = 65001
' Response.codepage = 1254
' Response.charset = "windows-1254"
'*/
Class ClassName
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Variables
	'---------------------------------------------------------------
	'*/
	Private PLUGIN_CODE, PLUGIN_DB_NAME, PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_CREDITS, PLUGIN_GIT, PLUGIN_DEV_URL, PLUGIN_FILES_ROOT, PLUGIN_ICON, PLUGIN_REMOVABLE, PLUGIN_ROOT, PLUGIN_FOLDER_NAME, PLUGIN_AUTOLOAD
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Variables
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Register Class
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Register Class
	'---------------------------------------------------------------
	'*/
	Public Property Get class_register()
		DebugTimer ""& PLUGIN_CODE &" class_register() Start"
		'/*
		'---------------------------------------------------------------
		' Check Register
		'---------------------------------------------------------------
		'*/
		If CheckSettings("PLUGIN:"& PLUGIN_CODE &"") = True Then 
			DebugTimer ""& PLUGIN_CODE &" class_registered"
			Exit Property
		End If
		'/*
		'---------------------------------------------------------------
		' Plugin Database
		'---------------------------------------------------------------
		'*/
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
			'------------------------------
    		Call PanelLog(""& PLUGIN_CODE &" için database tablosu oluşturuldu", 0, ""& PLUGIN_CODE &"", 0)

			' Register Settings
			'------------------------------
			DebugTimer ""& PLUGIN_CODE &" class_register() End"
    	End If
		'/*
		'---------------------------------------------------------------
		' Plugin Settings
		'---------------------------------------------------------------
		'*/
		a=GetSettings("PLUGIN:"& PLUGIN_CODE &"", PLUGIN_CODE&"_")
		a=GetSettings(""&PLUGIN_CODE&"_PLUGIN_NAME", PLUGIN_NAME)
		a=GetSettings(""&PLUGIN_CODE&"_CLASS", "ClassName")
		a=GetSettings(""&PLUGIN_CODE&"_REGISTERED", ""& Now() &"")
		a=GetSettings(""&PLUGIN_CODE&"_CODENO", "0")
		a=GetSettings(""&PLUGIN_CODE&"_FOLDER", PLUGIN_FOLDER_NAME)
		'/*
		'---------------------------------------------------------------
		' Register Settings
		'---------------------------------------------------------------
		'*/
		DebugTimer ""& PLUGIN_CODE &" class_register() End"
	End Property
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Register Class End
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Settings Panel
	'---------------------------------------------------------------
	'*/
	Public sub LoadPanel()
		'/*
		'--------------------------------------------------------
		' Sub Page
		'--------------------------------------------------------
		'*/
		If Query.Data("Page") = "SHOW:CachedFiles" Then
			Call PluginPage("Header")

			Call PluginPage("Footer")
			Call SystemTeardown("destroy")
		End If
		'/*
		'--------------------------------------------------------
		' Main Page
		'--------------------------------------------------------
		'*/
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

			.Write "<div class=""row"">"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write "        <a open-iframe href=""ajax.asp?Cmd=PluginSettings&PluginName="& PLUGIN_CODE &"&Page=SHOW:CachedFiles"" class=""btn btn-sm btn-primary"">"
			.Write "        	Önbelleklenmiş Dosyaları Göster"
			.Write "        </a>"
			.Write "        <a open-iframe href=""ajax.asp?Cmd=PluginSettings&PluginName="& PLUGIN_CODE &"&Page=DELETE:CachedFiles"" class=""btn btn-sm btn-danger"">"
			.Write "        	Tüm Önbelleği Temizle"
			.Write "        </a>"
			.Write "    </div>"
			.Write "</div>"
		End With
	End Sub
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Settings Panel
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Initialize
	'---------------------------------------------------------------
	'*/
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
		'/*
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Main Variables
    	'-------------------------------------------------------------------------------------
		'*/

		'/*
		'-----------------------------------------------------------------------------------
		' REQUIRED: Register Plugin to CMS
		'-----------------------------------------------------------------------------------
		'*/
		class_register()
		'/*
		'-----------------------------------------------------------------------------------
		' REQUIRED: Hook Plugin to CMS Auto Load Location WEB|API|PANEL
		'-----------------------------------------------------------------------------------
		'*/
		If PLUGIN_AUTOLOAD_AT("WEB") = True Then 
			' Cms.BodyData = Init()
			' Cms.FooterData = "<add-footer-html>Hello World!</add-footer-html>"
		End If
	End Sub
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Initialize
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Terminate
	'---------------------------------------------------------------
	'*/
	Private sub class_terminate()

	End Sub
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Terminate
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Manager Exports
	'---------------------------------------------------------------
	'*/
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
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Manager Exports
	'---------------------------------------------------------------
	'*/
End Class 
%>