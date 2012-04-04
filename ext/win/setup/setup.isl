<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<?xml-stylesheet type="text/xsl" href="is.xsl" ?>
<!DOCTYPE msi [
   <!ELEMENT msi   (summary,table*)>
   <!ATTLIST msi version    CDATA #REQUIRED>
   <!ATTLIST msi xmlns:dt   CDATA #IMPLIED
                 codepage   CDATA #IMPLIED
                 compression (MSZIP|LZX|none) "LZX">
   
   <!ELEMENT summary       (codepage?,title?,subject?,author?,keywords?,comments?,
                            template,lastauthor?,revnumber,lastprinted?,
                            createdtm?,lastsavedtm?,pagecount,wordcount,
                            charcount?,appname?,security?)>
                            
   <!ELEMENT codepage      (#PCDATA)>
   <!ELEMENT title         (#PCDATA)>
   <!ELEMENT subject       (#PCDATA)>
   <!ELEMENT author        (#PCDATA)>
   <!ELEMENT keywords      (#PCDATA)>
   <!ELEMENT comments      (#PCDATA)>
   <!ELEMENT template      (#PCDATA)>
   <!ELEMENT lastauthor    (#PCDATA)>
   <!ELEMENT revnumber     (#PCDATA)>
   <!ELEMENT lastprinted   (#PCDATA)>
   <!ELEMENT createdtm     (#PCDATA)>
   <!ELEMENT lastsavedtm   (#PCDATA)>
   <!ELEMENT pagecount     (#PCDATA)>
   <!ELEMENT wordcount     (#PCDATA)>
   <!ELEMENT charcount     (#PCDATA)>
   <!ELEMENT appname       (#PCDATA)>
   <!ELEMENT security      (#PCDATA)>                            
                                
   <!ELEMENT table         (col+,row*)>
   <!ATTLIST table
                name        CDATA #REQUIRED>

   <!ELEMENT col           (#PCDATA)>
   <!ATTLIST col
                 key       (yes|no) #IMPLIED
                 def       CDATA #IMPLIED>
                 
   <!ELEMENT row            (td+)>
   
   <!ELEMENT td             (#PCDATA)>
   <!ATTLIST td
                 href       CDATA #IMPLIED
                 dt:dt     (string|bin.base64) #IMPLIED
                 md5        CDATA #IMPLIED>
]>
<msi version="2.0" xmlns:dt="urn:schemas-microsoft-com:datatypes" codepage="65001">
	
	<summary>
		<codepage>1252</codepage>
		<title>Installation Database</title>
		<subject>Session</subject>
		<author>##ID_STRING3##</author>
		<keywords>Installer,MSI,Database</keywords>
		<comments>##ID_STRING4##</comments>
		<template>Intel;1033</template>
		<lastauthor>Administrator</lastauthor>
		<revnumber>{B4215428-5DBA-4252-80F8-9AA7778C9501}</revnumber>
		<lastprinted/>
		<createdtm>06/21/1999 14:00</createdtm>
		<lastsavedtm>07/14/2000 17:50</lastsavedtm>
		<pagecount>200</pagecount>
		<wordcount>0</wordcount>
		<charcount/>
		<appname>InstallShield Express</appname>
		<security>1</security>
	</summary>
	
	<table name="ActionText">
		<col key="yes" def="s72">Action</col>
		<col def="L64">Description</col>
		<col def="L128">Template</col>
		<row><td>Advertise</td><td>##IDS_ACTIONTEXT_Advertising##</td><td/></row>
		<row><td>AllocateRegistrySpace</td><td>##IDS_ACTIONTEXT_AllocatingRegistry##</td><td>##IDS_ACTIONTEXT_FreeSpace##</td></row>
		<row><td>AppSearch</td><td>##IDS_ACTIONTEXT_SearchInstalled##</td><td>##IDS_ACTIONTEXT_PropertySignature##</td></row>
		<row><td>BindImage</td><td>##IDS_ACTIONTEXT_BindingExes##</td><td>##IDS_ACTIONTEXT_File##</td></row>
		<row><td>CCPSearch</td><td>##IDS_ACTIONTEXT_UnregisterModules##</td><td/></row>
		<row><td>CostFinalize</td><td>##IDS_ACTIONTEXT_ComputingSpace3##</td><td/></row>
		<row><td>CostInitialize</td><td>##IDS_ACTIONTEXT_ComputingSpace##</td><td/></row>
		<row><td>CreateFolders</td><td>##IDS_ACTIONTEXT_CreatingFolders##</td><td>##IDS_ACTIONTEXT_Folder##</td></row>
		<row><td>CreateShortcuts</td><td>##IDS_ACTIONTEXT_CreatingShortcuts##</td><td>##IDS_ACTIONTEXT_Shortcut##</td></row>
		<row><td>DeleteServices</td><td>##IDS_ACTIONTEXT_DeletingServices##</td><td>##IDS_ACTIONTEXT_Service##</td></row>
		<row><td>DuplicateFiles</td><td>##IDS_ACTIONTEXT_CreatingDuplicate##</td><td>##IDS_ACTIONTEXT_FileDirectorySize##</td></row>
		<row><td>FileCost</td><td>##IDS_ACTIONTEXT_ComputingSpace2##</td><td/></row>
		<row><td>FindRelatedProducts</td><td>##IDS_ACTIONTEXT_SearchForRelated##</td><td>##IDS_ACTIONTEXT_FoundApp##</td></row>
		<row><td>GenerateScript</td><td>##IDS_ACTIONTEXT_GeneratingScript##</td><td>##IDS_ACTIONTEXT_1##</td></row>
		<row><td>ISLockPermissionsCost</td><td>##IDS_ACTIONTEXT_ISLockPermissionsCost##</td><td/></row>
		<row><td>ISLockPermissionsInstall</td><td>##IDS_ACTIONTEXT_ISLockPermissionsInstall##</td><td/></row>
		<row><td>InstallAdminPackage</td><td>##IDS_ACTIONTEXT_CopyingNetworkFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize##</td></row>
		<row><td>InstallFiles</td><td>##IDS_ACTIONTEXT_CopyingNewFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize2##</td></row>
		<row><td>InstallODBC</td><td>##IDS_ACTIONTEXT_InstallODBC##</td><td/></row>
		<row><td>InstallSFPCatalogFile</td><td>##IDS_ACTIONTEXT_InstallingSystemCatalog##</td><td>##IDS_ACTIONTEXT_FileDependencies##</td></row>
		<row><td>InstallServices</td><td>##IDS_ACTIONTEXT_InstallServices##</td><td>##IDS_ACTIONTEXT_Service2##</td></row>
		<row><td>InstallValidate</td><td>##IDS_ACTIONTEXT_Validating##</td><td/></row>
		<row><td>LaunchConditions</td><td>##IDS_ACTIONTEXT_EvaluateLaunchConditions##</td><td/></row>
		<row><td>MigrateFeatureStates</td><td>##IDS_ACTIONTEXT_MigratingFeatureStates##</td><td>##IDS_ACTIONTEXT_Application##</td></row>
		<row><td>MoveFiles</td><td>##IDS_ACTIONTEXT_MovingFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize3##</td></row>
		<row><td>PatchFiles</td><td>##IDS_ACTIONTEXT_PatchingFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize4##</td></row>
		<row><td>ProcessComponents</td><td>##IDS_ACTIONTEXT_UpdateComponentRegistration##</td><td/></row>
		<row><td>PublishComponents</td><td>##IDS_ACTIONTEXT_PublishingQualifiedComponents##</td><td>##IDS_ACTIONTEXT_ComponentIDQualifier##</td></row>
		<row><td>PublishFeatures</td><td>##IDS_ACTIONTEXT_PublishProductFeatures##</td><td>##IDS_ACTIONTEXT_FeatureColon##</td></row>
		<row><td>PublishProduct</td><td>##IDS_ACTIONTEXT_PublishProductInfo##</td><td/></row>
		<row><td>RMCCPSearch</td><td>##IDS_ACTIONTEXT_SearchingQualifyingProducts##</td><td/></row>
		<row><td>RegisterClassInfo</td><td>##IDS_ACTIONTEXT_RegisterClassServer##</td><td>##IDS_ACTIONTEXT_ClassId##</td></row>
		<row><td>RegisterComPlus</td><td>##IDS_ACTIONTEXT_RegisteringComPlus##</td><td>##IDS_ACTIONTEXT_AppIdAppTypeRSN##</td></row>
		<row><td>RegisterExtensionInfo</td><td>##IDS_ACTIONTEXT_RegisterExtensionServers##</td><td>##IDS_ACTIONTEXT_Extension2##</td></row>
		<row><td>RegisterFonts</td><td>##IDS_ACTIONTEXT_RegisterFonts##</td><td>##IDS_ACTIONTEXT_Font##</td></row>
		<row><td>RegisterMIMEInfo</td><td>##IDS_ACTIONTEXT_RegisterMimeInfo##</td><td>##IDS_ACTIONTEXT_ContentTypeExtension##</td></row>
		<row><td>RegisterProduct</td><td>##IDS_ACTIONTEXT_RegisteringProduct##</td><td>##IDS_ACTIONTEXT_1b##</td></row>
		<row><td>RegisterProgIdInfo</td><td>##IDS_ACTIONTEXT_RegisteringProgIdentifiers##</td><td>##IDS_ACTIONTEXT_ProgID2##</td></row>
		<row><td>RegisterTypeLibraries</td><td>##IDS_ACTIONTEXT_RegisterTypeLibs##</td><td>##IDS_ACTIONTEXT_LibId##</td></row>
		<row><td>RegisterUser</td><td>##IDS_ACTIONTEXT_RegUser##</td><td>##IDS_ACTIONTEXT_1c##</td></row>
		<row><td>RemoveDuplicateFiles</td><td>##IDS_ACTIONTEXT_RemovingDuplicates##</td><td>##IDS_ACTIONTEXT_FileDir##</td></row>
		<row><td>RemoveEnvironmentStrings</td><td>##IDS_ACTIONTEXT_UpdateEnvironmentStrings##</td><td>##IDS_ACTIONTEXT_NameValueAction2##</td></row>
		<row><td>RemoveExistingProducts</td><td>##IDS_ACTIONTEXT_RemoveApps##</td><td>##IDS_ACTIONTEXT_AppCommandLine##</td></row>
		<row><td>RemoveFiles</td><td>##IDS_ACTIONTEXT_RemovingFiles##</td><td>##IDS_ACTIONTEXT_FileDir2##</td></row>
		<row><td>RemoveFolders</td><td>##IDS_ACTIONTEXT_RemovingFolders##</td><td>##IDS_ACTIONTEXT_Folder1##</td></row>
		<row><td>RemoveIniValues</td><td>##IDS_ACTIONTEXT_RemovingIni##</td><td>##IDS_ACTIONTEXT_FileSectionKeyValue##</td></row>
		<row><td>RemoveODBC</td><td>##IDS_ACTIONTEXT_RemovingODBC##</td><td/></row>
		<row><td>RemoveRegistryValues</td><td>##IDS_ACTIONTEXT_RemovingRegistry##</td><td>##IDS_ACTIONTEXT_KeyName##</td></row>
		<row><td>RemoveShortcuts</td><td>##IDS_ACTIONTEXT_RemovingShortcuts##</td><td>##IDS_ACTIONTEXT_Shortcut1##</td></row>
		<row><td>Rollback</td><td>##IDS_ACTIONTEXT_RollingBack##</td><td>##IDS_ACTIONTEXT_1d##</td></row>
		<row><td>RollbackCleanup</td><td>##IDS_ACTIONTEXT_RemovingBackup##</td><td>##IDS_ACTIONTEXT_File2##</td></row>
		<row><td>SelfRegModules</td><td>##IDS_ACTIONTEXT_RegisteringModules##</td><td>##IDS_ACTIONTEXT_FileFolder##</td></row>
		<row><td>SelfUnregModules</td><td>##IDS_ACTIONTEXT_UnregisterModules##</td><td>##IDS_ACTIONTEXT_FileFolder2##</td></row>
		<row><td>SetODBCFolders</td><td>##IDS_ACTIONTEXT_InitializeODBCDirs##</td><td/></row>
		<row><td>StartServices</td><td>##IDS_ACTIONTEXT_StartingServices##</td><td>##IDS_ACTIONTEXT_Service3##</td></row>
		<row><td>StopServices</td><td>##IDS_ACTIONTEXT_StoppingServices##</td><td>##IDS_ACTIONTEXT_Service4##</td></row>
		<row><td>UnmoveFiles</td><td>##IDS_ACTIONTEXT_RemovingMoved##</td><td>##IDS_ACTIONTEXT_FileDir3##</td></row>
		<row><td>UnpublishComponents</td><td>##IDS_ACTIONTEXT_UnpublishQualified##</td><td>##IDS_ACTIONTEXT_ComponentIdQualifier2##</td></row>
		<row><td>UnpublishFeatures</td><td>##IDS_ACTIONTEXT_UnpublishProductFeatures##</td><td>##IDS_ACTIONTEXT_Feature##</td></row>
		<row><td>UnpublishProduct</td><td>##IDS_ACTIONTEXT_UnpublishingProductInfo##</td><td/></row>
		<row><td>UnregisterClassInfo</td><td>##IDS_ACTIONTEXT_UnregisterClassServers##</td><td>##IDS_ACTIONTEXT_ClsID##</td></row>
		<row><td>UnregisterComPlus</td><td>##IDS_ACTIONTEXT_UnregisteringComPlus##</td><td>##IDS_ACTIONTEXT_AppId##</td></row>
		<row><td>UnregisterExtensionInfo</td><td>##IDS_ACTIONTEXT_UnregisterExtensionServers##</td><td>##IDS_ACTIONTEXT_Extension##</td></row>
		<row><td>UnregisterFonts</td><td>##IDS_ACTIONTEXT_UnregisteringFonts##</td><td>##IDS_ACTIONTEXT_Font2##</td></row>
		<row><td>UnregisterMIMEInfo</td><td>##IDS_ACTIONTEXT_UnregisteringMimeInfo##</td><td>##IDS_ACTIONTEXT_ContentTypeExtension2##</td></row>
		<row><td>UnregisterProgIdInfo</td><td>##IDS_ACTIONTEXT_UnregisteringProgramIds##</td><td>##IDS_ACTIONTEXT_ProgID##</td></row>
		<row><td>UnregisterTypeLibraries</td><td>##IDS_ACTIONTEXT_UnregTypeLibs##</td><td>##IDS_ACTIONTEXT_Libid2##</td></row>
		<row><td>WriteEnvironmentStrings</td><td>##IDS_ACTIONTEXT_EnvironmentStrings##</td><td>##IDS_ACTIONTEXT_NameValueAction##</td></row>
		<row><td>WriteIniValues</td><td>##IDS_ACTIONTEXT_WritingINI##</td><td>##IDS_ACTIONTEXT_FileSectionKeyValue2##</td></row>
		<row><td>WriteRegistryValues</td><td>##IDS_ACTIONTEXT_WritingRegistry##</td><td>##IDS_ACTIONTEXT_KeyNameValue##</td></row>
	</table>

	<table name="AdminExecuteSequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>InstallAdminPackage</td><td/><td>3900</td><td>InstallAdminPackage</td><td/></row>
		<row><td>InstallFiles</td><td/><td>4000</td><td>InstallFiles</td><td/></row>
		<row><td>InstallFinalize</td><td/><td>6600</td><td>InstallFinalize</td><td/></row>
		<row><td>InstallInitialize</td><td/><td>1500</td><td>InstallInitialize</td><td/></row>
		<row><td>InstallValidate</td><td/><td>1400</td><td>InstallValidate</td><td/></row>
		<row><td>ScheduleReboot</td><td>ISSCHEDULEREBOOT</td><td>4010</td><td>ScheduleReboot</td><td/></row>
	</table>

	<table name="AdminUISequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>AdminWelcome</td><td/><td>1010</td><td>AdminWelcome</td><td/></row>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>ExecuteAction</td><td/><td>1300</td><td>ExecuteAction</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>SetupCompleteError</td><td/><td>-3</td><td>SetupCompleteError</td><td/></row>
		<row><td>SetupCompleteSuccess</td><td/><td>-1</td><td>SetupCompleteSuccess</td><td/></row>
		<row><td>SetupInitialization</td><td/><td>50</td><td>SetupInitialization</td><td/></row>
		<row><td>SetupInterrupted</td><td/><td>-2</td><td>SetupInterrupted</td><td/></row>
		<row><td>SetupProgress</td><td/><td>1020</td><td>SetupProgress</td><td/></row>
	</table>

	<table name="AdvtExecuteSequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>CreateShortcuts</td><td/><td>4500</td><td>CreateShortcuts</td><td/></row>
		<row><td>InstallFinalize</td><td/><td>6600</td><td>InstallFinalize</td><td/></row>
		<row><td>InstallInitialize</td><td/><td>1500</td><td>InstallInitialize</td><td/></row>
		<row><td>InstallValidate</td><td/><td>1400</td><td>InstallValidate</td><td/></row>
		<row><td>MsiPublishAssemblies</td><td/><td>6250</td><td>MsiPublishAssemblies</td><td/></row>
		<row><td>PublishComponents</td><td/><td>6200</td><td>PublishComponents</td><td/></row>
		<row><td>PublishFeatures</td><td/><td>6300</td><td>PublishFeatures</td><td/></row>
		<row><td>PublishProduct</td><td/><td>6400</td><td>PublishProduct</td><td/></row>
		<row><td>RegisterClassInfo</td><td/><td>4600</td><td>RegisterClassInfo</td><td/></row>
		<row><td>RegisterExtensionInfo</td><td/><td>4700</td><td>RegisterExtensionInfo</td><td/></row>
		<row><td>RegisterMIMEInfo</td><td/><td>4900</td><td>RegisterMIMEInfo</td><td/></row>
		<row><td>RegisterProgIdInfo</td><td/><td>4800</td><td>RegisterProgIdInfo</td><td/></row>
		<row><td>RegisterTypeLibraries</td><td/><td>4910</td><td>RegisterTypeLibraries</td><td/></row>
		<row><td>ScheduleReboot</td><td>ISSCHEDULEREBOOT</td><td>6410</td><td>ScheduleReboot</td><td/></row>
	</table>

	<table name="AdvtUISequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="AppId">
		<col key="yes" def="s38">AppId</col>
		<col def="S255">RemoteServerName</col>
		<col def="S255">LocalService</col>
		<col def="S255">ServiceParameters</col>
		<col def="S255">DllSurrogate</col>
		<col def="I2">ActivateAtStorage</col>
		<col def="I2">RunAsInteractiveUser</col>
	</table>

	<table name="AppSearch">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="s72">Signature_</col>
	</table>

	<table name="BBControl">
		<col key="yes" def="s50">Billboard_</col>
		<col key="yes" def="s50">BBControl</col>
		<col def="s50">Type</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="I4">Attributes</col>
		<col def="L50">Text</col>
	</table>

	<table name="Billboard">
		<col key="yes" def="s50">Billboard</col>
		<col def="s38">Feature_</col>
		<col def="S50">Action</col>
		<col def="I2">Ordering</col>
	</table>

	<table name="Binary">
		<col key="yes" def="s72">Name</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
		<row><td>ISExpHlp.dll</td><td/><td>&lt;ISProductFolder&gt;\redist\language independent\i386\ISExpHlp.dll</td></row>
		<row><td>ISSELFREG.DLL</td><td/><td>&lt;ISProductFolder&gt;\redist\language independent\i386\isregsvr.dll</td></row>
		<row><td>NewBinary1</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-installer-banner.bmp</td></row>
		<row><td>NewBinary10</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\CompleteSetupIco.ibd</td></row>
		<row><td>NewBinary11</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\CustomSetupIco.ibd</td></row>
		<row><td>NewBinary12</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\DestIcon.ibd</td></row>
		<row><td>NewBinary13</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\NetworkInstall.ico</td></row>
		<row><td>NewBinary14</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\DontInstall.ico</td></row>
		<row><td>NewBinary15</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\Install.ico</td></row>
		<row><td>NewBinary16</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\InstallFirstUse.ico</td></row>
		<row><td>NewBinary17</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\InstallPartial.ico</td></row>
		<row><td>NewBinary18</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\InstallStateMenu.ico</td></row>
		<row><td>NewBinary19</td><td/><td>&lt;ISProductFolder&gt;\redist\Language independent\i386\SerialNumCAHelper.dll</td></row>
		<row><td>NewBinary2</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\New.ibd</td></row>
		<row><td>NewBinary20</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-installer-banner.bmp</td></row>
		<row><td>NewBinary21</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-installer-welcome.bmp</td></row>
		<row><td>NewBinary22</td><td/><td>C:\Windows\System32\cmd.exe</td></row>
		<row><td>NewBinary3</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\Up.ibd</td></row>
		<row><td>NewBinary4</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\WarningIcon.ibd</td></row>
		<row><td>NewBinary5</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-installer-welcome.bmp</td></row>
		<row><td>NewBinary6</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\CustomSetupIco.ibd</td></row>
		<row><td>NewBinary7</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\ReinstIco.ibd</td></row>
		<row><td>NewBinary8</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\RemoveIco.ibd</td></row>
		<row><td>NewBinary9</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\SetupIcon.ibd</td></row>
		<row><td>SetAllUsers.dll</td><td/><td>&lt;ISProductFolder&gt;\redist\language independent\i386\SetAllUsers.dll</td></row>
	</table>

	<table name="BindImage">
		<col key="yes" def="s72">File_</col>
		<col def="S255">Path</col>
	</table>

	<table name="CCPSearch">
		<col key="yes" def="s72">Signature_</col>
	</table>

	<table name="CheckBox">
		<col key="yes" def="s72">Property</col>
		<col def="S64">Value</col>
		<row><td>ISCHECKFORPRODUCTUPDATES</td><td>1</td></row>
		<row><td>LAUNCHPROGRAM</td><td>1</td></row>
		<row><td>LAUNCHREADME</td><td>1</td></row>
	</table>

	<table name="Class">
		<col key="yes" def="s38">CLSID</col>
		<col key="yes" def="s32">Context</col>
		<col key="yes" def="s72">Component_</col>
		<col def="S255">ProgId_Default</col>
		<col def="L255">Description</col>
		<col def="S38">AppId_</col>
		<col def="S255">FileTypeMask</col>
		<col def="S72">Icon_</col>
		<col def="I2">IconIndex</col>
		<col def="S32">DefInprocHandler</col>
		<col def="S255">Argument</col>
		<col def="s38">Feature_</col>
		<col def="I2">Attributes</col>
	</table>

	<table name="ComboBox">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="L64">Text</col>
	</table>

	<table name="CompLocator">
		<col key="yes" def="s72">Signature_</col>
		<col def="s38">ComponentId</col>
		<col def="I2">Type</col>
	</table>

	<table name="Complus">
		<col key="yes" def="s72">Component_</col>
		<col key="yes" def="I2">ExpType</col>
	</table>

	<table name="Component">
		<col key="yes" def="s72">Component</col>
		<col def="S38">ComponentId</col>
		<col def="s72">Directory_</col>
		<col def="i2">Attributes</col>
		<col def="S255">Condition</col>
		<col def="S72">KeyPath</col>
		<col def="I4">ISAttributes</col>
		<col def="S255">ISComments</col>
		<col def="S255">ISScanAtBuildFile</col>
		<col def="S255">ISRegFileToMergeAtBuild</col>
		<col def="S0">ISDotNetInstallerArgsInstall</col>
		<col def="S0">ISDotNetInstallerArgsCommit</col>
		<col def="S0">ISDotNetInstallerArgsUninstall</col>
		<col def="S0">ISDotNetInstallerArgsRollback</col>
		<row><td>ISX_DEFAULTCOMPONENT</td><td>{04A07A85-FFAA-4280-AB8B-77EE41EBEAEE}</td><td>CRYPTRDP5</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT1</td><td>{92D009AE-82F5-4CE6-9380-78E63F07020C}</td><td>MINGW</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT10</td><td>{6386FFF6-4A41-4047-BEBE-E974AF81D75C}</td><td>SBIN</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT11</td><td>{774F3EDF-E3B4-49AF-811D-2CC9086709B7}</td><td>AWK</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT12</td><td>{84DCEE7F-C444-4211-955B-23995E971609}</td><td>SHARE</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT13</td><td>{C02F7B3D-0700-431D-8EB0-5839FFCEFFB7}</td><td>AWK1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT14</td><td>{EA2EC5F3-EB74-47F2-A7B7-D8EBAC216F93}</td><td>DOC</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT15</td><td>{5639D65E-1C47-44E5-9DA8-44C923C3B421}</td><td>MSYS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT16</td><td>{963F9467-0E0C-40CB-85D5-BE016E62D698}</td><td>MISC</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT17</td><td>{6F001A4D-E512-4F59-94DE-6F3C6C21ED52}</td><td>TEXINFO</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT18</td><td>{BAA61889-C726-4ECD-99F0-44E626B2F851}</td><td>SHARE1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT19</td><td>{33E2B7C4-5FE9-40FC-8AFF-AF17F766DAC7}</td><td>DOC1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT2</td><td>{CE28E94E-108C-49C5-8B11-C9827540BA98}</td><td>BIN</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT20</td><td>{1C5E0D19-179E-47BE-BA54-69F9BC78A0FC}</td><td>MINGW_GET1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT21</td><td>{46F3EBA6-BE93-4B80-B740-2B859C10871D}</td><td>VAR</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT22</td><td>{42646F32-1B7F-438F-833B-43D58BCF90ED}</td><td>CACHE</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT23</td><td>{EDD23957-E321-4BCF-989E-140A4AD8E976}</td><td>MINGW_GET2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT24</td><td>{1BA1F39D-1E8D-4A52-A4E7-E1487208FD7D}</td><td>DATA</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT25</td><td>{ED8F7106-5D1C-4716-BE3C-5A47696FB8A3}</td><td>_IN_TRANSIT</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT26</td><td>{D0298ED3-6394-45BA-A196-9D3D8D0CB351}</td><td>PACKAGES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT27</td><td>{0D9F2A87-F268-4780-9D52-49F2F7905055}</td><td>_IN_TRANSIT1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT28</td><td>{914087AF-3D7C-4D10-ACDD-5356D685F77E}</td><td>LIB</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT29</td><td>{63516947-7793-4AD5-859F-22B16A810A53}</td><td>MINGW_GET3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT3</td><td>{69A2A67B-85E1-4844-A8F0-0E8B3C812159}</td><td>LIBEXEC</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT30</td><td>{C23161BB-0505-439D-A4AB-29C9F82D4218}</td><td>DATA1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT31</td><td>{0BD08465-A5E1-4172-AA9A-1F4F3ACA76B4}</td><td>LOG</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT32</td><td>{3EB4311C-6266-4198-827D-FF7954D3ABD3}</td><td>NMAP</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT33</td><td>{F7B6775F-258A-42FF-AECA-C0D093B8915A}</td><td>LICENSES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT34</td><td>{DFA9CEEE-237E-496A-BA60-161AF8EBA0A0}</td><td>NSELIB</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT35</td><td>{1DC47954-F9C2-44E5-94A9-C8E2ED8C69CF}</td><td>DATA2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT36</td><td>{002E6853-D16D-4ED4-A8C3-73899172261F}</td><td>PSEXEC</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT37</td><td>{A3E0CB6A-6CDB-4F8A-9589-9473C6D6953A}</td><td>SCRIPTS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT38</td><td>{DF386F2A-8703-4B55-809B-F66565669099}</td><td>PSTOOLS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT39</td><td>{B4B374C8-6486-44EB-9849-8BBBD112056E}</td><td>PUTTY</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT4</td><td>{59AE8813-18A2-479F-8A0C-37ECA14DE5C5}</td><td>MINGW_GET</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT40</td><td>{D414649D-1056-47BB-B597-0D715391743A}</td><td>SESSION1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT41</td><td>{316A6C87-765E-4E41-BD1C-792855C151C0}</td><td>INSTALLDIR</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT5</td><td>{3EDA1979-F65D-4E9D-A8A8-6062E238F100}</td><td>MSYS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT6</td><td>{FDC88A22-461F-4042-86AF-5BEC143BA0A7}</td><td>_.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT7</td><td>{696A71E4-23CB-4740-BD66-D88BDBB3BBD2}</td><td>BIN1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT8</td><td>{9AEE94D6-241D-4043-9EF1-D45C0D5258CB}</td><td>ETC</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT9</td><td>{B80278B5-318C-43C7-BCFD-1616D431E2BD}</td><td>POSTINSTALL</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>awk.exe</td><td>{0BFB4EFF-548B-4382-AC24-966C7D255547}</td><td>BIN1</td><td>2</td><td/><td>awk.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>basename.exe</td><td>{DD468F45-8E68-43F7-986F-17E3B65DFBE9}</td><td>BIN1</td><td>2</td><td/><td>basename.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>bash.exe</td><td>{0057220D-6EC6-46F1-B57A-74B6629EB7D5}</td><td>BIN1</td><td>2</td><td/><td>bash.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>bunzip2.exe</td><td>{408E6503-7904-4F5F-B11D-26829583B761}</td><td>BIN1</td><td>2</td><td/><td>bunzip2.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>bzcat.exe</td><td>{AD7BF8A2-54A6-4E41-BCF1-8D6B828AC3BC}</td><td>BIN1</td><td>2</td><td/><td>bzcat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>bzip2.exe</td><td>{B293519A-28BC-4905-9C59-51C2738F43AD}</td><td>BIN1</td><td>2</td><td/><td>bzip2.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>bzip2recover.exe</td><td>{465A8452-48B3-48E1-8591-159B82E468CA}</td><td>BIN1</td><td>2</td><td/><td>bzip2recover.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>cat.exe</td><td>{BD236A1E-7A92-4B13-A24B-BCE392F92E8C}</td><td>BIN1</td><td>2</td><td/><td>cat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>chmod.exe</td><td>{BF6C0444-1AB6-4F40-9FC0-8B273AA78EE7}</td><td>BIN1</td><td>2</td><td/><td>chmod.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>cleanfile.exe</td><td>{656483FA-E4E3-48D0-A07B-2271CC31537F}</td><td>MINGW_GET</td><td>2</td><td/><td>cleanfile.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>cmp.exe</td><td>{3F639ADF-E3B4-42F1-8B5D-9E508305797F}</td><td>BIN1</td><td>2</td><td/><td>cmp.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>comm.exe</td><td>{93DAA10C-5669-48B6-92B4-B79416E2DC77}</td><td>BIN1</td><td>2</td><td/><td>comm.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>conv.exe</td><td>{9CAE9221-5B9B-4DDB-82E2-D447B2F0BF0F}</td><td>BIN1</td><td>2</td><td/><td>conv.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>cp.exe</td><td>{C7F897F9-3D38-41AA-9957-8F6C230A92B7}</td><td>BIN1</td><td>2</td><td/><td>cp.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>cryptRDP5.exe</td><td>{10BB9E04-6E90-45B3-A969-69D6BE29E4F4}</td><td>CRYPTRDP5</td><td>2</td><td/><td>cryptrdp5.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>cut.exe</td><td>{101E0A28-0B86-4C6D-8AB3-C9DF51443FA2}</td><td>BIN1</td><td>2</td><td/><td>cut.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>d2u.exe</td><td>{CADB6688-FE0E-4A3C-9334-E41F70A23342}</td><td>BIN1</td><td>2</td><td/><td>d2u.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>date.exe</td><td>{AC89CFF4-7C58-41A8-AB12-AE824574BC5C}</td><td>BIN1</td><td>2</td><td/><td>date.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>diff.exe</td><td>{16DF6E86-3474-4A31-A898-754C7251C9BD}</td><td>BIN1</td><td>2</td><td/><td>diff.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>diff3.exe</td><td>{ABB585E6-A466-4029-BD16-491DD9D2E868}</td><td>BIN1</td><td>2</td><td/><td>diff3.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>dirname.exe</td><td>{2B24E509-843A-4E2B-BE5B-8ACA2F5C0303}</td><td>BIN1</td><td>2</td><td/><td>dirname.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>dos2unix.exe</td><td>{FB93E513-76E4-4FEF-958C-23A483214BA0}</td><td>BIN1</td><td>2</td><td/><td>dos2unix.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>echo.exe</td><td>{912CD068-C422-46F6-9597-7AC816688446}</td><td>BIN1</td><td>2</td><td/><td>echo.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>egrep.exe</td><td>{B3E8BC27-3181-4412-8DEE-0044615F3EC7}</td><td>BIN1</td><td>2</td><td/><td>egrep.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>env.exe</td><td>{E9E144DE-274E-4064-AF2C-3224A7790622}</td><td>BIN1</td><td>2</td><td/><td>env.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>error_mode.exe</td><td>{FA2E75E1-0077-4602-AE8E-0ADE33F651A3}</td><td>BIN1</td><td>2</td><td/><td>error_mode.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>expr.exe</td><td>{2B2CC571-A875-42D4-B5D8-7F9690FD7EA7}</td><td>BIN1</td><td>2</td><td/><td>expr.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>false.exe</td><td>{637D25BB-21D1-4214-9EC0-993F520A277B}</td><td>BIN1</td><td>2</td><td/><td>false.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>fgrep.exe</td><td>{C9469DC8-47CB-4CB4-8D35-0197AC17AE0D}</td><td>BIN1</td><td>2</td><td/><td>fgrep.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>file.exe</td><td>{9E781373-B5F9-4181-BDBA-EC6EC597F2EC}</td><td>BIN1</td><td>2</td><td/><td>file.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>find.exe</td><td>{B8C29DD4-A00B-471B-B847-EBF12D007AEB}</td><td>BIN1</td><td>2</td><td/><td>find.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>fold.exe</td><td>{CF879FD6-5ABA-49C3-B86A-828EFC95164A}</td><td>BIN1</td><td>2</td><td/><td>fold.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>gawk.exe</td><td>{F482BEAB-4FAF-4700-9515-F2A6F1C72A86}</td><td>BIN1</td><td>2</td><td/><td>gawk.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>gawk_3.1.7.exe</td><td>{5462DCBF-DE94-44A2-BAAD-E40B10747E4C}</td><td>BIN1</td><td>2</td><td/><td>gawk_3.1.7.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>grcat.exe</td><td>{A8BA6090-FA9C-4228-8B67-A64C466C519C}</td><td>AWK</td><td>2</td><td/><td>grcat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>grep.exe</td><td>{9EED27A7-3763-4B9B-9A7D-7949557D994B}</td><td>BIN1</td><td>2</td><td/><td>grep.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>gui.exe</td><td>{3DB03DFD-D414-4FBD-A8CA-EC2C679CF7C6}</td><td>MINGW_GET</td><td>2</td><td/><td>gui.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>gzip.exe</td><td>{B0FAED0D-8199-49FC-BD07-3FAAED03AF06}</td><td>BIN1</td><td>2</td><td/><td>gzip.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>head.exe</td><td>{EB6D862D-B705-4289-AADE-8C3FE50FA72B}</td><td>BIN1</td><td>2</td><td/><td>head.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>id.exe</td><td>{4ACCAD93-BA8A-48EC-AAAB-2AD8D0A8ABCC}</td><td>BIN1</td><td>2</td><td/><td>id.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>info.exe</td><td>{C2C735F0-3520-409D-8B49-E2737AFC0FA8}</td><td>BIN1</td><td>2</td><td/><td>info.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>infokey.exe</td><td>{BBFA7AB6-69B8-4FCC-8531-17830737CE4C}</td><td>BIN1</td><td>2</td><td/><td>infokey.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>install.exe</td><td>{DA0791F1-84F8-4FEA-A884-4F805EAC3558}</td><td>BIN1</td><td>2</td><td/><td>install.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>install_info.exe</td><td>{4752A2C7-D244-42FF-A52C-6FB6D1D0F752}</td><td>BIN1</td><td>2</td><td/><td>install_info.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>join.exe</td><td>{D21C5809-4B7F-439F-9928-41EC259E107C}</td><td>BIN1</td><td>2</td><td/><td>join.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lastrites.exe</td><td>{C519A9AC-39C2-44E2-9EFF-B8B7B52D0AFF}</td><td>MINGW_GET</td><td>2</td><td/><td>lastrites.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>less.exe</td><td>{F2EE6A8E-D57C-46B7-BAF7-867B0F830CCD}</td><td>BIN1</td><td>2</td><td/><td>less.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lessecho.exe</td><td>{28AD12C2-77A7-4E53-94EC-2F47F7D88A08}</td><td>BIN1</td><td>2</td><td/><td>lessecho.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lesskey.exe</td><td>{8C6BF347-3823-4A13-91C4-D1FC9834DC59}</td><td>BIN1</td><td>2</td><td/><td>lesskey.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>libeay32.dll</td><td>{A39E2EAC-65AE-4244-9B27-8FB43A025CC7}</td><td>NMAP</td><td>2</td><td/><td>libeay32.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ln.exe</td><td>{7A30D9C7-1DD0-4AA1-9680-6DFA269222EF}</td><td>BIN1</td><td>2</td><td/><td>ln.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ls.exe</td><td>{735BB947-9569-4C59-B6FD-4D406EDE3038}</td><td>BIN1</td><td>2</td><td/><td>ls.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lzcat.exe</td><td>{8756BC40-0EC8-4F5D-A1F9-A12DC89A9A10}</td><td>BIN1</td><td>2</td><td/><td>lzcat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lzma.exe</td><td>{51853CF0-8002-4F29-8023-DD59F7609037}</td><td>BIN1</td><td>2</td><td/><td>lzma.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lzmadec.exe</td><td>{0B6BC492-3F5D-4C60-8444-0752D7B3D568}</td><td>BIN1</td><td>2</td><td/><td>lzmadec.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>lzmainfo.exe</td><td>{61B1E0A7-D715-45C5-AB41-53FFD9F335B9}</td><td>BIN1</td><td>2</td><td/><td>lzmainfo.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>make.exe</td><td>{82D937FA-F47F-4AC4-9F7C-B2255A5E9A5E}</td><td>BIN1</td><td>2</td><td/><td>make.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>makeinfo.exe</td><td>{8B7B364B-447D-4FDD-BB93-9729781EC1EE}</td><td>BIN1</td><td>2</td><td/><td>makeinfo.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>md5sum.exe</td><td>{C43539D5-2218-4DBF-B731-506F25250989}</td><td>BIN1</td><td>2</td><td/><td>md5sum.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>mingw_get.exe</td><td>{F00C2FE2-D2FD-4340-97A6-E83A268BA72B}</td><td>BIN</td><td>2</td><td/><td>mingw_get.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>mingw_get_0.dll</td><td>{58617EBD-AFF1-4C0A-B68C-A4DC97A7F951}</td><td>MINGW_GET</td><td>2</td><td/><td>mingw_get_0.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>mkdir.exe</td><td>{8909FD5B-8F33-4E3C-ADEE-E687C09521DE}</td><td>BIN1</td><td>2</td><td/><td>mkdir.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_1.0.dll</td><td>{11A600C6-2FFA-4B51-9914-22F083D8E795}</td><td>BIN1</td><td>2</td><td/><td>msys_1.0.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_iconv_2.dll</td><td>{42EE4BD9-86F7-4B44-9F94-08368752DAB1}</td><td>BIN1</td><td>2</td><td/><td>msys_iconv_2.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_intl_8.dll</td><td>{D875B903-54E6-4114-B2EE-804049862DA5}</td><td>BIN1</td><td>2</td><td/><td>msys_intl_8.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_lzma_5.dll</td><td>{3685B780-EAAC-4ADF-97C2-B790F28DAD6C}</td><td>BIN1</td><td>2</td><td/><td>msys_lzma_5.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_magic_1.dll</td><td>{3F54485A-50ED-40EA-84B1-8206BF9365DC}</td><td>BIN1</td><td>2</td><td/><td>msys_magic_1.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_popt_0.dll</td><td>{80202C27-01C1-41B6-B85B-0B99D75F1E6F}</td><td>BIN1</td><td>2</td><td/><td>msys_popt_0.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_regex_1.dll</td><td>{1B99C361-A10B-4CD7-9116-BA0ECD0E3349}</td><td>BIN1</td><td>2</td><td/><td>msys_regex_1.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_termcap_0.dll</td><td>{5F0A8632-62E0-4942-AB84-85098BF145FC}</td><td>BIN1</td><td>2</td><td/><td>msys_termcap_0.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msys_z.dll</td><td>{51C5B008-8BA6-43DC-9D7D-8774BBB9D067}</td><td>BIN1</td><td>2</td><td/><td>msys_z.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>msysmnt.exe</td><td>{B33516E8-1017-43E5-8B10-A81B48A2D740}</td><td>BIN1</td><td>2</td><td/><td>msysmnt.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>mv.exe</td><td>{5B1F885A-AF2C-439C-A821-300205570639}</td><td>BIN1</td><td>2</td><td/><td>mv.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ncat.exe</td><td>{BA894A38-A74D-4CEC-B4B0-C9339980827F}</td><td>NMAP</td><td>2</td><td/><td>ncat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>nmap.exe</td><td>{28299CF4-C246-4478-8DA5-9C56E09C213A}</td><td>NMAP</td><td>2</td><td/><td>nmap.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>nping.exe</td><td>{A6CDA0D5-0874-4821-860F-E547CF23F5A8}</td><td>NMAP</td><td>2</td><td/><td>nping.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>od.exe</td><td>{6F4A6BAE-19D7-4193-8F36-61B3B95DCE75}</td><td>BIN1</td><td>2</td><td/><td>od.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>oldfind.exe</td><td>{23817E3F-4942-4C01-8B73-F92734B2999B}</td><td>BIN1</td><td>2</td><td/><td>oldfind.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pageant.exe</td><td>{71F2B1E8-AF47-4CD4-AE34-637EA6D473B8}</td><td>PUTTY</td><td>2</td><td/><td>pageant.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>paste.exe</td><td>{81EC1504-C936-42D4-90F0-40059427626D}</td><td>BIN1</td><td>2</td><td/><td>paste.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pgawk.exe</td><td>{94083FAE-2937-4733-AFAF-631F4FBD7546}</td><td>BIN1</td><td>2</td><td/><td>pgawk.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pgawk_3.1.7.exe</td><td>{018517F0-71CD-4876-8DDA-E932D8A35D81}</td><td>BIN1</td><td>2</td><td/><td>pgawk_3.1.7.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pkginfo.exe</td><td>{8B35BBA5-2CDE-4EA2-AB99-83F4B510D36D}</td><td>BIN</td><td>2</td><td/><td>pkginfo.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>plink.exe</td><td>{C73E81C1-7CBC-4088-9883-F34F2ED9D0D9}</td><td>PUTTY</td><td>2</td><td/><td>plink.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>printf.exe</td><td>{81D780B3-1D81-4ED3-BB0B-CA7205A4E14F}</td><td>BIN1</td><td>2</td><td/><td>printf.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ps.exe</td><td>{D70B7E30-3C43-4EE9-A8E4-0B4CCD4AD444}</td><td>BIN1</td><td>2</td><td/><td>ps.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pscp.exe</td><td>{0A35CA9E-6410-4C58-9DA2-50571C247879}</td><td>PUTTY</td><td>2</td><td/><td>pscp.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>psexec.exe</td><td>{B7CCE8C6-114D-44A9-B3C4-AFCE08E6DBDC}</td><td>PSTOOLS</td><td>2</td><td/><td>psexec.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>psftp.exe</td><td>{F7574147-D4DB-48F5-8C15-64287C05793A}</td><td>PUTTY</td><td>2</td><td/><td>psftp.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>putty.chm</td><td>{C08D5A80-E55E-4CCB-8BA2-5527EFAA9E40}</td><td>PUTTY</td><td>2</td><td/><td>putty.chm</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>putty.exe</td><td>{12AD815D-504F-4498-9A13-FEA0E2292015}</td><td>PUTTY</td><td>2</td><td/><td>putty.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>putty.hlp</td><td>{070379A1-66DE-4D31-B526-2FECA695D0E4}</td><td>PUTTY</td><td>2</td><td/><td>putty.hlp</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>puttygen.exe</td><td>{8C00F088-E98F-457B-87C9-B246E83BC8A2}</td><td>PUTTY</td><td>2</td><td/><td>puttygen.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pwcat.exe</td><td>{2CB0CD70-774C-42A1-9B4D-27B278569BAC}</td><td>AWK</td><td>2</td><td/><td>pwcat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>pwd.exe</td><td>{33CB6D66-DEB9-4A34-B392-7109D9DAB5B3}</td><td>BIN1</td><td>2</td><td/><td>pwd.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>rm.exe</td><td>{6B385BFD-9F51-4FF8-8C53-042881AEC583}</td><td>BIN1</td><td>2</td><td/><td>rm.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>rmdir.exe</td><td>{C378D446-C773-4639-938B-9AF902291B17}</td><td>BIN1</td><td>2</td><td/><td>rmdir.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>sdiff.exe</td><td>{84A7DB1C-0FBC-47E4-A6F8-147FB1571778}</td><td>BIN1</td><td>2</td><td/><td>sdiff.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>sed.exe</td><td>{2B13A595-50A1-4EFB-8E72-3C556D7C7CA3}</td><td>BIN1</td><td>2</td><td/><td>sed.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>sh.exe</td><td>{19C86239-8D2E-4122-999F-7107EFDC2B6F}</td><td>BIN1</td><td>2</td><td/><td>sh.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>sleep.exe</td><td>{DE598DA6-9202-4366-BE63-1A02E47AF921}</td><td>BIN1</td><td>2</td><td/><td>sleep.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>sort.exe</td><td>{D1EB0DC7-37B6-409F-ABCE-8670B2573432}</td><td>BIN1</td><td>2</td><td/><td>sort.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>split.exe</td><td>{BD47EBB5-4492-4254-BFEC-776575A67A52}</td><td>BIN1</td><td>2</td><td/><td>split.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ssleay32.dll</td><td>{CCBEF3FE-2455-4941-B85A-3515E2000916}</td><td>NMAP</td><td>2</td><td/><td>ssleay32.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>stty.exe</td><td>{C4993425-0698-4EFC-90E8-32B8DFB2E359}</td><td>BIN1</td><td>2</td><td/><td>stty.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>tail.exe</td><td>{155E04F9-C0E6-46A9-A9DB-3564ECC50B62}</td><td>BIN1</td><td>2</td><td/><td>tail.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>tar.exe</td><td>{BCB51C55-817E-47C9-9522-B5270D2F8D04}</td><td>BIN1</td><td>2</td><td/><td>tar.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>tee.exe</td><td>{BF30539E-21E6-484C-874D-F2F2115F3087}</td><td>MINGW_GET</td><td>2</td><td/><td>tee.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>tee.exe1</td><td>{02EA073E-B312-49A6-9D64-87E4004AB004}</td><td>BIN1</td><td>2</td><td/><td>tee.exe1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>texindex.exe</td><td>{1F254E4C-8907-419D-9213-8CBA80D64665}</td><td>BIN1</td><td>2</td><td/><td>texindex.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>touch.exe</td><td>{40689BD3-1762-414A-A641-43149DD868C6}</td><td>BIN1</td><td>2</td><td/><td>touch.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>tr.exe</td><td>{5CFF974E-1DDF-42F7-B603-6D498230BFB1}</td><td>BIN1</td><td>2</td><td/><td>tr.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>true.exe</td><td>{60777A66-3A57-4D6B-8257-4AC795BB1793}</td><td>BIN1</td><td>2</td><td/><td>true.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>u2d.exe</td><td>{DA4EE37E-C8F7-4F0D-9F1A-9AEC24E8BF56}</td><td>BIN1</td><td>2</td><td/><td>u2d.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>uname.exe</td><td>{44FE003C-551E-46F5-B931-3B6B040DD5F9}</td><td>BIN1</td><td>2</td><td/><td>uname.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>uniq.exe</td><td>{A72DD1D1-ED2E-470A-A0F8-65CACD6F2CD3}</td><td>BIN1</td><td>2</td><td/><td>uniq.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>unix2dos.exe</td><td>{CC59CB8D-5CFD-49E1-A066-19378C371DD1}</td><td>BIN1</td><td>2</td><td/><td>unix2dos.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>unlzma.exe</td><td>{DB4DE507-2D27-43C9-AADD-527E1620E8C2}</td><td>BIN1</td><td>2</td><td/><td>unlzma.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>unxz.exe</td><td>{FF3E40DD-D6AC-416D-9C79-853F0BB4A2AB}</td><td>BIN1</td><td>2</td><td/><td>unxz.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>vc2008sp1_redist_x86.exe</td><td>{5D1AA438-4165-4CE8-85E8-7DD702600102}</td><td>NMAP</td><td>2</td><td/><td>vc2008sp1_redist_x86.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>vc2010sp1_redist_x86.exe</td><td>{6D319F3D-E4E0-4AFF-BF91-FA83C3F27D76}</td><td>NMAP</td><td>2</td><td/><td>vc2010sp1_redist_x86.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>wc.exe</td><td>{F39C5EAB-1530-4752-BD82-9CCD1BDB58E9}</td><td>BIN1</td><td>2</td><td/><td>wc.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>winpcap_nmap_4.12.exe</td><td>{2DAC960D-DE92-40A0-B59A-E66BB40E7A46}</td><td>NMAP</td><td>2</td><td/><td>winpcap_nmap_4.12.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>xargs.exe</td><td>{43C7A176-DEB8-4669-A08F-9C48D5467B3A}</td><td>BIN1</td><td>2</td><td/><td>xargs.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>xz.exe</td><td>{03DBF34F-450C-4E69-99C9-483ECBA9B491}</td><td>BIN1</td><td>2</td><td/><td>xz.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>xzcat.exe</td><td>{62D9E495-7C5E-4F10-B509-C9A237C0A224}</td><td>BIN1</td><td>2</td><td/><td>xzcat.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>xzdec.exe</td><td>{2AB27F4F-C537-4133-9E59-FF9F8FBF6B55}</td><td>BIN1</td><td>2</td><td/><td>xzdec.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
	</table>

	<table name="Condition">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="i2">Level</col>
		<col def="S255">Condition</col>
	</table>

	<table name="Control">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control</col>
		<col def="s20">Type</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="I4">Attributes</col>
		<col def="S72">Property</col>
		<col def="L0">Text</col>
		<col def="S50">Control_Next</col>
		<col def="L50">Help</col>
		<col def="I4">ISWindowStyle</col>
		<col def="I4">ISControlId</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="S72">Binary_</col>
		<row><td>AdminChangeFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>AdminChangeFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ComboText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Combo</td><td>DirectoryCombo</td><td>21</td><td>64</td><td>277</td><td>80</td><td>458755</td><td>TARGETDIR</td><td>##IDS__IsAdminInstallBrowse_4##</td><td>Up</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>ComboText</td><td>Text</td><td>21</td><td>50</td><td>99</td><td>14</td><td>3</td><td/><td>##IDS__IsAdminInstallBrowse_LookIn##</td><td>Combo</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallBrowse_BrowseDestination##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallBrowse_ChangeDestination##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>List</td><td>DirectoryList</td><td>21</td><td>90</td><td>332</td><td>97</td><td>7</td><td>TARGETDIR</td><td>##IDS__IsAdminInstallBrowse_8##</td><td>TailText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>NewFolder</td><td>PushButton</td><td>335</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>List</td><td>##IDS__IsAdminInstallBrowse_CreateFolder##</td><td>0</td><td/><td/><td>NewBinary2</td></row>
		<row><td>AdminChangeFolder</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_OK##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Tail</td><td>PathEdit</td><td>21</td><td>207</td><td>332</td><td>17</td><td>3</td><td>TARGETDIR</td><td>##IDS__IsAdminInstallBrowse_11##</td><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>TailText</td><td>Text</td><td>21</td><td>193</td><td>99</td><td>13</td><td>3</td><td/><td>##IDS__IsAdminInstallBrowse_FolderName##</td><td>Tail</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Up</td><td>PushButton</td><td>310</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>NewFolder</td><td>##IDS__IsAdminInstallBrowse_UpOneLevel##</td><td>0</td><td/><td/><td>NewBinary3</td></row>
		<row><td>AdminNetworkLocation</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>InstallNow</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>AdminNetworkLocation</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Browse</td><td>PushButton</td><td>286</td><td>124</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsAdminInstallPoint_Change##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>SetupPathEdit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallPoint_SpecifyNetworkLocation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>326</td><td>40</td><td>131075</td><td/><td>##IDS__IsAdminInstallPoint_EnterNetworkLocation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallPoint_NetworkLocationFormatted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsAdminInstallPoint_Install##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>LBBrowse</td><td>Text</td><td>21</td><td>90</td><td>100</td><td>10</td><td>3</td><td/><td>##IDS__IsAdminInstallPoint_NetworkLocation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>SetupPathEdit</td><td>PathEdit</td><td>21</td><td>102</td><td>330</td><td>17</td><td>3</td><td>TARGETDIR</td><td/><td>Browse</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>AdminWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsAdminInstallPointWelcome_Wizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsAdminInstallPointWelcome_ServerImage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CancelSetup</td><td>Icon</td><td>Icon</td><td>15</td><td>15</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary4</td></row>
		<row><td>CancelSetup</td><td>No</td><td>PushButton</td><td>135</td><td>57</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCancelDlg_No##</td><td>Yes</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CancelSetup</td><td>Text</td><td>Text</td><td>48</td><td>15</td><td>194</td><td>30</td><td>131075</td><td/><td>##IDS__IsCancelDlg_ConfirmCancel##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CancelSetup</td><td>Yes</td><td>PushButton</td><td>62</td><td>57</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCancelDlg_Yes##</td><td>No</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>CustomSetup</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Tree</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>ChangeFolder</td><td>PushButton</td><td>301</td><td>203</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_Change##</td><td>Help</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Details</td><td>PushButton</td><td>93</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_Space##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgDesc</td><td>Text</td><td>17</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsCustomSelectionDlg_SelectFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgText</td><td>Text</td><td>9</td><td>51</td><td>360</td><td>10</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_ClickFeatureIcon##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgTitle</td><td>Text</td><td>9</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsCustomSelectionDlg_CustomSetup##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>FeatureGroup</td><td>GroupBox</td><td>235</td><td>67</td><td>131</td><td>120</td><td>1</td><td/><td>##IDS__IsCustomSelectionDlg_FeatureDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Help</td><td>PushButton</td><td>22</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_Help##</td><td>Details</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>InstallLabel</td><td>Text</td><td>8</td><td>190</td><td>360</td><td>10</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_InstallTo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>ItemDescription</td><td>Text</td><td>241</td><td>80</td><td>120</td><td>50</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_MultilineDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Location</td><td>Text</td><td>8</td><td>203</td><td>291</td><td>20</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_FeaturePath##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Size</td><td>Text</td><td>241</td><td>133</td><td>120</td><td>50</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_FeatureSize##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Tree</td><td>SelectionTree</td><td>8</td><td>70</td><td>220</td><td>118</td><td>7</td><td>_BrowseProperty</td><td/><td>ChangeFolder</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>CustomSetupTips</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS_SetupTips_CustomSetupDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS_SetupTips_CustomSetup##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DontInstall</td><td>Icon</td><td>21</td><td>155</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary14</td></row>
		<row><td>CustomSetupTips</td><td>DontInstallText</td><td>Text</td><td>60</td><td>155</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_WillNotBeInstalled##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>FirstInstallText</td><td>Text</td><td>60</td><td>180</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_Advertise##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Install</td><td>Icon</td><td>21</td><td>105</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary15</td></row>
		<row><td>CustomSetupTips</td><td>InstallFirstUse</td><td>Icon</td><td>21</td><td>180</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary16</td></row>
		<row><td>CustomSetupTips</td><td>InstallPartial</td><td>Icon</td><td>21</td><td>130</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary17</td></row>
		<row><td>CustomSetupTips</td><td>InstallStateMenu</td><td>Icon</td><td>21</td><td>52</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary18</td></row>
		<row><td>CustomSetupTips</td><td>InstallStateText</td><td>Text</td><td>21</td><td>91</td><td>300</td><td>10</td><td>3</td><td/><td>##IDS_SetupTips_InstallState##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>CustomSetupTips</td><td>InstallText</td><td>Text</td><td>60</td><td>105</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_AllInstalledLocal##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>MenuText</td><td>Text</td><td>50</td><td>52</td><td>300</td><td>36</td><td>3</td><td/><td>##IDS_SetupTips_IconInstallState##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>NetworkInstall</td><td>Icon</td><td>21</td><td>205</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary13</td></row>
		<row><td>CustomSetupTips</td><td>NetworkInstallText</td><td>Text</td><td>60</td><td>205</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_Network##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>OK</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_SetupTips_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>PartialText</td><td>Text</td><td>60</td><td>130</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_SubFeaturesInstalledLocal##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>CustomerInformation</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>NameLabel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>CompanyEdit</td><td>Edit</td><td>21</td><td>100</td><td>237</td><td>17</td><td>3</td><td>COMPANYNAME</td><td>##IDS__IsRegisterUserDlg_Tahoma80##</td><td>SerialLabel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>CompanyLabel</td><td>Text</td><td>21</td><td>89</td><td>75</td><td>10</td><td>3</td><td/><td>##IDS__IsRegisterUserDlg_Organization##</td><td>CompanyEdit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsRegisterUserDlg_PleaseEnterInfo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Text</td><td>21</td><td>161</td><td>300</td><td>14</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_InstallFor##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsRegisterUserDlg_CustomerInformation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>NameEdit</td><td>Edit</td><td>21</td><td>63</td><td>237</td><td>17</td><td>3</td><td>USERNAME</td><td>##IDS__IsRegisterUserDlg_Tahoma50##</td><td>CompanyLabel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>NameLabel</td><td>Text</td><td>21</td><td>52</td><td>75</td><td>10</td><td>3</td><td/><td>##IDS__IsRegisterUserDlg_UserName##</td><td>NameEdit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>RadioButtonGroup</td><td>63</td><td>170</td><td>300</td><td>50</td><td>2</td><td>ApplicationUsers</td><td>##IDS__IsRegisterUserDlg_16##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>SerialLabel</td><td>Text</td><td>21</td><td>127</td><td>109</td><td>10</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_SerialNumber##</td><td>SerialNumber</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>SerialNumber</td><td>MaskedEdit</td><td>21</td><td>138</td><td>237</td><td>17</td><td>2</td><td>ISX_SERIALNUM</td><td/><td>RadioGroup</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>DatabaseFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ChangeFolder</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>ChangeFolder</td><td>PushButton</td><td>301</td><td>65</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CHANGE##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>DatabaseFolder</td><td>Icon</td><td>21</td><td>52</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary12</td></row>
		<row><td>DatabaseFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DatabaseFolder_ChangeFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DatabaseFolder_DatabaseFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>LocLabel</td><td>Text</td><td>57</td><td>52</td><td>290</td><td>10</td><td>131075</td><td/><td>##IDS_DatabaseFolder_InstallDatabaseTo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Location</td><td>Text</td><td>57</td><td>65</td><td>240</td><td>40</td><td>3</td><td>_BrowseProperty</td><td>##IDS__DatabaseFolder_DatabaseDir##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>DestinationFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ChangeFolder</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>ChangeFolder</td><td>PushButton</td><td>301</td><td>65</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__DestinationFolder_Change##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>DestFolder</td><td>Icon</td><td>21</td><td>52</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary12</td></row>
		<row><td>DestinationFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DestinationFolder_ChangeFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DestinationFolder_DestinationFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>LocLabel</td><td>Text</td><td>57</td><td>52</td><td>290</td><td>10</td><td>131075</td><td/><td>##IDS__DestinationFolder_InstallTo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Location</td><td>Text</td><td>57</td><td>65</td><td>240</td><td>40</td><td>3</td><td>_BrowseProperty</td><td>##IDS_INSTALLDIR##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>DiskSpaceRequirements</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgDesc</td><td>Text</td><td>17</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFeatureDetailsDlg_SpaceRequired##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgText</td><td>Text</td><td>10</td><td>185</td><td>358</td><td>41</td><td>3</td><td/><td>##IDS__IsFeatureDetailsDlg_VolumesTooSmall##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgTitle</td><td>Text</td><td>9</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFeatureDetailsDlg_DiskSpaceRequirements##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>List</td><td>VolumeCostList</td><td>8</td><td>55</td><td>358</td><td>125</td><td>393223</td><td/><td>##IDS__IsFeatureDetailsDlg_Numbers##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>OK</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFeatureDetailsDlg_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>FilesInUse</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUseMessage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>348</td><td>33</td><td>3</td><td/><td>##IDS__IsFilesInUse_ApplicationsUsingFiles##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUse##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Exit</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFilesInUse_Exit##</td><td>List</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Ignore</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFilesInUse_Ignore##</td><td>Exit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>List</td><td>ListBox</td><td>21</td><td>87</td><td>331</td><td>135</td><td>7</td><td>FileInUseProcess</td><td/><td>Retry</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Retry</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFilesInUse_Retry##</td><td>Ignore</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>InstallChangeFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ComboText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Combo</td><td>DirectoryCombo</td><td>21</td><td>64</td><td>277</td><td>80</td><td>4128779</td><td>_BrowseProperty</td><td>##IDS__IsBrowseFolderDlg_4##</td><td>Up</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>ComboText</td><td>Text</td><td>21</td><td>50</td><td>99</td><td>14</td><td>3</td><td/><td>##IDS__IsBrowseFolderDlg_LookIn##</td><td>Combo</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsBrowseFolderDlg_BrowseDestFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsBrowseFolderDlg_ChangeCurrentFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>List</td><td>DirectoryList</td><td>21</td><td>90</td><td>332</td><td>97</td><td>15</td><td>_BrowseProperty</td><td>##IDS__IsBrowseFolderDlg_8##</td><td>TailText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>NewFolder</td><td>PushButton</td><td>335</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>List</td><td>##IDS__IsBrowseFolderDlg_CreateFolder##</td><td>0</td><td/><td/><td>NewBinary2</td></row>
		<row><td>InstallChangeFolder</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsBrowseFolderDlg_OK##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Tail</td><td>PathEdit</td><td>21</td><td>207</td><td>332</td><td>17</td><td>15</td><td>_BrowseProperty</td><td>##IDS__IsBrowseFolderDlg_11##</td><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>TailText</td><td>Text</td><td>21</td><td>193</td><td>99</td><td>13</td><td>3</td><td/><td>##IDS__IsBrowseFolderDlg_FolderName##</td><td>Tail</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Up</td><td>PushButton</td><td>310</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>NewFolder</td><td>##IDS__IsBrowseFolderDlg_UpOneLevel##</td><td>0</td><td/><td/><td>NewBinary3</td></row>
		<row><td>InstallWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Copyright</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>Copyright</td><td>Text</td><td>135</td><td>144</td><td>228</td><td>73</td><td>65539</td><td/><td>##IDS__IsWelcomeDlg_WarningCopyright##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>InstallWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsWelcomeDlg_WelcomeProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsWelcomeDlg_InstallProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Agree</td><td>RadioButtonGroup</td><td>8</td><td>190</td><td>291</td><td>40</td><td>3</td><td>AgreeToLicense</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>LicenseAgreement</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ISPrintButton</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsLicenseDlg_ReadLicenseAgreement##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsLicenseDlg_LicenseAgreement##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>ISPrintButton</td><td>PushButton</td><td>301</td><td>188</td><td>65</td><td>17</td><td>3</td><td/><td>##IDS_PRINT_BUTTON##</td><td>Agree</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Memo</td><td>ScrollableText</td><td>8</td><td>55</td><td>358</td><td>130</td><td>7</td><td/><td/><td/><td/><td>0</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\gplv3.rtf</td><td/></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>MaintenanceType</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>RadioGroup</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsMaintenanceDlg_MaitenanceOptions##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsMaintenanceDlg_ProgramMaintenance##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Ico1</td><td>Icon</td><td>35</td><td>75</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary6</td></row>
		<row><td>MaintenanceType</td><td>Ico2</td><td>Icon</td><td>35</td><td>135</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary7</td></row>
		<row><td>MaintenanceType</td><td>Ico3</td><td>Icon</td><td>35</td><td>195</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary8</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>RadioGroup</td><td>RadioButtonGroup</td><td>21</td><td>55</td><td>290</td><td>170</td><td>3</td><td>_IsMaintenance</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Text1</td><td>Text</td><td>80</td><td>72</td><td>260</td><td>35</td><td>3</td><td/><td>##IDS__IsMaintenanceDlg_ChangeFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Text2</td><td>Text</td><td>80</td><td>135</td><td>260</td><td>35</td><td>3</td><td/><td>##IDS__IsMaintenanceDlg_RepairMessage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Text3</td><td>Text</td><td>80</td><td>192</td><td>260</td><td>35</td><td>131075</td><td/><td>##IDS__IsMaintenanceDlg_RemoveProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>MaintenanceWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsMaintenanceWelcome_WizardWelcome##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>50</td><td>196611</td><td/><td>##IDS__IsMaintenanceWelcome_MaintenanceOptionsDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>MsiRMFilesInUse</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Restart</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUseMessage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>348</td><td>14</td><td>3</td><td/><td>##IDS__IsMsiRMFilesInUse_ApplicationsUsingFiles##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUse##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>List</td><td>ListBox</td><td>21</td><td>66</td><td>331</td><td>130</td><td>3</td><td>FileInUseProcess</td><td/><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_OK##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Restart</td><td>RadioButtonGroup</td><td>19</td><td>187</td><td>343</td><td>40</td><td>3</td><td>RestartManagerOption</td><td/><td>List</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>OutOfSpace</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsDiskSpaceDlg_DiskSpace##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>326</td><td>43</td><td>3</td><td/><td>##IDS__IsDiskSpaceDlg_HighlightedVolumes##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsDiskSpaceDlg_OutOfDiskSpace##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>List</td><td>VolumeCostList</td><td>21</td><td>95</td><td>332</td><td>120</td><td>393223</td><td/><td>##IDS__IsDiskSpaceDlg_Numbers##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Resume</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsDiskSpaceDlg_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsPatchDlg_Update##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsPatchDlg_WelcomePatchWizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>54</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsPatchDlg_PatchClickUpdate##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1048579</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>3</td><td/><td/><td>DlgTitle</td><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>ReadmeInformation</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1048579</td><td/><td>##IDS__IsReadmeDlg_Cancel##</td><td>Readme</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>232</td><td>16</td><td>65539</td><td/><td>##IDS__IsReadmeDlg_PleaseReadInfo##</td><td>Back</td><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>3</td><td/><td/><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>193</td><td>13</td><td>65539</td><td/><td>##IDS__IsReadmeDlg_ReadMeInfo##</td><td>DlgDesc</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>1048579</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Readme</td><td>ScrollableText</td><td>10</td><td>55</td><td>353</td><td>166</td><td>3</td><td/><td/><td>Banner</td><td/><td>0</td><td/><td>&lt;ISProductFolder&gt;\Redist\0409\Readme.rtf</td><td/></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>GroupBox1</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>ReadyToInstall</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>CompanyNameText</td><td>Text</td><td>38</td><td>198</td><td>211</td><td>9</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_Company##</td><td>SerialNumberText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>CurrentSettingsText</td><td>Text</td><td>19</td><td>80</td><td>81</td><td>10</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_CurrentSettings##</td><td>InstallNow</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsVerifyReadyDlg_WizardReady##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgText1</td><td>Text</td><td>21</td><td>54</td><td>330</td><td>24</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_BackOrCancel##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgText2</td><td>Text</td><td>21</td><td>99</td><td>330</td><td>20</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_InstallFor##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsVerifyReadyDlg_ModifyReady##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgTitle2</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsVerifyReadyDlg_ReadyRepair##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgTitle3</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsVerifyReadyDlg_ReadyInstall##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>GroupBox1</td><td>Text</td><td>19</td><td>92</td><td>330</td><td>133</td><td>65541</td><td/><td/><td>SetupTypeText1</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>8388611</td><td/><td>##IDS__IsVerifyReadyDlg_Install##</td><td>InstallPerMachine</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>PushButton</td><td>63</td><td>123</td><td>248</td><td>17</td><td>8388610</td><td/><td>##IDS__IsRegisterUserDlg_Anyone##</td><td>InstallPerUser</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>PushButton</td><td>63</td><td>143</td><td>248</td><td>17</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_OnlyMe##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>SerialNumberText</td><td>Text</td><td>38</td><td>211</td><td>306</td><td>9</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_Serial##</td><td>CurrentSettingsText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText1</td><td>Text</td><td>23</td><td>97</td><td>306</td><td>13</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_SetupType##</td><td>SetupTypeText2</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText2</td><td>Text</td><td>37</td><td>114</td><td>306</td><td>14</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_SelectedSetupType##</td><td>TargetFolderText1</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText1</td><td>Text</td><td>24</td><td>136</td><td>306</td><td>11</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_DestFolder##</td><td>TargetFolderText2</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText2</td><td>Text</td><td>37</td><td>151</td><td>306</td><td>13</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_Installdir##</td><td>UserInformationText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>UserInformationText</td><td>Text</td><td>23</td><td>171</td><td>306</td><td>13</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_UserInfo##</td><td>UserNameText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>UserNameText</td><td>Text</td><td>38</td><td>184</td><td>306</td><td>9</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_UserName##</td><td>CompanyNameText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>RemoveNow</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>ReadyToRemove</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsVerifyRemoveAllDlg_ChoseRemoveProgram##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>326</td><td>24</td><td>131075</td><td/><td>##IDS__IsVerifyRemoveAllDlg_ClickRemove##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgText1</td><td>Text</td><td>21</td><td>79</td><td>330</td><td>23</td><td>3</td><td/><td>##IDS__IsVerifyRemoveAllDlg_ClickBack##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgText2</td><td>Text</td><td>21</td><td>102</td><td>330</td><td>24</td><td>3</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsVerifyRemoveAllDlg_RemoveProgram##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>8388611</td><td/><td>##IDS__IsVerifyRemoveAllDlg_Remove##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Finish</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>CheckShowMsiLog</td><td>CheckBox</td><td>151</td><td>172</td><td>10</td><td>9</td><td>2</td><td>ISSHOWMSILOG</td><td/><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFatalError_Finish##</td><td>Image</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>FinishText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsFatalError_NotModified##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>FinishText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsFatalError_ClickFinish##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td>CheckShowMsiLog</td><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>SetupCompleteError</td><td>RestContText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsFatalError_KeepOrRestore##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>RestContText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsFatalError_RestoreOrContinueLater##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>ShowMsiLogText</td><td>Text</td><td>164</td><td>172</td><td>198</td><td>10</td><td>65538</td><td/><td>##IDS__IsSetupComplete_ShowMsiLog##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>65539</td><td/><td>##IDS__IsFatalError_WizardCompleted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>25</td><td>196611</td><td/><td>##IDS__IsFatalError_WizardInterrupted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_CANCEL##</td><td>Image</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckBoxUpdates</td><td>CheckBox</td><td>135</td><td>164</td><td>10</td><td>9</td><td>2</td><td>ISCHECKFORPRODUCTUPDATES</td><td>CheckBox1</td><td>CheckShowMsiLog</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckForUpdatesText</td><td>Text</td><td>152</td><td>162</td><td>190</td><td>30</td><td>65538</td><td/><td>##IDS__IsExitDialog_Update_YesCheckForUpdates##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchProgram</td><td>CheckBox</td><td>151</td><td>114</td><td>10</td><td>9</td><td>2</td><td>LAUNCHPROGRAM</td><td/><td>CheckLaunchReadme</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchReadme</td><td>CheckBox</td><td>151</td><td>148</td><td>10</td><td>9</td><td>2</td><td>LAUNCHREADME</td><td/><td>CheckBoxUpdates</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckShowMsiLog</td><td>CheckBox</td><td>151</td><td>182</td><td>10</td><td>9</td><td>2</td><td>ISSHOWMSILOG</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td>CheckLaunchProgram</td><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchProgramText</td><td>Text</td><td>164</td><td>112</td><td>98</td><td>15</td><td>65538</td><td/><td>##IDS__IsExitDialog_LaunchProgram##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchReadmeText</td><td>Text</td><td>164</td><td>148</td><td>120</td><td>13</td><td>65538</td><td/><td>##IDS__IsExitDialog_ShowReadMe##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsExitDialog_Finish##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>ShowMsiLogText</td><td>Text</td><td>164</td><td>182</td><td>198</td><td>10</td><td>65538</td><td/><td>##IDS__IsSetupComplete_ShowMsiLog##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>65539</td><td/><td>##IDS__IsExitDialog_WizardCompleted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_InstallSuccess##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine3</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_UninstallSuccess##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine1</td><td>Text</td><td>135</td><td>30</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_Update_SetupFinished##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine2</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_Update_PossibleUpdates##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine3</td><td>Text</td><td>135</td><td>120</td><td>228</td><td>45</td><td>65538</td><td/><td>##IDS__IsExitDialog_Update_InternetConnection##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>A</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Abort##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>C</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>ErrorIcon</td><td>Icon</td><td>15</td><td>15</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary4</td></row>
		<row><td>SetupError</td><td>ErrorText</td><td>Text</td><td>50</td><td>15</td><td>200</td><td>50</td><td>131075</td><td/><td>##IDS__IsErrorDlg_ErrorText##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>I</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Ignore##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>N</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_NO##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>O</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>R</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Retry##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>Y</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Yes##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>ActionData</td><td>Text</td><td>135</td><td>125</td><td>228</td><td>12</td><td>65539</td><td/><td>##IDS__IsInitDlg_1##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>ActionText</td><td>Text</td><td>135</td><td>109</td><td>220</td><td>36</td><td>65539</td><td/><td>##IDS__IsInitDlg_2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>SetupInitialization</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_NEXT##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsInitDlg_WelcomeWizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>30</td><td>196611</td><td/><td>##IDS__IsInitDlg_PreparingWizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Finish</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_CANCEL##</td><td>Image</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>CheckShowMsiLog</td><td>CheckBox</td><td>151</td><td>172</td><td>10</td><td>9</td><td>2</td><td>ISSHOWMSILOG</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsUserExit_Finish##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>FinishText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsUserExit_NotModified##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>FinishText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsUserExit_ClickFinish##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td>CheckShowMsiLog</td><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>SetupInterrupted</td><td>RestContText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsUserExit_KeepOrRestore##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>RestContText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsUserExit_RestoreOrContinue##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>ShowMsiLogText</td><td>Text</td><td>164</td><td>172</td><td>198</td><td>10</td><td>65538</td><td/><td>##IDS__IsSetupComplete_ShowMsiLog##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>65539</td><td/><td>##IDS__IsUserExit_WizardCompleted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>25</td><td>196611</td><td/><td>##IDS__IsUserExit_WizardInterrupted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>ProgressBar</td><td>59</td><td>113</td><td>275</td><td>12</td><td>65537</td><td/><td>##IDS__IsProgressDlg_ProgressDone##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>ActionText</td><td>Text</td><td>59</td><td>100</td><td>275</td><td>12</td><td>3</td><td/><td>##IDS__IsProgressDlg_2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>SetupProgress</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsProgressDlg_UninstallingFeatures2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgDesc2</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsProgressDlg_UninstallingFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgText</td><td>Text</td><td>59</td><td>51</td><td>275</td><td>30</td><td>196610</td><td/><td>##IDS__IsProgressDlg_WaitUninstall2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgText2</td><td>Text</td><td>59</td><td>51</td><td>275</td><td>30</td><td>196610</td><td/><td>##IDS__IsProgressDlg_WaitUninstall##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>196610</td><td/><td>##IDS__IsProgressDlg_InstallingProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgTitle2</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>196610</td><td/><td>##IDS__IsProgressDlg_Uninstalling##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>LbSec</td><td>Text</td><td>192</td><td>139</td><td>32</td><td>12</td><td>2</td><td/><td>##IDS__IsProgressDlg_SecHidden##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>LbStatus</td><td>Text</td><td>59</td><td>85</td><td>70</td><td>12</td><td>3</td><td/><td>##IDS__IsProgressDlg_Status##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>SetupIcon</td><td>Icon</td><td>21</td><td>51</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary9</td></row>
		<row><td>SetupProgress</td><td>ShowTime</td><td>Text</td><td>170</td><td>139</td><td>17</td><td>12</td><td>2</td><td/><td>##IDS__IsProgressDlg_Hidden##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>TextTime</td><td>Text</td><td>59</td><td>139</td><td>110</td><td>12</td><td>2</td><td/><td>##IDS__IsProgressDlg_HiddenTimeRemaining##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>SetupResume</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>PreselectedText</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsResumeDlg_WizardResume##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>ResumeText</td><td>Text</td><td>135</td><td>46</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsResumeDlg_ResumeSuspended##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsResumeDlg_Resuming##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>SetupType</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>RadioGroup</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>CompText</td><td>Text</td><td>80</td><td>80</td><td>246</td><td>30</td><td>3</td><td/><td>##IDS__IsSetupTypeMinDlg_AllFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>CompleteIco</td><td>Icon</td><td>34</td><td>80</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary10</td></row>
		<row><td>SetupType</td><td>CustText</td><td>Text</td><td>80</td><td>171</td><td>246</td><td>30</td><td>2</td><td/><td>##IDS__IsSetupTypeMinDlg_ChooseFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>CustomIco</td><td>Icon</td><td>34</td><td>171</td><td>24</td><td>24</td><td>5242880</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary11</td></row>
		<row><td>SetupType</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsSetupTypeMinDlg_ChooseSetupType##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>DlgText</td><td>Text</td><td>22</td><td>49</td><td>326</td><td>10</td><td>3</td><td/><td>##IDS__IsSetupTypeMinDlg_SelectSetupType##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SetupType</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsSetupTypeMinDlg_SetupType##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>MinIco</td><td>Icon</td><td>34</td><td>125</td><td>24</td><td>24</td><td>5242880</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary11</td></row>
		<row><td>SetupType</td><td>MinText</td><td>Text</td><td>80</td><td>125</td><td>246</td><td>30</td><td>2</td><td/><td>##IDS__IsSetupTypeMinDlg_MinimumFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>RadioGroup</td><td>RadioButtonGroup</td><td>20</td><td>59</td><td>264</td><td>139</td><td>1048579</td><td>_IsSetupTypeMin</td><td/><td>Back</td><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SplashBitmap</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Image</td><td>Bitmap</td><td>13</td><td>12</td><td>349</td><td>211</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>SplashBitmap</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
	</table>

	<table name="ControlCondition">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">Action</col>
		<col key="yes" def="s255">Condition</col>
		<row><td>CustomSetup</td><td>ChangeFolder</td><td>Hide</td><td>Installed</td></row>
		<row><td>CustomSetup</td><td>Details</td><td>Hide</td><td>Installed</td></row>
		<row><td>CustomSetup</td><td>InstallLabel</td><td>Hide</td><td>Installed</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>NOT Privileged</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>ProductState &gt; 0</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>Version9X</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>NOT Privileged</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>ProductState &gt; 0</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>Version9X</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>CustomerInformation</td><td>SerialLabel</td><td>Show</td><td>SERIALNUMSHOW</td></row>
		<row><td>CustomerInformation</td><td>SerialNumber</td><td>Show</td><td>SERIALNUMSHOW</td></row>
		<row><td>InstallWelcome</td><td>Copyright</td><td>Hide</td><td>SHOWCOPYRIGHT="No"</td></row>
		<row><td>InstallWelcome</td><td>Copyright</td><td>Show</td><td>SHOWCOPYRIGHT="Yes"</td></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>Disable</td><td>AgreeToLicense &lt;&gt; "Yes"</td></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>Enable</td><td>AgreeToLicense = "Yes"</td></row>
		<row><td>ReadyToInstall</td><td>CompanyNameText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>CurrentSettingsText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>DlgText2</td><td>Hide</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>DlgText2</td><td>Show</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>DlgTitle</td><td>Show</td><td>ProgressType0="Modify"</td></row>
		<row><td>ReadyToInstall</td><td>DlgTitle2</td><td>Show</td><td>ProgressType0="Repair"</td></row>
		<row><td>ReadyToInstall</td><td>DlgTitle3</td><td>Show</td><td>ProgressType0="install"</td></row>
		<row><td>ReadyToInstall</td><td>GroupBox1</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>Disable</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>Enable</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>Hide</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>Show</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>Hide</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>Show</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>SerialNumberText</td><td>Hide</td><td>NOT SERIALNUMSHOW</td></row>
		<row><td>ReadyToInstall</td><td>SerialNumberText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText1</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText2</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText1</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText2</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>UserInformationText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>UserNameText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>Default</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>CheckShowMsiLog</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>Default</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText1</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText1</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText2</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText2</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText1</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText1</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText2</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText2</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>ShowMsiLogText</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckBoxUpdates</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckForUpdatesText</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchProgram</td><td>Show</td><td>SHOWLAUNCHPROGRAM="-1" And PROGRAMFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchReadme</td><td>Show</td><td>SHOWLAUNCHREADME="-1"  And READMEFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckShowMsiLog</td><td>Show</td><td>MsiLogFileLocation And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchProgramText</td><td>Show</td><td>SHOWLAUNCHPROGRAM="-1" And PROGRAMFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchReadmeText</td><td>Show</td><td>SHOWLAUNCHREADME="-1"  And READMEFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>ShowMsiLogText</td><td>Show</td><td>MsiLogFileLocation And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine2</td><td>Show</td><td>ProgressType2="installed" And ((ACTION&lt;&gt;"INSTALL") OR (NOT ISENABLEDWUSFINISHDIALOG) OR (ISENABLEDWUSFINISHDIALOG And Installed))</td></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine3</td><td>Show</td><td>ProgressType2="uninstalled" And ((ACTION&lt;&gt;"INSTALL") OR (NOT ISENABLEDWUSFINISHDIALOG) OR (ISENABLEDWUSFINISHDIALOG And Installed))</td></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine1</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine2</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine3</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>Default</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>CheckShowMsiLog</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>Default</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText1</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText1</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText2</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText2</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText1</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText1</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText2</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText2</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>ShowMsiLogText</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupProgress</td><td>DlgDesc</td><td>Show</td><td>ProgressType2="installed"</td></row>
		<row><td>SetupProgress</td><td>DlgDesc2</td><td>Show</td><td>ProgressType2="uninstalled"</td></row>
		<row><td>SetupProgress</td><td>DlgText</td><td>Show</td><td>ProgressType3="installs"</td></row>
		<row><td>SetupProgress</td><td>DlgText2</td><td>Show</td><td>ProgressType3="uninstalls"</td></row>
		<row><td>SetupProgress</td><td>DlgTitle</td><td>Show</td><td>ProgressType1="Installing"</td></row>
		<row><td>SetupProgress</td><td>DlgTitle2</td><td>Show</td><td>ProgressType1="Uninstalling"</td></row>
		<row><td>SetupResume</td><td>PreselectedText</td><td>Hide</td><td>RESUME</td></row>
		<row><td>SetupResume</td><td>PreselectedText</td><td>Show</td><td>NOT RESUME</td></row>
		<row><td>SetupResume</td><td>ResumeText</td><td>Hide</td><td>NOT RESUME</td></row>
		<row><td>SetupResume</td><td>ResumeText</td><td>Show</td><td>RESUME</td></row>
	</table>

	<table name="ControlEvent">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">Event</col>
		<col key="yes" def="s255">Argument</col>
		<col key="yes" def="S255">Condition</col>
		<col def="I2">Ordering</col>
		<row><td>AdminChangeFolder</td><td>Cancel</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>AdminChangeFolder</td><td>Cancel</td><td>Reset</td><td>0</td><td>1</td><td>1</td></row>
		<row><td>AdminChangeFolder</td><td>NewFolder</td><td>DirectoryListNew</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>AdminChangeFolder</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>0</td></row>
		<row><td>AdminChangeFolder</td><td>OK</td><td>SetTargetPath</td><td>TARGETDIR</td><td>1</td><td>1</td></row>
		<row><td>AdminChangeFolder</td><td>Up</td><td>DirectoryListUp</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>Back</td><td>NewDialog</td><td>AdminWelcome</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>Browse</td><td>SpawnDialog</td><td>AdminChangeFolder</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>3</td></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>2</td></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>SetTargetPath</td><td>TARGETDIR</td><td>1</td><td>1</td></row>
		<row><td>AdminWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>AdminWelcome</td><td>Next</td><td>NewDialog</td><td>AdminNetworkLocation</td><td>1</td><td>0</td></row>
		<row><td>CancelSetup</td><td>No</td><td>EndDialog</td><td>Return</td><td>1</td><td>0</td></row>
		<row><td>CancelSetup</td><td>Yes</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>CancelSetup</td><td>Yes</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>CustomSetup</td><td>Back</td><td>NewDialog</td><td>CustomerInformation</td><td>NOT Installed</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Back</td><td>NewDialog</td><td>MaintenanceType</td><td>Installed</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>ChangeFolder</td><td>SelectionBrowse</td><td>InstallChangeFolder</td><td>1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Details</td><td>SelectionBrowse</td><td>DiskSpaceRequirements</td><td>1</td><td>1</td></row>
		<row><td>CustomSetup</td><td>Help</td><td>SpawnDialog</td><td>CustomSetupTips</td><td>1</td><td>1</td></row>
		<row><td>CustomSetup</td><td>Next</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Next</td><td>[_IsSetupTypeMin]</td><td>Custom</td><td>1</td><td>0</td></row>
		<row><td>CustomSetupTips</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>1</td></row>
		<row><td>CustomerInformation</td><td>Back</td><td>NewDialog</td><td>LicenseAgreement</td><td>1</td><td>1</td></row>
		<row><td>CustomerInformation</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>EndDialog</td><td>Exit</td><td>(SERIALNUMVALRETRYLIMIT) And (SERIALNUMVALRETRYLIMIT&lt;0) And (SERIALNUMVALRETURN&lt;&gt;SERIALNUMVALSUCCESSRETVAL)</td><td>2</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>(Not SERIALNUMVALRETURN) OR (SERIALNUMVALRETURN=SERIALNUMVALSUCCESSRETVAL)</td><td>3</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>[ALLUSERS]</td><td>1</td><td>ApplicationUsers = "AllUsers" And Privileged</td><td>1</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>[ALLUSERS]</td><td>{}</td><td>ApplicationUsers = "OnlyCurrentUser" And Privileged</td><td>2</td></row>
		<row><td>DatabaseFolder</td><td>Back</td><td>NewDialog</td><td>CustomerInformation</td><td>1</td><td>1</td></row>
		<row><td>DatabaseFolder</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>DatabaseFolder</td><td>ChangeFolder</td><td>SpawnDialog</td><td>InstallChangeFolder</td><td>1</td><td>1</td></row>
		<row><td>DatabaseFolder</td><td>ChangeFolder</td><td>[_BrowseProperty]</td><td>DATABASEDIR</td><td>1</td><td>2</td></row>
		<row><td>DatabaseFolder</td><td>Next</td><td>NewDialog</td><td>SetupType</td><td>1</td><td>1</td></row>
		<row><td>DestinationFolder</td><td>Back</td><td>NewDialog</td><td>LicenseAgreement</td><td>NOT Installed</td><td>0</td></row>
		<row><td>DestinationFolder</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>DestinationFolder</td><td>ChangeFolder</td><td>SpawnDialog</td><td>InstallChangeFolder</td><td>1</td><td>1</td></row>
		<row><td>DestinationFolder</td><td>ChangeFolder</td><td>[_BrowseProperty]</td><td>INSTALLDIR</td><td>1</td><td>2</td></row>
		<row><td>DestinationFolder</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>1</td><td>0</td></row>
		<row><td>DiskSpaceRequirements</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>0</td></row>
		<row><td>FilesInUse</td><td>Exit</td><td>EndDialog</td><td>Exit</td><td>1</td><td>0</td></row>
		<row><td>FilesInUse</td><td>Ignore</td><td>EndDialog</td><td>Ignore</td><td>1</td><td>0</td></row>
		<row><td>FilesInUse</td><td>Retry</td><td>EndDialog</td><td>Retry</td><td>1</td><td>0</td></row>
		<row><td>InstallChangeFolder</td><td>Cancel</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>InstallChangeFolder</td><td>Cancel</td><td>Reset</td><td>0</td><td>1</td><td>1</td></row>
		<row><td>InstallChangeFolder</td><td>NewFolder</td><td>DirectoryListNew</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>InstallChangeFolder</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>3</td></row>
		<row><td>InstallChangeFolder</td><td>OK</td><td>SetTargetPath</td><td>[_BrowseProperty]</td><td>1</td><td>2</td></row>
		<row><td>InstallChangeFolder</td><td>Up</td><td>DirectoryListUp</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>InstallWelcome</td><td>Back</td><td>NewDialog</td><td>SplashBitmap</td><td>Display_IsBitmapDlg</td><td>0</td></row>
		<row><td>InstallWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>InstallWelcome</td><td>Next</td><td>NewDialog</td><td>LicenseAgreement</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>Back</td><td>NewDialog</td><td>InstallWelcome</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>ISPrintButton</td><td>DoAction</td><td>ISPrint</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>NewDialog</td><td>DestinationFolder</td><td>AgreeToLicense = "Yes"</td><td>0</td></row>
		<row><td>MaintenanceType</td><td>Back</td><td>NewDialog</td><td>MaintenanceWelcome</td><td>1</td><td>0</td></row>
		<row><td>MaintenanceType</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>NewDialog</td><td>CustomSetup</td><td>_IsMaintenance = "Change"</td><td>12</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>_IsMaintenance = "Reinstall"</td><td>13</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>NewDialog</td><td>ReadyToRemove</td><td>_IsMaintenance = "Remove"</td><td>11</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>Reinstall</td><td>ALL</td><td>_IsMaintenance = "Reinstall"</td><td>10</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>ReinstallMode</td><td>[ReinstallModeText]</td><td>_IsMaintenance = "Reinstall"</td><td>9</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType0]</td><td>Modify</td><td>_IsMaintenance = "Change"</td><td>2</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType0]</td><td>Repair</td><td>_IsMaintenance = "Reinstall"</td><td>1</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType1]</td><td>Modifying</td><td>_IsMaintenance = "Change"</td><td>3</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType1]</td><td>Repairing</td><td>_IsMaintenance = "Reinstall"</td><td>4</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType2]</td><td>modified</td><td>_IsMaintenance = "Change"</td><td>6</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType2]</td><td>repairs</td><td>_IsMaintenance = "Reinstall"</td><td>5</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType3]</td><td>modifies</td><td>_IsMaintenance = "Change"</td><td>7</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType3]</td><td>repairs</td><td>_IsMaintenance = "Reinstall"</td><td>8</td></row>
		<row><td>MaintenanceWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>MaintenanceWelcome</td><td>Next</td><td>NewDialog</td><td>MaintenanceType</td><td>1</td><td>0</td></row>
		<row><td>MsiRMFilesInUse</td><td>Cancel</td><td>EndDialog</td><td>Exit</td><td>1</td><td>1</td></row>
		<row><td>MsiRMFilesInUse</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>1</td></row>
		<row><td>MsiRMFilesInUse</td><td>OK</td><td>RMShutdownAndRestart</td><td>0</td><td>RestartManagerOption="CloseRestart"</td><td>2</td></row>
		<row><td>OutOfSpace</td><td>Resume</td><td>NewDialog</td><td>AdminNetworkLocation</td><td>ACTION = "ADMIN"</td><td>0</td></row>
		<row><td>OutOfSpace</td><td>Resume</td><td>NewDialog</td><td>DestinationFolder</td><td>ACTION &lt;&gt; "ADMIN"</td><td>0</td></row>
		<row><td>PatchWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>EndDialog</td><td>Return</td><td>1</td><td>3</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>Reinstall</td><td>ALL</td><td>PATCH And REINSTALL=""</td><td>1</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>ReinstallMode</td><td>omus</td><td>PATCH And REINSTALLMODE=""</td><td>2</td></row>
		<row><td>ReadmeInformation</td><td>Back</td><td>NewDialog</td><td>LicenseAgreement</td><td>1</td><td>1</td></row>
		<row><td>ReadmeInformation</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>ReadmeInformation</td><td>Next</td><td>NewDialog</td><td>CustomerInformation</td><td>1</td><td>1</td></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>NewDialog</td><td>CustomSetup</td><td>Installed OR _IsSetupTypeMin = "Custom"</td><td>2</td></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>NewDialog</td><td>DestinationFolder</td><td>NOT Installed</td><td>1</td></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>NewDialog</td><td>MaintenanceType</td><td>Installed AND _IsMaintenance = "Reinstall"</td><td>3</td></row>
		<row><td>ReadyToInstall</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>[ProgressType1]</td><td>Installing</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>[ProgressType2]</td><td>installed</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>[ProgressType3]</td><td>installs</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ALLUSERS]</td><td>1</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[MSIINSTALLPERUSER]</td><td>{}</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ProgressType1]</td><td>Installing</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ProgressType2]</td><td>installed</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ProgressType3]</td><td>installs</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ALLUSERS]</td><td>2</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[MSIINSTALLPERUSER]</td><td>1</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ProgressType1]</td><td>Installing</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ProgressType2]</td><td>installed</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ProgressType3]</td><td>installs</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>Back</td><td>NewDialog</td><td>MaintenanceType</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>2</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>2</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>Remove</td><td>ALL</td><td>1</td><td>1</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>[ProgressType1]</td><td>Uninstalling</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>[ProgressType2]</td><td>uninstalled</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>[ProgressType3]</td><td>uninstalls</td><td>1</td><td>0</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>[Suspend]</td><td>{}</td><td>1</td><td>1</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>[Suspend]</td><td>1</td><td>1</td><td>1</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>DoAction</td><td>ShowMsiLog</td><td>MsiLogFileLocation And (ISSHOWMSILOG="1")</td><td>3</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>LaunchProgramFileFromSetupCompleteSuccess</td><td>LAUNCHPROGRAM And PROGRAMFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed</td><td>2</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>ShowMsiLog</td><td>MsiLogFileLocation And (ISSHOWMSILOG="1") And NOT ISENABLEDWUSFINISHDIALOG</td><td>7</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>EndDialog</td><td>Exit</td><td>1</td><td>3</td></row>
		<row><td>SetupError</td><td>A</td><td>EndDialog</td><td>ErrorAbort</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>C</td><td>EndDialog</td><td>ErrorCancel</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>I</td><td>EndDialog</td><td>ErrorIgnore</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>N</td><td>EndDialog</td><td>ErrorNo</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>O</td><td>EndDialog</td><td>ErrorOk</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>R</td><td>EndDialog</td><td>ErrorRetry</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>Y</td><td>EndDialog</td><td>ErrorYes</td><td>1</td><td>0</td></row>
		<row><td>SetupInitialization</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>[Suspend]</td><td>{}</td><td>1</td><td>1</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>[Suspend]</td><td>1</td><td>1</td><td>1</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>DoAction</td><td>ShowMsiLog</td><td>MsiLogFileLocation And (ISSHOWMSILOG="1")</td><td>3</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupProgress</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupResume</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupResume</td><td>Next</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>SetupResume</td><td>Next</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>SetupType</td><td>Back</td><td>NewDialog</td><td>CustomerInformation</td><td>1</td><td>1</td></row>
		<row><td>SetupType</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>NewDialog</td><td>CustomSetup</td><td>_IsSetupTypeMin = "Custom"</td><td>2</td></row>
		<row><td>SetupType</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>_IsSetupTypeMin &lt;&gt; "Custom"</td><td>1</td></row>
		<row><td>SetupType</td><td>Next</td><td>SetInstallLevel</td><td>100</td><td>_IsSetupTypeMin="Minimal"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>SetInstallLevel</td><td>200</td><td>_IsSetupTypeMin="Typical"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>SetInstallLevel</td><td>300</td><td>_IsSetupTypeMin="Custom"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[ISRUNSETUPTYPEADDLOCALEVENT]</td><td>1</td><td>1</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[SelectedSetupType]</td><td>[DisplayNameCustom]</td><td>_IsSetupTypeMin = "Custom"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[SelectedSetupType]</td><td>[DisplayNameMinimal]</td><td>_IsSetupTypeMin = "Minimal"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[SelectedSetupType]</td><td>[DisplayNameTypical]</td><td>_IsSetupTypeMin = "Typical"</td><td>0</td></row>
		<row><td>SplashBitmap</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SplashBitmap</td><td>Next</td><td>NewDialog</td><td>InstallWelcome</td><td>1</td><td>0</td></row>
	</table>

	<table name="CreateFolder">
		<col key="yes" def="s72">Directory_</col>
		<col key="yes" def="s72">Component_</col>
		<row><td>AWK</td><td>ISX_DEFAULTCOMPONENT11</td></row>
		<row><td>BIN</td><td>ISX_DEFAULTCOMPONENT2</td></row>
		<row><td>CACHE</td><td>ISX_DEFAULTCOMPONENT22</td></row>
		<row><td>DATA</td><td>ISX_DEFAULTCOMPONENT24</td></row>
		<row><td>DOC</td><td>ISX_DEFAULTCOMPONENT14</td></row>
		<row><td>DOC1</td><td>ISX_DEFAULTCOMPONENT19</td></row>
		<row><td>INSTALLDIR</td><td>ISX_DEFAULTCOMPONENT41</td></row>
		<row><td>LIB</td><td>ISX_DEFAULTCOMPONENT28</td></row>
		<row><td>LIBEXEC</td><td>ISX_DEFAULTCOMPONENT3</td></row>
		<row><td>MINGW</td><td>ISX_DEFAULTCOMPONENT1</td></row>
		<row><td>MINGW_GET</td><td>ISX_DEFAULTCOMPONENT4</td></row>
		<row><td>MINGW_GET2</td><td>ISX_DEFAULTCOMPONENT23</td></row>
		<row><td>MINGW_GET3</td><td>ISX_DEFAULTCOMPONENT29</td></row>
		<row><td>MSYS</td><td>ISX_DEFAULTCOMPONENT5</td></row>
		<row><td>SBIN</td><td>ISX_DEFAULTCOMPONENT10</td></row>
		<row><td>SHARE</td><td>ISX_DEFAULTCOMPONENT12</td></row>
		<row><td>SHARE1</td><td>ISX_DEFAULTCOMPONENT18</td></row>
		<row><td>VAR</td><td>ISX_DEFAULTCOMPONENT21</td></row>
		<row><td>_.0</td><td>ISX_DEFAULTCOMPONENT6</td></row>
		<row><td>_IN_TRANSIT</td><td>ISX_DEFAULTCOMPONENT25</td></row>
		<row><td>_IN_TRANSIT1</td><td>ISX_DEFAULTCOMPONENT27</td></row>
	</table>

	<table name="CustomAction">
		<col key="yes" def="s72">Action</col>
		<col def="i2">Type</col>
		<col def="S64">Source</col>
		<col def="S0">Target</col>
		<col def="I4">ExtendedType</col>
		<col def="S255">ISComments</col>
		<row><td>ISPreventDowngrade</td><td>19</td><td/><td>[IS_PREVENT_DOWNGRADE_EXIT]</td><td/><td>Exits install when a newer version of this product is found</td></row>
		<row><td>ISPrint</td><td>1</td><td>SetAllUsers.dll</td><td>PrintScrollableText</td><td/><td>Prints the contents of a ScrollableText control on a dialog.</td></row>
		<row><td>ISRunSetupTypeAddLocalEvent</td><td>1</td><td>ISExpHlp.dll</td><td>RunSetupTypeAddLocalEvent</td><td/><td>Run the AddLocal events associated with the Next button on the Setup Type dialog.</td></row>
		<row><td>ISSelfRegisterCosting</td><td>1</td><td>ISSELFREG.DLL</td><td>ISSelfRegisterCosting</td><td/><td/></row>
		<row><td>ISSelfRegisterFiles</td><td>3073</td><td>ISSELFREG.DLL</td><td>ISSelfRegisterFiles</td><td/><td/></row>
		<row><td>ISSelfRegisterFinalize</td><td>1</td><td>ISSELFREG.DLL</td><td>ISSelfRegisterFinalize</td><td/><td/></row>
		<row><td>ISUnSelfRegisterFiles</td><td>3073</td><td>ISSELFREG.DLL</td><td>ISUnSelfRegisterFiles</td><td/><td/></row>
		<row><td>LaunchProgramFileFromSetupCompleteSuccess</td><td>1</td><td>NewBinary19</td><td>LaunchProgram</td><td/><td/></row>
		<row><td>SessionConfigure</td><td>3106</td><td>SystemFolder</td><td>[SystemFolder]cmd.exe /c "[INSTALLDIR]/session/session-configure.bat"</td><td/><td>Copies the main batch files to INSTALLDIR and sets the default msys bash profile.</td></row>
		<row><td>SetARPINSTALLLOCATION</td><td>51</td><td>ARPINSTALLLOCATION</td><td>[INSTALLDIR]</td><td/><td/></row>
		<row><td>SetAllUsersProfileNT</td><td>51</td><td>ALLUSERSPROFILE</td><td>[%SystemRoot]\Profiles\All Users</td><td/><td/></row>
		<row><td>ShowMsiLog</td><td>226</td><td>SystemFolder</td><td>[SystemFolder]notepad.exe "[MsiLogFileLocation]"</td><td/><td>Shows Property-driven MSI Log</td></row>
		<row><td>setAllUsersProfile2K</td><td>51</td><td>ALLUSERSPROFILE</td><td>[%ALLUSERSPROFILE]</td><td/><td/></row>
		<row><td>setUserProfileNT</td><td>51</td><td>USERPROFILE</td><td>[%USERPROFILE]</td><td/><td/></row>
	</table>

	<table name="Dialog">
		<col key="yes" def="s72">Dialog</col>
		<col def="i2">HCentering</col>
		<col def="i2">VCentering</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="I4">Attributes</col>
		<col def="L128">Title</col>
		<col def="s50">Control_First</col>
		<col def="S50">Control_Default</col>
		<col def="S50">Control_Cancel</col>
		<col def="S255">ISComments</col>
		<col def="S72">TextStyle_</col>
		<col def="I4">ISWindowStyle</col>
		<col def="I4">ISResourceId</col>
		<row><td>AdminChangeFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Tail</td><td>OK</td><td>Cancel</td><td>Install Point Browse</td><td/><td>0</td><td/></row>
		<row><td>AdminNetworkLocation</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>InstallNow</td><td>InstallNow</td><td>Cancel</td><td>Network Location</td><td/><td>0</td><td/></row>
		<row><td>AdminWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Administration Welcome</td><td/><td>0</td><td/></row>
		<row><td>CancelSetup</td><td>50</td><td>50</td><td>260</td><td>85</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>No</td><td>No</td><td>No</td><td>Cancel</td><td/><td>0</td><td/></row>
		<row><td>CustomSetup</td><td>50</td><td>50</td><td>374</td><td>266</td><td>35</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Tree</td><td>Next</td><td>Cancel</td><td>Custom Selection</td><td/><td>0</td><td/></row>
		<row><td>CustomSetupTips</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>OK</td><td>Custom Setup Tips</td><td/><td>0</td><td/></row>
		<row><td>CustomerInformation</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>NameEdit</td><td>Next</td><td>Cancel</td><td>Identification</td><td/><td>0</td><td/></row>
		<row><td>DatabaseFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Database Folder</td><td/><td>0</td><td/></row>
		<row><td>DestinationFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Destination Folder</td><td/><td>0</td><td/></row>
		<row><td>DiskSpaceRequirements</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>OK</td><td>Feature Details</td><td/><td>0</td><td/></row>
		<row><td>FilesInUse</td><td>50</td><td>50</td><td>374</td><td>266</td><td>19</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Retry</td><td>Retry</td><td>Exit</td><td>Files in Use</td><td/><td>0</td><td/></row>
		<row><td>InstallChangeFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Tail</td><td>OK</td><td>Cancel</td><td>Browse</td><td/><td>0</td><td/></row>
		<row><td>InstallWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Welcome Panel</td><td/><td>0</td><td/></row>
		<row><td>LicenseAgreement</td><td>50</td><td>50</td><td>374</td><td>266</td><td>2</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Agree</td><td>Next</td><td>Cancel</td><td>License Agreement</td><td/><td>0</td><td/></row>
		<row><td>MaintenanceType</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>RadioGroup</td><td>Next</td><td>Cancel</td><td>Change, Reinstall, Remove</td><td/><td>0</td><td/></row>
		<row><td>MaintenanceWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Maintenance Welcome</td><td/><td>0</td><td/></row>
		<row><td>MsiRMFilesInUse</td><td>50</td><td>50</td><td>374</td><td>266</td><td>19</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>Cancel</td><td>RestartManager Files in Use</td><td/><td>0</td><td/></row>
		<row><td>OutOfSpace</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Resume</td><td>Resume</td><td>Resume</td><td>Out Of Disk Space</td><td/><td>0</td><td/></row>
		<row><td>PatchWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS__IsPatchDlg_PatchWizard##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Patch Panel</td><td/><td>0</td><td/></row>
		<row><td>ReadmeInformation</td><td>50</td><td>50</td><td>374</td><td>266</td><td>7</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Readme Information</td><td/><td>0</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>50</td><td>50</td><td>374</td><td>266</td><td>35</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>InstallNow</td><td>InstallNow</td><td>Cancel</td><td>Ready to Install</td><td/><td>0</td><td/></row>
		<row><td>ReadyToRemove</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>RemoveNow</td><td>RemoveNow</td><td>Cancel</td><td>Verify Remove</td><td/><td>0</td><td/></row>
		<row><td>SetupCompleteError</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Finish</td><td>Finish</td><td>Finish</td><td>Fatal Error</td><td/><td>0</td><td/></row>
		<row><td>SetupCompleteSuccess</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>OK</td><td>Exit</td><td/><td>0</td><td/></row>
		<row><td>SetupError</td><td>50</td><td>50</td><td>270</td><td>110</td><td>65543</td><td>##IDS__IsErrorDlg_InstallerInfo##</td><td>ErrorText</td><td>O</td><td>C</td><td>Error</td><td/><td>0</td><td/></row>
		<row><td>SetupInitialization</td><td>50</td><td>50</td><td>374</td><td>266</td><td>5</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Cancel</td><td>Cancel</td><td>Cancel</td><td>Setup Initialization</td><td/><td>0</td><td/></row>
		<row><td>SetupInterrupted</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Finish</td><td>Finish</td><td>Finish</td><td>User Exit</td><td/><td>0</td><td/></row>
		<row><td>SetupProgress</td><td>50</td><td>50</td><td>374</td><td>266</td><td>5</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Cancel</td><td>Cancel</td><td>Cancel</td><td>Progress</td><td/><td>0</td><td/></row>
		<row><td>SetupResume</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Resume</td><td/><td>0</td><td/></row>
		<row><td>SetupType</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>RadioGroup</td><td>Next</td><td>Cancel</td><td>Setup Type</td><td/><td>0</td><td/></row>
		<row><td>SplashBitmap</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Welcome Bitmap</td><td/><td>0</td><td/></row>
	</table>

	<table name="Directory">
		<col key="yes" def="s72">Directory</col>
		<col def="S72">Directory_Parent</col>
		<col def="l255">DefaultDir</col>
		<col def="S255">ISDescription</col>
		<col def="I4">ISAttributes</col>
		<col def="S255">ISFolderName</col>
		<row><td>ALLUSERSPROFILE</td><td>TARGETDIR</td><td>.:ALLUSE~1|All Users</td><td/><td>0</td><td/></row>
		<row><td>AWK</td><td>SBIN</td><td>awk</td><td/><td>0</td><td/></row>
		<row><td>AWK1</td><td>SHARE</td><td>awk</td><td/><td>0</td><td/></row>
		<row><td>AdminToolsFolder</td><td>TARGETDIR</td><td>.:Admint~1|AdminTools</td><td/><td>0</td><td/></row>
		<row><td>AppDataFolder</td><td>TARGETDIR</td><td>.:APPLIC~1|Application Data</td><td/><td>0</td><td/></row>
		<row><td>BIN</td><td>MINGW</td><td>bin</td><td/><td>0</td><td/></row>
		<row><td>BIN1</td><td>_.0</td><td>bin</td><td/><td>0</td><td/></row>
		<row><td>CACHE</td><td>VAR</td><td>cache</td><td/><td>0</td><td/></row>
		<row><td>CRYPTRDP5</td><td>INSTALLDIR</td><td>CRYPTR~1|cryptrdp5</td><td/><td>0</td><td/></row>
		<row><td>CommonAppDataFolder</td><td>TARGETDIR</td><td>.:Common~1|CommonAppData</td><td/><td>0</td><td/></row>
		<row><td>CommonFilesFolder</td><td>TARGETDIR</td><td>.:Common</td><td/><td>0</td><td/></row>
		<row><td>DATA</td><td>MINGW_GET2</td><td>data</td><td/><td>0</td><td/></row>
		<row><td>DATA1</td><td>MINGW_GET3</td><td>data</td><td/><td>0</td><td/></row>
		<row><td>DATA2</td><td>NSELIB</td><td>data</td><td/><td>0</td><td/></row>
		<row><td>DATABASEDIR</td><td>ISYourDataBaseDir</td><td>.</td><td/><td>0</td><td/></row>
		<row><td>DOC</td><td>SHARE</td><td>doc</td><td/><td>0</td><td/></row>
		<row><td>DOC1</td><td>SHARE1</td><td>doc</td><td/><td>0</td><td/></row>
		<row><td>DesktopFolder</td><td>TARGETDIR</td><td>.:Desktop</td><td/><td>3</td><td/></row>
		<row><td>ETC</td><td>_.0</td><td>etc</td><td/><td>0</td><td/></row>
		<row><td>FavoritesFolder</td><td>TARGETDIR</td><td>.:FAVORI~1|Favorites</td><td/><td>0</td><td/></row>
		<row><td>FontsFolder</td><td>TARGETDIR</td><td>.:Fonts</td><td/><td>0</td><td/></row>
		<row><td>GlobalAssemblyCache</td><td>TARGETDIR</td><td>.:Global~1|GlobalAssemblyCache</td><td/><td>0</td><td/></row>
		<row><td>INSTALLDIR</td><td>RAAF_TECHNOLOGY</td><td>.</td><td/><td>0</td><td/></row>
		<row><td>ISCommonFilesFolder</td><td>CommonFilesFolder</td><td>Instal~1|InstallShield</td><td/><td>0</td><td/></row>
		<row><td>ISYourDataBaseDir</td><td>INSTALLDIR</td><td>Database</td><td/><td>0</td><td/></row>
		<row><td>LIB</td><td>VAR</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIBEXEC</td><td>MINGW</td><td>libexec</td><td/><td>0</td><td/></row>
		<row><td>LICENSES</td><td>NMAP</td><td>licenses</td><td/><td>0</td><td/></row>
		<row><td>LOG</td><td>VAR</td><td>log</td><td/><td>0</td><td/></row>
		<row><td>LocalAppDataFolder</td><td>TARGETDIR</td><td>.:LocalA~1|LocalAppData</td><td/><td>0</td><td/></row>
		<row><td>MINGW</td><td>INSTALLDIR</td><td>mingw</td><td/><td>0</td><td/></row>
		<row><td>MINGW_GET</td><td>LIBEXEC</td><td>MINGW-~1|mingw-get</td><td/><td>0</td><td/></row>
		<row><td>MINGW_GET1</td><td>DOC1</td><td>MINGW-~1|mingw-get</td><td/><td>0</td><td/></row>
		<row><td>MINGW_GET2</td><td>CACHE</td><td>MINGW-~1|mingw-get</td><td/><td>0</td><td/></row>
		<row><td>MINGW_GET3</td><td>LIB</td><td>MINGW-~1|mingw-get</td><td/><td>0</td><td/></row>
		<row><td>MISC</td><td>SHARE</td><td>misc</td><td/><td>0</td><td/></row>
		<row><td>MSYS</td><td>MINGW</td><td>msys</td><td/><td>0</td><td/></row>
		<row><td>MSYS1</td><td>DOC</td><td>MSYS</td><td/><td>0</td><td/></row>
		<row><td>MyPicturesFolder</td><td>TARGETDIR</td><td>.:MyPict~1|MyPictures</td><td/><td>0</td><td/></row>
		<row><td>NEW_DIRECTORY1</td><td>TARGETDIR</td><td>NEW_DIRECTORY1</td><td/><td>0</td><td/></row>
		<row><td>NMAP</td><td>INSTALLDIR</td><td>nmap</td><td/><td>0</td><td/></row>
		<row><td>NSELIB</td><td>NMAP</td><td>nselib</td><td/><td>0</td><td/></row>
		<row><td>NetHoodFolder</td><td>TARGETDIR</td><td>.:NetHood</td><td/><td>0</td><td/></row>
		<row><td>PACKAGES</td><td>MINGW_GET2</td><td>packages</td><td/><td>0</td><td/></row>
		<row><td>POSTINSTALL</td><td>_.0</td><td>POSTIN~1|postinstall</td><td/><td>0</td><td/></row>
		<row><td>PSEXEC</td><td>DATA2</td><td>psexec</td><td/><td>0</td><td/></row>
		<row><td>PSTOOLS</td><td>INSTALLDIR</td><td>pstools</td><td/><td>0</td><td/></row>
		<row><td>PUTTY</td><td>INSTALLDIR</td><td>putty</td><td/><td>0</td><td/></row>
		<row><td>PersonalFolder</td><td>TARGETDIR</td><td>.:Personal</td><td/><td>0</td><td/></row>
		<row><td>PrimaryVolumePath</td><td>TARGETDIR</td><td>.:Primar~1|PrimaryVolumePath</td><td/><td>0</td><td/></row>
		<row><td>PrintHoodFolder</td><td>TARGETDIR</td><td>.:PRINTH~1|PrintHood</td><td/><td>0</td><td/></row>
		<row><td>ProgramFilesFolder</td><td>TARGETDIR</td><td>.:PROGRA~1|program files</td><td/><td>0</td><td/></row>
		<row><td>ProgramMenuFolder</td><td>TARGETDIR</td><td>.:Programs</td><td/><td>3</td><td/></row>
		<row><td>RAAF_TECHNOLOGY</td><td>ProgramFilesFolder</td><td>Session</td><td/><td>0</td><td/></row>
		<row><td>RecentFolder</td><td>TARGETDIR</td><td>.:Recent</td><td/><td>0</td><td/></row>
		<row><td>SBIN</td><td>_.0</td><td>sbin</td><td/><td>0</td><td/></row>
		<row><td>SCRIPTS</td><td>NMAP</td><td>scripts</td><td/><td>0</td><td/></row>
		<row><td>SESSION1</td><td>INSTALLDIR</td><td>session</td><td/><td>0</td><td/></row>
		<row><td>SHARE</td><td>_.0</td><td>share</td><td/><td>0</td><td/></row>
		<row><td>SHARE1</td><td>MINGW</td><td>share</td><td/><td>0</td><td/></row>
		<row><td>SendToFolder</td><td>TARGETDIR</td><td>.:SendTo</td><td/><td>3</td><td/></row>
		<row><td>StartMenuFolder</td><td>TARGETDIR</td><td>.:STARTM~1|Start Menu</td><td/><td>3</td><td/></row>
		<row><td>StartupFolder</td><td>TARGETDIR</td><td>.:StartUp</td><td/><td>3</td><td/></row>
		<row><td>System16Folder</td><td>TARGETDIR</td><td>.:System</td><td/><td>0</td><td/></row>
		<row><td>SystemFolder</td><td>TARGETDIR</td><td>.:System32</td><td/><td>0</td><td/></row>
		<row><td>TARGETDIR</td><td/><td>SourceDir</td><td/><td>0</td><td/></row>
		<row><td>TEXINFO</td><td>SHARE</td><td>texinfo</td><td/><td>0</td><td/></row>
		<row><td>TempFolder</td><td>TARGETDIR</td><td>.:Temp</td><td/><td>0</td><td/></row>
		<row><td>TemplateFolder</td><td>TARGETDIR</td><td>.:ShellNew</td><td/><td>0</td><td/></row>
		<row><td>USERPROFILE</td><td>TARGETDIR</td><td>.:USERPR~1|UserProfile</td><td/><td>0</td><td/></row>
		<row><td>VAR</td><td>MINGW</td><td>var</td><td/><td>0</td><td/></row>
		<row><td>WindowsFolder</td><td>TARGETDIR</td><td>.:Windows</td><td/><td>0</td><td/></row>
		<row><td>WindowsVolume</td><td>TARGETDIR</td><td>.:WinRoot</td><td/><td>0</td><td/></row>
		<row><td>_.0</td><td>MSYS</td><td>1.0</td><td/><td>0</td><td/></row>
		<row><td>_IN_TRANSIT</td><td>DATA</td><td>_IN-TR~1|.in-transit</td><td/><td>0</td><td/></row>
		<row><td>_IN_TRANSIT1</td><td>PACKAGES</td><td>_IN-TR~1|.in-transit</td><td/><td>0</td><td/></row>
		<row><td>newfolder1</td><td>raafte_1_raaf_technology</td><td>##ID_STRING9##</td><td/><td>1</td><td/></row>
		<row><td>raafte_1_raaf_technology</td><td>ProgramMenuFolder</td><td>RAAFTE~1|RAAF Technology Session</td><td/><td>1</td><td/></row>
	</table>

	<table name="DrLocator">
		<col key="yes" def="s72">Signature_</col>
		<col key="yes" def="S72">Parent</col>
		<col key="yes" def="S255">Path</col>
		<col def="I2">Depth</col>
	</table>

	<table name="DuplicateFile">
		<col key="yes" def="s72">FileKey</col>
		<col def="s72">Component_</col>
		<col def="s72">File_</col>
		<col def="L255">DestName</col>
		<col def="S72">DestFolder</col>
	</table>

	<table name="Environment">
		<col key="yes" def="s72">Environment</col>
		<col def="l255">Name</col>
		<col def="L255">Value</col>
		<col def="s72">Component_</col>
		<row><td>NewEnvironment1</td><td>##ID_STRING119##</td><td>##ID_STRING120##</td><td>ISX_DEFAULTCOMPONENT41</td></row>
	</table>

	<table name="Error">
		<col key="yes" def="i2">Error</col>
		<col def="L255">Message</col>
		<row><td>0</td><td>##IDS_ERROR_0##</td></row>
		<row><td>1</td><td>##IDS_ERROR_1##</td></row>
		<row><td>10</td><td>##IDS_ERROR_8##</td></row>
		<row><td>11</td><td>##IDS_ERROR_9##</td></row>
		<row><td>1101</td><td>##IDS_ERROR_22##</td></row>
		<row><td>12</td><td>##IDS_ERROR_10##</td></row>
		<row><td>13</td><td>##IDS_ERROR_11##</td></row>
		<row><td>1301</td><td>##IDS_ERROR_23##</td></row>
		<row><td>1302</td><td>##IDS_ERROR_24##</td></row>
		<row><td>1303</td><td>##IDS_ERROR_25##</td></row>
		<row><td>1304</td><td>##IDS_ERROR_26##</td></row>
		<row><td>1305</td><td>##IDS_ERROR_27##</td></row>
		<row><td>1306</td><td>##IDS_ERROR_28##</td></row>
		<row><td>1307</td><td>##IDS_ERROR_29##</td></row>
		<row><td>1308</td><td>##IDS_ERROR_30##</td></row>
		<row><td>1309</td><td>##IDS_ERROR_31##</td></row>
		<row><td>1310</td><td>##IDS_ERROR_32##</td></row>
		<row><td>1311</td><td>##IDS_ERROR_33##</td></row>
		<row><td>1312</td><td>##IDS_ERROR_34##</td></row>
		<row><td>1313</td><td>##IDS_ERROR_35##</td></row>
		<row><td>1314</td><td>##IDS_ERROR_36##</td></row>
		<row><td>1315</td><td>##IDS_ERROR_37##</td></row>
		<row><td>1316</td><td>##IDS_ERROR_38##</td></row>
		<row><td>1317</td><td>##IDS_ERROR_39##</td></row>
		<row><td>1318</td><td>##IDS_ERROR_40##</td></row>
		<row><td>1319</td><td>##IDS_ERROR_41##</td></row>
		<row><td>1320</td><td>##IDS_ERROR_42##</td></row>
		<row><td>1321</td><td>##IDS_ERROR_43##</td></row>
		<row><td>1322</td><td>##IDS_ERROR_44##</td></row>
		<row><td>1323</td><td>##IDS_ERROR_45##</td></row>
		<row><td>1324</td><td>##IDS_ERROR_46##</td></row>
		<row><td>1325</td><td>##IDS_ERROR_47##</td></row>
		<row><td>1326</td><td>##IDS_ERROR_48##</td></row>
		<row><td>1327</td><td>##IDS_ERROR_49##</td></row>
		<row><td>1328</td><td>##IDS_ERROR_122##</td></row>
		<row><td>1329</td><td>##IDS_ERROR_1329##</td></row>
		<row><td>1330</td><td>##IDS_ERROR_1330##</td></row>
		<row><td>1331</td><td>##IDS_ERROR_1331##</td></row>
		<row><td>1332</td><td>##IDS_ERROR_1332##</td></row>
		<row><td>1333</td><td>##IDS_ERROR_1333##</td></row>
		<row><td>1334</td><td>##IDS_ERROR_1334##</td></row>
		<row><td>1335</td><td>##IDS_ERROR_1335##</td></row>
		<row><td>1336</td><td>##IDS_ERROR_1336##</td></row>
		<row><td>14</td><td>##IDS_ERROR_12##</td></row>
		<row><td>1401</td><td>##IDS_ERROR_50##</td></row>
		<row><td>1402</td><td>##IDS_ERROR_51##</td></row>
		<row><td>1403</td><td>##IDS_ERROR_52##</td></row>
		<row><td>1404</td><td>##IDS_ERROR_53##</td></row>
		<row><td>1405</td><td>##IDS_ERROR_54##</td></row>
		<row><td>1406</td><td>##IDS_ERROR_55##</td></row>
		<row><td>1407</td><td>##IDS_ERROR_56##</td></row>
		<row><td>1408</td><td>##IDS_ERROR_57##</td></row>
		<row><td>1409</td><td>##IDS_ERROR_58##</td></row>
		<row><td>1410</td><td>##IDS_ERROR_59##</td></row>
		<row><td>15</td><td>##IDS_ERROR_13##</td></row>
		<row><td>1500</td><td>##IDS_ERROR_60##</td></row>
		<row><td>1501</td><td>##IDS_ERROR_61##</td></row>
		<row><td>1502</td><td>##IDS_ERROR_62##</td></row>
		<row><td>1503</td><td>##IDS_ERROR_63##</td></row>
		<row><td>16</td><td>##IDS_ERROR_14##</td></row>
		<row><td>1601</td><td>##IDS_ERROR_64##</td></row>
		<row><td>1602</td><td>##IDS_ERROR_65##</td></row>
		<row><td>1603</td><td>##IDS_ERROR_66##</td></row>
		<row><td>1604</td><td>##IDS_ERROR_67##</td></row>
		<row><td>1605</td><td>##IDS_ERROR_68##</td></row>
		<row><td>1606</td><td>##IDS_ERROR_69##</td></row>
		<row><td>1607</td><td>##IDS_ERROR_70##</td></row>
		<row><td>1608</td><td>##IDS_ERROR_71##</td></row>
		<row><td>1609</td><td>##IDS_ERROR_1609##</td></row>
		<row><td>1651</td><td>##IDS_ERROR_1651##</td></row>
		<row><td>17</td><td>##IDS_ERROR_15##</td></row>
		<row><td>1701</td><td>##IDS_ERROR_72##</td></row>
		<row><td>1702</td><td>##IDS_ERROR_73##</td></row>
		<row><td>1703</td><td>##IDS_ERROR_74##</td></row>
		<row><td>1704</td><td>##IDS_ERROR_75##</td></row>
		<row><td>1705</td><td>##IDS_ERROR_76##</td></row>
		<row><td>1706</td><td>##IDS_ERROR_77##</td></row>
		<row><td>1707</td><td>##IDS_ERROR_78##</td></row>
		<row><td>1708</td><td>##IDS_ERROR_79##</td></row>
		<row><td>1709</td><td>##IDS_ERROR_80##</td></row>
		<row><td>1710</td><td>##IDS_ERROR_81##</td></row>
		<row><td>1711</td><td>##IDS_ERROR_82##</td></row>
		<row><td>1712</td><td>##IDS_ERROR_83##</td></row>
		<row><td>1713</td><td>##IDS_ERROR_123##</td></row>
		<row><td>1714</td><td>##IDS_ERROR_124##</td></row>
		<row><td>1715</td><td>##IDS_ERROR_1715##</td></row>
		<row><td>1716</td><td>##IDS_ERROR_1716##</td></row>
		<row><td>1717</td><td>##IDS_ERROR_1717##</td></row>
		<row><td>1718</td><td>##IDS_ERROR_1718##</td></row>
		<row><td>1719</td><td>##IDS_ERROR_1719##</td></row>
		<row><td>1720</td><td>##IDS_ERROR_1720##</td></row>
		<row><td>1721</td><td>##IDS_ERROR_1721##</td></row>
		<row><td>1722</td><td>##IDS_ERROR_1722##</td></row>
		<row><td>1723</td><td>##IDS_ERROR_1723##</td></row>
		<row><td>1724</td><td>##IDS_ERROR_1724##</td></row>
		<row><td>1725</td><td>##IDS_ERROR_1725##</td></row>
		<row><td>1726</td><td>##IDS_ERROR_1726##</td></row>
		<row><td>1727</td><td>##IDS_ERROR_1727##</td></row>
		<row><td>1728</td><td>##IDS_ERROR_1728##</td></row>
		<row><td>1729</td><td>##IDS_ERROR_1729##</td></row>
		<row><td>1730</td><td>##IDS_ERROR_1730##</td></row>
		<row><td>1731</td><td>##IDS_ERROR_1731##</td></row>
		<row><td>1732</td><td>##IDS_ERROR_1732##</td></row>
		<row><td>18</td><td>##IDS_ERROR_16##</td></row>
		<row><td>1801</td><td>##IDS_ERROR_84##</td></row>
		<row><td>1802</td><td>##IDS_ERROR_85##</td></row>
		<row><td>1803</td><td>##IDS_ERROR_86##</td></row>
		<row><td>1804</td><td>##IDS_ERROR_87##</td></row>
		<row><td>1805</td><td>##IDS_ERROR_88##</td></row>
		<row><td>1806</td><td>##IDS_ERROR_89##</td></row>
		<row><td>1807</td><td>##IDS_ERROR_90##</td></row>
		<row><td>19</td><td>##IDS_ERROR_17##</td></row>
		<row><td>1901</td><td>##IDS_ERROR_91##</td></row>
		<row><td>1902</td><td>##IDS_ERROR_92##</td></row>
		<row><td>1903</td><td>##IDS_ERROR_93##</td></row>
		<row><td>1904</td><td>##IDS_ERROR_94##</td></row>
		<row><td>1905</td><td>##IDS_ERROR_95##</td></row>
		<row><td>1906</td><td>##IDS_ERROR_96##</td></row>
		<row><td>1907</td><td>##IDS_ERROR_97##</td></row>
		<row><td>1908</td><td>##IDS_ERROR_98##</td></row>
		<row><td>1909</td><td>##IDS_ERROR_99##</td></row>
		<row><td>1910</td><td>##IDS_ERROR_100##</td></row>
		<row><td>1911</td><td>##IDS_ERROR_101##</td></row>
		<row><td>1912</td><td>##IDS_ERROR_102##</td></row>
		<row><td>1913</td><td>##IDS_ERROR_103##</td></row>
		<row><td>1914</td><td>##IDS_ERROR_104##</td></row>
		<row><td>1915</td><td>##IDS_ERROR_105##</td></row>
		<row><td>1916</td><td>##IDS_ERROR_106##</td></row>
		<row><td>1917</td><td>##IDS_ERROR_107##</td></row>
		<row><td>1918</td><td>##IDS_ERROR_108##</td></row>
		<row><td>1919</td><td>##IDS_ERROR_109##</td></row>
		<row><td>1920</td><td>##IDS_ERROR_110##</td></row>
		<row><td>1921</td><td>##IDS_ERROR_111##</td></row>
		<row><td>1922</td><td>##IDS_ERROR_112##</td></row>
		<row><td>1923</td><td>##IDS_ERROR_113##</td></row>
		<row><td>1924</td><td>##IDS_ERROR_114##</td></row>
		<row><td>1925</td><td>##IDS_ERROR_115##</td></row>
		<row><td>1926</td><td>##IDS_ERROR_116##</td></row>
		<row><td>1927</td><td>##IDS_ERROR_117##</td></row>
		<row><td>1928</td><td>##IDS_ERROR_118##</td></row>
		<row><td>1929</td><td>##IDS_ERROR_119##</td></row>
		<row><td>1930</td><td>##IDS_ERROR_125##</td></row>
		<row><td>1931</td><td>##IDS_ERROR_126##</td></row>
		<row><td>1932</td><td>##IDS_ERROR_127##</td></row>
		<row><td>1933</td><td>##IDS_ERROR_128##</td></row>
		<row><td>1934</td><td>##IDS_ERROR_129##</td></row>
		<row><td>1935</td><td>##IDS_ERROR_1935##</td></row>
		<row><td>1936</td><td>##IDS_ERROR_1936##</td></row>
		<row><td>1937</td><td>##IDS_ERROR_1937##</td></row>
		<row><td>1938</td><td>##IDS_ERROR_1938##</td></row>
		<row><td>2</td><td>##IDS_ERROR_2##</td></row>
		<row><td>20</td><td>##IDS_ERROR_18##</td></row>
		<row><td>21</td><td>##IDS_ERROR_19##</td></row>
		<row><td>2101</td><td>##IDS_ERROR_2101##</td></row>
		<row><td>2102</td><td>##IDS_ERROR_2102##</td></row>
		<row><td>2103</td><td>##IDS_ERROR_2103##</td></row>
		<row><td>2104</td><td>##IDS_ERROR_2104##</td></row>
		<row><td>2105</td><td>##IDS_ERROR_2105##</td></row>
		<row><td>2106</td><td>##IDS_ERROR_2106##</td></row>
		<row><td>2107</td><td>##IDS_ERROR_2107##</td></row>
		<row><td>2108</td><td>##IDS_ERROR_2108##</td></row>
		<row><td>2109</td><td>##IDS_ERROR_2109##</td></row>
		<row><td>2110</td><td>##IDS_ERROR_2110##</td></row>
		<row><td>2111</td><td>##IDS_ERROR_2111##</td></row>
		<row><td>2112</td><td>##IDS_ERROR_2112##</td></row>
		<row><td>2113</td><td>##IDS_ERROR_2113##</td></row>
		<row><td>22</td><td>##IDS_ERROR_120##</td></row>
		<row><td>2200</td><td>##IDS_ERROR_2200##</td></row>
		<row><td>2201</td><td>##IDS_ERROR_2201##</td></row>
		<row><td>2202</td><td>##IDS_ERROR_2202##</td></row>
		<row><td>2203</td><td>##IDS_ERROR_2203##</td></row>
		<row><td>2204</td><td>##IDS_ERROR_2204##</td></row>
		<row><td>2205</td><td>##IDS_ERROR_2205##</td></row>
		<row><td>2206</td><td>##IDS_ERROR_2206##</td></row>
		<row><td>2207</td><td>##IDS_ERROR_2207##</td></row>
		<row><td>2208</td><td>##IDS_ERROR_2208##</td></row>
		<row><td>2209</td><td>##IDS_ERROR_2209##</td></row>
		<row><td>2210</td><td>##IDS_ERROR_2210##</td></row>
		<row><td>2211</td><td>##IDS_ERROR_2211##</td></row>
		<row><td>2212</td><td>##IDS_ERROR_2212##</td></row>
		<row><td>2213</td><td>##IDS_ERROR_2213##</td></row>
		<row><td>2214</td><td>##IDS_ERROR_2214##</td></row>
		<row><td>2215</td><td>##IDS_ERROR_2215##</td></row>
		<row><td>2216</td><td>##IDS_ERROR_2216##</td></row>
		<row><td>2217</td><td>##IDS_ERROR_2217##</td></row>
		<row><td>2218</td><td>##IDS_ERROR_2218##</td></row>
		<row><td>2219</td><td>##IDS_ERROR_2219##</td></row>
		<row><td>2220</td><td>##IDS_ERROR_2220##</td></row>
		<row><td>2221</td><td>##IDS_ERROR_2221##</td></row>
		<row><td>2222</td><td>##IDS_ERROR_2222##</td></row>
		<row><td>2223</td><td>##IDS_ERROR_2223##</td></row>
		<row><td>2224</td><td>##IDS_ERROR_2224##</td></row>
		<row><td>2225</td><td>##IDS_ERROR_2225##</td></row>
		<row><td>2226</td><td>##IDS_ERROR_2226##</td></row>
		<row><td>2227</td><td>##IDS_ERROR_2227##</td></row>
		<row><td>2228</td><td>##IDS_ERROR_2228##</td></row>
		<row><td>2229</td><td>##IDS_ERROR_2229##</td></row>
		<row><td>2230</td><td>##IDS_ERROR_2230##</td></row>
		<row><td>2231</td><td>##IDS_ERROR_2231##</td></row>
		<row><td>2232</td><td>##IDS_ERROR_2232##</td></row>
		<row><td>2233</td><td>##IDS_ERROR_2233##</td></row>
		<row><td>2234</td><td>##IDS_ERROR_2234##</td></row>
		<row><td>2235</td><td>##IDS_ERROR_2235##</td></row>
		<row><td>2236</td><td>##IDS_ERROR_2236##</td></row>
		<row><td>2237</td><td>##IDS_ERROR_2237##</td></row>
		<row><td>2238</td><td>##IDS_ERROR_2238##</td></row>
		<row><td>2239</td><td>##IDS_ERROR_2239##</td></row>
		<row><td>2240</td><td>##IDS_ERROR_2240##</td></row>
		<row><td>2241</td><td>##IDS_ERROR_2241##</td></row>
		<row><td>2242</td><td>##IDS_ERROR_2242##</td></row>
		<row><td>2243</td><td>##IDS_ERROR_2243##</td></row>
		<row><td>2244</td><td>##IDS_ERROR_2244##</td></row>
		<row><td>2245</td><td>##IDS_ERROR_2245##</td></row>
		<row><td>2246</td><td>##IDS_ERROR_2246##</td></row>
		<row><td>2247</td><td>##IDS_ERROR_2247##</td></row>
		<row><td>2248</td><td>##IDS_ERROR_2248##</td></row>
		<row><td>2249</td><td>##IDS_ERROR_2249##</td></row>
		<row><td>2250</td><td>##IDS_ERROR_2250##</td></row>
		<row><td>2251</td><td>##IDS_ERROR_2251##</td></row>
		<row><td>2252</td><td>##IDS_ERROR_2252##</td></row>
		<row><td>2253</td><td>##IDS_ERROR_2253##</td></row>
		<row><td>2254</td><td>##IDS_ERROR_2254##</td></row>
		<row><td>2255</td><td>##IDS_ERROR_2255##</td></row>
		<row><td>2256</td><td>##IDS_ERROR_2256##</td></row>
		<row><td>2257</td><td>##IDS_ERROR_2257##</td></row>
		<row><td>2258</td><td>##IDS_ERROR_2258##</td></row>
		<row><td>2259</td><td>##IDS_ERROR_2259##</td></row>
		<row><td>2260</td><td>##IDS_ERROR_2260##</td></row>
		<row><td>2261</td><td>##IDS_ERROR_2261##</td></row>
		<row><td>2262</td><td>##IDS_ERROR_2262##</td></row>
		<row><td>2263</td><td>##IDS_ERROR_2263##</td></row>
		<row><td>2264</td><td>##IDS_ERROR_2264##</td></row>
		<row><td>2265</td><td>##IDS_ERROR_2265##</td></row>
		<row><td>2266</td><td>##IDS_ERROR_2266##</td></row>
		<row><td>2267</td><td>##IDS_ERROR_2267##</td></row>
		<row><td>2268</td><td>##IDS_ERROR_2268##</td></row>
		<row><td>2269</td><td>##IDS_ERROR_2269##</td></row>
		<row><td>2270</td><td>##IDS_ERROR_2270##</td></row>
		<row><td>2271</td><td>##IDS_ERROR_2271##</td></row>
		<row><td>2272</td><td>##IDS_ERROR_2272##</td></row>
		<row><td>2273</td><td>##IDS_ERROR_2273##</td></row>
		<row><td>2274</td><td>##IDS_ERROR_2274##</td></row>
		<row><td>2275</td><td>##IDS_ERROR_2275##</td></row>
		<row><td>2276</td><td>##IDS_ERROR_2276##</td></row>
		<row><td>2277</td><td>##IDS_ERROR_2277##</td></row>
		<row><td>2278</td><td>##IDS_ERROR_2278##</td></row>
		<row><td>2279</td><td>##IDS_ERROR_2279##</td></row>
		<row><td>2280</td><td>##IDS_ERROR_2280##</td></row>
		<row><td>2281</td><td>##IDS_ERROR_2281##</td></row>
		<row><td>2282</td><td>##IDS_ERROR_2282##</td></row>
		<row><td>23</td><td>##IDS_ERROR_121##</td></row>
		<row><td>2302</td><td>##IDS_ERROR_2302##</td></row>
		<row><td>2303</td><td>##IDS_ERROR_2303##</td></row>
		<row><td>2304</td><td>##IDS_ERROR_2304##</td></row>
		<row><td>2305</td><td>##IDS_ERROR_2305##</td></row>
		<row><td>2306</td><td>##IDS_ERROR_2306##</td></row>
		<row><td>2307</td><td>##IDS_ERROR_2307##</td></row>
		<row><td>2308</td><td>##IDS_ERROR_2308##</td></row>
		<row><td>2309</td><td>##IDS_ERROR_2309##</td></row>
		<row><td>2310</td><td>##IDS_ERROR_2310##</td></row>
		<row><td>2315</td><td>##IDS_ERROR_2315##</td></row>
		<row><td>2318</td><td>##IDS_ERROR_2318##</td></row>
		<row><td>2319</td><td>##IDS_ERROR_2319##</td></row>
		<row><td>2320</td><td>##IDS_ERROR_2320##</td></row>
		<row><td>2321</td><td>##IDS_ERROR_2321##</td></row>
		<row><td>2322</td><td>##IDS_ERROR_2322##</td></row>
		<row><td>2323</td><td>##IDS_ERROR_2323##</td></row>
		<row><td>2324</td><td>##IDS_ERROR_2324##</td></row>
		<row><td>2325</td><td>##IDS_ERROR_2325##</td></row>
		<row><td>2326</td><td>##IDS_ERROR_2326##</td></row>
		<row><td>2327</td><td>##IDS_ERROR_2327##</td></row>
		<row><td>2328</td><td>##IDS_ERROR_2328##</td></row>
		<row><td>2329</td><td>##IDS_ERROR_2329##</td></row>
		<row><td>2330</td><td>##IDS_ERROR_2330##</td></row>
		<row><td>2331</td><td>##IDS_ERROR_2331##</td></row>
		<row><td>2332</td><td>##IDS_ERROR_2332##</td></row>
		<row><td>2333</td><td>##IDS_ERROR_2333##</td></row>
		<row><td>2334</td><td>##IDS_ERROR_2334##</td></row>
		<row><td>2335</td><td>##IDS_ERROR_2335##</td></row>
		<row><td>2336</td><td>##IDS_ERROR_2336##</td></row>
		<row><td>2337</td><td>##IDS_ERROR_2337##</td></row>
		<row><td>2338</td><td>##IDS_ERROR_2338##</td></row>
		<row><td>2339</td><td>##IDS_ERROR_2339##</td></row>
		<row><td>2340</td><td>##IDS_ERROR_2340##</td></row>
		<row><td>2341</td><td>##IDS_ERROR_2341##</td></row>
		<row><td>2342</td><td>##IDS_ERROR_2342##</td></row>
		<row><td>2343</td><td>##IDS_ERROR_2343##</td></row>
		<row><td>2344</td><td>##IDS_ERROR_2344##</td></row>
		<row><td>2345</td><td>##IDS_ERROR_2345##</td></row>
		<row><td>2347</td><td>##IDS_ERROR_2347##</td></row>
		<row><td>2348</td><td>##IDS_ERROR_2348##</td></row>
		<row><td>2349</td><td>##IDS_ERROR_2349##</td></row>
		<row><td>2350</td><td>##IDS_ERROR_2350##</td></row>
		<row><td>2351</td><td>##IDS_ERROR_2351##</td></row>
		<row><td>2352</td><td>##IDS_ERROR_2352##</td></row>
		<row><td>2353</td><td>##IDS_ERROR_2353##</td></row>
		<row><td>2354</td><td>##IDS_ERROR_2354##</td></row>
		<row><td>2355</td><td>##IDS_ERROR_2355##</td></row>
		<row><td>2356</td><td>##IDS_ERROR_2356##</td></row>
		<row><td>2357</td><td>##IDS_ERROR_2357##</td></row>
		<row><td>2358</td><td>##IDS_ERROR_2358##</td></row>
		<row><td>2359</td><td>##IDS_ERROR_2359##</td></row>
		<row><td>2360</td><td>##IDS_ERROR_2360##</td></row>
		<row><td>2361</td><td>##IDS_ERROR_2361##</td></row>
		<row><td>2362</td><td>##IDS_ERROR_2362##</td></row>
		<row><td>2363</td><td>##IDS_ERROR_2363##</td></row>
		<row><td>2364</td><td>##IDS_ERROR_2364##</td></row>
		<row><td>2365</td><td>##IDS_ERROR_2365##</td></row>
		<row><td>2366</td><td>##IDS_ERROR_2366##</td></row>
		<row><td>2367</td><td>##IDS_ERROR_2367##</td></row>
		<row><td>2368</td><td>##IDS_ERROR_2368##</td></row>
		<row><td>2370</td><td>##IDS_ERROR_2370##</td></row>
		<row><td>2371</td><td>##IDS_ERROR_2371##</td></row>
		<row><td>2372</td><td>##IDS_ERROR_2372##</td></row>
		<row><td>2373</td><td>##IDS_ERROR_2373##</td></row>
		<row><td>2374</td><td>##IDS_ERROR_2374##</td></row>
		<row><td>2375</td><td>##IDS_ERROR_2375##</td></row>
		<row><td>2376</td><td>##IDS_ERROR_2376##</td></row>
		<row><td>2379</td><td>##IDS_ERROR_2379##</td></row>
		<row><td>2380</td><td>##IDS_ERROR_2380##</td></row>
		<row><td>2381</td><td>##IDS_ERROR_2381##</td></row>
		<row><td>2382</td><td>##IDS_ERROR_2382##</td></row>
		<row><td>2401</td><td>##IDS_ERROR_2401##</td></row>
		<row><td>2402</td><td>##IDS_ERROR_2402##</td></row>
		<row><td>2501</td><td>##IDS_ERROR_2501##</td></row>
		<row><td>2502</td><td>##IDS_ERROR_2502##</td></row>
		<row><td>2503</td><td>##IDS_ERROR_2503##</td></row>
		<row><td>2601</td><td>##IDS_ERROR_2601##</td></row>
		<row><td>2602</td><td>##IDS_ERROR_2602##</td></row>
		<row><td>2603</td><td>##IDS_ERROR_2603##</td></row>
		<row><td>2604</td><td>##IDS_ERROR_2604##</td></row>
		<row><td>2605</td><td>##IDS_ERROR_2605##</td></row>
		<row><td>2606</td><td>##IDS_ERROR_2606##</td></row>
		<row><td>2607</td><td>##IDS_ERROR_2607##</td></row>
		<row><td>2608</td><td>##IDS_ERROR_2608##</td></row>
		<row><td>2609</td><td>##IDS_ERROR_2609##</td></row>
		<row><td>2611</td><td>##IDS_ERROR_2611##</td></row>
		<row><td>2612</td><td>##IDS_ERROR_2612##</td></row>
		<row><td>2613</td><td>##IDS_ERROR_2613##</td></row>
		<row><td>2614</td><td>##IDS_ERROR_2614##</td></row>
		<row><td>2615</td><td>##IDS_ERROR_2615##</td></row>
		<row><td>2616</td><td>##IDS_ERROR_2616##</td></row>
		<row><td>2617</td><td>##IDS_ERROR_2617##</td></row>
		<row><td>2618</td><td>##IDS_ERROR_2618##</td></row>
		<row><td>2619</td><td>##IDS_ERROR_2619##</td></row>
		<row><td>2620</td><td>##IDS_ERROR_2620##</td></row>
		<row><td>2621</td><td>##IDS_ERROR_2621##</td></row>
		<row><td>2701</td><td>##IDS_ERROR_2701##</td></row>
		<row><td>2702</td><td>##IDS_ERROR_2702##</td></row>
		<row><td>2703</td><td>##IDS_ERROR_2703##</td></row>
		<row><td>2704</td><td>##IDS_ERROR_2704##</td></row>
		<row><td>2705</td><td>##IDS_ERROR_2705##</td></row>
		<row><td>2706</td><td>##IDS_ERROR_2706##</td></row>
		<row><td>2707</td><td>##IDS_ERROR_2707##</td></row>
		<row><td>2708</td><td>##IDS_ERROR_2708##</td></row>
		<row><td>2709</td><td>##IDS_ERROR_2709##</td></row>
		<row><td>2710</td><td>##IDS_ERROR_2710##</td></row>
		<row><td>2711</td><td>##IDS_ERROR_2711##</td></row>
		<row><td>2712</td><td>##IDS_ERROR_2712##</td></row>
		<row><td>2713</td><td>##IDS_ERROR_2713##</td></row>
		<row><td>2714</td><td>##IDS_ERROR_2714##</td></row>
		<row><td>2715</td><td>##IDS_ERROR_2715##</td></row>
		<row><td>2716</td><td>##IDS_ERROR_2716##</td></row>
		<row><td>2717</td><td>##IDS_ERROR_2717##</td></row>
		<row><td>2718</td><td>##IDS_ERROR_2718##</td></row>
		<row><td>2719</td><td>##IDS_ERROR_2719##</td></row>
		<row><td>2720</td><td>##IDS_ERROR_2720##</td></row>
		<row><td>2721</td><td>##IDS_ERROR_2721##</td></row>
		<row><td>2722</td><td>##IDS_ERROR_2722##</td></row>
		<row><td>2723</td><td>##IDS_ERROR_2723##</td></row>
		<row><td>2724</td><td>##IDS_ERROR_2724##</td></row>
		<row><td>2725</td><td>##IDS_ERROR_2725##</td></row>
		<row><td>2726</td><td>##IDS_ERROR_2726##</td></row>
		<row><td>2727</td><td>##IDS_ERROR_2727##</td></row>
		<row><td>2728</td><td>##IDS_ERROR_2728##</td></row>
		<row><td>2729</td><td>##IDS_ERROR_2729##</td></row>
		<row><td>2730</td><td>##IDS_ERROR_2730##</td></row>
		<row><td>2731</td><td>##IDS_ERROR_2731##</td></row>
		<row><td>2732</td><td>##IDS_ERROR_2732##</td></row>
		<row><td>2733</td><td>##IDS_ERROR_2733##</td></row>
		<row><td>2734</td><td>##IDS_ERROR_2734##</td></row>
		<row><td>2735</td><td>##IDS_ERROR_2735##</td></row>
		<row><td>2736</td><td>##IDS_ERROR_2736##</td></row>
		<row><td>2737</td><td>##IDS_ERROR_2737##</td></row>
		<row><td>2738</td><td>##IDS_ERROR_2738##</td></row>
		<row><td>2739</td><td>##IDS_ERROR_2739##</td></row>
		<row><td>2740</td><td>##IDS_ERROR_2740##</td></row>
		<row><td>2741</td><td>##IDS_ERROR_2741##</td></row>
		<row><td>2742</td><td>##IDS_ERROR_2742##</td></row>
		<row><td>2743</td><td>##IDS_ERROR_2743##</td></row>
		<row><td>2744</td><td>##IDS_ERROR_2744##</td></row>
		<row><td>2745</td><td>##IDS_ERROR_2745##</td></row>
		<row><td>2746</td><td>##IDS_ERROR_2746##</td></row>
		<row><td>2747</td><td>##IDS_ERROR_2747##</td></row>
		<row><td>2748</td><td>##IDS_ERROR_2748##</td></row>
		<row><td>2749</td><td>##IDS_ERROR_2749##</td></row>
		<row><td>2750</td><td>##IDS_ERROR_2750##</td></row>
		<row><td>27500</td><td>##IDS_ERROR_130##</td></row>
		<row><td>27501</td><td>##IDS_ERROR_131##</td></row>
		<row><td>27502</td><td>##IDS_ERROR_27502##</td></row>
		<row><td>27503</td><td>##IDS_ERROR_27503##</td></row>
		<row><td>27504</td><td>##IDS_ERROR_27504##</td></row>
		<row><td>27505</td><td>##IDS_ERROR_27505##</td></row>
		<row><td>27506</td><td>##IDS_ERROR_27506##</td></row>
		<row><td>27507</td><td>##IDS_ERROR_27507##</td></row>
		<row><td>27508</td><td>##IDS_ERROR_27508##</td></row>
		<row><td>27509</td><td>##IDS_ERROR_27509##</td></row>
		<row><td>2751</td><td>##IDS_ERROR_2751##</td></row>
		<row><td>27510</td><td>##IDS_ERROR_27510##</td></row>
		<row><td>27511</td><td>##IDS_ERROR_27511##</td></row>
		<row><td>27512</td><td>##IDS_ERROR_27512##</td></row>
		<row><td>27513</td><td>##IDS_ERROR_27513##</td></row>
		<row><td>27514</td><td>##IDS_ERROR_27514##</td></row>
		<row><td>27515</td><td>##IDS_ERROR_27515##</td></row>
		<row><td>27516</td><td>##IDS_ERROR_27516##</td></row>
		<row><td>27517</td><td>##IDS_ERROR_27517##</td></row>
		<row><td>27518</td><td>##IDS_ERROR_27518##</td></row>
		<row><td>27519</td><td>##IDS_ERROR_27519##</td></row>
		<row><td>2752</td><td>##IDS_ERROR_2752##</td></row>
		<row><td>27520</td><td>##IDS_ERROR_27520##</td></row>
		<row><td>27521</td><td>##IDS_ERROR_27521##</td></row>
		<row><td>27522</td><td>##IDS_ERROR_27522##</td></row>
		<row><td>27523</td><td>##IDS_ERROR_27523##</td></row>
		<row><td>27524</td><td>##IDS_ERROR_27524##</td></row>
		<row><td>27525</td><td>##IDS_ERROR_27525##</td></row>
		<row><td>27526</td><td>##IDS_ERROR_27526##</td></row>
		<row><td>27527</td><td>##IDS_ERROR_27527##</td></row>
		<row><td>27528</td><td>##IDS_ERROR_27528##</td></row>
		<row><td>27529</td><td>##IDS_ERROR_27529##</td></row>
		<row><td>2753</td><td>##IDS_ERROR_2753##</td></row>
		<row><td>27530</td><td>##IDS_ERROR_27530##</td></row>
		<row><td>27531</td><td>##IDS_ERROR_27531##</td></row>
		<row><td>27532</td><td>##IDS_ERROR_27532##</td></row>
		<row><td>27533</td><td>##IDS_ERROR_27533##</td></row>
		<row><td>27534</td><td>##IDS_ERROR_27534##</td></row>
		<row><td>27535</td><td>##IDS_ERROR_27535##</td></row>
		<row><td>27536</td><td>##IDS_ERROR_27536##</td></row>
		<row><td>27537</td><td>##IDS_ERROR_27537##</td></row>
		<row><td>27538</td><td>##IDS_ERROR_27538##</td></row>
		<row><td>27539</td><td>##IDS_ERROR_27539##</td></row>
		<row><td>2754</td><td>##IDS_ERROR_2754##</td></row>
		<row><td>27540</td><td>##IDS_ERROR_27540##</td></row>
		<row><td>27541</td><td>##IDS_ERROR_27541##</td></row>
		<row><td>27542</td><td>##IDS_ERROR_27542##</td></row>
		<row><td>27543</td><td>##IDS_ERROR_27543##</td></row>
		<row><td>27544</td><td>##IDS_ERROR_27544##</td></row>
		<row><td>27545</td><td>##IDS_ERROR_27545##</td></row>
		<row><td>27546</td><td>##IDS_ERROR_27546##</td></row>
		<row><td>27547</td><td>##IDS_ERROR_27547##</td></row>
		<row><td>27548</td><td>##IDS_ERROR_27548##</td></row>
		<row><td>27549</td><td>##IDS_ERROR_27549##</td></row>
		<row><td>2755</td><td>##IDS_ERROR_2755##</td></row>
		<row><td>27550</td><td>##IDS_ERROR_27550##</td></row>
		<row><td>27551</td><td>##IDS_ERROR_27551##</td></row>
		<row><td>27552</td><td>##IDS_ERROR_27552##</td></row>
		<row><td>27553</td><td>##IDS_ERROR_27553##</td></row>
		<row><td>27554</td><td>##IDS_ERROR_27554##</td></row>
		<row><td>27555</td><td>##IDS_ERROR_27555##</td></row>
		<row><td>2756</td><td>##IDS_ERROR_2756##</td></row>
		<row><td>2757</td><td>##IDS_ERROR_2757##</td></row>
		<row><td>2758</td><td>##IDS_ERROR_2758##</td></row>
		<row><td>2759</td><td>##IDS_ERROR_2759##</td></row>
		<row><td>2760</td><td>##IDS_ERROR_2760##</td></row>
		<row><td>2761</td><td>##IDS_ERROR_2761##</td></row>
		<row><td>2762</td><td>##IDS_ERROR_2762##</td></row>
		<row><td>2763</td><td>##IDS_ERROR_2763##</td></row>
		<row><td>2765</td><td>##IDS_ERROR_2765##</td></row>
		<row><td>2766</td><td>##IDS_ERROR_2766##</td></row>
		<row><td>2767</td><td>##IDS_ERROR_2767##</td></row>
		<row><td>2768</td><td>##IDS_ERROR_2768##</td></row>
		<row><td>2769</td><td>##IDS_ERROR_2769##</td></row>
		<row><td>2770</td><td>##IDS_ERROR_2770##</td></row>
		<row><td>2771</td><td>##IDS_ERROR_2771##</td></row>
		<row><td>2772</td><td>##IDS_ERROR_2772##</td></row>
		<row><td>2801</td><td>##IDS_ERROR_2801##</td></row>
		<row><td>2802</td><td>##IDS_ERROR_2802##</td></row>
		<row><td>2803</td><td>##IDS_ERROR_2803##</td></row>
		<row><td>2804</td><td>##IDS_ERROR_2804##</td></row>
		<row><td>2806</td><td>##IDS_ERROR_2806##</td></row>
		<row><td>2807</td><td>##IDS_ERROR_2807##</td></row>
		<row><td>2808</td><td>##IDS_ERROR_2808##</td></row>
		<row><td>2809</td><td>##IDS_ERROR_2809##</td></row>
		<row><td>2810</td><td>##IDS_ERROR_2810##</td></row>
		<row><td>2811</td><td>##IDS_ERROR_2811##</td></row>
		<row><td>2812</td><td>##IDS_ERROR_2812##</td></row>
		<row><td>2813</td><td>##IDS_ERROR_2813##</td></row>
		<row><td>2814</td><td>##IDS_ERROR_2814##</td></row>
		<row><td>2815</td><td>##IDS_ERROR_2815##</td></row>
		<row><td>2816</td><td>##IDS_ERROR_2816##</td></row>
		<row><td>2817</td><td>##IDS_ERROR_2817##</td></row>
		<row><td>2818</td><td>##IDS_ERROR_2818##</td></row>
		<row><td>2819</td><td>##IDS_ERROR_2819##</td></row>
		<row><td>2820</td><td>##IDS_ERROR_2820##</td></row>
		<row><td>2821</td><td>##IDS_ERROR_2821##</td></row>
		<row><td>2822</td><td>##IDS_ERROR_2822##</td></row>
		<row><td>2823</td><td>##IDS_ERROR_2823##</td></row>
		<row><td>2824</td><td>##IDS_ERROR_2824##</td></row>
		<row><td>2825</td><td>##IDS_ERROR_2825##</td></row>
		<row><td>2826</td><td>##IDS_ERROR_2826##</td></row>
		<row><td>2827</td><td>##IDS_ERROR_2827##</td></row>
		<row><td>2828</td><td>##IDS_ERROR_2828##</td></row>
		<row><td>2829</td><td>##IDS_ERROR_2829##</td></row>
		<row><td>2830</td><td>##IDS_ERROR_2830##</td></row>
		<row><td>2831</td><td>##IDS_ERROR_2831##</td></row>
		<row><td>2832</td><td>##IDS_ERROR_2832##</td></row>
		<row><td>2833</td><td>##IDS_ERROR_2833##</td></row>
		<row><td>2834</td><td>##IDS_ERROR_2834##</td></row>
		<row><td>2835</td><td>##IDS_ERROR_2835##</td></row>
		<row><td>2836</td><td>##IDS_ERROR_2836##</td></row>
		<row><td>2837</td><td>##IDS_ERROR_2837##</td></row>
		<row><td>2838</td><td>##IDS_ERROR_2838##</td></row>
		<row><td>2839</td><td>##IDS_ERROR_2839##</td></row>
		<row><td>2840</td><td>##IDS_ERROR_2840##</td></row>
		<row><td>2841</td><td>##IDS_ERROR_2841##</td></row>
		<row><td>2842</td><td>##IDS_ERROR_2842##</td></row>
		<row><td>2843</td><td>##IDS_ERROR_2843##</td></row>
		<row><td>2844</td><td>##IDS_ERROR_2844##</td></row>
		<row><td>2845</td><td>##IDS_ERROR_2845##</td></row>
		<row><td>2846</td><td>##IDS_ERROR_2846##</td></row>
		<row><td>2847</td><td>##IDS_ERROR_2847##</td></row>
		<row><td>2848</td><td>##IDS_ERROR_2848##</td></row>
		<row><td>2849</td><td>##IDS_ERROR_2849##</td></row>
		<row><td>2850</td><td>##IDS_ERROR_2850##</td></row>
		<row><td>2851</td><td>##IDS_ERROR_2851##</td></row>
		<row><td>2852</td><td>##IDS_ERROR_2852##</td></row>
		<row><td>2853</td><td>##IDS_ERROR_2853##</td></row>
		<row><td>2854</td><td>##IDS_ERROR_2854##</td></row>
		<row><td>2855</td><td>##IDS_ERROR_2855##</td></row>
		<row><td>2856</td><td>##IDS_ERROR_2856##</td></row>
		<row><td>2857</td><td>##IDS_ERROR_2857##</td></row>
		<row><td>2858</td><td>##IDS_ERROR_2858##</td></row>
		<row><td>2859</td><td>##IDS_ERROR_2859##</td></row>
		<row><td>2860</td><td>##IDS_ERROR_2860##</td></row>
		<row><td>2861</td><td>##IDS_ERROR_2861##</td></row>
		<row><td>2862</td><td>##IDS_ERROR_2862##</td></row>
		<row><td>2863</td><td>##IDS_ERROR_2863##</td></row>
		<row><td>2864</td><td>##IDS_ERROR_2864##</td></row>
		<row><td>2865</td><td>##IDS_ERROR_2865##</td></row>
		<row><td>2866</td><td>##IDS_ERROR_2866##</td></row>
		<row><td>2867</td><td>##IDS_ERROR_2867##</td></row>
		<row><td>2868</td><td>##IDS_ERROR_2868##</td></row>
		<row><td>2869</td><td>##IDS_ERROR_2869##</td></row>
		<row><td>2870</td><td>##IDS_ERROR_2870##</td></row>
		<row><td>2871</td><td>##IDS_ERROR_2871##</td></row>
		<row><td>2872</td><td>##IDS_ERROR_2872##</td></row>
		<row><td>2873</td><td>##IDS_ERROR_2873##</td></row>
		<row><td>2874</td><td>##IDS_ERROR_2874##</td></row>
		<row><td>2875</td><td>##IDS_ERROR_2875##</td></row>
		<row><td>2876</td><td>##IDS_ERROR_2876##</td></row>
		<row><td>2877</td><td>##IDS_ERROR_2877##</td></row>
		<row><td>2878</td><td>##IDS_ERROR_2878##</td></row>
		<row><td>2879</td><td>##IDS_ERROR_2879##</td></row>
		<row><td>2880</td><td>##IDS_ERROR_2880##</td></row>
		<row><td>2881</td><td>##IDS_ERROR_2881##</td></row>
		<row><td>2882</td><td>##IDS_ERROR_2882##</td></row>
		<row><td>2883</td><td>##IDS_ERROR_2883##</td></row>
		<row><td>2884</td><td>##IDS_ERROR_2884##</td></row>
		<row><td>2885</td><td>##IDS_ERROR_2885##</td></row>
		<row><td>2886</td><td>##IDS_ERROR_2886##</td></row>
		<row><td>2887</td><td>##IDS_ERROR_2887##</td></row>
		<row><td>2888</td><td>##IDS_ERROR_2888##</td></row>
		<row><td>2889</td><td>##IDS_ERROR_2889##</td></row>
		<row><td>2890</td><td>##IDS_ERROR_2890##</td></row>
		<row><td>2891</td><td>##IDS_ERROR_2891##</td></row>
		<row><td>2892</td><td>##IDS_ERROR_2892##</td></row>
		<row><td>2893</td><td>##IDS_ERROR_2893##</td></row>
		<row><td>2894</td><td>##IDS_ERROR_2894##</td></row>
		<row><td>2895</td><td>##IDS_ERROR_2895##</td></row>
		<row><td>2896</td><td>##IDS_ERROR_2896##</td></row>
		<row><td>2897</td><td>##IDS_ERROR_2897##</td></row>
		<row><td>2898</td><td>##IDS_ERROR_2898##</td></row>
		<row><td>2899</td><td>##IDS_ERROR_2899##</td></row>
		<row><td>2901</td><td>##IDS_ERROR_2901##</td></row>
		<row><td>2902</td><td>##IDS_ERROR_2902##</td></row>
		<row><td>2903</td><td>##IDS_ERROR_2903##</td></row>
		<row><td>2904</td><td>##IDS_ERROR_2904##</td></row>
		<row><td>2905</td><td>##IDS_ERROR_2905##</td></row>
		<row><td>2906</td><td>##IDS_ERROR_2906##</td></row>
		<row><td>2907</td><td>##IDS_ERROR_2907##</td></row>
		<row><td>2908</td><td>##IDS_ERROR_2908##</td></row>
		<row><td>2909</td><td>##IDS_ERROR_2909##</td></row>
		<row><td>2910</td><td>##IDS_ERROR_2910##</td></row>
		<row><td>2911</td><td>##IDS_ERROR_2911##</td></row>
		<row><td>2912</td><td>##IDS_ERROR_2912##</td></row>
		<row><td>2919</td><td>##IDS_ERROR_2919##</td></row>
		<row><td>2920</td><td>##IDS_ERROR_2920##</td></row>
		<row><td>2924</td><td>##IDS_ERROR_2924##</td></row>
		<row><td>2927</td><td>##IDS_ERROR_2927##</td></row>
		<row><td>2928</td><td>##IDS_ERROR_2928##</td></row>
		<row><td>2929</td><td>##IDS_ERROR_2929##</td></row>
		<row><td>2932</td><td>##IDS_ERROR_2932##</td></row>
		<row><td>2933</td><td>##IDS_ERROR_2933##</td></row>
		<row><td>2934</td><td>##IDS_ERROR_2934##</td></row>
		<row><td>2935</td><td>##IDS_ERROR_2935##</td></row>
		<row><td>2936</td><td>##IDS_ERROR_2936##</td></row>
		<row><td>2937</td><td>##IDS_ERROR_2937##</td></row>
		<row><td>2938</td><td>##IDS_ERROR_2938##</td></row>
		<row><td>2939</td><td>##IDS_ERROR_2939##</td></row>
		<row><td>2940</td><td>##IDS_ERROR_2940##</td></row>
		<row><td>2941</td><td>##IDS_ERROR_2941##</td></row>
		<row><td>2942</td><td>##IDS_ERROR_2942##</td></row>
		<row><td>2943</td><td>##IDS_ERROR_2943##</td></row>
		<row><td>2944</td><td>##IDS_ERROR_2944##</td></row>
		<row><td>2945</td><td>##IDS_ERROR_2945##</td></row>
		<row><td>3001</td><td>##IDS_ERROR_3001##</td></row>
		<row><td>3002</td><td>##IDS_ERROR_3002##</td></row>
		<row><td>32</td><td>##IDS_ERROR_20##</td></row>
		<row><td>33</td><td>##IDS_ERROR_21##</td></row>
		<row><td>4</td><td>##IDS_ERROR_3##</td></row>
		<row><td>5</td><td>##IDS_ERROR_4##</td></row>
		<row><td>7</td><td>##IDS_ERROR_5##</td></row>
		<row><td>8</td><td>##IDS_ERROR_6##</td></row>
		<row><td>9</td><td>##IDS_ERROR_7##</td></row>
	</table>

	<table name="EventMapping">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">Event</col>
		<col def="s50">Attribute</col>
		<row><td>CustomSetup</td><td>ItemDescription</td><td>SelectionDescription</td><td>Text</td></row>
		<row><td>CustomSetup</td><td>Location</td><td>SelectionPath</td><td>Text</td></row>
		<row><td>CustomSetup</td><td>Size</td><td>SelectionSize</td><td>Text</td></row>
		<row><td>SetupInitialization</td><td>ActionData</td><td>ActionData</td><td>Text</td></row>
		<row><td>SetupInitialization</td><td>ActionText</td><td>ActionText</td><td>Text</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>AdminInstallFinalize</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>InstallFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>MoveFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>RemoveFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>RemoveRegistryValues</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>SetProgress</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>UnmoveFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>WriteIniValues</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>WriteRegistryValues</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionText</td><td>ActionText</td><td>Text</td></row>
	</table>

	<table name="Extension">
		<col key="yes" def="s255">Extension</col>
		<col key="yes" def="s72">Component_</col>
		<col def="S255">ProgId_</col>
		<col def="S64">MIME_</col>
		<col def="s38">Feature_</col>
	</table>

	<table name="Feature">
		<col key="yes" def="s38">Feature</col>
		<col def="S38">Feature_Parent</col>
		<col def="L64">Title</col>
		<col def="L255">Description</col>
		<col def="I2">Display</col>
		<col def="i2">Level</col>
		<col def="S72">Directory_</col>
		<col def="i2">Attributes</col>
		<col def="S255">ISReleaseFlags</col>
		<col def="S255">ISComments</col>
		<col def="S255">ISFeatureCabName</col>
		<col def="S255">ISProFeatureName</col>
		<row><td>AlwaysInstall</td><td/><td>##DN_AlwaysInstall##</td><td>Enter the description for this feature here.</td><td>0</td><td>1</td><td>INSTALLDIR</td><td>16</td><td/><td>Enter comments regarding this feature here.</td><td/><td/></row>
	</table>

	<table name="FeatureComponents">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s72">Component_</col>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT1</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT10</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT11</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT12</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT13</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT14</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT15</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT16</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT17</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT18</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT19</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT2</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT20</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT21</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT22</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT23</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT24</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT25</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT26</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT27</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT28</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT29</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT3</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT30</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT31</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT32</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT33</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT34</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT35</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT36</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT37</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT38</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT39</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT4</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT40</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT41</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT5</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT6</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT7</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT8</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT9</td></row>
		<row><td>AlwaysInstall</td><td>awk.exe</td></row>
		<row><td>AlwaysInstall</td><td>basename.exe</td></row>
		<row><td>AlwaysInstall</td><td>bash.exe</td></row>
		<row><td>AlwaysInstall</td><td>bunzip2.exe</td></row>
		<row><td>AlwaysInstall</td><td>bzcat.exe</td></row>
		<row><td>AlwaysInstall</td><td>bzip2.exe</td></row>
		<row><td>AlwaysInstall</td><td>bzip2recover.exe</td></row>
		<row><td>AlwaysInstall</td><td>cat.exe</td></row>
		<row><td>AlwaysInstall</td><td>chmod.exe</td></row>
		<row><td>AlwaysInstall</td><td>cleanfile.exe</td></row>
		<row><td>AlwaysInstall</td><td>cmp.exe</td></row>
		<row><td>AlwaysInstall</td><td>comm.exe</td></row>
		<row><td>AlwaysInstall</td><td>conv.exe</td></row>
		<row><td>AlwaysInstall</td><td>cp.exe</td></row>
		<row><td>AlwaysInstall</td><td>cryptRDP5.exe</td></row>
		<row><td>AlwaysInstall</td><td>cut.exe</td></row>
		<row><td>AlwaysInstall</td><td>d2u.exe</td></row>
		<row><td>AlwaysInstall</td><td>date.exe</td></row>
		<row><td>AlwaysInstall</td><td>diff.exe</td></row>
		<row><td>AlwaysInstall</td><td>diff3.exe</td></row>
		<row><td>AlwaysInstall</td><td>dirname.exe</td></row>
		<row><td>AlwaysInstall</td><td>dos2unix.exe</td></row>
		<row><td>AlwaysInstall</td><td>echo.exe</td></row>
		<row><td>AlwaysInstall</td><td>egrep.exe</td></row>
		<row><td>AlwaysInstall</td><td>env.exe</td></row>
		<row><td>AlwaysInstall</td><td>error_mode.exe</td></row>
		<row><td>AlwaysInstall</td><td>expr.exe</td></row>
		<row><td>AlwaysInstall</td><td>false.exe</td></row>
		<row><td>AlwaysInstall</td><td>fgrep.exe</td></row>
		<row><td>AlwaysInstall</td><td>file.exe</td></row>
		<row><td>AlwaysInstall</td><td>find.exe</td></row>
		<row><td>AlwaysInstall</td><td>fold.exe</td></row>
		<row><td>AlwaysInstall</td><td>gawk.exe</td></row>
		<row><td>AlwaysInstall</td><td>gawk_3.1.7.exe</td></row>
		<row><td>AlwaysInstall</td><td>grcat.exe</td></row>
		<row><td>AlwaysInstall</td><td>grep.exe</td></row>
		<row><td>AlwaysInstall</td><td>gui.exe</td></row>
		<row><td>AlwaysInstall</td><td>gzip.exe</td></row>
		<row><td>AlwaysInstall</td><td>head.exe</td></row>
		<row><td>AlwaysInstall</td><td>id.exe</td></row>
		<row><td>AlwaysInstall</td><td>info.exe</td></row>
		<row><td>AlwaysInstall</td><td>infokey.exe</td></row>
		<row><td>AlwaysInstall</td><td>install.exe</td></row>
		<row><td>AlwaysInstall</td><td>install_info.exe</td></row>
		<row><td>AlwaysInstall</td><td>join.exe</td></row>
		<row><td>AlwaysInstall</td><td>lastrites.exe</td></row>
		<row><td>AlwaysInstall</td><td>less.exe</td></row>
		<row><td>AlwaysInstall</td><td>lessecho.exe</td></row>
		<row><td>AlwaysInstall</td><td>lesskey.exe</td></row>
		<row><td>AlwaysInstall</td><td>libeay32.dll</td></row>
		<row><td>AlwaysInstall</td><td>ln.exe</td></row>
		<row><td>AlwaysInstall</td><td>ls.exe</td></row>
		<row><td>AlwaysInstall</td><td>lzcat.exe</td></row>
		<row><td>AlwaysInstall</td><td>lzma.exe</td></row>
		<row><td>AlwaysInstall</td><td>lzmadec.exe</td></row>
		<row><td>AlwaysInstall</td><td>lzmainfo.exe</td></row>
		<row><td>AlwaysInstall</td><td>make.exe</td></row>
		<row><td>AlwaysInstall</td><td>makeinfo.exe</td></row>
		<row><td>AlwaysInstall</td><td>md5sum.exe</td></row>
		<row><td>AlwaysInstall</td><td>mingw_get.exe</td></row>
		<row><td>AlwaysInstall</td><td>mingw_get_0.dll</td></row>
		<row><td>AlwaysInstall</td><td>mkdir.exe</td></row>
		<row><td>AlwaysInstall</td><td>msys_1.0.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_iconv_2.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_intl_8.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_lzma_5.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_magic_1.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_popt_0.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_regex_1.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_termcap_0.dll</td></row>
		<row><td>AlwaysInstall</td><td>msys_z.dll</td></row>
		<row><td>AlwaysInstall</td><td>msysmnt.exe</td></row>
		<row><td>AlwaysInstall</td><td>mv.exe</td></row>
		<row><td>AlwaysInstall</td><td>ncat.exe</td></row>
		<row><td>AlwaysInstall</td><td>nmap.exe</td></row>
		<row><td>AlwaysInstall</td><td>nping.exe</td></row>
		<row><td>AlwaysInstall</td><td>od.exe</td></row>
		<row><td>AlwaysInstall</td><td>oldfind.exe</td></row>
		<row><td>AlwaysInstall</td><td>pageant.exe</td></row>
		<row><td>AlwaysInstall</td><td>paste.exe</td></row>
		<row><td>AlwaysInstall</td><td>pgawk.exe</td></row>
		<row><td>AlwaysInstall</td><td>pgawk_3.1.7.exe</td></row>
		<row><td>AlwaysInstall</td><td>pkginfo.exe</td></row>
		<row><td>AlwaysInstall</td><td>plink.exe</td></row>
		<row><td>AlwaysInstall</td><td>printf.exe</td></row>
		<row><td>AlwaysInstall</td><td>ps.exe</td></row>
		<row><td>AlwaysInstall</td><td>pscp.exe</td></row>
		<row><td>AlwaysInstall</td><td>psexec.exe</td></row>
		<row><td>AlwaysInstall</td><td>psftp.exe</td></row>
		<row><td>AlwaysInstall</td><td>putty.chm</td></row>
		<row><td>AlwaysInstall</td><td>putty.exe</td></row>
		<row><td>AlwaysInstall</td><td>putty.hlp</td></row>
		<row><td>AlwaysInstall</td><td>puttygen.exe</td></row>
		<row><td>AlwaysInstall</td><td>pwcat.exe</td></row>
		<row><td>AlwaysInstall</td><td>pwd.exe</td></row>
		<row><td>AlwaysInstall</td><td>rm.exe</td></row>
		<row><td>AlwaysInstall</td><td>rmdir.exe</td></row>
		<row><td>AlwaysInstall</td><td>sdiff.exe</td></row>
		<row><td>AlwaysInstall</td><td>sed.exe</td></row>
		<row><td>AlwaysInstall</td><td>sh.exe</td></row>
		<row><td>AlwaysInstall</td><td>sleep.exe</td></row>
		<row><td>AlwaysInstall</td><td>sort.exe</td></row>
		<row><td>AlwaysInstall</td><td>split.exe</td></row>
		<row><td>AlwaysInstall</td><td>ssleay32.dll</td></row>
		<row><td>AlwaysInstall</td><td>stty.exe</td></row>
		<row><td>AlwaysInstall</td><td>tail.exe</td></row>
		<row><td>AlwaysInstall</td><td>tar.exe</td></row>
		<row><td>AlwaysInstall</td><td>tee.exe</td></row>
		<row><td>AlwaysInstall</td><td>tee.exe1</td></row>
		<row><td>AlwaysInstall</td><td>texindex.exe</td></row>
		<row><td>AlwaysInstall</td><td>touch.exe</td></row>
		<row><td>AlwaysInstall</td><td>tr.exe</td></row>
		<row><td>AlwaysInstall</td><td>true.exe</td></row>
		<row><td>AlwaysInstall</td><td>u2d.exe</td></row>
		<row><td>AlwaysInstall</td><td>uname.exe</td></row>
		<row><td>AlwaysInstall</td><td>uniq.exe</td></row>
		<row><td>AlwaysInstall</td><td>unix2dos.exe</td></row>
		<row><td>AlwaysInstall</td><td>unlzma.exe</td></row>
		<row><td>AlwaysInstall</td><td>unxz.exe</td></row>
		<row><td>AlwaysInstall</td><td>vc2008sp1_redist_x86.exe</td></row>
		<row><td>AlwaysInstall</td><td>vc2010sp1_redist_x86.exe</td></row>
		<row><td>AlwaysInstall</td><td>wc.exe</td></row>
		<row><td>AlwaysInstall</td><td>winpcap_nmap_4.12.exe</td></row>
		<row><td>AlwaysInstall</td><td>xargs.exe</td></row>
		<row><td>AlwaysInstall</td><td>xz.exe</td></row>
		<row><td>AlwaysInstall</td><td>xzcat.exe</td></row>
		<row><td>AlwaysInstall</td><td>xzdec.exe</td></row>
	</table>

	<table name="File">
		<col key="yes" def="s72">File</col>
		<col def="s72">Component_</col>
		<col def="s255">FileName</col>
		<col def="i4">FileSize</col>
		<col def="S72">Version</col>
		<col def="S20">Language</col>
		<col def="I2">Attributes</col>
		<col def="i2">Sequence</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="I4">ISAttributes</col>
		<col def="S72">ISComponentSubFolder_</col>
		<row><td>_rd_party_licenses.txt</td><td>ISX_DEFAULTCOMPONENT32</td><td>3RD-PA~1.TXT|3rd-party-licenses.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\3rd-party-licenses.txt</td><td>1</td><td/></row>
		<row><td>afp.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>afp.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\afp.lua</td><td>1</td><td/></row>
		<row><td>afp_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>AFP-BR~1.NSE|afp-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\afp-brute.nse</td><td>1</td><td/></row>
		<row><td>afp_path_vuln.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>AFP-PA~1.NSE|afp-path-vuln.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\afp-path-vuln.nse</td><td>1</td><td/></row>
		<row><td>afp_serverinfo.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>AFP-SE~1.NSE|afp-serverinfo.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\afp-serverinfo.nse</td><td>1</td><td/></row>
		<row><td>afp_showmount.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>AFP-SH~1.NSE|afp-showmount.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\afp-showmount.nse</td><td>1</td><td/></row>
		<row><td>asn1.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>asn1.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\asn1.lua</td><td>1</td><td/></row>
		<row><td>asn_query.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ASN-QU~1.NSE|asn-query.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\asn-query.nse</td><td>1</td><td/></row>
		<row><td>assert.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>assert.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\assert.awk</td><td>1</td><td/></row>
		<row><td>auth_owners.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>AUTH-O~1.NSE|auth-owners.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\auth-owners.nse</td><td>1</td><td/></row>
		<row><td>auth_spoof.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>AUTH-S~1.NSE|auth-spoof.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\auth-spoof.nse</td><td>1</td><td/></row>
		<row><td>awk.exe</td><td>awk.exe</td><td>awk.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\awk.exe</td><td>1</td><td/></row>
		<row><td>backdoor.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>backdoor.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\backdoor.lua</td><td>1</td><td/></row>
		<row><td>banner.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>banner.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\banner.nse</td><td>1</td><td/></row>
		<row><td>base64.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>base64.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\base64.lua</td><td>1</td><td/></row>
		<row><td>basename.exe</td><td>basename.exe</td><td>basename.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\basename.exe</td><td>1</td><td/></row>
		<row><td>bash.exe</td><td>bash.exe</td><td>bash.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bash.exe</td><td>1</td><td/></row>
		<row><td>bash_3.1.17_4_msys_1.0.16_bi</td><td>ISX_DEFAULTCOMPONENT26</td><td>BASH-3~1.LZM|bash-3.1.17-4-msys-1.0.16-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\bash-3.1.17-4-msys-1.0.16-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>bashbug</td><td>ISX_DEFAULTCOMPONENT7</td><td>bashbug</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bashbug</td><td>1</td><td/></row>
		<row><td>bin.luadoc</td><td>ISX_DEFAULTCOMPONENT34</td><td>BIN~1.LUA|bin.luadoc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\bin.luadoc</td><td>1</td><td/></row>
		<row><td>bit.luadoc</td><td>ISX_DEFAULTCOMPONENT34</td><td>BIT~1.LUA|bit.luadoc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\bit.luadoc</td><td>1</td><td/></row>
		<row><td>bits2str.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>bits2str.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\bits2str.awk</td><td>1</td><td/></row>
		<row><td>broadcast_dns_service_discov</td><td>ISX_DEFAULTCOMPONENT37</td><td>BROADC~1.NSE|broadcast-dns-service-discovery.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\broadcast-dns-service-discovery.nse</td><td>1</td><td/></row>
		<row><td>broadcast_dropbox_listener.n</td><td>ISX_DEFAULTCOMPONENT37</td><td>BROADC~1.NSE|broadcast-dropbox-listener.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\broadcast-dropbox-listener.nse</td><td>1</td><td/></row>
		<row><td>broadcast_ms_sql_discover.ns</td><td>ISX_DEFAULTCOMPONENT37</td><td>BROADC~1.NSE|broadcast-ms-sql-discover.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\broadcast-ms-sql-discover.nse</td><td>1</td><td/></row>
		<row><td>broadcast_upnp_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>BROADC~1.NSE|broadcast-upnp-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\broadcast-upnp-info.nse</td><td>1</td><td/></row>
		<row><td>broadcast_wsdd_discover.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>BROADC~1.NSE|broadcast-wsdd-discover.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\broadcast-wsdd-discover.nse</td><td>1</td><td/></row>
		<row><td>brute.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>brute.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\brute.lua</td><td>1</td><td/></row>
		<row><td>bunzip2.exe</td><td>bunzip2.exe</td><td>bunzip2.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bunzip2.exe</td><td>1</td><td/></row>
		<row><td>bzcat.exe</td><td>bzcat.exe</td><td>bzcat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzcat.exe</td><td>1</td><td/></row>
		<row><td>bzcmp</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzcmp</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzcmp</td><td>1</td><td/></row>
		<row><td>bzdiff</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzdiff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzdiff</td><td>1</td><td/></row>
		<row><td>bzegrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzegrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzegrep</td><td>1</td><td/></row>
		<row><td>bzfgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzfgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzfgrep</td><td>1</td><td/></row>
		<row><td>bzgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzgrep</td><td>1</td><td/></row>
		<row><td>bzip2.exe</td><td>bzip2.exe</td><td>bzip2.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzip2.exe</td><td>1</td><td/></row>
		<row><td>bzip2_1.0.6_1_msys_1.0.17_bi</td><td>ISX_DEFAULTCOMPONENT26</td><td>BZIP2-~1.LZM|bzip2-1.0.6-1-msys-1.0.17-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\bzip2-1.0.6-1-msys-1.0.17-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>bzip2recover.exe</td><td>bzip2recover.exe</td><td>BZIP2R~1.EXE|bzip2recover.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzip2recover.exe</td><td>1</td><td/></row>
		<row><td>bzless</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzless</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzless</td><td>1</td><td/></row>
		<row><td>bzmore</td><td>ISX_DEFAULTCOMPONENT7</td><td>bzmore</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\bzmore</td><td>1</td><td/></row>
		<row><td>ca_bundle.crt</td><td>ISX_DEFAULTCOMPONENT32</td><td>CA-BUN~1.CRT|ca-bundle.crt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\ca-bundle.crt</td><td>1</td><td/></row>
		<row><td>cat.exe</td><td>cat.exe</td><td>cat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\cat.exe</td><td>1</td><td/></row>
		<row><td>changelog</td><td>ISX_DEFAULTCOMPONENT32</td><td>CHANGE~1|CHANGELOG</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\CHANGELOG</td><td>1</td><td/></row>
		<row><td>chmod.exe</td><td>chmod.exe</td><td>chmod.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\chmod.exe</td><td>1</td><td/></row>
		<row><td>citrix_brute_xml.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>CITRIX~1.NSE|citrix-brute-xml.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\citrix-brute-xml.nse</td><td>1</td><td/></row>
		<row><td>citrix_enum_apps.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>CITRIX~1.NSE|citrix-enum-apps.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\citrix-enum-apps.nse</td><td>1</td><td/></row>
		<row><td>citrix_enum_apps_xml.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>CITRIX~1.NSE|citrix-enum-apps-xml.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\citrix-enum-apps-xml.nse</td><td>1</td><td/></row>
		<row><td>citrix_enum_servers.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>CITRIX~1.NSE|citrix-enum-servers.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\citrix-enum-servers.nse</td><td>1</td><td/></row>
		<row><td>citrix_enum_servers_xml.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>CITRIX~1.NSE|citrix-enum-servers-xml.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\citrix-enum-servers-xml.nse</td><td>1</td><td/></row>
		<row><td>citrixxml.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>CITRIX~1.LUA|citrixxml.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\citrixxml.lua</td><td>1</td><td/></row>
		<row><td>cleanfile.exe</td><td>cleanfile.exe</td><td>CLEANF~1.EXE|cleanfile.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\libexec\mingw-get\cleanfile.exe</td><td>1</td><td/></row>
		<row><td>cliff_rand.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>CLIFF_~1.AWK|cliff_rand.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\cliff_rand.awk</td><td>1</td><td/></row>
		<row><td>cls</td><td>ISX_DEFAULTCOMPONENT7</td><td>cls</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\cls</td><td>1</td><td/></row>
		<row><td>clsb</td><td>ISX_DEFAULTCOMPONENT7</td><td>clsb</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\clsb</td><td>1</td><td/></row>
		<row><td>cmd</td><td>ISX_DEFAULTCOMPONENT7</td><td>cmd</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\cmd</td><td>1</td><td/></row>
		<row><td>cmp.exe</td><td>cmp.exe</td><td>cmp.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\cmp.exe</td><td>1</td><td/></row>
		<row><td>comm.exe</td><td>comm.exe</td><td>comm.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\comm.exe</td><td>1</td><td/></row>
		<row><td>comm.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>comm.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\comm.lua</td><td>1</td><td/></row>
		<row><td>conv.exe</td><td>conv.exe</td><td>conv.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\conv.exe</td><td>1</td><td/></row>
		<row><td>copying</td><td>ISX_DEFAULTCOMPONENT15</td><td>COPYING</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\COPYING</td><td>1</td><td/></row>
		<row><td>copying.lib</td><td>ISX_DEFAULTCOMPONENT15</td><td>COPYING.LIB</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\COPYING.LIB</td><td>1</td><td/></row>
		<row><td>copying1</td><td>ISX_DEFAULTCOMPONENT20</td><td>COPYING</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\share\doc\mingw-get\COPYING</td><td>1</td><td/></row>
		<row><td>copying2</td><td>ISX_DEFAULTCOMPONENT32</td><td>COPYING</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\COPYING</td><td>1</td><td/></row>
		<row><td>coreutils_5.97_3_msys_1.0.13</td><td>ISX_DEFAULTCOMPONENT26</td><td>COREUT~1.LZM|coreutils-5.97-3-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\coreutils-5.97-3-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>couchdb_databases.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>COUCHD~1.NSE|couchdb-databases.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\couchdb-databases.nse</td><td>1</td><td/></row>
		<row><td>couchdb_stats.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>COUCHD~1.NSE|couchdb-stats.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\couchdb-stats.nse</td><td>1</td><td/></row>
		<row><td>cp.exe</td><td>cp.exe</td><td>cp.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\cp.exe</td><td>1</td><td/></row>
		<row><td>cryptrdp5.exe</td><td>cryptRDP5.exe</td><td>CRYPTR~1.EXE|cryptRDP5.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\cryptrdp5\cryptRDP5.exe</td><td>1</td><td/></row>
		<row><td>ctime.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>ctime.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\ctime.awk</td><td>1</td><td/></row>
		<row><td>cut.exe</td><td>cut.exe</td><td>cut.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\cut.exe</td><td>1</td><td/></row>
		<row><td>cygutils_dos2unix_1.3.4_4_ms</td><td>ISX_DEFAULTCOMPONENT26</td><td>CYGUTI~1.LZM|cygutils-dos2unix-1.3.4-4-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\cygutils-dos2unix-1.3.4-4-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>cygwin_license</td><td>ISX_DEFAULTCOMPONENT15</td><td>CYGWIN~1|CYGWIN_LICENSE</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\CYGWIN_LICENSE</td><td>1</td><td/></row>
		<row><td>d2u.exe</td><td>d2u.exe</td><td>d2u.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\d2u.exe</td><td>1</td><td/></row>
		<row><td>daap_get_library.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DAAP-G~1.NSE|daap-get-library.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\daap-get-library.nse</td><td>1</td><td/></row>
		<row><td>datafiles.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>DATAFI~1.LUA|datafiles.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\datafiles.lua</td><td>1</td><td/></row>
		<row><td>date.exe</td><td>date.exe</td><td>date.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\date.exe</td><td>1</td><td/></row>
		<row><td>daytime.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>daytime.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\daytime.nse</td><td>1</td><td/></row>
		<row><td>db2_das_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DB2-DA~1.NSE|db2-das-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\db2-das-info.nse</td><td>1</td><td/></row>
		<row><td>db2_discover.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DB2-DI~1.NSE|db2-discover.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\db2-discover.nse</td><td>1</td><td/></row>
		<row><td>default.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>default.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\default.lua</td><td>1</td><td/></row>
		<row><td>defaults.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>defaults.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\defaults.xml</td><td>1</td><td/></row>
		<row><td>dhcp.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>dhcp.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\dhcp.lua</td><td>1</td><td/></row>
		<row><td>dhcp_discover.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DHCP-D~1.NSE|dhcp-discover.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dhcp-discover.nse</td><td>1</td><td/></row>
		<row><td>diff.exe</td><td>diff.exe</td><td>diff.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\diff.exe</td><td>1</td><td/></row>
		<row><td>diff3.exe</td><td>diff3.exe</td><td>diff3.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\diff3.exe</td><td>1</td><td/></row>
		<row><td>diffutils_2.8.7.20071206cvs_</td><td>ISX_DEFAULTCOMPONENT26</td><td>DIFFUT~1.LZM|diffutils-2.8.7.20071206cvs-3-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\diffutils-2.8.7.20071206cvs-3-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>dirname.exe</td><td>dirname.exe</td><td>dirname.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\dirname.exe</td><td>1</td><td/></row>
		<row><td>dns.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>dns.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\dns.lua</td><td>1</td><td/></row>
		<row><td>dns_cache_snoop.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-CA~1.NSE|dns-cache-snoop.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-cache-snoop.nse</td><td>1</td><td/></row>
		<row><td>dns_fuzz.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>dns-fuzz.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-fuzz.nse</td><td>1</td><td/></row>
		<row><td>dns_random_srcport.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-RA~1.NSE|dns-random-srcport.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-random-srcport.nse</td><td>1</td><td/></row>
		<row><td>dns_random_txid.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-RA~1.NSE|dns-random-txid.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-random-txid.nse</td><td>1</td><td/></row>
		<row><td>dns_recursion.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-RE~1.NSE|dns-recursion.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-recursion.nse</td><td>1</td><td/></row>
		<row><td>dns_service_discovery.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-SE~1.NSE|dns-service-discovery.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-service-discovery.nse</td><td>1</td><td/></row>
		<row><td>dns_update.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-UP~1.NSE|dns-update.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-update.nse</td><td>1</td><td/></row>
		<row><td>dns_zone_transfer.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DNS-ZO~1.NSE|dns-zone-transfer.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\dns-zone-transfer.nse</td><td>1</td><td/></row>
		<row><td>dnssd.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>dnssd.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\dnssd.lua</td><td>1</td><td/></row>
		<row><td>domcon_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DOMCON~1.NSE|domcon-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\domcon-brute.nse</td><td>1</td><td/></row>
		<row><td>domcon_cmd.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DOMCON~1.NSE|domcon-cmd.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\domcon-cmd.nse</td><td>1</td><td/></row>
		<row><td>domino_enum_users.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DOMINO~1.NSE|domino-enum-users.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\domino-enum-users.nse</td><td>1</td><td/></row>
		<row><td>dos2unix.exe</td><td>dos2unix.exe</td><td>dos2unix.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\dos2unix.exe</td><td>1</td><td/></row>
		<row><td>dotnet4link.url</td><td>ISX_DEFAULTCOMPONENT40</td><td>DOTNET~1.URL|dotnet4link.url</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\Rubin\Source\Projects\Session\ext\win\session\dotnet4link.url</td><td>1</td><td/></row>
		<row><td>drda.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>drda.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\drda.lua</td><td>1</td><td/></row>
		<row><td>drda_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DRDA-B~1.NSE|drda-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\drda-brute.nse</td><td>1</td><td/></row>
		<row><td>drda_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>DRDA-I~1.NSE|drda-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\drda-info.nse</td><td>1</td><td/></row>
		<row><td>drives.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>drives.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\drives.lua</td><td>1</td><td/></row>
		<row><td>echo.exe</td><td>echo.exe</td><td>echo.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\echo.exe</td><td>1</td><td/></row>
		<row><td>egrep.exe</td><td>egrep.exe</td><td>egrep.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\egrep.exe</td><td>1</td><td/></row>
		<row><td>env.exe</td><td>env.exe</td><td>env.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\env.exe</td><td>1</td><td/></row>
		<row><td>error_mode.exe</td><td>error_mode.exe</td><td>ERROR-~1.EXE|error-mode.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\error-mode.exe</td><td>1</td><td/></row>
		<row><td>examples.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>examples.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\examples.lua</td><td>1</td><td/></row>
		<row><td>experimental.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>EXPERI~1.LUA|experimental.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\experimental.lua</td><td>1</td><td/></row>
		<row><td>expr.exe</td><td>expr.exe</td><td>expr.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\expr.exe</td><td>1</td><td/></row>
		<row><td>false.exe</td><td>false.exe</td><td>false.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\false.exe</td><td>1</td><td/></row>
		<row><td>favicon_db</td><td>ISX_DEFAULTCOMPONENT35</td><td>FAVICO~1|favicon-db</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\favicon-db</td><td>1</td><td/></row>
		<row><td>fgrep.exe</td><td>fgrep.exe</td><td>fgrep.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\fgrep.exe</td><td>1</td><td/></row>
		<row><td>file.exe</td><td>file.exe</td><td>file.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\file.exe</td><td>1</td><td/></row>
		<row><td>file_5.04_1_msys_1.0.13_bin.</td><td>ISX_DEFAULTCOMPONENT26</td><td>FILE-5~1.LZM|file-5.04-1-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\file-5.04-1-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>find.exe</td><td>find.exe</td><td>find.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\find.exe</td><td>1</td><td/></row>
		<row><td>findutils_4.4.2_2_msys_1.0.1</td><td>ISX_DEFAULTCOMPONENT26</td><td>FINDUT~1.LZM|findutils-4.4.2-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\findutils-4.4.2-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>finger.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>finger.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\finger.nse</td><td>1</td><td/></row>
		<row><td>firewalk.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>firewalk.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\firewalk.nse</td><td>1</td><td/></row>
		<row><td>fold.exe</td><td>fold.exe</td><td>fold.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\fold.exe</td><td>1</td><td/></row>
		<row><td>fstab</td><td>ISX_DEFAULTCOMPONENT8</td><td>fstab</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\etc\fstab</td><td>1</td><td/></row>
		<row><td>fstab.sample</td><td>ISX_DEFAULTCOMPONENT8</td><td>FSTAB~1.SAM|fstab.sample</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\etc\fstab.sample</td><td>1</td><td/></row>
		<row><td>ftp</td><td>ISX_DEFAULTCOMPONENT7</td><td>ftp</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\ftp</td><td>1</td><td/></row>
		<row><td>ftp.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>ftp.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\ftp.lua</td><td>1</td><td/></row>
		<row><td>ftp_anon.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ftp-anon.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ftp-anon.nse</td><td>1</td><td/></row>
		<row><td>ftp_bounce.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>FTP-BO~1.NSE|ftp-bounce.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ftp-bounce.nse</td><td>1</td><td/></row>
		<row><td>ftp_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>FTP-BR~1.NSE|ftp-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ftp-brute.nse</td><td>1</td><td/></row>
		<row><td>ftp_libopie.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>FTP-LI~1.NSE|ftp-libopie.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ftp-libopie.nse</td><td>1</td><td/></row>
		<row><td>ftp_proftpd_backdoor.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>FTP-PR~1.NSE|ftp-proftpd-backdoor.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ftp-proftpd-backdoor.nse</td><td>1</td><td/></row>
		<row><td>ftrans.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>ftrans.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\ftrans.awk</td><td>1</td><td/></row>
		<row><td>gawk.exe</td><td>gawk.exe</td><td>gawk.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\gawk.exe</td><td>1</td><td/></row>
		<row><td>gawk_3.1.7.exe</td><td>gawk_3.1.7.exe</td><td>GAWK-3~1.EXE|gawk-3.1.7.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\gawk-3.1.7.exe</td><td>1</td><td/></row>
		<row><td>gawk_3.1.7_2_msys_1.0.13_bin</td><td>ISX_DEFAULTCOMPONENT26</td><td>GAWK-3~1.LZM|gawk-3.1.7-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\gawk-3.1.7-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>getopt.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>getopt.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\getopt.awk</td><td>1</td><td/></row>
		<row><td>gettime.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>gettime.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\gettime.awk</td><td>1</td><td/></row>
		<row><td>giop.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>giop.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\giop.lua</td><td>1</td><td/></row>
		<row><td>giop_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>GIOP-I~1.NSE|giop-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\giop-info.nse</td><td>1</td><td/></row>
		<row><td>gopher_ls.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>GOPHER~1.NSE|gopher-ls.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\gopher-ls.nse</td><td>1</td><td/></row>
		<row><td>gplv3.rtf</td><td>ISX_DEFAULTCOMPONENT40</td><td>gplv3.rtf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\gplv3.rtf</td><td>1</td><td/></row>
		<row><td>grcat.exe</td><td>grcat.exe</td><td>grcat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\sbin\awk\grcat.exe</td><td>1</td><td/></row>
		<row><td>grep.exe</td><td>grep.exe</td><td>grep.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\grep.exe</td><td>1</td><td/></row>
		<row><td>grep_2.5.4_2_msys_1.0.13_bin</td><td>ISX_DEFAULTCOMPONENT26</td><td>GREP-2~1.LZM|grep-2.5.4-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\grep-2.5.4-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>group.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>group.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\group.awk</td><td>1</td><td/></row>
		<row><td>gui.exe</td><td>gui.exe</td><td>gui.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\libexec\mingw-get\gui.exe</td><td>1</td><td/></row>
		<row><td>gunzip</td><td>ISX_DEFAULTCOMPONENT7</td><td>gunzip</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\gunzip</td><td>1</td><td/></row>
		<row><td>gzexe</td><td>ISX_DEFAULTCOMPONENT7</td><td>gzexe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\gzexe</td><td>1</td><td/></row>
		<row><td>gzip.exe</td><td>gzip.exe</td><td>gzip.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\gzip.exe</td><td>1</td><td/></row>
		<row><td>gzip_1.3.12_2_msys_1.0.13_bi</td><td>ISX_DEFAULTCOMPONENT26</td><td>GZIP-1~1.LZM|gzip-1.3.12-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\gzip-1.3.12-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>hddtemp_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HDDTEM~1.NSE|hddtemp-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\hddtemp-info.nse</td><td>1</td><td/></row>
		<row><td>head.exe</td><td>head.exe</td><td>head.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\head.exe</td><td>1</td><td/></row>
		<row><td>hostmap.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>hostmap.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\hostmap.nse</td><td>1</td><td/></row>
		<row><td>http.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>http.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\http.lua</td><td>1</td><td/></row>
		<row><td>http_auth.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-A~1.NSE|http-auth.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-auth.nse</td><td>1</td><td/></row>
		<row><td>http_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-B~1.NSE|http-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-brute.nse</td><td>1</td><td/></row>
		<row><td>http_date.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-D~1.NSE|http-date.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-date.nse</td><td>1</td><td/></row>
		<row><td>http_domino_enum_passwords.n</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-D~1.NSE|http-domino-enum-passwords.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-domino-enum-passwords.nse</td><td>1</td><td/></row>
		<row><td>http_enum.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-E~1.NSE|http-enum.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-enum.nse</td><td>1</td><td/></row>
		<row><td>http_favicon.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-F~1.NSE|http-favicon.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-favicon.nse</td><td>1</td><td/></row>
		<row><td>http_fingerprints.lua</td><td>ISX_DEFAULTCOMPONENT35</td><td>HTTP-F~1.LUA|http-fingerprints.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\http-fingerprints.lua</td><td>1</td><td/></row>
		<row><td>http_folders.txt</td><td>ISX_DEFAULTCOMPONENT35</td><td>HTTP-F~1.TXT|http-folders.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\http-folders.txt</td><td>1</td><td/></row>
		<row><td>http_form_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-F~1.NSE|http-form-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-form-brute.nse</td><td>1</td><td/></row>
		<row><td>http_headers.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-H~1.NSE|http-headers.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-headers.nse</td><td>1</td><td/></row>
		<row><td>http_iis_webdav_vuln.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-I~1.NSE|http-iis-webdav-vuln.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-iis-webdav-vuln.nse</td><td>1</td><td/></row>
		<row><td>http_malware_host.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-M~1.NSE|http-malware-host.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-malware-host.nse</td><td>1</td><td/></row>
		<row><td>http_methods.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-M~1.NSE|http-methods.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-methods.nse</td><td>1</td><td/></row>
		<row><td>http_open_proxy.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-O~1.NSE|http-open-proxy.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-open-proxy.nse</td><td>1</td><td/></row>
		<row><td>http_passwd.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-P~1.NSE|http-passwd.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-passwd.nse</td><td>1</td><td/></row>
		<row><td>http_php_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-P~1.NSE|http-php-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-php-version.nse</td><td>1</td><td/></row>
		<row><td>http_robots.txt.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-R~1.NSE|http-robots.txt.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-robots.txt.nse</td><td>1</td><td/></row>
		<row><td>http_title.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-T~1.NSE|http-title.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-title.nse</td><td>1</td><td/></row>
		<row><td>http_trace.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-T~1.NSE|http-trace.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-trace.nse</td><td>1</td><td/></row>
		<row><td>http_userdir_enum.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-U~1.NSE|http-userdir-enum.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-userdir-enum.nse</td><td>1</td><td/></row>
		<row><td>http_vhosts.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-V~1.NSE|http-vhosts.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-vhosts.nse</td><td>1</td><td/></row>
		<row><td>http_vmware_path_vuln.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>HTTP-V~1.NSE|http-vmware-path-vuln.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\http-vmware-path-vuln.nse</td><td>1</td><td/></row>
		<row><td>iax2_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>IAX2-V~1.NSE|iax2-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\iax2-version.nse</td><td>1</td><td/></row>
		<row><td>id.exe</td><td>id.exe</td><td>id.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\id.exe</td><td>1</td><td/></row>
		<row><td>igawk</td><td>ISX_DEFAULTCOMPONENT7</td><td>igawk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\igawk</td><td>1</td><td/></row>
		<row><td>imap.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>imap.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\imap.lua</td><td>1</td><td/></row>
		<row><td>imap_capabilities.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>IMAP-C~1.NSE|imap-capabilities.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\imap-capabilities.nse</td><td>1</td><td/></row>
		<row><td>info.exe</td><td>info.exe</td><td>info.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\info.exe</td><td>1</td><td/></row>
		<row><td>infokey.exe</td><td>infokey.exe</td><td>infokey.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\infokey.exe</td><td>1</td><td/></row>
		<row><td>informix.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>informix.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\informix.lua</td><td>1</td><td/></row>
		<row><td>informix_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>INFORM~1.NSE|informix-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\informix-brute.nse</td><td>1</td><td/></row>
		<row><td>informix_query.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>INFORM~1.NSE|informix-query.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\informix-query.nse</td><td>1</td><td/></row>
		<row><td>informix_tables.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>INFORM~1.NSE|informix-tables.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\informix-tables.nse</td><td>1</td><td/></row>
		<row><td>inputrc.default</td><td>ISX_DEFAULTCOMPONENT8</td><td>INPUTR~1.DEF|inputrc.default</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\etc\inputrc.default</td><td>1</td><td/></row>
		<row><td>install.exe</td><td>install.exe</td><td>install.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\install.exe</td><td>1</td><td/></row>
		<row><td>install.exe.manifest</td><td>ISX_DEFAULTCOMPONENT7</td><td>INSTAL~1.MAN|install.exe.manifest</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\install.exe.manifest</td><td>1</td><td/></row>
		<row><td>install_info.exe</td><td>install_info.exe</td><td>INSTAL~1.EXE|install-info.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\install-info.exe</td><td>1</td><td/></row>
		<row><td>install_info.exe.manifest</td><td>ISX_DEFAULTCOMPONENT7</td><td>INSTAL~1.MAN|install-info.exe.manifest</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\install-info.exe.manifest</td><td>1</td><td/></row>
		<row><td>ipidseq.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ipidseq.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ipidseq.nse</td><td>1</td><td/></row>
		<row><td>ipops.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>ipOps.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\ipOps.lua</td><td>1</td><td/></row>
		<row><td>irc_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>irc-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\irc-info.nse</td><td>1</td><td/></row>
		<row><td>irc_unrealircd_backdoor.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>IRC-UN~1.NSE|irc-unrealircd-backdoor.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\irc-unrealircd-backdoor.nse</td><td>1</td><td/></row>
		<row><td>iscsi.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>iscsi.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\iscsi.lua</td><td>1</td><td/></row>
		<row><td>iscsi_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ISCSI-~1.NSE|iscsi-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\iscsi-brute.nse</td><td>1</td><td/></row>
		<row><td>iscsi_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ISCSI-~1.NSE|iscsi-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\iscsi-info.nse</td><td>1</td><td/></row>
		<row><td>issues.txt</td><td>ISX_DEFAULTCOMPONENT40</td><td>issues.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\Rubin\Source\Projects\Session\ext\win\session\issues.txt</td><td>1</td><td/></row>
		<row><td>jdwp_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>JDWP-V~1.NSE|jdwp-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\jdwp-version.nse</td><td>1</td><td/></row>
		<row><td>join.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>join.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\join.awk</td><td>1</td><td/></row>
		<row><td>join.exe</td><td>join.exe</td><td>join.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\join.exe</td><td>1</td><td/></row>
		<row><td>json.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>json.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\json.lua</td><td>1</td><td/></row>
		<row><td>lastrites.exe</td><td>lastrites.exe</td><td>LASTRI~1.EXE|lastrites.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\libexec\mingw-get\lastrites.exe</td><td>1</td><td/></row>
		<row><td>ldap.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>ldap.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\ldap.lua</td><td>1</td><td/></row>
		<row><td>ldap_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>LDAP-B~1.NSE|ldap-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ldap-brute.nse</td><td>1</td><td/></row>
		<row><td>ldap_rootdse.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>LDAP-R~1.NSE|ldap-rootdse.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ldap-rootdse.nse</td><td>1</td><td/></row>
		<row><td>ldap_search.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>LDAP-S~1.NSE|ldap-search.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ldap-search.nse</td><td>1</td><td/></row>
		<row><td>less.exe</td><td>less.exe</td><td>less.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\less.exe</td><td>1</td><td/></row>
		<row><td>less_436_2_msys_1.0.13_bin.t</td><td>ISX_DEFAULTCOMPONENT26</td><td>LESS-4~1.LZM|less-436-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\less-436-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>lessecho.exe</td><td>lessecho.exe</td><td>lessecho.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lessecho.exe</td><td>1</td><td/></row>
		<row><td>lesskey.exe</td><td>lesskey.exe</td><td>lesskey.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lesskey.exe</td><td>1</td><td/></row>
		<row><td>lexmark_config.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>LEXMAR~1.NSE|lexmark-config.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\lexmark-config.nse</td><td>1</td><td/></row>
		<row><td>lgpl_2</td><td>ISX_DEFAULTCOMPONENT33</td><td>LGPL-2</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\licenses\LGPL-2</td><td>1</td><td/></row>
		<row><td>lgpl_2.1</td><td>ISX_DEFAULTCOMPONENT33</td><td>LGPL-2.1</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\licenses\LGPL-2.1</td><td>1</td><td/></row>
		<row><td>libeay32.dll</td><td>libeay32.dll</td><td>libeay32.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\libeay32.dll</td><td>1</td><td/></row>
		<row><td>libiconv_1.14_1_msys_1.0.17_</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBICO~1.LZM|libiconv-1.14-1-msys-1.0.17-dll-2.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\libiconv-1.14-1-msys-1.0.17-dll-2.tar.lzma</td><td>1</td><td/></row>
		<row><td>libintl.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>libintl.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\libintl.awk</td><td>1</td><td/></row>
		<row><td>libintl_0.18.1.1_1_msys_1.0.</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBINT~1.LZM|libintl-0.18.1.1-1-msys-1.0.17-dll-8.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\libintl-0.18.1.1-1-msys-1.0.17-dll-8.tar.lzma</td><td>1</td><td/></row>
		<row><td>liblzma_5.0.3_1_msys_1.0.17_</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBLZM~1.LZM|liblzma-5.0.3-1-msys-1.0.17-dll-5.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\liblzma-5.0.3-1-msys-1.0.17-dll-5.tar.lzma</td><td>1</td><td/></row>
		<row><td>libmagic_5.04_1_msys_1.0.13_</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBMAG~1.LZM|libmagic-5.04-1-msys-1.0.13-dll-1.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\libmagic-5.04-1-msys-1.0.13-dll-1.tar.lzma</td><td>1</td><td/></row>
		<row><td>libpopt_1.15_2_msys_1.0.13_d</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBPOP~1.LZM|libpopt-1.15-2-msys-1.0.13-dll-0.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\libpopt-1.15-2-msys-1.0.13-dll-0.tar.lzma</td><td>1</td><td/></row>
		<row><td>libregex_1.20090805_2_msys_1</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBREG~1.LZM|libregex-1.20090805-2-msys-1.0.13-dll-1.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\libregex-1.20090805-2-msys-1.0.13-dll-1.tar.lzma</td><td>1</td><td/></row>
		<row><td>libtermcap_0.20050421_1_2_ms</td><td>ISX_DEFAULTCOMPONENT26</td><td>LIBTER~1.LZM|libtermcap-0.20050421_1-2-msys-1.0.13-dll-0.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\libtermcap-0.20050421_1-2-msys-1.0.13-dll-0.tar.lzma</td><td>1</td><td/></row>
		<row><td>listop.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>listop.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\listop.lua</td><td>1</td><td/></row>
		<row><td>ln.exe</td><td>ln.exe</td><td>ln.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\ln.exe</td><td>1</td><td/></row>
		<row><td>lnkcnv</td><td>ISX_DEFAULTCOMPONENT7</td><td>lnkcnv</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lnkcnv</td><td>1</td><td/></row>
		<row><td>ls.exe</td><td>ls.exe</td><td>ls.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\ls.exe</td><td>1</td><td/></row>
		<row><td>lzcat.exe</td><td>lzcat.exe</td><td>lzcat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzcat.exe</td><td>1</td><td/></row>
		<row><td>lzcmp</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzcmp</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzcmp</td><td>1</td><td/></row>
		<row><td>lzdiff</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzdiff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzdiff</td><td>1</td><td/></row>
		<row><td>lzegrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzegrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzegrep</td><td>1</td><td/></row>
		<row><td>lzfgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzfgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzfgrep</td><td>1</td><td/></row>
		<row><td>lzgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzgrep</td><td>1</td><td/></row>
		<row><td>lzless</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzless</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzless</td><td>1</td><td/></row>
		<row><td>lzma.exe</td><td>lzma.exe</td><td>lzma.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzma.exe</td><td>1</td><td/></row>
		<row><td>lzmadec.exe</td><td>lzmadec.exe</td><td>lzmadec.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzmadec.exe</td><td>1</td><td/></row>
		<row><td>lzmainfo.exe</td><td>lzmainfo.exe</td><td>lzmainfo.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzmainfo.exe</td><td>1</td><td/></row>
		<row><td>lzmore</td><td>ISX_DEFAULTCOMPONENT7</td><td>lzmore</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\lzmore</td><td>1</td><td/></row>
		<row><td>magic.mgc</td><td>ISX_DEFAULTCOMPONENT16</td><td>magic.mgc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\misc\magic.mgc</td><td>1</td><td/></row>
		<row><td>make.exe</td><td>make.exe</td><td>make.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\make.exe</td><td>1</td><td/></row>
		<row><td>make_3.81_3_msys_1.0.13_bin.</td><td>ISX_DEFAULTCOMPONENT26</td><td>MAKE-3~1.LZM|make-3.81-3-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\make-3.81-3-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>makeinfo.exe</td><td>makeinfo.exe</td><td>makeinfo.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\makeinfo.exe</td><td>1</td><td/></row>
		<row><td>manifest_0_035_2745_6a4314.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-035-2745-6a4314.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-035-2745-6a4314.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_035_452f_e0e19d.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-035-452f-e0e19d.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-035-452f-e0e19d.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_035_6b29_e1f328.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-035-6b29-e1f328.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-035-6b29-e1f328.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_036_01d9_28bfa1.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-036-01d9-28bfa1.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-036-01d9-28bfa1.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_036_52ba_e1fa99.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-036-52ba-e1fa99.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-036-52ba-e1fa99.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_036_8366_7ada49.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-036-8366-7ada49.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-036-8366-7ada49.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_037_0709_9f68c5.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-037-0709-9f68c5.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-037-0709-9f68c5.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_037_27a2_415068.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-037-27a2-415068.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-037-27a2-415068.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_037_4379_20536b.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-037-4379-20536b.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-037-4379-20536b.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_038_3c76_94f81a.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-038-3c76-94f81a.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-038-3c76-94f81a.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_038_5995_634b6c.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-038-5995-634b6c.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-038-5995-634b6c.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_038_cd5e_e1b83a.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-038-cd5e-e1b83a.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-038-cd5e-e1b83a.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_038_e37b_d840e2.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-038-e37b-d840e2.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-038-e37b-d840e2.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_040_2c50_af8688.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-040-2c50-af8688.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-040-2c50-af8688.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_040_84bb_d21f75.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-040-84bb-d21f75.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-040-84bb-d21f75.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_040_eb2b_8f91dd.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-040-eb2b-8f91dd.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-040-eb2b-8f91dd.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_041_1813_d17935.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-041-1813-d17935.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-041-1813-d17935.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_041_b8c4_b350fa.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-041-b8c4-b350fa.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-041-b8c4-b350fa.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_2d94_79ff05.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-2d94-79ff05.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-2d94-79ff05.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_43ff_c734bc.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-43ff-c734bc.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-43ff-c734bc.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_453d_27dbac.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-453d-27dbac.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-453d-27dbac.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_5f65_d0d829.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-5f65-d0d829.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-5f65-d0d829.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_6af0_a700dc.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-6af0-a700dc.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-6af0-a700dc.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_7567_7c532c.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-7567-7c532c.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-7567-7c532c.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_a8fc_7bb6ac.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-a8fc-7bb6ac.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-a8fc-7bb6ac.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_042_b539_b602d5.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-042-b539-b602d5.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-042-b539-b602d5.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_045_e551_0d522d.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-045-e551-0d522d.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-045-e551-0d522d.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_047_72e5_12026f.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-047-72e5-12026f.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-047-72e5-12026f.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_048_1178_e1bab0.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-048-1178-e1bab0.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-048-1178-e1bab0.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_050_fa0f_8d42f0.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-050-fa0f-8d42f0.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-050-fa0f-8d42f0.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_052_9788_afe609.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-052-9788-afe609.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-052-9788-afe609.xml</td><td>1</td><td/></row>
		<row><td>manifest_0_054_a198_94876e.x</td><td>ISX_DEFAULTCOMPONENT30</td><td>MANIFE~1.XML|manifest-0-054-a198-94876e.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\manifest-0-054-a198-94876e.xml</td><td>1</td><td/></row>
		<row><td>match.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>match.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\match.lua</td><td>1</td><td/></row>
		<row><td>md5sum.exe</td><td>md5sum.exe</td><td>md5sum.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\md5sum.exe</td><td>1</td><td/></row>
		<row><td>mingw32_autoconf.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-autoconf.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-autoconf.xml</td><td>1</td><td/></row>
		<row><td>mingw32_automake.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-automake.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-automake.xml</td><td>1</td><td/></row>
		<row><td>mingw32_autotools.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-autotools.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-autotools.xml</td><td>1</td><td/></row>
		<row><td>mingw32_base.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-base.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-base.xml</td><td>1</td><td/></row>
		<row><td>mingw32_basic_bsdtar.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-basic-bsdtar.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-basic-bsdtar.xml</td><td>1</td><td/></row>
		<row><td>mingw32_binutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-binutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-binutils.xml</td><td>1</td><td/></row>
		<row><td>mingw32_bzip2.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-bzip2.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-bzip2.xml</td><td>1</td><td/></row>
		<row><td>mingw32_cygutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-cygutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-cygutils.xml</td><td>1</td><td/></row>
		<row><td>mingw32_expat.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-expat.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-expat.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gcc3.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gcc3.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gcc3.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gcc4.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gcc4.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gcc4.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gcc_tools.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gcc-tools.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gcc-tools.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gdb.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gdb.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gdb.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gendef.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gendef.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gendef.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gettext.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gettext.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gettext.xml</td><td>1</td><td/></row>
		<row><td>mingw32_gmp.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-gmp.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-gmp.xml</td><td>1</td><td/></row>
		<row><td>mingw32_libarchive.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-libarchive.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-libarchive.xml</td><td>1</td><td/></row>
		<row><td>mingw32_libiconv.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-libiconv.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-libiconv.xml</td><td>1</td><td/></row>
		<row><td>mingw32_libtool.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-libtool.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-libtool.xml</td><td>1</td><td/></row>
		<row><td>mingw32_libunistring.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-libunistring.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-libunistring.xml</td><td>1</td><td/></row>
		<row><td>mingw32_make.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-make.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-make.xml</td><td>1</td><td/></row>
		<row><td>mingw32_mgwport.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-mgwport.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-mgwport.xml</td><td>1</td><td/></row>
		<row><td>mingw32_mingw_get.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-mingw-get.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-mingw-get.xml</td><td>1</td><td/></row>
		<row><td>mingw32_mingw_utils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-mingw-utils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-mingw-utils.xml</td><td>1</td><td/></row>
		<row><td>mingw32_mpc.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-mpc.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-mpc.xml</td><td>1</td><td/></row>
		<row><td>mingw32_mpfr.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-mpfr.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-mpfr.xml</td><td>1</td><td/></row>
		<row><td>mingw32_package_list.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-package-list.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-package-list.xml</td><td>1</td><td/></row>
		<row><td>mingw32_pdcurses.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-pdcurses.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-pdcurses.xml</td><td>1</td><td/></row>
		<row><td>mingw32_pexports.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-pexports.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-pexports.xml</td><td>1</td><td/></row>
		<row><td>mingw32_popt.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-popt.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-popt.xml</td><td>1</td><td/></row>
		<row><td>mingw32_pthreads_w32.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-pthreads-w32.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-pthreads-w32.xml</td><td>1</td><td/></row>
		<row><td>mingw32_runtime.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-runtime.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-runtime.xml</td><td>1</td><td/></row>
		<row><td>mingw32_xz.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-xz.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-xz.xml</td><td>1</td><td/></row>
		<row><td>mingw32_zlib.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW3~1.XML|mingw32-zlib.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw32-zlib.xml</td><td>1</td><td/></row>
		<row><td>mingw_developer_toolkit.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MINGW-~1.XML|mingw-developer-toolkit.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\mingw-developer-toolkit.xml</td><td>1</td><td/></row>
		<row><td>mingw_get.exe</td><td>mingw_get.exe</td><td>MINGW-~1.EXE|mingw-get.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\bin\mingw-get.exe</td><td>1</td><td/></row>
		<row><td>mingw_get_0.4_mingw32_alpha_</td><td>ISX_DEFAULTCOMPONENT26</td><td>MINGW-~1.XZ|mingw-get-0.4-mingw32-alpha-1-bin.tar.xz</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\mingw-get-0.4-mingw32-alpha-1-bin.tar.xz</td><td>1</td><td/></row>
		<row><td>mingw_get_0.4_mingw32_alpha_1</td><td>ISX_DEFAULTCOMPONENT26</td><td>MINGW-~1.XZ|mingw-get-0.4-mingw32-alpha-1-lic.tar.xz</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\mingw-get-0.4-mingw32-alpha-1-lic.tar.xz</td><td>1</td><td/></row>
		<row><td>mingw_get_0.dll</td><td>mingw_get_0.dll</td><td>MINGW-~1.DLL|mingw-get-0.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\libexec\mingw-get\mingw-get-0.dll</td><td>1</td><td/></row>
		<row><td>mingw_get_log.orig.txt</td><td>ISX_DEFAULTCOMPONENT31</td><td>MINGW-~1.TXT|mingw-get-log.orig.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\log\mingw-get-log.orig.txt</td><td>1</td><td/></row>
		<row><td>mingw_get_log.txt</td><td>ISX_DEFAULTCOMPONENT31</td><td>MINGW-~1.TXT|mingw-get-log.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\log\mingw-get-log.txt</td><td>1</td><td/></row>
		<row><td>mkdir.exe</td><td>mkdir.exe</td><td>mkdir.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\mkdir.exe</td><td>1</td><td/></row>
		<row><td>modbus_discover.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MODBUS~1.NSE|modbus-discover.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\modbus-discover.nse</td><td>1</td><td/></row>
		<row><td>mongodb.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>mongodb.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\mongodb.lua</td><td>1</td><td/></row>
		<row><td>mongodb_databases.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MONGOD~1.NSE|mongodb-databases.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mongodb-databases.nse</td><td>1</td><td/></row>
		<row><td>mongodb_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MONGOD~1.NSE|mongodb-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mongodb-info.nse</td><td>1</td><td/></row>
		<row><td>mount</td><td>ISX_DEFAULTCOMPONENT7</td><td>mount</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\mount</td><td>1</td><td/></row>
		<row><td>mpl_1.1</td><td>ISX_DEFAULTCOMPONENT33</td><td>MPL-1.1</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\licenses\MPL-1.1</td><td>1</td><td/></row>
		<row><td>ms_sql_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-brute.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_config.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-config.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-config.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_empty_password.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-empty-password.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-empty-password.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_hasdbaccess.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-hasdbaccess.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-hasdbaccess.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-info.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_query.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-query.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-query.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_tables.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-tables.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-tables.nse</td><td>1</td><td/></row>
		<row><td>ms_sql_xp_cmdshell.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MS-SQL~1.NSE|ms-sql-xp-cmdshell.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ms-sql-xp-cmdshell.nse</td><td>1</td><td/></row>
		<row><td>msrpc.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>msrpc.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\msrpc.lua</td><td>1</td><td/></row>
		<row><td>msrpcperformance.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>MSRPCP~1.LUA|msrpcperformance.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\msrpcperformance.lua</td><td>1</td><td/></row>
		<row><td>msrpctypes.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>MSRPCT~1.LUA|msrpctypes.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\msrpctypes.lua</td><td>1</td><td/></row>
		<row><td>mssql.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>mssql.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\mssql.lua</td><td>1</td><td/></row>
		<row><td>msys_1.0.dll</td><td>msys_1.0.dll</td><td>MSYS-1~1.DLL|msys-1.0.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-1.0.dll</td><td>1</td><td/></row>
		<row><td>msys_autoconf.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-A~1.XML|msys-autoconf.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-autoconf.xml</td><td>1</td><td/></row>
		<row><td>msys_autogen.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-A~1.XML|msys-autogen.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-autogen.xml</td><td>1</td><td/></row>
		<row><td>msys_automake.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-A~1.XML|msys-automake.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-automake.xml</td><td>1</td><td/></row>
		<row><td>msys_base.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-B~1.XML|msys-base.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-base.xml</td><td>1</td><td/></row>
		<row><td>msys_bash.profile</td><td>ISX_DEFAULTCOMPONENT40</td><td>MSYS-B~1.PRO|msys-bash.profile</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\msys-bash.profile</td><td>1</td><td/></row>
		<row><td>msys_bash.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-B~1.XML|msys-bash.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-bash.xml</td><td>1</td><td/></row>
		<row><td>msys_binutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-B~1.XML|msys-binutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-binutils.xml</td><td>1</td><td/></row>
		<row><td>msys_bison.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-B~1.XML|msys-bison.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-bison.xml</td><td>1</td><td/></row>
		<row><td>msys_bzip2.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-B~1.XML|msys-bzip2.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-bzip2.xml</td><td>1</td><td/></row>
		<row><td>msys_console.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-C~1.XML|msys-console.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-console.xml</td><td>1</td><td/></row>
		<row><td>msys_core.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-C~1.XML|msys-core.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-core.xml</td><td>1</td><td/></row>
		<row><td>msys_coreutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-C~1.XML|msys-coreutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-coreutils.xml</td><td>1</td><td/></row>
		<row><td>msys_crypt.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-C~1.XML|msys-crypt.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-crypt.xml</td><td>1</td><td/></row>
		<row><td>msys_cvs.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-cvs.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-cvs.xml</td><td>1</td><td/></row>
		<row><td>msys_cygutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-C~1.XML|msys-cygutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-cygutils.xml</td><td>1</td><td/></row>
		<row><td>msys_dash.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-D~1.XML|msys-dash.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-dash.xml</td><td>1</td><td/></row>
		<row><td>msys_diffstat.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-D~1.XML|msys-diffstat.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-diffstat.xml</td><td>1</td><td/></row>
		<row><td>msys_diffutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-D~1.XML|msys-diffutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-diffutils.xml</td><td>1</td><td/></row>
		<row><td>msys_expat.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-E~1.XML|msys-expat.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-expat.xml</td><td>1</td><td/></row>
		<row><td>msys_file.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-F~1.XML|msys-file.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-file.xml</td><td>1</td><td/></row>
		<row><td>msys_findutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-F~1.XML|msys-findutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-findutils.xml</td><td>1</td><td/></row>
		<row><td>msys_flex.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-F~1.XML|msys-flex.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-flex.xml</td><td>1</td><td/></row>
		<row><td>msys_gawk.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-gawk.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-gawk.xml</td><td>1</td><td/></row>
		<row><td>msys_gcc.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-gcc.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-gcc.xml</td><td>1</td><td/></row>
		<row><td>msys_gdbm.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-gdbm.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-gdbm.xml</td><td>1</td><td/></row>
		<row><td>msys_gettext.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-gettext.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-gettext.xml</td><td>1</td><td/></row>
		<row><td>msys_gmp.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-gmp.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-gmp.xml</td><td>1</td><td/></row>
		<row><td>msys_grep.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-grep.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-grep.xml</td><td>1</td><td/></row>
		<row><td>msys_groff.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-groff.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-groff.xml</td><td>1</td><td/></row>
		<row><td>msys_guile.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-guile.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-guile.xml</td><td>1</td><td/></row>
		<row><td>msys_gzip.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-G~1.XML|msys-gzip.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-gzip.xml</td><td>1</td><td/></row>
		<row><td>msys_help2man.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-H~1.XML|msys-help2man.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-help2man.xml</td><td>1</td><td/></row>
		<row><td>msys_iconv_2.dll</td><td>msys_iconv_2.dll</td><td>MSYS-I~1.DLL|msys-iconv-2.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-iconv-2.dll</td><td>1</td><td/></row>
		<row><td>msys_inetutils.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-I~1.XML|msys-inetutils.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-inetutils.xml</td><td>1</td><td/></row>
		<row><td>msys_intl_8.dll</td><td>msys_intl_8.dll</td><td>MSYS-I~1.DLL|msys-intl-8.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-intl-8.dll</td><td>1</td><td/></row>
		<row><td>msys_less.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-less.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-less.xml</td><td>1</td><td/></row>
		<row><td>msys_libarchive.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-libarchive.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-libarchive.xml</td><td>1</td><td/></row>
		<row><td>msys_libiconv.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-libiconv.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-libiconv.xml</td><td>1</td><td/></row>
		<row><td>msys_libtool.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-libtool.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-libtool.xml</td><td>1</td><td/></row>
		<row><td>msys_libxml2.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-libxml2.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-libxml2.xml</td><td>1</td><td/></row>
		<row><td>msys_license.rtf</td><td>ISX_DEFAULTCOMPONENT15</td><td>MSYS_L~1.RTF|MSYS_LICENSE.rtf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\MSYS_LICENSE.rtf</td><td>1</td><td/></row>
		<row><td>msys_lndir.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-lndir.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-lndir.xml</td><td>1</td><td/></row>
		<row><td>msys_lpr_enhanced.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-L~1.XML|msys-lpr-enhanced.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-lpr-enhanced.xml</td><td>1</td><td/></row>
		<row><td>msys_lzma_5.dll</td><td>msys_lzma_5.dll</td><td>MSYS-L~1.DLL|msys-lzma-5.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-lzma-5.dll</td><td>1</td><td/></row>
		<row><td>msys_m4.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-m4.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-m4.xml</td><td>1</td><td/></row>
		<row><td>msys_magic_1.dll</td><td>msys_magic_1.dll</td><td>MSYS-M~1.DLL|msys-magic-1.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-magic-1.dll</td><td>1</td><td/></row>
		<row><td>msys_make.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-M~1.XML|msys-make.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-make.xml</td><td>1</td><td/></row>
		<row><td>msys_man.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-man.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-man.xml</td><td>1</td><td/></row>
		<row><td>msys_minires.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-M~1.XML|msys-minires.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-minires.xml</td><td>1</td><td/></row>
		<row><td>msys_mintty.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-M~1.XML|msys-mintty.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-mintty.xml</td><td>1</td><td/></row>
		<row><td>msys_mission</td><td>ISX_DEFAULTCOMPONENT15</td><td>MSYS_M~1|MSYS_MISSION</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\MSYS_MISSION</td><td>1</td><td/></row>
		<row><td>msys_mksh.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-M~1.XML|msys-mksh.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-mksh.xml</td><td>1</td><td/></row>
		<row><td>msys_mktemp.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-M~1.XML|msys-mktemp.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-mktemp.xml</td><td>1</td><td/></row>
		<row><td>msys_openssh.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-O~1.XML|msys-openssh.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-openssh.xml</td><td>1</td><td/></row>
		<row><td>msys_openssl.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-O~1.XML|msys-openssl.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-openssl.xml</td><td>1</td><td/></row>
		<row><td>msys_package_list.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-P~1.XML|msys-package-list.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-package-list.xml</td><td>1</td><td/></row>
		<row><td>msys_patch.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-P~1.XML|msys-patch.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-patch.xml</td><td>1</td><td/></row>
		<row><td>msys_perl.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-P~1.XML|msys-perl.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-perl.xml</td><td>1</td><td/></row>
		<row><td>msys_popt.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-P~1.XML|msys-popt.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-popt.xml</td><td>1</td><td/></row>
		<row><td>msys_popt_0.dll</td><td>msys_popt_0.dll</td><td>MSYS-P~1.DLL|msys-popt-0.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-popt-0.dll</td><td>1</td><td/></row>
		<row><td>msys_rebase.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-R~1.XML|msys-rebase.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-rebase.xml</td><td>1</td><td/></row>
		<row><td>msys_regex.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-R~1.XML|msys-regex.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-regex.xml</td><td>1</td><td/></row>
		<row><td>msys_regex_1.dll</td><td>msys_regex_1.dll</td><td>MSYS-R~1.DLL|msys-regex-1.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-regex-1.dll</td><td>1</td><td/></row>
		<row><td>msys_rsync.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-R~1.XML|msys-rsync.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-rsync.xml</td><td>1</td><td/></row>
		<row><td>msys_rxvt.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-R~1.XML|msys-rxvt.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-rxvt.xml</td><td>1</td><td/></row>
		<row><td>msys_sed.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-sed.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-sed.xml</td><td>1</td><td/></row>
		<row><td>msys_system_builder.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-S~1.XML|msys-system-builder.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-system-builder.xml</td><td>1</td><td/></row>
		<row><td>msys_tar.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-tar.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-tar.xml</td><td>1</td><td/></row>
		<row><td>msys_termcap.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-T~1.XML|msys-termcap.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-termcap.xml</td><td>1</td><td/></row>
		<row><td>msys_termcap_0.dll</td><td>msys_termcap_0.dll</td><td>MSYS-T~1.DLL|msys-termcap-0.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-termcap-0.dll</td><td>1</td><td/></row>
		<row><td>msys_texinfo.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-T~1.XML|msys-texinfo.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-texinfo.xml</td><td>1</td><td/></row>
		<row><td>msys_unzip.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-U~1.XML|msys-unzip.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-unzip.xml</td><td>1</td><td/></row>
		<row><td>msys_vim.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-vim.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-vim.xml</td><td>1</td><td/></row>
		<row><td>msys_vs_cygwin</td><td>ISX_DEFAULTCOMPONENT15</td><td>MSYS_V~1|MSYS_VS_CYGWIN</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\MSYS_VS_CYGWIN</td><td>1</td><td/></row>
		<row><td>msys_w32api.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-W~1.XML|msys-w32api.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-w32api.xml</td><td>1</td><td/></row>
		<row><td>msys_welcome.rtf</td><td>ISX_DEFAULTCOMPONENT15</td><td>MSYS_W~1.RTF|MSYS_WELCOME.rtf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\MSYS_WELCOME.rtf</td><td>1</td><td/></row>
		<row><td>msys_wget.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-W~1.XML|msys-wget.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-wget.xml</td><td>1</td><td/></row>
		<row><td>msys_xz.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-xz.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-xz.xml</td><td>1</td><td/></row>
		<row><td>msys_z.dll</td><td>msys_z.dll</td><td>msys-z.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msys-z.dll</td><td>1</td><td/></row>
		<row><td>msys_zip.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>msys-zip.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-zip.xml</td><td>1</td><td/></row>
		<row><td>msys_zlib.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>MSYS-Z~1.XML|msys-zlib.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\msys-zlib.xml</td><td>1</td><td/></row>
		<row><td>msyscore_1.0.17_1_msys_1.0.1</td><td>ISX_DEFAULTCOMPONENT26</td><td>MSYSCO~1.LZM|msysCORE-1.0.17-1-msys-1.0.17-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\msysCORE-1.0.17-1-msys-1.0.17-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>msyscore_1.0.17_1_msys_1.0.11</td><td>ISX_DEFAULTCOMPONENT26</td><td>MSYSCO~1.LZM|msysCORE-1.0.17-1-msys-1.0.17-doc.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\msysCORE-1.0.17-1-msys-1.0.17-doc.tar.lzma</td><td>1</td><td/></row>
		<row><td>msyscore_1.0.17_1_msys_1.0.12</td><td>ISX_DEFAULTCOMPONENT26</td><td>MSYSCO~1.LZM|msysCORE-1.0.17-1-msys-1.0.17-ext.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\msysCORE-1.0.17-1-msys-1.0.17-ext.tar.lzma</td><td>1</td><td/></row>
		<row><td>msyscore_1.0.17_1_msys_1.0.13</td><td>ISX_DEFAULTCOMPONENT26</td><td>MSYSCO~1.LZM|msysCORE-1.0.17-1-msys-1.0.17-lic.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\msysCORE-1.0.17-1-msys-1.0.17-lic.tar.lzma</td><td>1</td><td/></row>
		<row><td>msyscore_1.0.17_1_msys_relea</td><td>ISX_DEFAULTCOMPONENT15</td><td>MSYSCO~1.TXT|msysCORE-1.0.17-1-msys-RELEASE_NOTES.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\msysCORE-1.0.17-1-msys-RELEASE_NOTES.txt</td><td>1</td><td/></row>
		<row><td>msysinfo</td><td>ISX_DEFAULTCOMPONENT7</td><td>msysinfo</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msysinfo</td><td>1</td><td/></row>
		<row><td>msysmnt.exe</td><td>msysmnt.exe</td><td>msysmnt.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\msysmnt.exe</td><td>1</td><td/></row>
		<row><td>mv.exe</td><td>mv.exe</td><td>mv.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\mv.exe</td><td>1</td><td/></row>
		<row><td>mysql.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>mysql.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\mysql.lua</td><td>1</td><td/></row>
		<row><td>mysql_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MYSQL-~1.NSE|mysql-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mysql-brute.nse</td><td>1</td><td/></row>
		<row><td>mysql_databases.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MYSQL-~1.NSE|mysql-databases.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mysql-databases.nse</td><td>1</td><td/></row>
		<row><td>mysql_empty_password.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MYSQL-~1.NSE|mysql-empty-password.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mysql-empty-password.nse</td><td>1</td><td/></row>
		<row><td>mysql_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MYSQL-~1.NSE|mysql-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mysql-info.nse</td><td>1</td><td/></row>
		<row><td>mysql_users.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MYSQL-~1.NSE|mysql-users.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mysql-users.nse</td><td>1</td><td/></row>
		<row><td>mysql_variables.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>MYSQL-~1.NSE|mysql-variables.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\mysql-variables.nse</td><td>1</td><td/></row>
		<row><td>nat_pmp_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NAT-PM~1.NSE|nat-pmp-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\nat-pmp-info.nse</td><td>1</td><td/></row>
		<row><td>nbstat.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>nbstat.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\nbstat.nse</td><td>1</td><td/></row>
		<row><td>ncat.exe</td><td>ncat.exe</td><td>ncat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\ncat.exe</td><td>1</td><td/></row>
		<row><td>ndiff.bat</td><td>ISX_DEFAULTCOMPONENT32</td><td>ndiff.bat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\ndiff.bat</td><td>1</td><td/></row>
		<row><td>ndiff.py</td><td>ISX_DEFAULTCOMPONENT32</td><td>ndiff.py</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\ndiff.py</td><td>1</td><td/></row>
		<row><td>netbios.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>netbios.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\netbios.lua</td><td>1</td><td/></row>
		<row><td>netbus_auth_bypass.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NETBUS~1.NSE|netbus-auth-bypass.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\netbus-auth-bypass.nse</td><td>1</td><td/></row>
		<row><td>netbus_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NETBUS~1.NSE|netbus-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\netbus-brute.nse</td><td>1</td><td/></row>
		<row><td>netbus_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NETBUS~1.NSE|netbus-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\netbus-info.nse</td><td>1</td><td/></row>
		<row><td>netbus_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NETBUS~1.NSE|netbus-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\netbus-version.nse</td><td>1</td><td/></row>
		<row><td>network.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>network.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\network.lua</td><td>1</td><td/></row>
		<row><td>nextfile.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>nextfile.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\nextfile.awk</td><td>1</td><td/></row>
		<row><td>nfs_ls.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>nfs-ls.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\nfs-ls.nse</td><td>1</td><td/></row>
		<row><td>nfs_showmount.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NFS-SH~1.NSE|nfs-showmount.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\nfs-showmount.nse</td><td>1</td><td/></row>
		<row><td>nfs_statfs.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NFS-ST~1.NSE|nfs-statfs.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\nfs-statfs.nse</td><td>1</td><td/></row>
		<row><td>nmap.exe</td><td>nmap.exe</td><td>nmap.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap.exe</td><td>1</td><td/></row>
		<row><td>nmap.luadoc</td><td>ISX_DEFAULTCOMPONENT34</td><td>NMAP~1.LUA|nmap.luadoc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\nmap.luadoc</td><td>1</td><td/></row>
		<row><td>nmap.xsl</td><td>ISX_DEFAULTCOMPONENT32</td><td>nmap.xsl</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap.xsl</td><td>1</td><td/></row>
		<row><td>nmap_mac_prefixes</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP-M~1|nmap-mac-prefixes</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-mac-prefixes</td><td>1</td><td/></row>
		<row><td>nmap_os_db</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP-O~1|nmap-os-db</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-os-db</td><td>1</td><td/></row>
		<row><td>nmap_payloads</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP-P~1|nmap-payloads</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-payloads</td><td>1</td><td/></row>
		<row><td>nmap_performance.reg</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP_P~1.REG|nmap_performance.reg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap_performance.reg</td><td>1</td><td/></row>
		<row><td>nmap_protocols</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP-P~1|nmap-protocols</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-protocols</td><td>1</td><td/></row>
		<row><td>nmap_rpc</td><td>ISX_DEFAULTCOMPONENT32</td><td>nmap-rpc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-rpc</td><td>1</td><td/></row>
		<row><td>nmap_service.c</td><td>ISX_DEFAULTCOMPONENT36</td><td>NMAP_S~1.C|nmap_service.c</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\nmap_service.c</td><td>1</td><td/></row>
		<row><td>nmap_service.vcproj</td><td>ISX_DEFAULTCOMPONENT36</td><td>NMAP_S~1.VCP|nmap_service.vcproj</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\nmap_service.vcproj</td><td>1</td><td/></row>
		<row><td>nmap_service_probes</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP-S~1|nmap-service-probes</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-service-probes</td><td>1</td><td/></row>
		<row><td>nmap_services</td><td>ISX_DEFAULTCOMPONENT32</td><td>NMAP-S~1|nmap-services</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nmap-services</td><td>1</td><td/></row>
		<row><td>noassign.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>noassign.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\noassign.awk</td><td>1</td><td/></row>
		<row><td>nping.exe</td><td>nping.exe</td><td>nping.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nping.exe</td><td>1</td><td/></row>
		<row><td>nrpc.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>nrpc.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\nrpc.lua</td><td>1</td><td/></row>
		<row><td>nrpe_enum.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NRPE-E~1.NSE|nrpe-enum.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\nrpe-enum.nse</td><td>1</td><td/></row>
		<row><td>nse_main.lua</td><td>ISX_DEFAULTCOMPONENT32</td><td>nse_main.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nse_main.lua</td><td>1</td><td/></row>
		<row><td>nsedebug.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>nsedebug.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\nsedebug.lua</td><td>1</td><td/></row>
		<row><td>ntp_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ntp-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ntp-info.nse</td><td>1</td><td/></row>
		<row><td>ntp_monlist.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>NTP-MO~1.NSE|ntp-monlist.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ntp-monlist.nse</td><td>1</td><td/></row>
		<row><td>od.exe</td><td>od.exe</td><td>od.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\od.exe</td><td>1</td><td/></row>
		<row><td>oldfind.exe</td><td>oldfind.exe</td><td>oldfind.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\oldfind.exe</td><td>1</td><td/></row>
		<row><td>openssl.luadoc</td><td>ISX_DEFAULTCOMPONENT34</td><td>OPENSS~1.LUA|openssl.luadoc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\openssl.luadoc</td><td>1</td><td/></row>
		<row><td>openssl.txt</td><td>ISX_DEFAULTCOMPONENT33</td><td>OpenSSL.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\licenses\OpenSSL.txt</td><td>1</td><td/></row>
		<row><td>oracle_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ORACLE~1.NSE|oracle-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\oracle-brute.nse</td><td>1</td><td/></row>
		<row><td>oracle_enum_users.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ORACLE~1.NSE|oracle-enum-users.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\oracle-enum-users.nse</td><td>1</td><td/></row>
		<row><td>oracle_sid_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ORACLE~1.NSE|oracle-sid-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\oracle-sid-brute.nse</td><td>1</td><td/></row>
		<row><td>oracle_sids</td><td>ISX_DEFAULTCOMPONENT35</td><td>ORACLE~1|oracle-sids</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\oracle-sids</td><td>1</td><td/></row>
		<row><td>ord.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>ord.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\ord.awk</td><td>1</td><td/></row>
		<row><td>p2p_conficker.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>P2P-CO~1.NSE|p2p-conficker.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\p2p-conficker.nse</td><td>1</td><td/></row>
		<row><td>package_list.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>PACKAG~1.XML|package-list.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\package-list.xml</td><td>1</td><td/></row>
		<row><td>packet.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>packet.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\packet.lua</td><td>1</td><td/></row>
		<row><td>pageant.exe</td><td>pageant.exe</td><td>pageant.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\pageant.exe</td><td>1</td><td/></row>
		<row><td>passwd.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>passwd.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\passwd.awk</td><td>1</td><td/></row>
		<row><td>passwords.lst</td><td>ISX_DEFAULTCOMPONENT35</td><td>PASSWO~1.LST|passwords.lst</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\passwords.lst</td><td>1</td><td/></row>
		<row><td>paste.exe</td><td>paste.exe</td><td>paste.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\paste.exe</td><td>1</td><td/></row>
		<row><td>path_mtu.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>path-mtu.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\path-mtu.nse</td><td>1</td><td/></row>
		<row><td>pcre.luadoc</td><td>ISX_DEFAULTCOMPONENT34</td><td>PCRE~1.LUA|pcre.luadoc</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\pcre.luadoc</td><td>1</td><td/></row>
		<row><td>pdftexi2dvi</td><td>ISX_DEFAULTCOMPONENT7</td><td>PDFTEX~1|pdftexi2dvi</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\pdftexi2dvi</td><td>1</td><td/></row>
		<row><td>pgawk.exe</td><td>pgawk.exe</td><td>pgawk.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\pgawk.exe</td><td>1</td><td/></row>
		<row><td>pgawk_3.1.7.exe</td><td>pgawk_3.1.7.exe</td><td>PGAWK-~1.EXE|pgawk-3.1.7.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\pgawk-3.1.7.exe</td><td>1</td><td/></row>
		<row><td>pgsql.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>pgsql.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\pgsql.lua</td><td>1</td><td/></row>
		<row><td>pgsql_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>PGSQL-~1.NSE|pgsql-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\pgsql-brute.nse</td><td>1</td><td/></row>
		<row><td>pi.bat</td><td>ISX_DEFAULTCOMPONENT9</td><td>pi.bat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\postinstall\pi.bat</td><td>1</td><td/></row>
		<row><td>pi.sh</td><td>ISX_DEFAULTCOMPONENT9</td><td>pi.sh</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\postinstall\pi.sh</td><td>1</td><td/></row>
		<row><td>pjl_ready_message.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>PJL-RE~1.NSE|pjl-ready-message.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\pjl-ready-message.nse</td><td>1</td><td/></row>
		<row><td>pkginfo.exe</td><td>pkginfo.exe</td><td>pkginfo.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\bin\pkginfo.exe</td><td>1</td><td/></row>
		<row><td>pkginfo_0.4_mingw32_alpha_1_</td><td>ISX_DEFAULTCOMPONENT26</td><td>PKGINF~1.XZ|pkginfo-0.4-mingw32-alpha-1-bin.tar.xz</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\pkginfo-0.4-mingw32-alpha-1-bin.tar.xz</td><td>1</td><td/></row>
		<row><td>plink.exe</td><td>plink.exe</td><td>plink.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\plink.exe</td><td>1</td><td/></row>
		<row><td>pop3.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>pop3.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\pop3.lua</td><td>1</td><td/></row>
		<row><td>pop3_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>POP3-B~1.NSE|pop3-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\pop3-brute.nse</td><td>1</td><td/></row>
		<row><td>pop3_capabilities.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>POP3-C~1.NSE|pop3-capabilities.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\pop3-capabilities.nse</td><td>1</td><td/></row>
		<row><td>pptp_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>PPTP-V~1.NSE|pptp-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\pptp-version.nse</td><td>1</td><td/></row>
		<row><td>printf.exe</td><td>printf.exe</td><td>printf.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\printf.exe</td><td>1</td><td/></row>
		<row><td>profile</td><td>ISX_DEFAULTCOMPONENT8</td><td>profile</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\etc\profile</td><td>1</td><td/></row>
		<row><td>profile.xml</td><td>ISX_DEFAULTCOMPONENT30</td><td>profile.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\profile.xml</td><td>1</td><td/></row>
		<row><td>proxy.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>proxy.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\proxy.lua</td><td>1</td><td/></row>
		<row><td>ps.exe</td><td>ps.exe</td><td>ps.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\ps.exe</td><td>1</td><td/></row>
		<row><td>pscp.exe</td><td>pscp.exe</td><td>pscp.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\pscp.exe</td><td>1</td><td/></row>
		<row><td>psexec.exe</td><td>psexec.exe</td><td>psexec.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\pstools\psexec.exe</td><td>1</td><td/></row>
		<row><td>psftp.exe</td><td>psftp.exe</td><td>psftp.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\psftp.exe</td><td>1</td><td/></row>
		<row><td>psversion.txt</td><td>ISX_DEFAULTCOMPONENT38</td><td>PSVERS~1.TXT|psversion.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\pstools\psversion.txt</td><td>1</td><td/></row>
		<row><td>putty.chm</td><td>putty.chm</td><td>putty.chm</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\putty.chm</td><td>1</td><td/></row>
		<row><td>putty.cnt</td><td>ISX_DEFAULTCOMPONENT39</td><td>putty.cnt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\putty.cnt</td><td>1</td><td/></row>
		<row><td>putty.exe</td><td>putty.exe</td><td>putty.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\putty.exe</td><td>1</td><td/></row>
		<row><td>putty.hlp</td><td>putty.hlp</td><td>putty.hlp</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\putty.hlp</td><td>1</td><td/></row>
		<row><td>puttygen.exe</td><td>puttygen.exe</td><td>puttygen.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\putty\puttygen.exe</td><td>1</td><td/></row>
		<row><td>pwcat.exe</td><td>pwcat.exe</td><td>pwcat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\sbin\awk\pwcat.exe</td><td>1</td><td/></row>
		<row><td>pwd.exe</td><td>pwd.exe</td><td>pwd.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\pwd.exe</td><td>1</td><td/></row>
		<row><td>pwdump.lua</td><td>ISX_DEFAULTCOMPONENT36</td><td>pwdump.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\pwdump.lua</td><td>1</td><td/></row>
		<row><td>qscan.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>qscan.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\qscan.nse</td><td>1</td><td/></row>
		<row><td>rdcclient6link.url</td><td>ISX_DEFAULTCOMPONENT40</td><td>RDCCLI~1.URL|rdcclient6link.url</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\rdcclient6link.url</td><td>1</td><td/></row>
		<row><td>readable.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>readable.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\readable.awk</td><td>1</td><td/></row>
		<row><td>readme</td><td>ISX_DEFAULTCOMPONENT20</td><td>README</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\share\doc\mingw-get\README</td><td>1</td><td/></row>
		<row><td>readme.rtf</td><td>ISX_DEFAULTCOMPONENT15</td><td>README.rtf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\doc\MSYS\README.rtf</td><td>1</td><td/></row>
		<row><td>readme.txt</td><td>ISX_DEFAULTCOMPONENT</td><td>readme.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\cryptrdp5\readme.txt</td><td>1</td><td/></row>
		<row><td>readme1</td><td>ISX_DEFAULTCOMPONENT36</td><td>README</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\psexec\README</td><td>1</td><td/></row>
		<row><td>readme_win32</td><td>ISX_DEFAULTCOMPONENT32</td><td>README~1|README-WIN32</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\README-WIN32</td><td>1</td><td/></row>
		<row><td>realvnc_auth_bypass.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>REALVN~1.NSE|realvnc-auth-bypass.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\realvnc-auth-bypass.nse</td><td>1</td><td/></row>
		<row><td>resolveall.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>RESOLV~1.NSE|resolveall.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\resolveall.nse</td><td>1</td><td/></row>
		<row><td>rewind.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>rewind.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\rewind.awk</td><td>1</td><td/></row>
		<row><td>rm.exe</td><td>rm.exe</td><td>rm.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\rm.exe</td><td>1</td><td/></row>
		<row><td>rmdir.exe</td><td>rmdir.exe</td><td>rmdir.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\rmdir.exe</td><td>1</td><td/></row>
		<row><td>rmi.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>rmi.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\rmi.lua</td><td>1</td><td/></row>
		<row><td>rmi_dumpregistry.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>RMI-DU~1.NSE|rmi-dumpregistry.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\rmi-dumpregistry.nse</td><td>1</td><td/></row>
		<row><td>round.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>round.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\round.awk</td><td>1</td><td/></row>
		<row><td>rpc.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>rpc.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\rpc.lua</td><td>1</td><td/></row>
		<row><td>rpcinfo.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>rpcinfo.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\rpcinfo.nse</td><td>1</td><td/></row>
		<row><td>script.db</td><td>ISX_DEFAULTCOMPONENT37</td><td>script.db</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\script.db</td><td>1</td><td/></row>
		<row><td>sdiff.exe</td><td>sdiff.exe</td><td>sdiff.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\sdiff.exe</td><td>1</td><td/></row>
		<row><td>sed.exe</td><td>sed.exe</td><td>sed.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\sed.exe</td><td>1</td><td/></row>
		<row><td>sed_4.2.1_2_msys_1.0.13_bin.</td><td>ISX_DEFAULTCOMPONENT26</td><td>SED-42~1.LZM|sed-4.2.1-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\sed-4.2.1-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>session.sh</td><td>ISX_DEFAULTCOMPONENT40</td><td>session.sh</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session.sh</td><td>1</td><td/></row>
		<row><td>session_configure.bat</td><td>ISX_DEFAULTCOMPONENT40</td><td>SESSIO~1.BAT|session-configure.bat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-configure.bat</td><td>1</td><td/></row>
		<row><td>session_installer_icon.ico</td><td>ISX_DEFAULTCOMPONENT40</td><td>SESSIO~1.ICO|session-installer-icon.ico</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-installer-icon.ico</td><td>1</td><td/></row>
		<row><td>session_shell.bat</td><td>ISX_DEFAULTCOMPONENT40</td><td>SESSIO~1.BAT|session-shell.bat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-shell.bat</td><td>1</td><td/></row>
		<row><td>session_wrapper.bat</td><td>ISX_DEFAULTCOMPONENT40</td><td>SESSIO~1.BAT|session-wrapper.bat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-wrapper.bat</td><td>1</td><td/></row>
		<row><td>sh.exe</td><td>sh.exe</td><td>sh.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\sh.exe</td><td>1</td><td/></row>
		<row><td>shortport.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>SHORTP~1.LUA|shortport.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\shortport.lua</td><td>1</td><td/></row>
		<row><td>skypev2_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SKYPEV~1.NSE|skypev2-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\skypev2-version.nse</td><td>1</td><td/></row>
		<row><td>sleep.exe</td><td>sleep.exe</td><td>sleep.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\sleep.exe</td><td>1</td><td/></row>
		<row><td>smb.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>smb.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\smb.lua</td><td>1</td><td/></row>
		<row><td>smb_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-BR~1.NSE|smb-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-brute.nse</td><td>1</td><td/></row>
		<row><td>smb_check_vulns.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-CH~1.NSE|smb-check-vulns.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-check-vulns.nse</td><td>1</td><td/></row>
		<row><td>smb_enum_domains.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-EN~1.NSE|smb-enum-domains.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-enum-domains.nse</td><td>1</td><td/></row>
		<row><td>smb_enum_groups.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-EN~1.NSE|smb-enum-groups.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-enum-groups.nse</td><td>1</td><td/></row>
		<row><td>smb_enum_processes.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-EN~1.NSE|smb-enum-processes.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-enum-processes.nse</td><td>1</td><td/></row>
		<row><td>smb_enum_sessions.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-EN~1.NSE|smb-enum-sessions.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-enum-sessions.nse</td><td>1</td><td/></row>
		<row><td>smb_enum_shares.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-EN~1.NSE|smb-enum-shares.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-enum-shares.nse</td><td>1</td><td/></row>
		<row><td>smb_enum_users.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-EN~1.NSE|smb-enum-users.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-enum-users.nse</td><td>1</td><td/></row>
		<row><td>smb_flood.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-FL~1.NSE|smb-flood.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-flood.nse</td><td>1</td><td/></row>
		<row><td>smb_os_discovery.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-OS~1.NSE|smb-os-discovery.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-os-discovery.nse</td><td>1</td><td/></row>
		<row><td>smb_psexec.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-PS~1.NSE|smb-psexec.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-psexec.nse</td><td>1</td><td/></row>
		<row><td>smb_security_mode.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-SE~1.NSE|smb-security-mode.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-security-mode.nse</td><td>1</td><td/></row>
		<row><td>smb_server_stats.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-SE~1.NSE|smb-server-stats.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-server-stats.nse</td><td>1</td><td/></row>
		<row><td>smb_system_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMB-SY~1.NSE|smb-system-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smb-system-info.nse</td><td>1</td><td/></row>
		<row><td>smbauth.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>smbauth.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\smbauth.lua</td><td>1</td><td/></row>
		<row><td>smbv2_enabled.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMBV2-~1.NSE|smbv2-enabled.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smbv2-enabled.nse</td><td>1</td><td/></row>
		<row><td>smtp_commands.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMTP-C~1.NSE|smtp-commands.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smtp-commands.nse</td><td>1</td><td/></row>
		<row><td>smtp_enum_users.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMTP-E~1.NSE|smtp-enum-users.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smtp-enum-users.nse</td><td>1</td><td/></row>
		<row><td>smtp_open_relay.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMTP-O~1.NSE|smtp-open-relay.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smtp-open-relay.nse</td><td>1</td><td/></row>
		<row><td>smtp_strangeport.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SMTP-S~1.NSE|smtp-strangeport.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\smtp-strangeport.nse</td><td>1</td><td/></row>
		<row><td>sniffer_detect.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNIFFE~1.NSE|sniffer-detect.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\sniffer-detect.nse</td><td>1</td><td/></row>
		<row><td>snmp.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>snmp.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\snmp.lua</td><td>1</td><td/></row>
		<row><td>snmp_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-B~1.NSE|snmp-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-brute.nse</td><td>1</td><td/></row>
		<row><td>snmp_interfaces.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-I~1.NSE|snmp-interfaces.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-interfaces.nse</td><td>1</td><td/></row>
		<row><td>snmp_netstat.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-N~1.NSE|snmp-netstat.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-netstat.nse</td><td>1</td><td/></row>
		<row><td>snmp_processes.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-P~1.NSE|snmp-processes.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-processes.nse</td><td>1</td><td/></row>
		<row><td>snmp_sysdescr.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-S~1.NSE|snmp-sysdescr.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-sysdescr.nse</td><td>1</td><td/></row>
		<row><td>snmp_win32_services.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-W~1.NSE|snmp-win32-services.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-win32-services.nse</td><td>1</td><td/></row>
		<row><td>snmp_win32_shares.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-W~1.NSE|snmp-win32-shares.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-win32-shares.nse</td><td>1</td><td/></row>
		<row><td>snmp_win32_software.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-W~1.NSE|snmp-win32-software.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-win32-software.nse</td><td>1</td><td/></row>
		<row><td>snmp_win32_users.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SNMP-W~1.NSE|snmp-win32-users.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\snmp-win32-users.nse</td><td>1</td><td/></row>
		<row><td>socks_open_proxy.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SOCKS-~1.NSE|socks-open-proxy.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\socks-open-proxy.nse</td><td>1</td><td/></row>
		<row><td>sort.exe</td><td>sort.exe</td><td>sort.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\sort.exe</td><td>1</td><td/></row>
		<row><td>split.exe</td><td>split.exe</td><td>split.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\split.exe</td><td>1</td><td/></row>
		<row><td>sql_injection.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SQL-IN~1.NSE|sql-injection.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\sql-injection.nse</td><td>1</td><td/></row>
		<row><td>ssh1.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>ssh1.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\ssh1.lua</td><td>1</td><td/></row>
		<row><td>ssh2.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>ssh2.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\ssh2.lua</td><td>1</td><td/></row>
		<row><td>ssh2_enum_algos.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SSH2-E~1.NSE|ssh2-enum-algos.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ssh2-enum-algos.nse</td><td>1</td><td/></row>
		<row><td>ssh_hostkey.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SSH-HO~1.NSE|ssh-hostkey.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ssh-hostkey.nse</td><td>1</td><td/></row>
		<row><td>sshv1.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>sshv1.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\sshv1.nse</td><td>1</td><td/></row>
		<row><td>ssl_cert.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>ssl-cert.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ssl-cert.nse</td><td>1</td><td/></row>
		<row><td>ssl_enum_ciphers.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SSL-EN~1.NSE|ssl-enum-ciphers.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\ssl-enum-ciphers.nse</td><td>1</td><td/></row>
		<row><td>ssleay32.dll</td><td>ssleay32.dll</td><td>ssleay32.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\ssleay32.dll</td><td>1</td><td/></row>
		<row><td>sslv2.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>sslv2.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\sslv2.nse</td><td>1</td><td/></row>
		<row><td>start</td><td>ISX_DEFAULTCOMPONENT7</td><td>start</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\start</td><td>1</td><td/></row>
		<row><td>stdnse.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>stdnse.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\stdnse.lua</td><td>1</td><td/></row>
		<row><td>strbuf.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>strbuf.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\strbuf.lua</td><td>1</td><td/></row>
		<row><td>strict.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>strict.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\strict.lua</td><td>1</td><td/></row>
		<row><td>strtonum.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>strtonum.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\strtonum.awk</td><td>1</td><td/></row>
		<row><td>stty.exe</td><td>stty.exe</td><td>stty.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\stty.exe</td><td>1</td><td/></row>
		<row><td>stuxnet_detect.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>STUXNE~1.NSE|stuxnet-detect.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\stuxnet-detect.nse</td><td>1</td><td/></row>
		<row><td>svn_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>SVN-BR~1.NSE|svn-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\svn-brute.nse</td><td>1</td><td/></row>
		<row><td>sysroot_0_002_a7c6_d7dbb5.xm</td><td>ISX_DEFAULTCOMPONENT30</td><td>SYSROO~1.XML|sysroot-0-002-a7c6-d7dbb5.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\sysroot-0-002-a7c6-d7dbb5.xml</td><td>1</td><td/></row>
		<row><td>sysroot_0_011_664d_7cd9c6.xm</td><td>ISX_DEFAULTCOMPONENT30</td><td>SYSROO~1.XML|sysroot-0-011-664d-7cd9c6.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\lib\mingw-get\data\sysroot-0-011-664d-7cd9c6.xml</td><td>1</td><td/></row>
		<row><td>tab.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>tab.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\tab.lua</td><td>1</td><td/></row>
		<row><td>tail.exe</td><td>tail.exe</td><td>tail.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\tail.exe</td><td>1</td><td/></row>
		<row><td>tar.exe</td><td>tar.exe</td><td>tar.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\tar.exe</td><td>1</td><td/></row>
		<row><td>tar_1.23_1_msys_1.0.13_bin.t</td><td>ISX_DEFAULTCOMPONENT26</td><td>TAR-12~1.LZM|tar-1.23-1-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\tar-1.23-1-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>target.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>target.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\target.lua</td><td>1</td><td/></row>
		<row><td>targets_traceroute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>TARGET~1.NSE|targets-traceroute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\targets-traceroute.nse</td><td>1</td><td/></row>
		<row><td>tee.exe</td><td>tee.exe</td><td>tee.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\libexec\mingw-get\tee.exe</td><td>1</td><td/></row>
		<row><td>tee.exe1</td><td>tee.exe1</td><td>tee.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\tee.exe</td><td>1</td><td/></row>
		<row><td>telnet_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>TELNET~1.NSE|telnet-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\telnet-brute.nse</td><td>1</td><td/></row>
		<row><td>termcap</td><td>ISX_DEFAULTCOMPONENT8</td><td>termcap</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\etc\termcap</td><td>1</td><td/></row>
		<row><td>termcap_0.20050421_1_2_msys_</td><td>ISX_DEFAULTCOMPONENT26</td><td>TERMCA~1.LZM|termcap-0.20050421_1-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\termcap-0.20050421_1-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>texi2dvi</td><td>ISX_DEFAULTCOMPONENT7</td><td>texi2dvi</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\texi2dvi</td><td>1</td><td/></row>
		<row><td>texi2pdf</td><td>ISX_DEFAULTCOMPONENT7</td><td>texi2pdf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\texi2pdf</td><td>1</td><td/></row>
		<row><td>texindex.exe</td><td>texindex.exe</td><td>texindex.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\texindex.exe</td><td>1</td><td/></row>
		<row><td>texinfo.cat</td><td>ISX_DEFAULTCOMPONENT17</td><td>texinfo.cat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\texinfo\texinfo.cat</td><td>1</td><td/></row>
		<row><td>texinfo.dtd</td><td>ISX_DEFAULTCOMPONENT17</td><td>texinfo.dtd</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\texinfo\texinfo.dtd</td><td>1</td><td/></row>
		<row><td>texinfo.xsl</td><td>ISX_DEFAULTCOMPONENT17</td><td>texinfo.xsl</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\texinfo\texinfo.xsl</td><td>1</td><td/></row>
		<row><td>texinfo_4.13a_2_msys_1.0.13_</td><td>ISX_DEFAULTCOMPONENT26</td><td>TEXINF~1.LZM|texinfo-4.13a-2-msys-1.0.13-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\texinfo-4.13a-2-msys-1.0.13-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>tns.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>tns.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\tns.lua</td><td>1</td><td/></row>
		<row><td>touch.exe</td><td>touch.exe</td><td>touch.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\touch.exe</td><td>1</td><td/></row>
		<row><td>tr.exe</td><td>tr.exe</td><td>tr.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\tr.exe</td><td>1</td><td/></row>
		<row><td>true.exe</td><td>true.exe</td><td>true.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\true.exe</td><td>1</td><td/></row>
		<row><td>u2d.exe</td><td>u2d.exe</td><td>u2d.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\u2d.exe</td><td>1</td><td/></row>
		<row><td>umount</td><td>ISX_DEFAULTCOMPONENT7</td><td>umount</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\umount</td><td>1</td><td/></row>
		<row><td>uname.exe</td><td>uname.exe</td><td>uname.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\uname.exe</td><td>1</td><td/></row>
		<row><td>uncompress</td><td>ISX_DEFAULTCOMPONENT7</td><td>UNCOMP~1|uncompress</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\uncompress</td><td>1</td><td/></row>
		<row><td>uniq.exe</td><td>uniq.exe</td><td>uniq.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\uniq.exe</td><td>1</td><td/></row>
		<row><td>unix2dos.exe</td><td>unix2dos.exe</td><td>unix2dos.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\unix2dos.exe</td><td>1</td><td/></row>
		<row><td>unlzma.exe</td><td>unlzma.exe</td><td>unlzma.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\unlzma.exe</td><td>1</td><td/></row>
		<row><td>unpwdb.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>unpwdb.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\unpwdb.lua</td><td>1</td><td/></row>
		<row><td>unxz.exe</td><td>unxz.exe</td><td>unxz.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\unxz.exe</td><td>1</td><td/></row>
		<row><td>upnp.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>upnp.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\upnp.lua</td><td>1</td><td/></row>
		<row><td>upnp_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>UPNP-I~1.NSE|upnp-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\upnp-info.nse</td><td>1</td><td/></row>
		<row><td>url.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>url.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\url.lua</td><td>1</td><td/></row>
		<row><td>usernames.lst</td><td>ISX_DEFAULTCOMPONENT35</td><td>USERNA~1.LST|usernames.lst</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\data\usernames.lst</td><td>1</td><td/></row>
		<row><td>vc2008sp1_redist_x86.exe</td><td>vc2008sp1_redist_x86.exe</td><td>VC2008~1.EXE|vc2008sp1-redist_x86.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\Rubin\Source\Projects\Session\ext\win\nmap\vc2008sp1-redist_x86.exe</td><td>1</td><td/></row>
		<row><td>vc2010sp1_redist_x86.exe</td><td>vc2010sp1_redist_x86.exe</td><td>VC2010~1.EXE|vc2010sp1-redist_x86.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\Rubin\Source\Projects\Session\ext\win\nmap\vc2010sp1-redist_x86.exe</td><td>1</td><td/></row>
		<row><td>vnc.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>vnc.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\vnc.lua</td><td>1</td><td/></row>
		<row><td>vnc_brute.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>VNC-BR~1.NSE|vnc-brute.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\vnc-brute.nse</td><td>1</td><td/></row>
		<row><td>vnc_info.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>vnc-info.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\vnc-info.nse</td><td>1</td><td/></row>
		<row><td>wc.exe</td><td>wc.exe</td><td>wc.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\wc.exe</td><td>1</td><td/></row>
		<row><td>wdb_version.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>WDB-VE~1.NSE|wdb-version.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\wdb-version.nse</td><td>1</td><td/></row>
		<row><td>which</td><td>ISX_DEFAULTCOMPONENT7</td><td>which</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\which</td><td>1</td><td/></row>
		<row><td>whois.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>whois.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\whois.nse</td><td>1</td><td/></row>
		<row><td>winpcap_nmap_4.12.exe</td><td>winpcap_nmap_4.12.exe</td><td>WINPCA~1.EXE|winpcap-nmap-4.12.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\winpcap-nmap-4.12.exe</td><td>1</td><td/></row>
		<row><td>wsdd.lua</td><td>ISX_DEFAULTCOMPONENT34</td><td>wsdd.lua</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\nselib\wsdd.lua</td><td>1</td><td/></row>
		<row><td>wsdd_discover.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>WSDD-D~1.NSE|wsdd-discover.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\wsdd-discover.nse</td><td>1</td><td/></row>
		<row><td>x11_access.nse</td><td>ISX_DEFAULTCOMPONENT37</td><td>X11-AC~1.NSE|x11-access.nse</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\scripts\x11-access.nse</td><td>1</td><td/></row>
		<row><td>xargs.exe</td><td>xargs.exe</td><td>xargs.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xargs.exe</td><td>1</td><td/></row>
		<row><td>xz.exe</td><td>xz.exe</td><td>xz.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xz.exe</td><td>1</td><td/></row>
		<row><td>xz_5.0.3_1_msys_1.0.17_bin.t</td><td>ISX_DEFAULTCOMPONENT26</td><td>XZ-503~1.LZM|xz-5.0.3-1-msys-1.0.17-bin.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\xz-5.0.3-1-msys-1.0.17-bin.tar.lzma</td><td>1</td><td/></row>
		<row><td>xzcat.exe</td><td>xzcat.exe</td><td>xzcat.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzcat.exe</td><td>1</td><td/></row>
		<row><td>xzcmp</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzcmp</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzcmp</td><td>1</td><td/></row>
		<row><td>xzdec.exe</td><td>xzdec.exe</td><td>xzdec.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzdec.exe</td><td>1</td><td/></row>
		<row><td>xzdiff</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzdiff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzdiff</td><td>1</td><td/></row>
		<row><td>xzegrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzegrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzegrep</td><td>1</td><td/></row>
		<row><td>xzfgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzfgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzfgrep</td><td>1</td><td/></row>
		<row><td>xzgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzgrep</td><td>1</td><td/></row>
		<row><td>xzless</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzless</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzless</td><td>1</td><td/></row>
		<row><td>xzmore</td><td>ISX_DEFAULTCOMPONENT7</td><td>xzmore</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\xzmore</td><td>1</td><td/></row>
		<row><td>zcat</td><td>ISX_DEFAULTCOMPONENT7</td><td>zcat</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zcat</td><td>1</td><td/></row>
		<row><td>zcmp</td><td>ISX_DEFAULTCOMPONENT7</td><td>zcmp</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zcmp</td><td>1</td><td/></row>
		<row><td>zdiff</td><td>ISX_DEFAULTCOMPONENT7</td><td>zdiff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zdiff</td><td>1</td><td/></row>
		<row><td>zegrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>zegrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zegrep</td><td>1</td><td/></row>
		<row><td>zerofile.awk</td><td>ISX_DEFAULTCOMPONENT13</td><td>zerofile.awk</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\share\awk\zerofile.awk</td><td>1</td><td/></row>
		<row><td>zfgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>zfgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zfgrep</td><td>1</td><td/></row>
		<row><td>zforce</td><td>ISX_DEFAULTCOMPONENT7</td><td>zforce</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zforce</td><td>1</td><td/></row>
		<row><td>zgrep</td><td>ISX_DEFAULTCOMPONENT7</td><td>zgrep</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zgrep</td><td>1</td><td/></row>
		<row><td>zless</td><td>ISX_DEFAULTCOMPONENT7</td><td>zless</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zless</td><td>1</td><td/></row>
		<row><td>zlib_1.2.5_1_msys_1.0.17_dll</td><td>ISX_DEFAULTCOMPONENT26</td><td>ZLIB-1~1.LZM|zlib-1.2.5-1-msys-1.0.17-dll.tar.lzma</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\var\cache\mingw-get\packages\zlib-1.2.5-1-msys-1.0.17-dll.tar.lzma</td><td>1</td><td/></row>
		<row><td>zmore</td><td>ISX_DEFAULTCOMPONENT7</td><td>zmore</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\zmore</td><td>1</td><td/></row>
		<row><td>znew</td><td>ISX_DEFAULTCOMPONENT7</td><td>znew</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Users\rubin\Source\Projects\Session\ext\win\mingw\msys\1.0\bin\znew</td><td>1</td><td/></row>
	</table>

	<table name="FileSFPCatalog">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s255">SFPCatalog_</col>
	</table>

	<table name="Font">
		<col key="yes" def="s72">File_</col>
		<col def="S128">FontTitle</col>
	</table>

	<table name="ISAssistantTag">
		<col key="yes" def="s72">Tag</col>
		<col def="S255">Data</col>
		<row><td>PROJECT_ASSISTANT_DEFAULT_FEATURE</td><td>AlwaysInstall</td></row>
		<row><td>PROJECT_ASSISTANT_FEATURES</td><td>NonSelectable</td></row>
		<row><td>session_shell.bat</td><td/></row>
	</table>

	<table name="ISBillBoard">
		<col key="yes" def="s72">ISBillboard</col>
		<col def="i2">Duration</col>
		<col def="i2">Origin</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Effect</col>
		<col def="i2">Sequence</col>
		<col def="i2">Target</col>
		<col def="S72">Color</col>
		<col def="S72">Style</col>
		<col def="S72">Font</col>
		<col def="L72">Title</col>
		<col def="S72">DisplayName</col>
	</table>

	<table name="ISCEApp">
		<col key="yes" def="s50">AppKey</col>
		<col def="s50">AppName</col>
		<col def="s200">CompanyName</col>
		<col def="s50">DefDir</col>
		<col def="S255">IconPath</col>
		<col def="I4">IconIndex</col>
		<col def="S255">DeviceFile</col>
		<col def="s50">DesktopTargetDir</col>
		<col def="S255">Description</col>
		<col def="i2">DeleteMedia</col>
		<col def="I4">InstallNetCF</col>
		<col def="I4">InstallSQLServer</col>
		<col def="I4">InstallSQLClient</col>
		<col def="I4">InstallSQLDev</col>
		<col def="S255">PreXML</col>
		<col def="S255">PostXML</col>
		<col def="I2">NoUninstall</col>
		<col def="S255">SPCFile</col>
		<col def="S255">PVKFile</col>
		<col def="I4">Attributes</col>
		<col def="S255">RawDeviceFile</col>
		<col def="S72">Component_</col>
		<col def="I4">InstallNetCF2</col>
		<col def="I4">InstallSQLServer2</col>
		<col def="I4">InstallSQLClient2</col>
		<col def="I4">InstallSQLDev2</col>
		<col def="S255">SPCPwd</col>
	</table>

	<table name="ISCEDir">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">DirKey</col>
		<col def="s50">DirParent</col>
		<col def="s255">DirValue</col>
	</table>

	<table name="ISCEFile">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">FileKey</col>
		<col def="s255">Name</col>
		<col def="s50">Destination</col>
		<col def="s255">Source</col>
		<col def="i4">Processor</col>
		<col def="i4">Platform</col>
		<col def="i4">CopyOption</col>
		<col def="i4">FileOption</col>
		<col def="I4">AdvancedOptions</col>
	</table>

	<table name="ISCEFileExt">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">ExtKey</col>
		<col def="s50">FileKey</col>
		<col def="S255">Description</col>
		<col def="s50">Extension</col>
		<col def="i4">IconIndex</col>
	</table>

	<table name="ISCEInstall">
		<col key="yes" def="s255">CEInstallKey</col>
		<col def="s255">CEAppName</col>
		<col def="s255">CEDesktopDir</col>
		<col def="s255">CEIniFileKey</col>
		<col def="s0">CECabs</col>
		<col def="s0">CEIcoFile</col>
		<col def="i2">DeleteMedia</col>
		<col def="S38">Component_</col>
	</table>

	<table name="ISCEOtherAppCABs">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">FileKey</col>
		<col def="s255">BuildSourcePath</col>
	</table>

	<table name="ISCERedist">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="S50">Name</col>
		<col def="I4">Platforms</col>
	</table>

	<table name="ISCERegistry">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">RegKey</col>
		<col def="i4">Root</col>
		<col def="s255">Key</col>
		<col def="S255">Name</col>
		<col def="S0">Value</col>
		<col def="i4">Processor</col>
		<col def="i4">Platform</col>
		<col def="i4">Overwrite</col>
	</table>

	<table name="ISCESetupFile">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">SetupFileKey</col>
		<col def="s255">Name</col>
		<col def="s255">Source</col>
		<col def="i4">Processor</col>
		<col def="i4">Platform</col>
	</table>

	<table name="ISCEShtCut">
		<col key="yes" def="s50">AppKey</col>
		<col key="yes" def="s50">ShtCutKey</col>
		<col def="s255">DisplayName</col>
		<col def="s255">Destination</col>
		<col def="s50">Target</col>
		<col def="i4">Platform</col>
		<col def="S255">StartScreenIcon</col>
	</table>

	<table name="ISChainPackage">
		<col key="yes" def="s72">Package</col>
		<col def="S255">SourcePath</col>
		<col def="S72">ProductCode</col>
		<col def="i2">Order</col>
		<col def="i4">Options</col>
		<col def="S255">InstallCondition</col>
		<col def="S255">RemoveCondition</col>
		<col def="S0">InstallProperties</col>
		<col def="S0">RemoveProperties</col>
		<col def="S255">ISReleaseFlags</col>
		<col def="S72">DisplayName</col>
	</table>

	<table name="ISChainPackageData">
		<col key="yes" def="s72">Package_</col>
		<col key="yes" def="s72">File</col>
		<col def="s50">FilePath</col>
		<col def="I4">Options</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="ISClrWrap">
		<col key="yes" def="s72">Action_</col>
		<col key="yes" def="s72">Name</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISComCatalogAttribute">
		<col key="yes" def="s72">ISComCatalogObject_</col>
		<col key="yes" def="s255">ItemName</col>
		<col def="S0">ItemValue</col>
	</table>

	<table name="ISComCatalogCollection">
		<col key="yes" def="s72">ISComCatalogCollection</col>
		<col def="s72">ISComCatalogObject_</col>
		<col def="s255">CollectionName</col>
	</table>

	<table name="ISComCatalogCollectionObjects">
		<col key="yes" def="s72">ISComCatalogCollection_</col>
		<col key="yes" def="s72">ISComCatalogObject_</col>
	</table>

	<table name="ISComCatalogObject">
		<col key="yes" def="s72">ISComCatalogObject</col>
		<col def="s255">DisplayName</col>
	</table>

	<table name="ISComPlusApplication">
		<col key="yes" def="s72">ISComCatalogObject_</col>
		<col def="S255">ComputerName</col>
		<col def="s72">Component_</col>
		<col def="I2">ISAttributes</col>
		<col def="S0">DepFiles</col>
	</table>

	<table name="ISComPlusApplicationDLL">
		<col key="yes" def="s72">ISComPlusApplicationDLL</col>
		<col def="s72">ISComPlusApplication_</col>
		<col def="s72">ISComCatalogObject_</col>
		<col def="s0">CLSID</col>
		<col def="S0">ProgId</col>
		<col def="S0">DLL</col>
		<col def="S0">AlterDLL</col>
	</table>

	<table name="ISComPlusProxy">
		<col key="yes" def="s72">ISComPlusProxy</col>
		<col def="s72">ISComPlusApplication_</col>
		<col def="S72">Component_</col>
		<col def="I2">ISAttributes</col>
		<col def="S0">DepFiles</col>
	</table>

	<table name="ISComPlusProxyDepFile">
		<col key="yes" def="s72">ISComPlusApplication_</col>
		<col key="yes" def="s72">File_</col>
		<col def="S0">ISPath</col>
	</table>

	<table name="ISComPlusProxyFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">ISComPlusApplicationDLL_</col>
	</table>

	<table name="ISComPlusServerDepFile">
		<col key="yes" def="s72">ISComPlusApplication_</col>
		<col key="yes" def="s72">File_</col>
		<col def="S0">ISPath</col>
	</table>

	<table name="ISComPlusServerFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">ISComPlusApplicationDLL_</col>
	</table>

	<table name="ISComponentExtended">
		<col key="yes" def="s72">Component_</col>
		<col def="I4">OS</col>
		<col def="S0">Language</col>
		<col def="s72">FilterProperty</col>
		<col def="I4">Platforms</col>
		<col def="S0">FTPLocation</col>
		<col def="S0">HTTPLocation</col>
		<col def="S0">Miscellaneous</col>
		<row><td>ISX_DEFAULTCOMPONENT</td><td/><td/><td>_AC9B7D85_7D6F_4659_833C_E3E3C1D0CC10_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT1</td><td/><td/><td>_B317D9F6_76E5_4576_92B1_81FBFDD1000B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT10</td><td/><td/><td>_88E407F3_1087_48CE_A559_6E0C8C3A46D4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT11</td><td/><td/><td>_8DACF35B_E43B_408A_9647_CCFCC4CE2CA8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT12</td><td/><td/><td>_7036F2A9_E6AC_40E9_82B8_9BBB4B1BF75D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT13</td><td/><td/><td>_D0843AF8_2F40_4A12_B8F1_06AC46E318EF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT14</td><td/><td/><td>_86688767_1E2E_4173_A001_51F8064F526E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT15</td><td/><td/><td>_68F413D2_68F0_4AD1_A6AF_224269D0C293_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT16</td><td/><td/><td>_F365976D_7B53_4392_BC95_74C54C93D5FF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT17</td><td/><td/><td>_3651DF91_7DE1_4E49_A310_3B24A49BEE7B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT18</td><td/><td/><td>_2D3D4302_2557_4D8D_ADB8_FF4A99C92710_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT19</td><td/><td/><td>_7EE51B6E_7BBE_4D95_9D4D_90E46C357763_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT2</td><td/><td/><td>_E3A844D7_7757_4CAD_A257_7540E0F6696D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT20</td><td/><td/><td>_8F0DF13F_8CD9_4205_A41D_7075F263BFDC_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT21</td><td/><td/><td>_BA8C5557_31F1_4F59_8337_8DC606BC8F15_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT22</td><td/><td/><td>_CE7F4C5C_B505_4213_8CE9_6045E383B1B7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT23</td><td/><td/><td>_8ED48B73_388F_474A_BCD7_29E49B3158C0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT24</td><td/><td/><td>_25824677_24E8_4BB2_9189_DEAC66808C38_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT25</td><td/><td/><td>_C1543659_BA79_4EE3_BB1A_9DF6FEAFD465_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT26</td><td/><td/><td>_0AFDE5FB_CDEE_4605_A920_2AB2041BCA62_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT27</td><td/><td/><td>_AA44D861_97CB_4F52_BE09_359D02546333_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT28</td><td/><td/><td>_2956FA04_2FAB_416F_A7EA_68ADDED9A814_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT29</td><td/><td/><td>_7687ECEE_8FFB_48ED_B01E_52025DBE08EB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT3</td><td/><td/><td>_6A78CAEB_F500_48FE_A6AC_A05C8887F4C3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT30</td><td/><td/><td>_090B07F4_ED15_495A_BB21_3775CB944916_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT31</td><td/><td/><td>_6CDFEB43_AC6E_4224_B001_057DAEB2B649_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT32</td><td/><td/><td>_80AD7CD5_30E4_4474_9D28_025F745BB95E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT33</td><td/><td/><td>_EB309444_D068_4539_9727_37C421B0EAEA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT34</td><td/><td/><td>_EDC8C43F_58BB_4236_97B7_ADF8795F8393_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT35</td><td/><td/><td>_40A9312D_4763_405F_BACA_6C213C9E3C9B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT36</td><td/><td/><td>_C54B6FBD_BB7B_4362_913B_E1836BA27F34_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT37</td><td/><td/><td>_09DDCBAD_4282_4BDB_A265_46C38BB64002_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT38</td><td/><td/><td>_2C00C023_6251_45F8_A3EE_C01825C947BF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT39</td><td/><td/><td>_8600675C_A225_4B4A_9631_064F4349D4E1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT4</td><td/><td/><td>_6326482F_6710_41E8_94F3_AF2ECE0FD448_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT40</td><td/><td/><td>_7D55F46C_B5E9_4EF1_AA64_56E7B3A805AF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT41</td><td/><td/><td>_2674AB4C_17B9_4469_B873_865FD1AF32A2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT5</td><td/><td/><td>_99A1B7AF_DC83_4CA3_BD33_3800510EA9DF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT6</td><td/><td/><td>_E1120DDE_C633_44C2_BD5A_6DA4C8D870E2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT7</td><td/><td/><td>_A7C40D83_613B_407E_AE0F_4F58E3742526_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT8</td><td/><td/><td>_78017458_79EA_42B8_A1C3_867AB4B0FDEF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT9</td><td/><td/><td>_D93475E9_B093_4862_8334_7A87186A58C9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>awk.exe</td><td/><td/><td>_729F5619_51C5_44AF_9A14_BBD530538B1D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>basename.exe</td><td/><td/><td>_6995ED7F_5735_4BCA_A72D_9B88E7186FF8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>bash.exe</td><td/><td/><td>_B52F32EF_3CB1_4AD9_9A4C_992A37509C1F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>bunzip2.exe</td><td/><td/><td>_2AD2FD3E_6378_47B1_A1FC_5AF09D3D9538_FILTER</td><td/><td/><td/><td/></row>
		<row><td>bzcat.exe</td><td/><td/><td>_36EC6548_A656_453F_B2BE_4A6F1AF4F512_FILTER</td><td/><td/><td/><td/></row>
		<row><td>bzip2.exe</td><td/><td/><td>_CC4F89BE_B9D6_4D9A_8969_7648809CD407_FILTER</td><td/><td/><td/><td/></row>
		<row><td>bzip2recover.exe</td><td/><td/><td>_B7AEF617_AEFB_4C50_B5B2_D440F81E9661_FILTER</td><td/><td/><td/><td/></row>
		<row><td>cat.exe</td><td/><td/><td>_BABA8E0A_0B75_47AC_B724_4FFFC0DCE634_FILTER</td><td/><td/><td/><td/></row>
		<row><td>chmod.exe</td><td/><td/><td>_33FDF1D0_33CA_41F6_9345_440BD702D01B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>cleanfile.exe</td><td/><td/><td>_73CD93C2_336C_4D63_B856_AF8145813745_FILTER</td><td/><td/><td/><td/></row>
		<row><td>cmp.exe</td><td/><td/><td>_98F8118E_1D64_4485_9131_2B606A11971D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>comm.exe</td><td/><td/><td>_8C5C4670_04AE_428E_A504_F37286FE6064_FILTER</td><td/><td/><td/><td/></row>
		<row><td>conv.exe</td><td/><td/><td>_89B085F6_39B4_47E3_9741_8DC2345DE5CE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>cp.exe</td><td/><td/><td>_9AB92761_9C1F_4291_A23E_A2B9881998AB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>cryptRDP5.exe</td><td/><td/><td>_D1833251_4ECE_4C23_92E8_302C00D25526_FILTER</td><td/><td/><td/><td/></row>
		<row><td>cut.exe</td><td/><td/><td>_FD7CDE9F_6582_4B9C_A4A5_3C0BA6C9D2D2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>d2u.exe</td><td/><td/><td>_7518A138_71B5_4AFA_BC3D_8EEC925FFE3F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>date.exe</td><td/><td/><td>_732AC08E_6A77_46F8_A1D2_CBE94952662A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>diff.exe</td><td/><td/><td>_39A64BAF_B850_4548_BEA4_11348B05B97B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>diff3.exe</td><td/><td/><td>_6FC8D91F_DEC8_4910_9A2F_FCEFA3DDD9F8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>dirname.exe</td><td/><td/><td>_BE49756F_9083_4DA4_BF67_E1DDF9A57C50_FILTER</td><td/><td/><td/><td/></row>
		<row><td>dos2unix.exe</td><td/><td/><td>_9BFEFB6F_F6F3_498B_B60F_2AB399D0CA27_FILTER</td><td/><td/><td/><td/></row>
		<row><td>echo.exe</td><td/><td/><td>_10A637A9_290F_4B57_AC17_FC32CCF9AFA2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>egrep.exe</td><td/><td/><td>_B973EB2F_3339_4FEF_9F34_1A77AA6006A9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>env.exe</td><td/><td/><td>_25C6392C_4918_4D6C_8B62_12DDDACF6C5D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>error_mode.exe</td><td/><td/><td>_6E235726_3144_4AAF_83C3_9EA67D29AA79_FILTER</td><td/><td/><td/><td/></row>
		<row><td>expr.exe</td><td/><td/><td>_52542652_E7EE_4B81_9836_909061730D15_FILTER</td><td/><td/><td/><td/></row>
		<row><td>false.exe</td><td/><td/><td>_C4784FA1_EC26_404C_B3D6_CF0B35DB01D4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>fgrep.exe</td><td/><td/><td>_D1E0243D_3634_45F3_B4DF_D8DF0D47FF51_FILTER</td><td/><td/><td/><td/></row>
		<row><td>file.exe</td><td/><td/><td>_336A2AB2_CE89_431A_B8E3_B000C400BE8F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>find.exe</td><td/><td/><td>_99B27B90_E1BD_4D7C_B105_DF177FD86FF5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>fold.exe</td><td/><td/><td>_5D4232E1_F137_484B_A3B7_2AC772FE47F4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>gawk.exe</td><td/><td/><td>_E9F9E07F_791A_4631_85A2_865F11344EDC_FILTER</td><td/><td/><td/><td/></row>
		<row><td>gawk_3.1.7.exe</td><td/><td/><td>_3F798B8E_DC8E_49FC_81A0_C94F3E02CE78_FILTER</td><td/><td/><td/><td/></row>
		<row><td>grcat.exe</td><td/><td/><td>_5E5BF555_E6AA_4E60_BEE8_E02CBC09DFE1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>grep.exe</td><td/><td/><td>_294FDB8C_7658_4EB4_A079_25CF9A3F51F3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>gui.exe</td><td/><td/><td>_6CDE71B5_25CC_42A5_BC4E_908D0F637992_FILTER</td><td/><td/><td/><td/></row>
		<row><td>gzip.exe</td><td/><td/><td>_3CD13A85_6431_440F_8B26_13F01726B7D5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>head.exe</td><td/><td/><td>_CCB81A37_8BA2_4949_A90D_80E6F16DC006_FILTER</td><td/><td/><td/><td/></row>
		<row><td>id.exe</td><td/><td/><td>_70937DC3_4533_44E0_BF72_60D74B0D19E6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>info.exe</td><td/><td/><td>_76F66AE5_6C77_4594_98FF_F0889EED46E1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>infokey.exe</td><td/><td/><td>_FD3DB44F_0590_4B86_9987_80317BFBFD3B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>install.exe</td><td/><td/><td>_63C37B80_0B1D_449F_BAF7_BCEABC34130F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>install_info.exe</td><td/><td/><td>_3C54841D_DDFF_48F6_8046_45A45097B924_FILTER</td><td/><td/><td/><td/></row>
		<row><td>join.exe</td><td/><td/><td>_7627C429_ADA4_4634_AC5A_8833465CF3D6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lastrites.exe</td><td/><td/><td>_F9F558DF_528D_44F7_AB2F_CA3B3B587CF8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>less.exe</td><td/><td/><td>_D281CB5B_E897_41C2_AEF2_B973AD06EFDC_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lessecho.exe</td><td/><td/><td>_9A7FD6C2_05BA_414F_868C_DC073DA2CFF5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lesskey.exe</td><td/><td/><td>_417D8FCD_05F2_4275_8EEE_D9BCB705B71F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>libeay32.dll</td><td/><td/><td>_E1735510_4DC2_41E6_BC05_192B217A5F9F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ln.exe</td><td/><td/><td>_6607D97D_15F9_4CED_8D44_CA49084195A6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ls.exe</td><td/><td/><td>_33DA35AC_7D6D_4FE5_A75E_111E7CB4B29B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lzcat.exe</td><td/><td/><td>_E8000561_89DB_492C_869D_139027FEFF4F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lzma.exe</td><td/><td/><td>_EB06FADE_3AE8_4C08_8C2C_04A308D40FFC_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lzmadec.exe</td><td/><td/><td>_0339F9CC_2925_42E0_B6FF_16BA1B2CD69B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>lzmainfo.exe</td><td/><td/><td>_F951BD41_3E43_4C2B_9BCA_CFBBAED388F3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>make.exe</td><td/><td/><td>_29F9F9F6_DED0_457F_8C15_0D90CFD2BBED_FILTER</td><td/><td/><td/><td/></row>
		<row><td>makeinfo.exe</td><td/><td/><td>_1D61D975_A320_4265_80C8_E467AB9A11A9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>md5sum.exe</td><td/><td/><td>_5E7B371A_75D2_45E9_A83B_2F76D7947CF7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>mingw_get.exe</td><td/><td/><td>_89AF449F_7013_4FBF_B846_334E83644F72_FILTER</td><td/><td/><td/><td/></row>
		<row><td>mingw_get_0.dll</td><td/><td/><td>_B50D1839_98D2_4233_A2ED_8C9ADED073E1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>mkdir.exe</td><td/><td/><td>_2A2C5533_F660_4B4A_B35F_8F2A054415B4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_1.0.dll</td><td/><td/><td>_DB57C8B5_24AD_4467_B424_3DFE1570B8F7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_iconv_2.dll</td><td/><td/><td>_207D7762_205A_467D_80F1_1E4B87893CF6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_intl_8.dll</td><td/><td/><td>_84200BD9_0415_46E5_BD91_DB6BC457EC2F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_lzma_5.dll</td><td/><td/><td>_CE82C7CD_F20B_4386_9363_3907C1E31ECB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_magic_1.dll</td><td/><td/><td>_12E6A71B_B4A8_47BF_9550_EAED1B10EA37_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_popt_0.dll</td><td/><td/><td>_9988AC6E_30EF_4C2F_A77C_E8A3235B6B99_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_regex_1.dll</td><td/><td/><td>_2B13EE5D_D7BF_4D32_B749_9041B6E4A30D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_termcap_0.dll</td><td/><td/><td>_725C513B_9A40_4D33_A8BF_5B337E7F2CFF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msys_z.dll</td><td/><td/><td>_D4C99B4E_5418_4DD7_97DE_95823EDAAB08_FILTER</td><td/><td/><td/><td/></row>
		<row><td>msysmnt.exe</td><td/><td/><td>_82F703FE_28F7_4BA4_BA8F_1A62B4E69FA6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>mv.exe</td><td/><td/><td>_80DF6EA1_888C_4A9C_9FCA_B939B77578ED_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ncat.exe</td><td/><td/><td>_98C9F6AB_2DC9_4409_9FE0_C22424B41854_FILTER</td><td/><td/><td/><td/></row>
		<row><td>nmap.exe</td><td/><td/><td>_0560DB8C_DB09_4268_A2E4_83E27B60F284_FILTER</td><td/><td/><td/><td/></row>
		<row><td>nping.exe</td><td/><td/><td>_4E17A960_E8E5_422F_B8CD_0482CEE29378_FILTER</td><td/><td/><td/><td/></row>
		<row><td>od.exe</td><td/><td/><td>_4B79A48F_5CED_40CB_A7B5_C6E09812957F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>oldfind.exe</td><td/><td/><td>_4CEC518D_4722_4E3F_9602_CABFFC5C9988_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pageant.exe</td><td/><td/><td>_83135AE1_7DF6_488D_AD6B_C681D4AB5F16_FILTER</td><td/><td/><td/><td/></row>
		<row><td>paste.exe</td><td/><td/><td>_0B3BCCFF_8058_4B29_B8E8_42229F05C77D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pgawk.exe</td><td/><td/><td>_304C8B68_C7B8_4B0D_9805_B09BDB147035_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pgawk_3.1.7.exe</td><td/><td/><td>_91F7A4FA_62E6_42DF_B1E7_404AECC3BC03_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pkginfo.exe</td><td/><td/><td>_2FAF3B82_D2D6_48B0_A522_A5BF4B88348D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>plink.exe</td><td/><td/><td>_E89966CD_D170_420B_BC4D_FEF2443C3F85_FILTER</td><td/><td/><td/><td/></row>
		<row><td>printf.exe</td><td/><td/><td>_3A0C10AD_EF6E_42B9_9392_CD6181E2E0F5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ps.exe</td><td/><td/><td>_C2F445E0_D839_47F7_BDFF_4D51A177C022_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pscp.exe</td><td/><td/><td>_472095F3_C4E2_476C_A91A_A4F1177C8CD5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>psexec.exe</td><td/><td/><td>_0AAEF5AD_B80F_4602_995F_56AB230151CB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>psftp.exe</td><td/><td/><td>_E2491CF3_4161_4618_BD7E_EFD5398106CF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>putty.chm</td><td/><td/><td>_B1C25756_5D41_4D9A_B71C_8EA807D4D866_FILTER</td><td/><td/><td/><td/></row>
		<row><td>putty.exe</td><td/><td/><td>_65D67DBE_CDE2_44FC_829B_502CD5F814F9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>putty.hlp</td><td/><td/><td>_97B12658_073F_4963_80D5_45BC66F9A448_FILTER</td><td/><td/><td/><td/></row>
		<row><td>puttygen.exe</td><td/><td/><td>_0080EEB9_BE13_4F89_A9D1_4D3420C016F6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pwcat.exe</td><td/><td/><td>_90F9DB89_4D35_440A_960E_0FF1921200B4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>pwd.exe</td><td/><td/><td>_713E7E05_5ECD_4035_B451_E05CC7110ECB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>rm.exe</td><td/><td/><td>_59D6C643_F79D_4884_B2AA_AE4B2B3EE1E8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>rmdir.exe</td><td/><td/><td>_43795AA7_1D00_4004_878C_632B60EDA6E0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>sdiff.exe</td><td/><td/><td>_866CEEF6_8548_4E51_B29F_9F1A45055C48_FILTER</td><td/><td/><td/><td/></row>
		<row><td>sed.exe</td><td/><td/><td>_A382EC5F_000C_44B7_81D8_06C658467FEA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>sh.exe</td><td/><td/><td>_2D4C5317_7077_4786_BD61_300E76066C70_FILTER</td><td/><td/><td/><td/></row>
		<row><td>sleep.exe</td><td/><td/><td>_07D5F801_A5AE_42F0_BB00_7A8BA86A4094_FILTER</td><td/><td/><td/><td/></row>
		<row><td>sort.exe</td><td/><td/><td>_17CD79C7_F051_472F_8F65_507336B84657_FILTER</td><td/><td/><td/><td/></row>
		<row><td>split.exe</td><td/><td/><td>_A6FB1E89_BB16_496D_88B7_EF628E3A8BE1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ssleay32.dll</td><td/><td/><td>_F6A4D719_6A86_4A71_A1B2_51201C3346FB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>stty.exe</td><td/><td/><td>_337F58CF_160C_465B_BD36_CEA6F772560D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>tail.exe</td><td/><td/><td>_1F09C174_6154_4606_845B_57B67C3F854E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>tar.exe</td><td/><td/><td>_EA3086D3_B206_481C_8C7C_846E6D301474_FILTER</td><td/><td/><td/><td/></row>
		<row><td>tee.exe</td><td/><td/><td>_D9ACD0BD_DF80_49D4_87AD_F0A77934BC79_FILTER</td><td/><td/><td/><td/></row>
		<row><td>tee.exe1</td><td/><td/><td>_0C9ED853_B45A_4635_9E83_77D41B6B67DD_FILTER</td><td/><td/><td/><td/></row>
		<row><td>texindex.exe</td><td/><td/><td>_CAA12E50_7D01_4C08_9E0B_DB315E615444_FILTER</td><td/><td/><td/><td/></row>
		<row><td>touch.exe</td><td/><td/><td>_A3242F20_0C3E_4889_9566_DAA599790613_FILTER</td><td/><td/><td/><td/></row>
		<row><td>tr.exe</td><td/><td/><td>_E6E94B6A_D078_4C68_ACB0_B7709527C081_FILTER</td><td/><td/><td/><td/></row>
		<row><td>true.exe</td><td/><td/><td>_6EAC3CB4_7EDA_4E6B_B848_FFF8CC68DBCE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>u2d.exe</td><td/><td/><td>_4DA4F2D3_465B_4A23_A1B7_791DA6017025_FILTER</td><td/><td/><td/><td/></row>
		<row><td>uname.exe</td><td/><td/><td>_03B18535_4C0A_45F6_B812_5F0C0F54C9AE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>uniq.exe</td><td/><td/><td>_52169273_047E_4F39_A4DA_1A3D8DBBB3A3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>unix2dos.exe</td><td/><td/><td>_59FDCBE3_4C2F_4FC3_A647_4A8F4DBA8974_FILTER</td><td/><td/><td/><td/></row>
		<row><td>unlzma.exe</td><td/><td/><td>_58F62C3A_D938_4DB4_8337_1919D5F50BE3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>unxz.exe</td><td/><td/><td>_68A6BA09_170E_455A_99C8_10198AC900DA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>vc2008sp1_redist_x86.exe</td><td/><td/><td>_B93B54CE_2764_4D63_803C_4437083C68BF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>vc2010sp1_redist_x86.exe</td><td/><td/><td>_BFA2A63F_DDA2_4D15_9E26_1D621C1D55AA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>wc.exe</td><td/><td/><td>_74ED62B8_CF95_4565_A442_D69D0F596DA2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>winpcap_nmap_4.12.exe</td><td/><td/><td>_857AC950_4B5E_404F_821F_E2453A7BF61C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>xargs.exe</td><td/><td/><td>_1D232961_E2E6_445E_9E49_523971A8C42C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>xz.exe</td><td/><td/><td>_5005A0AD_78C6_463F_ACB8_51DB55908CD9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>xzcat.exe</td><td/><td/><td>_1683163F_A6ED_4AD3_8F7C_6F773198020A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>xzdec.exe</td><td/><td/><td>_11EF7908_744B_4999_8E90_C0B173D71696_FILTER</td><td/><td/><td/><td/></row>
	</table>

	<table name="ISCustomActionReference">
		<col key="yes" def="s72">Action_</col>
		<col def="S0">Description</col>
		<col def="S255">FileType</col>
		<col def="S255">ISCAReferenceFilePath</col>
	</table>

	<table name="ISDIMDependency">
		<col key="yes" def="s72">ISDIMReference_</col>
		<col def="s255">RequiredUUID</col>
		<col def="S255">RequiredMajorVersion</col>
		<col def="S255">RequiredMinorVersion</col>
		<col def="S255">RequiredBuildVersion</col>
		<col def="S255">RequiredRevisionVersion</col>
	</table>

	<table name="ISDIMReference">
		<col key="yes" def="s72">ISDIMReference</col>
		<col def="S0">ISBuildSourcePath</col>
	</table>

	<table name="ISDIMReferenceDependencies">
		<col key="yes" def="s72">ISDIMReference_Parent</col>
		<col key="yes" def="s72">ISDIMDependency_</col>
	</table>

	<table name="ISDIMVariable">
		<col key="yes" def="s72">ISDIMVariable</col>
		<col def="s72">ISDIMReference_</col>
		<col def="s0">Name</col>
		<col def="S0">NewValue</col>
		<col def="I4">Type</col>
	</table>

	<table name="ISDLLWrapper">
		<col key="yes" def="s72">EntryPoint</col>
		<col def="I4">Type</col>
		<col def="s0">Source</col>
		<col def="s255">Target</col>
	</table>

	<table name="ISDRMFile">
		<col key="yes" def="s72">ISDRMFile</col>
		<col def="S72">File_</col>
		<col def="S72">ISDRMLicense_</col>
		<col def="s255">Shell</col>
	</table>

	<table name="ISDRMFileAttribute">
		<col key="yes" def="s72">ISDRMFile_</col>
		<col key="yes" def="s72">Property</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISDRMLicense">
		<col key="yes" def="s72">ISDRMLicense</col>
		<col def="S255">Description</col>
		<col def="S50">ProjectVersion</col>
		<col def="I4">Attributes</col>
		<col def="S255">LicenseNumber</col>
		<col def="S255">RequestCode</col>
		<col def="S255">ResponseCode</col>
	</table>

	<table name="ISDependency">
		<col key="yes" def="S50">ISDependency</col>
		<col def="I2">Exclude</col>
	</table>

	<table name="ISDisk1File">
		<col key="yes" def="s72">ISDisk1File</col>
		<col def="s255">ISBuildSourcePath</col>
		<col def="I4">Disk</col>
	</table>

	<table name="ISDynamicFile">
		<col key="yes" def="s72">Component_</col>
		<col key="yes" def="s255">SourceFolder</col>
		<col def="I2">IncludeFlags</col>
		<col def="S0">IncludeFiles</col>
		<col def="S0">ExcludeFiles</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISFeatureDIMReferences">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s72">ISDIMReference_</col>
	</table>

	<table name="ISFeatureMergeModuleExcludes">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s255">ModuleID</col>
		<col key="yes" def="i2">Language</col>
	</table>

	<table name="ISFeatureMergeModules">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s255">ISMergeModule_</col>
		<col key="yes" def="i2">Language_</col>
	</table>

	<table name="ISFeatureSetupPrerequisites">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s72">ISSetupPrerequisites_</col>
	</table>

	<table name="ISFileManifests">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">Manifest_</col>
	</table>

	<table name="ISIISItem">
		<col key="yes" def="s72">ISIISItem</col>
		<col def="S72">ISIISItem_Parent</col>
		<col def="L255">DisplayName</col>
		<col def="i4">Type</col>
		<col def="S72">Component_</col>
	</table>

	<table name="ISIISProperty">
		<col key="yes" def="s72">ISIISProperty</col>
		<col key="yes" def="s72">ISIISItem_</col>
		<col def="S0">Schema</col>
		<col def="S255">FriendlyName</col>
		<col def="I4">MetaDataProp</col>
		<col def="I4">MetaDataType</col>
		<col def="I4">MetaDataUserType</col>
		<col def="I4">MetaDataAttributes</col>
		<col def="L0">MetaDataValue</col>
		<col def="I4">Order</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISInstallScriptAction">
		<col key="yes" def="s72">EntryPoint</col>
		<col def="I4">Type</col>
		<col def="s72">Source</col>
		<col def="S255">Target</col>
	</table>

	<table name="ISLanguage">
		<col key="yes" def="s50">ISLanguage</col>
		<col def="I2">Included</col>
		<row><td>1033</td><td>1</td></row>
	</table>

	<table name="ISLinkerLibrary">
		<col key="yes" def="s72">ISLinkerLibrary</col>
		<col def="s255">Library</col>
		<col def="i4">Order</col>
		<row><td>isrt.obl</td><td>isrt.obl</td><td>2</td></row>
		<row><td>iswi.obl</td><td>iswi.obl</td><td>1</td></row>
	</table>

	<table name="ISLocalControl">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">ISLanguage_</col>
		<col def="I4">Attributes</col>
		<col def="I2">X</col>
		<col def="I2">Y</col>
		<col def="I2">Width</col>
		<col def="I2">Height</col>
		<col def="S72">Binary_</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="ISLocalDialog">
		<col key="yes" def="S50">Dialog_</col>
		<col key="yes" def="S50">ISLanguage_</col>
		<col def="I4">Attributes</col>
		<col def="S72">TextStyle_</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
	</table>

	<table name="ISLocalRadioButton">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col key="yes" def="s50">ISLanguage_</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
	</table>

	<table name="ISLockPermissions">
		<col key="yes" def="s72">LockObject</col>
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="S255">Domain</col>
		<col key="yes" def="s255">User</col>
		<col def="I4">Permission</col>
		<col def="I4">Attributes</col>
	</table>

	<table name="ISLogicalDisk">
		<col key="yes" def="i2">DiskId</col>
		<col key="yes" def="s255">ISProductConfiguration_</col>
		<col key="yes" def="s255">ISRelease_</col>
		<col def="i2">LastSequence</col>
		<col def="L64">DiskPrompt</col>
		<col def="S255">Cabinet</col>
		<col def="S32">VolumeLabel</col>
		<col def="S32">Source</col>
	</table>

	<table name="ISLogicalDiskFeatures">
		<col key="yes" def="i2">ISLogicalDisk_</col>
		<col key="yes" def="s255">ISProductConfiguration_</col>
		<col key="yes" def="s255">ISRelease_</col>
		<col key="yes" def="S38">Feature_</col>
		<col def="i2">Sequence</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISMergeModule">
		<col key="yes" def="s255">ISMergeModule</col>
		<col key="yes" def="i2">Language</col>
		<col def="s255">Name</col>
		<col def="S255">Destination</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISMergeModuleCfgValues">
		<col key="yes" def="s255">ISMergeModule_</col>
		<col key="yes" def="i2">Language_</col>
		<col key="yes" def="s72">ModuleConfiguration_</col>
		<col def="L0">Value</col>
		<col def="i2">Format</col>
		<col def="L255">Type</col>
		<col def="L255">ContextData</col>
		<col def="L255">DefaultValue</col>
		<col def="I2">Attributes</col>
		<col def="L255">DisplayName</col>
		<col def="L255">Description</col>
		<col def="L255">HelpLocation</col>
		<col def="L255">HelpKeyword</col>
	</table>

	<table name="ISObject">
		<col key="yes" def="s50">ObjectName</col>
		<col def="s15">Language</col>
	</table>

	<table name="ISObjectProperty">
		<col key="yes" def="S50">ObjectName</col>
		<col key="yes" def="S50">Property</col>
		<col def="S0">Value</col>
		<col def="I2">IncludeInBuild</col>
	</table>

	<table name="ISPalmApp">
		<col key="yes" def="s72">PalmApp</col>
		<col key="yes" def="s72">Component</col>
	</table>

	<table name="ISPalmAppFile">
		<col key="yes" def="s72">PalmApp</col>
		<col key="yes" def="s72">FileKey</col>
		<col def="i4">Destination</col>
	</table>

	<table name="ISPatchConfigImage">
		<col key="yes" def="S72">PatchConfiguration_</col>
		<col key="yes" def="s72">UpgradedImage_</col>
	</table>

	<table name="ISPatchConfiguration">
		<col key="yes" def="s72">Name</col>
		<col def="i2">CanPCDiffer</col>
		<col def="i2">CanPVDiffer</col>
		<col def="i2">IncludeWholeFiles</col>
		<col def="i2">LeaveDecompressed</col>
		<col def="i2">OptimizeForSize</col>
		<col def="i2">EnablePatchCache</col>
		<col def="S0">PatchCacheDir</col>
		<col def="i4">Flags</col>
		<col def="S0">PatchGuidsToReplace</col>
		<col def="s0">TargetProductCodes</col>
		<col def="s50">PatchGuid</col>
		<col def="s0">OutputPath</col>
		<col def="i2">MinMsiVersion</col>
		<col def="I4">Attributes</col>
	</table>

	<table name="ISPatchConfigurationProperty">
		<col key="yes" def="S72">ISPatchConfiguration_</col>
		<col key="yes" def="S50">Property</col>
		<col def="S50">Value</col>
	</table>

	<table name="ISPatchExternalFile">
		<col key="yes" def="s50">Name</col>
		<col key="yes" def="s13">ISUpgradedImage_</col>
		<col def="s72">FileKey</col>
		<col def="s255">FilePath</col>
	</table>

	<table name="ISPatchWholeFile">
		<col key="yes" def="s50">UpgradedImage</col>
		<col key="yes" def="s72">FileKey</col>
		<col def="S72">Component</col>
	</table>

	<table name="ISPathVariable">
		<col key="yes" def="s32">ISPathVariable</col>
		<col def="S255">Value</col>
		<col def="S255">TestValue</col>
		<col def="i4">Type</col>
		<row><td>CommonFilesFolder</td><td/><td/><td>1</td></row>
		<row><td>ISPROJECTDIR</td><td/><td/><td>1</td></row>
		<row><td>ISProductFolder</td><td/><td/><td>1</td></row>
		<row><td>ISProjectDataFolder</td><td/><td/><td>1</td></row>
		<row><td>ISProjectFolder</td><td/><td/><td>1</td></row>
		<row><td>ProgramFilesFolder</td><td/><td/><td>1</td></row>
		<row><td>SystemFolder</td><td/><td/><td>1</td></row>
		<row><td>WindowsFolder</td><td/><td/><td>1</td></row>
	</table>

	<table name="ISProductConfiguration">
		<col key="yes" def="s72">ISProductConfiguration</col>
		<col def="S255">ProductConfigurationFlags</col>
		<col def="I4">GeneratePackageCode</col>
		<row><td>Express</td><td/><td>1</td></row>
	</table>

	<table name="ISProductConfigurationInstance">
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="i2">InstanceId</col>
		<col key="yes" def="s72">Property</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISProductConfigurationProperty">
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="s72">Property</col>
		<col def="L255">Value</col>
		<row><td>Express</td><td>MSIPackageFileName</td><td>session-0.9.1</td></row>
		<row><td>Express</td><td>SetupFileName</td><td>setup</td></row>
	</table>

	<table name="ISRelease">
		<col key="yes" def="s72">ISRelease</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col def="s255">BuildLocation</col>
		<col def="s255">PackageName</col>
		<col def="i4">Type</col>
		<col def="s0">SupportedLanguagesUI</col>
		<col def="i4">MsiSourceType</col>
		<col def="i4">ReleaseType</col>
		<col def="s72">Platforms</col>
		<col def="S0">SupportedLanguagesData</col>
		<col def="s6">DefaultLanguage</col>
		<col def="i4">SupportedOSs</col>
		<col def="s50">DiskSize</col>
		<col def="i4">DiskSizeUnit</col>
		<col def="i4">DiskClusterSize</col>
		<col def="S0">ReleaseFlags</col>
		<col def="i4">DiskSpanning</col>
		<col def="S255">SynchMsi</col>
		<col def="s255">MediaLocation</col>
		<col def="S255">URLLocation</col>
		<col def="S255">DigitalURL</col>
		<col def="S255">DigitalPVK</col>
		<col def="S255">DigitalSPC</col>
		<col def="S255">Password</col>
		<col def="S255">VersionCopyright</col>
		<col def="i4">Attributes</col>
		<col def="S255">CDBrowser</col>
		<col def="S255">DotNetBuildConfiguration</col>
		<col def="S255">MsiCommandLine</col>
		<col def="I4">ISSetupPrerequisiteLocation</col>
		<row><td>CD_ROM</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>0</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>650</td><td>0</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75804</td><td/><td/><td/><td>3</td></row>
		<row><td>Custom</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>2</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>100</td><td>0</td><td>1024</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-10</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>8.75</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-18</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>15.83</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-5</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>4.38</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75804</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-9</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>7.95</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>SingleImage</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>PackageName</td><td>1</td><td>1033</td><td>0</td><td>1</td><td>Intel</td><td/><td>1033</td><td>0</td><td>0</td><td>0</td><td>0</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>108572</td><td/><td/><td/><td>3</td></row>
		<row><td>WebDeployment</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>PackageName</td><td>4</td><td>1033</td><td>2</td><td>1</td><td>Intel</td><td/><td>1033</td><td>0</td><td>0</td><td>0</td><td>0</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>124941</td><td/><td/><td/><td>3</td></row>
	</table>

	<table name="ISReleaseASPublishInfo">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="S0">Property</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISReleaseExtended">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col def="I4">WebType</col>
		<col def="S255">WebURL</col>
		<col def="I4">WebCabSize</col>
		<col def="S255">OneClickCabName</col>
		<col def="S255">OneClickHtmlName</col>
		<col def="S255">WebLocalCachePath</col>
		<col def="I4">EngineLocation</col>
		<col def="S255">Win9xMsiUrl</col>
		<col def="S255">WinNTMsiUrl</col>
		<col def="I4">ISEngineLocation</col>
		<col def="S255">ISEngineURL</col>
		<col def="I4">OneClickTargetBrowser</col>
		<col def="S255">DigitalCertificateIdNS</col>
		<col def="S255">DigitalCertificateDBaseNS</col>
		<col def="S255">DigitalCertificatePasswordNS</col>
		<col def="I4">DotNetRedistLocation</col>
		<col def="S255">DotNetRedistURL</col>
		<col def="I4">DotNetVersion</col>
		<col def="S255">DotNetBaseLanguage</col>
		<col def="S0">DotNetLangaugePacks</col>
		<col def="S255">DotNetFxCmdLine</col>
		<col def="S255">DotNetLangPackCmdLine</col>
		<col def="S50">JSharpCmdLine</col>
		<col def="I4">Attributes</col>
		<col def="I4">JSharpRedistLocation</col>
		<col def="I4">MsiEngineVersion</col>
		<col def="S255">WinMsi30Url</col>
		<col def="S255">CertPassword</col>
		<row><td>CD_ROM</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>Custom</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-10</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-18</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-5</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-9</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>SingleImage</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>1</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>WebDeployment</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>setup</td><td>Default</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>2</td><td>http://www.Installengine.com/Msiengine20</td><td>http://www.Installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>2</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
	</table>

	<table name="ISReleaseProperty">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s0">Value</col>
	</table>

	<table name="ISReleasePublishInfo">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col def="S255">Repository</col>
		<col def="S255">DisplayName</col>
		<col def="S255">Publisher</col>
		<col def="S255">Description</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISSQLConnection">
		<col key="yes" def="s72">ISSQLConnection</col>
		<col def="s255">Server</col>
		<col def="s255">Database</col>
		<col def="s255">UserName</col>
		<col def="s255">Password</col>
		<col def="s255">Authentication</col>
		<col def="i2">Attributes</col>
		<col def="i2">Order</col>
		<col def="S0">Comments</col>
		<col def="I4">CmdTimeout</col>
		<col def="S0">BatchSeparator</col>
		<col def="S0">ScriptVersion_Table</col>
		<col def="S0">ScriptVersion_Column</col>
	</table>

	<table name="ISSQLConnectionDBServer">
		<col key="yes" def="s72">ISSQLConnectionDBServer</col>
		<col key="yes" def="s72">ISSQLConnection_</col>
		<col key="yes" def="s72">ISSQLDBMetaData_</col>
		<col def="i2">Order</col>
	</table>

	<table name="ISSQLConnectionScript">
		<col key="yes" def="s72">ISSQLConnection_</col>
		<col key="yes" def="s72">ISSQLScriptFile_</col>
		<col def="i2">Order</col>
	</table>

	<table name="ISSQLDBMetaData">
		<col key="yes" def="s72">ISSQLDBMetaData</col>
		<col def="S0">DisplayName</col>
		<col def="S0">AdoDriverName</col>
		<col def="S0">AdoCxnDriver</col>
		<col def="S0">AdoCxnServer</col>
		<col def="S0">AdoCxnDatabase</col>
		<col def="S0">AdoCxnUserID</col>
		<col def="S0">AdoCxnPassword</col>
		<col def="S0">AdoCxnWindowsSecurity</col>
		<col def="S0">AdoCxnNetLibrary</col>
		<col def="S0">TestDatabaseCmd</col>
		<col def="S0">TestTableCmd</col>
		<col def="S0">VersionInfoCmd</col>
		<col def="S0">VersionBeginToken</col>
		<col def="S0">VersionEndToken</col>
		<col def="S0">LocalInstanceNames</col>
		<col def="S0">CreateDbCmd</col>
		<col def="S0">SwitchDbCmd</col>
		<col def="I4">ISAttributes</col>
		<col def="S0">TestTableCmd2</col>
		<col def="S0">WinAuthentUserId</col>
		<col def="S0">DsnODBCName</col>
		<col def="S0">AdoCxnPort</col>
		<col def="S0">AdoCxnAdditional</col>
		<col def="S0">QueryDatabasesCmd</col>
		<col def="S0">CreateTableCmd</col>
		<col def="S0">InsertRecordCmd</col>
		<col def="S0">SelectTableCmd</col>
		<col def="S0">ScriptVersion_Table</col>
		<col def="S0">ScriptVersion_Column</col>
		<col def="S0">ScriptVersion_ColumnType</col>
	</table>

	<table name="ISSQLRequirement">
		<col key="yes" def="s72">ISSQLRequirement</col>
		<col key="yes" def="s72">ISSQLConnection_</col>
		<col def="S15">MajorVersion</col>
		<col def="S25">ServicePackLevel</col>
		<col def="i4">Attributes</col>
		<col def="S72">ISSQLConnectionDBServer_</col>
	</table>

	<table name="ISSQLScriptError">
		<col key="yes" def="i4">ErrNumber</col>
		<col key="yes" def="S72">ISSQLScriptFile_</col>
		<col def="i2">ErrHandling</col>
		<col def="L255">Message</col>
		<col def="i2">Attributes</col>
	</table>

	<table name="ISSQLScriptFile">
		<col key="yes" def="s72">ISSQLScriptFile</col>
		<col def="s72">Component_</col>
		<col def="i2">Scheduling</col>
		<col def="L255">InstallText</col>
		<col def="L255">UninstallText</col>
		<col def="S0">ISBuildSourcePath</col>
		<col def="S0">Comments</col>
		<col def="i2">ErrorHandling</col>
		<col def="i2">Attributes</col>
		<col def="S15">Version</col>
		<col def="S255">Condition</col>
	</table>

	<table name="ISSQLScriptImport">
		<col key="yes" def="s72">ISSQLScriptFile_</col>
		<col def="S255">Server</col>
		<col def="S255">Database</col>
		<col def="S255">UserName</col>
		<col def="S255">Password</col>
		<col def="i4">Authentication</col>
		<col def="S0">IncludeTables</col>
		<col def="S0">ExcludeTables</col>
		<col def="i4">Attributes</col>
	</table>

	<table name="ISSQLScriptReplace">
		<col key="yes" def="s72">ISSQLScriptReplace</col>
		<col key="yes" def="s72">ISSQLScriptFile_</col>
		<col def="S0">Search</col>
		<col def="S0">Replace</col>
		<col def="i4">Attributes</col>
	</table>

	<table name="ISScriptFile">
		<col key="yes" def="s255">ISScriptFile</col>
	</table>

	<table name="ISSelfReg">
		<col key="yes" def="s72">FileKey</col>
		<col def="I2">Cost</col>
		<col def="I2">Order</col>
		<col def="S50">CmdLine</col>
	</table>

	<table name="ISSetupFile">
		<col key="yes" def="s72">ISSetupFile</col>
		<col def="S255">FileName</col>
		<col def="V0">Stream</col>
		<col def="S50">Language</col>
		<col def="I2">Splash</col>
		<col def="S0">Path</col>
	</table>

	<table name="ISSetupPrerequisites">
		<col key="yes" def="s72">ISSetupPrerequisites</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="I2">Order</col>
		<col def="I2">ISSetupLocation</col>
		<col def="S255">ISReleaseFlags</col>
	</table>

	<table name="ISSetupType">
		<col key="yes" def="s38">ISSetupType</col>
		<col def="L255">Description</col>
		<col def="L255">Display_Name</col>
		<col def="i2">Display</col>
		<col def="S255">Comments</col>
		<row><td>Custom</td><td>##IDS__IsSetupTypeMinDlg_ChooseFeatures##</td><td>##IDS__IsSetupTypeMinDlg_Custom##</td><td>3</td><td/></row>
		<row><td>Minimal</td><td>##IDS__IsSetupTypeMinDlg_MinimumFeatures##</td><td>##IDS__IsSetupTypeMinDlg_Minimal##</td><td>2</td><td/></row>
		<row><td>Typical</td><td>##IDS__IsSetupTypeMinDlg_AllFeatures##</td><td>##IDS__IsSetupTypeMinDlg_Typical##</td><td>1</td><td/></row>
	</table>

	<table name="ISSetupTypeFeatures">
		<col key="yes" def="s38">ISSetupType_</col>
		<col key="yes" def="s38">Feature_</col>
		<row><td>Custom</td><td>AlwaysInstall</td></row>
		<row><td>Minimal</td><td>AlwaysInstall</td></row>
		<row><td>Typical</td><td>AlwaysInstall</td></row>
	</table>

	<table name="ISStorages">
		<col key="yes" def="s72">Name</col>
		<col def="S0">ISBuildSourcePath</col>
	</table>

	<table name="ISString">
		<col key="yes" def="s255">ISString</col>
		<col key="yes" def="s50">ISLanguage_</col>
		<col def="S0">Value</col>
		<col def="I2">Encoded</col>
		<col def="S0">Comment</col>
		<col def="I4">TimeStamp</col>
		<row><td>COMPANY_NAME</td><td>1033</td><td>RAAF Technology</td><td>0</td><td/><td>639608304</td></row>
		<row><td>DN_AlwaysInstall</td><td>1033</td><td>Always Install</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_COLOR</td><td>1033</td><td>The color settings of your system are not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_OS</td><td>1033</td><td>The operating system is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_PROCESSOR</td><td>1033</td><td>The processor is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_RAM</td><td>1033</td><td>The amount of RAM is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_SCREEN</td><td>1033</td><td>The screen resolution is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPACT</td><td>1033</td><td>Compact</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPACT_DESC</td><td>1033</td><td>Compact Description</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPLETE</td><td>1033</td><td>Complete</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPLETE_DESC</td><td>1033</td><td>Complete</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_CUSTOM</td><td>1033</td><td>Custom</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_CUSTOM_DESC</td><td>1033</td><td>Custom Description</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_CUSTOM_DESC_PRO</td><td>1033</td><td>Custom</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_TYPICAL</td><td>1033</td><td>Typical</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDPROP_SETUPTYPE_TYPICAL_DESC</td><td>1033</td><td>Typical Description</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_1</td><td>1033</td><td>[1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_1b</td><td>1033</td><td>[1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_1c</td><td>1033</td><td>[1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_1d</td><td>1033</td><td>[1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Advertising</td><td>1033</td><td>Advertising application</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_AllocatingRegistry</td><td>1033</td><td>Allocating registry space</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_AppCommandLine</td><td>1033</td><td>Application: [1], Command line: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_AppId</td><td>1033</td><td>AppId: [1]{{, AppType: [2]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_AppIdAppTypeRSN</td><td>1033</td><td>AppId: [1]{{, AppType: [2], Users: [3], RSN: [4]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Application</td><td>1033</td><td>Application: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_BindingExes</td><td>1033</td><td>Binding executables</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ClassId</td><td>1033</td><td>Class ID: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ClsID</td><td>1033</td><td>Class ID: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ComponentIDQualifier</td><td>1033</td><td>Component ID: [1], Qualifier: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ComponentIdQualifier2</td><td>1033</td><td>Component ID: [1], Qualifier: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ComputingSpace</td><td>1033</td><td>Computing space requirements</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ComputingSpace2</td><td>1033</td><td>Computing space requirements</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ComputingSpace3</td><td>1033</td><td>Computing space requirements</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ContentTypeExtension</td><td>1033</td><td>MIME Content Type: [1], Extension: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ContentTypeExtension2</td><td>1033</td><td>MIME Content Type: [1], Extension: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_CopyingNetworkFiles</td><td>1033</td><td>Copying files to the network</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_CopyingNewFiles</td><td>1033</td><td>Copying new files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingDuplicate</td><td>1033</td><td>Creating duplicate files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingFolders</td><td>1033</td><td>Creating folders</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingIISRoots</td><td>1033</td><td>Creating IIS Virtual Roots...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingShortcuts</td><td>1033</td><td>Creating shortcuts</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_DeletingServices</td><td>1033</td><td>Deleting services</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_EnvironmentStrings</td><td>1033</td><td>Updating environment strings</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_EvaluateLaunchConditions</td><td>1033</td><td>Evaluating launch conditions</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Extension</td><td>1033</td><td>Extension: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Extension2</td><td>1033</td><td>Extension: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Feature</td><td>1033</td><td>Feature: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FeatureColon</td><td>1033</td><td>Feature: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_File</td><td>1033</td><td>File: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_File2</td><td>1033</td><td>File: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDependencies</td><td>1033</td><td>File: [1],  Dependencies: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDir</td><td>1033</td><td>File: [1], Directory: [9]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDir2</td><td>1033</td><td>File: [1], Directory: [9]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDir3</td><td>1033</td><td>File: [1], Directory: [9]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize</td><td>1033</td><td>File: [1], Directory: [9], Size: [6]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize2</td><td>1033</td><td>File: [1],  Directory: [9],  Size: [6]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize3</td><td>1033</td><td>File: [1],  Directory: [9],  Size: [6]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize4</td><td>1033</td><td>File: [1],  Directory: [2],  Size: [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirectorySize</td><td>1033</td><td>File: [1],  Directory: [9],  Size: [6]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileFolder</td><td>1033</td><td>File: [1], Folder: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileFolder2</td><td>1033</td><td>File: [1], Folder: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileSectionKeyValue</td><td>1033</td><td>File: [1],  Section: [2],  Key: [3], Value: [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FileSectionKeyValue2</td><td>1033</td><td>File: [1],  Section: [2],  Key: [3], Value: [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Folder</td><td>1033</td><td>Folder: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Folder1</td><td>1033</td><td>Folder: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Font</td><td>1033</td><td>Font: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Font2</td><td>1033</td><td>Font: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FoundApp</td><td>1033</td><td>Found application: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_FreeSpace</td><td>1033</td><td>Free space: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_GeneratingScript</td><td>1033</td><td>Generating script operations for action:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ISLockPermissionsCost</td><td>1033</td><td>Gathering permissions information for objects...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ISLockPermissionsInstall</td><td>1033</td><td>Applying permissions information for objects...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_InitializeODBCDirs</td><td>1033</td><td>Initializing ODBC directories</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_InstallODBC</td><td>1033</td><td>Installing ODBC components</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_InstallServices</td><td>1033</td><td>Installing new services</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_InstallingSystemCatalog</td><td>1033</td><td>Installing system catalog</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_KeyName</td><td>1033</td><td>Key: [1], Name: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_KeyNameValue</td><td>1033</td><td>Key: [1], Name: [2], Value: [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_LibId</td><td>1033</td><td>LibID: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Libid2</td><td>1033</td><td>LibID: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_MigratingFeatureStates</td><td>1033</td><td>Migrating feature states from related applications</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_MovingFiles</td><td>1033</td><td>Moving files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_NameValueAction</td><td>1033</td><td>Name: [1], Value: [2], Action [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_NameValueAction2</td><td>1033</td><td>Name: [1], Value: [2], Action [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_PatchingFiles</td><td>1033</td><td>Patching files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ProgID</td><td>1033</td><td>ProgID: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_ProgID2</td><td>1033</td><td>ProgID: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_PropertySignature</td><td>1033</td><td>Property: [1], Signature: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_PublishProductFeatures</td><td>1033</td><td>Publishing product features</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_PublishProductInfo</td><td>1033</td><td>Publishing product information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_PublishingQualifiedComponents</td><td>1033</td><td>Publishing qualified components</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegUser</td><td>1033</td><td>Registering user</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterClassServer</td><td>1033</td><td>Registering class servers</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterExtensionServers</td><td>1033</td><td>Registering extension servers</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterFonts</td><td>1033</td><td>Registering fonts</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterMimeInfo</td><td>1033</td><td>Registering MIME info</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterTypeLibs</td><td>1033</td><td>Registering type libraries</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringComPlus</td><td>1033</td><td>Registering COM+ Applications and Components</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringModules</td><td>1033</td><td>Registering modules</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringProduct</td><td>1033</td><td>Registering product</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringProgIdentifiers</td><td>1033</td><td>Registering program identifiers</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemoveApps</td><td>1033</td><td>Removing applications</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingBackup</td><td>1033</td><td>Removing backup files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingDuplicates</td><td>1033</td><td>Removing duplicated files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingFiles</td><td>1033</td><td>Removing files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingFolders</td><td>1033</td><td>Removing folders</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingIISRoots</td><td>1033</td><td>Removing IIS Virtual Roots...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingIni</td><td>1033</td><td>Removing INI file entries</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingMoved</td><td>1033</td><td>Removing moved files</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingODBC</td><td>1033</td><td>Removing ODBC components</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingRegistry</td><td>1033</td><td>Removing system registry values</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingShortcuts</td><td>1033</td><td>Removing shortcuts</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_RollingBack</td><td>1033</td><td>Rolling back action:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_SearchForRelated</td><td>1033</td><td>Searching for related applications</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_SearchInstalled</td><td>1033</td><td>Searching for installed applications</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_SearchingQualifyingProducts</td><td>1033</td><td>Searching for qualifying products</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_SearchingQualifyingProducts2</td><td>1033</td><td>Searching for qualifying products</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Service</td><td>1033</td><td>Service: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Service2</td><td>1033</td><td>Service: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Service3</td><td>1033</td><td>Service: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Service4</td><td>1033</td><td>Service: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Shortcut</td><td>1033</td><td>Shortcut: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Shortcut1</td><td>1033</td><td>Shortcut: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_StartingServices</td><td>1033</td><td>Starting services</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_StoppingServices</td><td>1033</td><td>Stopping services</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnpublishProductFeatures</td><td>1033</td><td>Unpublishing product features</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnpublishQualified</td><td>1033</td><td>Unpublishing Qualified Components</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnpublishingProductInfo</td><td>1033</td><td>Unpublishing product information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregTypeLibs</td><td>1033</td><td>Unregistering type libraries</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisterClassServers</td><td>1033</td><td>Unregister class servers</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisterExtensionServers</td><td>1033</td><td>Unregistering extension servers</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisterModules</td><td>1033</td><td>Unregistering modules</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringComPlus</td><td>1033</td><td>Unregistering COM+ Applications and Components</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringFonts</td><td>1033</td><td>Unregistering fonts</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringMimeInfo</td><td>1033</td><td>Unregistering MIME info</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringProgramIds</td><td>1033</td><td>Unregistering program identifiers</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UpdateComponentRegistration</td><td>1033</td><td>Updating component registration</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_UpdateEnvironmentStrings</td><td>1033</td><td>Updating environment strings</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_Validating</td><td>1033</td><td>Validating install</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_WritingINI</td><td>1033</td><td>Writing INI file values</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ACTIONTEXT_WritingRegistry</td><td>1033</td><td>Writing system registry values</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_BACK</td><td>1033</td><td>&lt; &amp;Back</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_CANCEL</td><td>1033</td><td>Cancel</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_CANCEL2</td><td>1033</td><td>&amp;Cancel</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_CHANGE</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_COMPLUS_PROGRESSTEXT_COST</td><td>1033</td><td>Costing COM+ application: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_COMPLUS_PROGRESSTEXT_INSTALL</td><td>1033</td><td>Installing COM+ application: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_COMPLUS_PROGRESSTEXT_UNINSTALL</td><td>1033</td><td>Uninstalling COM+ application: [1]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DIALOG_TEXT2_DESCRIPTION</td><td>1033</td><td>Dialog Normal Description</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DIALOG_TEXT_DESCRIPTION_EXTERIOR</td><td>1033</td><td>{&amp;TahomaBold10}Dialog Bold Title</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DIALOG_TEXT_DESCRIPTION_INTERIOR</td><td>1033</td><td>{&amp;MSSansBold8}Dialog Bold Title</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DIFX_AMD64</td><td>1033</td><td>[ProductName] requires an X64 processor. Click OK to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DIFX_IA64</td><td>1033</td><td>[ProductName] requires an IA64 processor. Click OK to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DIFX_X86</td><td>1033</td><td>[ProductName] requires an X86 processor. Click OK to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_DatabaseFolder_InstallDatabaseTo</td><td>1033</td><td>Install [ProductName] database to:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_0</td><td>1033</td><td>{{Fatal error: }}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1</td><td>1033</td><td>Error [1]. </td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_10</td><td>1033</td><td>=== Logging started: [Date]  [Time] ===</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_100</td><td>1033</td><td>Could not remove shortcut [2]. Verify that the shortcut file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_101</td><td>1033</td><td>Could not register type library for file [2].  Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_102</td><td>1033</td><td>Could not unregister type library for file [2].  Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_103</td><td>1033</td><td>Could not update the INI file [2][3].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_104</td><td>1033</td><td>Could not schedule file [2] to replace file [3] on reboot.  Verify that you have write permissions to file [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_105</td><td>1033</td><td>Error removing ODBC driver manager, ODBC error [2]: [3]. Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_106</td><td>1033</td><td>Error installing ODBC driver manager, ODBC error [2]: [3]. Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_107</td><td>1033</td><td>Error removing ODBC driver [4], ODBC error [2]: [3]. Verify that you have sufficient privileges to remove ODBC drivers.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_108</td><td>1033</td><td>Error installing ODBC driver [4], ODBC error [2]: [3]. Verify that the file [4] exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_109</td><td>1033</td><td>Error configuring ODBC data source [4], ODBC error [2]: [3]. Verify that the file [4] exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_11</td><td>1033</td><td>=== Logging stopped: [Date]  [Time] ===</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_110</td><td>1033</td><td>Service [2] ([3]) failed to start.  Verify that you have sufficient privileges to start system services.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_111</td><td>1033</td><td>Service [2] ([3]) could not be stopped.  Verify that you have sufficient privileges to stop system services.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_112</td><td>1033</td><td>Service [2] ([3]) could not be deleted.  Verify that you have sufficient privileges to remove system services.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_113</td><td>1033</td><td>Service [2] ([3]) could not be installed.  Verify that you have sufficient privileges to install system services.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_114</td><td>1033</td><td>Could not update environment variable [2].  Verify that you have sufficient privileges to modify environment variables.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_115</td><td>1033</td><td>You do not have sufficient privileges to complete this installation for all users of the machine.  Log on as an administrator and then retry this installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_116</td><td>1033</td><td>Could not set file security for file [3]. Error: [2].  Verify that you have sufficient privileges to modify the security permissions for this file.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_117</td><td>1033</td><td>Component Services (COM+ 1.0) are not installed on this computer.  This installation requires Component Services in order to complete successfully.  Component Services are available on Windows 2000.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_118</td><td>1033</td><td>Error registering COM+ application.  Contact your support personnel for more information.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_119</td><td>1033</td><td>Error unregistering COM+ application.  Contact your support personnel for more information.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_12</td><td>1033</td><td>Action start [Time]: [1].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_120</td><td>1033</td><td>Removing older versions of this application</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_121</td><td>1033</td><td>Preparing to remove older versions of this application</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_122</td><td>1033</td><td>Error applying patch to file [2].  It has probably been updated by other means, and can no longer be modified by this patch.  For more information contact your patch vendor.  {{System Error: [3]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_123</td><td>1033</td><td>[2] cannot install one of its required products. Contact your technical support group.  {{System Error: [3].}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_124</td><td>1033</td><td>The older version of [2] cannot be removed.  Contact your technical support group.  {{System Error [3].}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_125</td><td>1033</td><td>The description for service '[2]' ([3]) could not be changed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_126</td><td>1033</td><td>The Windows Installer service cannot update the system file [2] because the file is protected by Windows.  You may need to update your operating system for this program to work correctly. {{Package version: [3], OS Protected version: [4]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_127</td><td>1033</td><td>The Windows Installer service cannot update the protected Windows file [2]. {{Package version: [3], OS Protected version: [4], SFP Error: [5]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_128</td><td>1033</td><td>The Windows Installer service cannot update one or more protected Windows files. SFP Error: [2]. List of protected files: [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_129</td><td>1033</td><td>User installations are disabled via policy on the machine.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_13</td><td>1033</td><td>Action ended [Time]: [1]. Return value [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_130</td><td>1033</td><td>This setup requires Internet Information Server 4.0 or higher for configuring IIS Virtual Roots. Please make sure that you have IIS 4.0 or higher.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_131</td><td>1033</td><td>This setup requires Administrator privileges for configuring IIS Virtual Roots.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1329</td><td>1033</td><td>A file that is required cannot be installed because the cabinet file [2] is not digitally signed. This may indicate that the cabinet file is corrupt.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1330</td><td>1033</td><td>A file that is required cannot be installed because the cabinet file [2] has an invalid digital signature. This may indicate that the cabinet file is corrupt.{ Error [3] was returned by WinVerifyTrust.}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1331</td><td>1033</td><td>Failed to correctly copy [2] file: CRC error.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1332</td><td>1033</td><td>Failed to correctly patch [2] file: CRC error.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1333</td><td>1033</td><td>Failed to correctly patch [2] file: CRC error.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1334</td><td>1033</td><td>The file '[2]' cannot be installed because the file cannot be found in cabinet file '[3]'. This could indicate a network error, an error reading from the CD-ROM, or a problem with this package.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1335</td><td>1033</td><td>The cabinet file '[2]' required for this installation is corrupt and cannot be used. This could indicate a network error, an error reading from the CD-ROM, or a problem with this package.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1336</td><td>1033</td><td>There was an error creating a temporary file that is needed to complete this installation. Folder: [3]. System error code: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_14</td><td>1033</td><td>Time remaining: {[1] minutes }{[2] seconds}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_15</td><td>1033</td><td>Out of memory. Shut down other applications before retrying.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_16</td><td>1033</td><td>Installer is no longer responding.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1609</td><td>1033</td><td>An error occurred while applying security settings. [2] is not a valid user or group. This could be a problem with the package, or a problem connecting to a domain controller on the network. Check your network connection and click Retry, or Cancel to end the install. Unable to locate the user's SID, system error [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1651</td><td>1033</td><td>Admin user failed to apply patch for a per-user managed or a per-machine application which is in advertise state.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_17</td><td>1033</td><td>Installer terminated prematurely.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1715</td><td>1033</td><td>Installed [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1716</td><td>1033</td><td>Configured [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1717</td><td>1033</td><td>Removed [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1718</td><td>1033</td><td>File [2] was rejected by digital signature policy.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1719</td><td>1033</td><td>Windows Installer service could not be accessed. Contact your support personnel to verify that it is properly registered and enabled.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1720</td><td>1033</td><td>There is a problem with this Windows Installer package. A script required for this install to complete could not be run. Contact your support personnel or package vendor. Custom action [2] script error [3], [4]: [5] Line [6], Column [7], [8]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1721</td><td>1033</td><td>There is a problem with this Windows Installer package. A program required for this install to complete could not be run. Contact your support personnel or package vendor. Action: [2], location: [3], command: [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1722</td><td>1033</td><td>There is a problem with this Windows Installer package. A program run as part of the setup did not finish as expected. Contact your support personnel or package vendor. Action [2], location: [3], command: [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1723</td><td>1033</td><td>There is a problem with this Windows Installer package. A DLL required for this install to complete could not be run. Contact your support personnel or package vendor. Action [2], entry: [3], library: [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1724</td><td>1033</td><td>Removal completed successfully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1725</td><td>1033</td><td>Removal failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1726</td><td>1033</td><td>Advertisement completed successfully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1727</td><td>1033</td><td>Advertisement failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1728</td><td>1033</td><td>Configuration completed successfully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1729</td><td>1033</td><td>Configuration failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1730</td><td>1033</td><td>You must be an Administrator to remove this application. To remove this application, you can log on as an administrator, or contact your technical support group for assistance.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1731</td><td>1033</td><td>The source installation package for the product [2] is out of sync with the client package. Try the installation again using a valid copy of the installation package '[3]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1732</td><td>1033</td><td>In order to complete the installation of [2], you must restart the computer. Other users are currently logged on to this computer, and restarting may cause them to lose their work. Do you want to restart now?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_18</td><td>1033</td><td>Please wait while Windows configures [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_19</td><td>1033</td><td>Gathering required information...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1935</td><td>1033</td><td>An error occurred during the installation of assembly component [2]. HRESULT: [3]. {{assembly interface: [4], function: [5], assembly name: [6]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1936</td><td>1033</td><td>An error occurred during the installation of assembly '[6]'. The assembly is not strongly named or is not signed with the minimal key length. HRESULT: [3]. {{assembly interface: [4], function: [5], component: [2]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1937</td><td>1033</td><td>An error occurred during the installation of assembly '[6]'. The signature or catalog could not be verified or is not valid. HRESULT: [3]. {{assembly interface: [4], function: [5], component: [2]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_1938</td><td>1033</td><td>An error occurred during the installation of assembly '[6]'. One or more modules of the assembly could not be found. HRESULT: [3]. {{assembly interface: [4], function: [5], component: [2]}}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2</td><td>1033</td><td>Warning [1]. </td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_20</td><td>1033</td><td>{[ProductName] }Setup completed successfully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_21</td><td>1033</td><td>{[ProductName] }Setup failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2101</td><td>1033</td><td>Shortcuts not supported by the operating system.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2102</td><td>1033</td><td>Invalid .ini action: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2103</td><td>1033</td><td>Could not resolve path for shell folder [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2104</td><td>1033</td><td>Writing .ini file: [3]: System error: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2105</td><td>1033</td><td>Shortcut Creation [3] Failed. System error: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2106</td><td>1033</td><td>Shortcut Deletion [3] Failed. System error: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2107</td><td>1033</td><td>Error [3] registering type library [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2108</td><td>1033</td><td>Error [3] unregistering type library [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2109</td><td>1033</td><td>Section missing for .ini action.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2110</td><td>1033</td><td>Key missing for .ini action.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2111</td><td>1033</td><td>Detection of running applications failed, could not get performance data. Registered operation returned : [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2112</td><td>1033</td><td>Detection of running applications failed, could not get performance index. Registered operation returned : [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2113</td><td>1033</td><td>Detection of running applications failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_22</td><td>1033</td><td>Error reading from file: [2]. {{ System error [3].}}  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2200</td><td>1033</td><td>Database: [2]. Database object creation failed, mode = [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2201</td><td>1033</td><td>Database: [2]. Initialization failed, out of memory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2202</td><td>1033</td><td>Database: [2]. Data access failed, out of memory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2203</td><td>1033</td><td>Database: [2]. Cannot open database file. System error [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2204</td><td>1033</td><td>Database: [2]. Table already exists: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2205</td><td>1033</td><td>Database: [2]. Table does not exist: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2206</td><td>1033</td><td>Database: [2]. Table could not be dropped: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2207</td><td>1033</td><td>Database: [2]. Intent violation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2208</td><td>1033</td><td>Database: [2]. Insufficient parameters for Execute.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2209</td><td>1033</td><td>Database: [2]. Cursor in invalid state.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2210</td><td>1033</td><td>Database: [2]. Invalid update data type in column [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2211</td><td>1033</td><td>Database: [2]. Could not create database table [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2212</td><td>1033</td><td>Database: [2]. Database not in writable state.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2213</td><td>1033</td><td>Database: [2]. Error saving database tables.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2214</td><td>1033</td><td>Database: [2]. Error writing export file: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2215</td><td>1033</td><td>Database: [2]. Cannot open import file: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2216</td><td>1033</td><td>Database: [2]. Import file format error: [3], Line [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2217</td><td>1033</td><td>Database: [2]. Wrong state to CreateOutputDatabase [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2218</td><td>1033</td><td>Database: [2]. Table name not supplied.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2219</td><td>1033</td><td>Database: [2]. Invalid Installer database format.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2220</td><td>1033</td><td>Database: [2]. Invalid row/field data.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2221</td><td>1033</td><td>Database: [2]. Code page conflict in import file: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2222</td><td>1033</td><td>Database: [2]. Transform or merge code page [3] differs from database code page [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2223</td><td>1033</td><td>Database: [2]. Databases are the same. No transform generated.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2224</td><td>1033</td><td>Database: [2]. GenerateTransform: Database corrupt. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2225</td><td>1033</td><td>Database: [2]. Transform: Cannot transform a temporary table. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2226</td><td>1033</td><td>Database: [2]. Transform failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2227</td><td>1033</td><td>Database: [2]. Invalid identifier '[3]' in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2228</td><td>1033</td><td>Database: [2]. Unknown table '[3]' in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2229</td><td>1033</td><td>Database: [2]. Could not load table '[3]' in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2230</td><td>1033</td><td>Database: [2]. Repeated table '[3]' in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2231</td><td>1033</td><td>Database: [2]. Missing ')' in SQL query: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2232</td><td>1033</td><td>Database: [2]. Unexpected token '[3]' in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2233</td><td>1033</td><td>Database: [2]. No columns in SELECT clause in SQL query: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2234</td><td>1033</td><td>Database: [2]. No columns in ORDER BY clause in SQL query: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2235</td><td>1033</td><td>Database: [2]. Column '[3]' not present or ambiguous in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2236</td><td>1033</td><td>Database: [2]. Invalid operator '[3]' in SQL query: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2237</td><td>1033</td><td>Database: [2]. Invalid or missing query string: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2238</td><td>1033</td><td>Database: [2]. Missing FROM clause in SQL query: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2239</td><td>1033</td><td>Database: [2]. Insufficient values in INSERT SQL statement.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2240</td><td>1033</td><td>Database: [2]. Missing update columns in UPDATE SQL statement.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2241</td><td>1033</td><td>Database: [2]. Missing insert columns in INSERT SQL statement.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2242</td><td>1033</td><td>Database: [2]. Column '[3]' repeated.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2243</td><td>1033</td><td>Database: [2]. No primary columns defined for table creation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2244</td><td>1033</td><td>Database: [2]. Invalid type specifier '[3]' in SQL query [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2245</td><td>1033</td><td>IStorage::Stat failed with error [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2246</td><td>1033</td><td>Database: [2]. Invalid Installer transform format.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2247</td><td>1033</td><td>Database: [2] Transform stream read/write failure.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2248</td><td>1033</td><td>Database: [2] GenerateTransform/Merge: Column type in base table does not match reference table. Table: [3] Col #: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2249</td><td>1033</td><td>Database: [2] GenerateTransform: More columns in base table than in reference table. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2250</td><td>1033</td><td>Database: [2] Transform: Cannot add existing row. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2251</td><td>1033</td><td>Database: [2] Transform: Cannot delete row that does not exist. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2252</td><td>1033</td><td>Database: [2] Transform: Cannot add existing table. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2253</td><td>1033</td><td>Database: [2] Transform: Cannot delete table that does not exist. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2254</td><td>1033</td><td>Database: [2] Transform: Cannot update row that does not exist. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2255</td><td>1033</td><td>Database: [2] Transform: Column with this name already exists. Table: [3] Col: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2256</td><td>1033</td><td>Database: [2] GenerateTransform/Merge: Number of primary keys in base table does not match reference table. Table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2257</td><td>1033</td><td>Database: [2]. Intent to modify read only table: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2258</td><td>1033</td><td>Database: [2]. Type mismatch in parameter: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2259</td><td>1033</td><td>Database: [2] Table(s) Update failed</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2260</td><td>1033</td><td>Storage CopyTo failed. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2261</td><td>1033</td><td>Could not remove stream [2]. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2262</td><td>1033</td><td>Stream does not exist: [2]. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2263</td><td>1033</td><td>Could not open stream [2]. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2264</td><td>1033</td><td>Could not remove stream [2]. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2265</td><td>1033</td><td>Could not commit storage. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2266</td><td>1033</td><td>Could not rollback storage. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2267</td><td>1033</td><td>Could not delete storage [2]. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2268</td><td>1033</td><td>Database: [2]. Merge: There were merge conflicts reported in [3] tables.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2269</td><td>1033</td><td>Database: [2]. Merge: The column count differed in the '[3]' table of the two databases.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2270</td><td>1033</td><td>Database: [2]. GenerateTransform/Merge: Column name in base table does not match reference table. Table: [3] Col #: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2271</td><td>1033</td><td>SummaryInformation write for transform failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2272</td><td>1033</td><td>Database: [2]. MergeDatabase will not write any changes because the database is open read-only.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2273</td><td>1033</td><td>Database: [2]. MergeDatabase: A reference to the base database was passed as the reference database.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2274</td><td>1033</td><td>Database: [2]. MergeDatabase: Unable to write errors to Error table. Could be due to a non-nullable column in a predefined Error table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2275</td><td>1033</td><td>Database: [2]. Specified Modify [3] operation invalid for table joins.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2276</td><td>1033</td><td>Database: [2]. Code page [3] not supported by the system.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2277</td><td>1033</td><td>Database: [2]. Failed to save table [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2278</td><td>1033</td><td>Database: [2]. Exceeded number of expressions limit of 32 in WHERE clause of SQL query: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2279</td><td>1033</td><td>Database: [2] Transform: Too many columns in base table [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2280</td><td>1033</td><td>Database: [2]. Could not create column [3] for table [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2281</td><td>1033</td><td>Could not rename stream [2]. System error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2282</td><td>1033</td><td>Stream name invalid [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_23</td><td>1033</td><td>Cannot create the file [3].  A directory with this name already exists.  Cancel the installation and try installing to a different location.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2302</td><td>1033</td><td>Patch notify: [2] bytes patched to far.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2303</td><td>1033</td><td>Error getting volume info. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2304</td><td>1033</td><td>Error getting disk free space. GetLastError: [2]. Volume: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2305</td><td>1033</td><td>Error waiting for patch thread. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2306</td><td>1033</td><td>Could not create thread for patch application. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2307</td><td>1033</td><td>Source file key name is null.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2308</td><td>1033</td><td>Destination file name is null.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2309</td><td>1033</td><td>Attempting to patch file [2] when patch already in progress.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2310</td><td>1033</td><td>Attempting to continue patch when no patch is in progress.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2315</td><td>1033</td><td>Missing path separator: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2318</td><td>1033</td><td>File does not exist: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2319</td><td>1033</td><td>Error setting file attribute: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2320</td><td>1033</td><td>File not writable: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2321</td><td>1033</td><td>Error creating file: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2322</td><td>1033</td><td>User canceled.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2323</td><td>1033</td><td>Invalid file attribute.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2324</td><td>1033</td><td>Could not open file: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2325</td><td>1033</td><td>Could not get file time for file: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2326</td><td>1033</td><td>Error in FileToDosDateTime.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2327</td><td>1033</td><td>Could not remove directory: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2328</td><td>1033</td><td>Error getting file version info for file: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2329</td><td>1033</td><td>Error deleting file: [3]. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2330</td><td>1033</td><td>Error getting file attributes: [3]. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2331</td><td>1033</td><td>Error loading library [2] or finding entry point [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2332</td><td>1033</td><td>Error getting file attributes. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2333</td><td>1033</td><td>Error setting file attributes. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2334</td><td>1033</td><td>Error converting file time to local time for file: [3]. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2335</td><td>1033</td><td>Path: [2] is not a parent of [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2336</td><td>1033</td><td>Error creating temp file on path: [3]. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2337</td><td>1033</td><td>Could not close file: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2338</td><td>1033</td><td>Could not update resource for file: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2339</td><td>1033</td><td>Could not set file time for file: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2340</td><td>1033</td><td>Could not update resource for file: [3], Missing resource.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2341</td><td>1033</td><td>Could not update resource for file: [3], Resource too large.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2342</td><td>1033</td><td>Could not update resource for file: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2343</td><td>1033</td><td>Specified path is empty.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2344</td><td>1033</td><td>Could not find required file IMAGEHLP.DLL to validate file:[2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2345</td><td>1033</td><td>[2]: File does not contain a valid checksum value.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2347</td><td>1033</td><td>User ignore.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2348</td><td>1033</td><td>Error attempting to read from cabinet stream.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2349</td><td>1033</td><td>Copy resumed with different info.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2350</td><td>1033</td><td>FDI server error</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2351</td><td>1033</td><td>File key '[2]' not found in cabinet '[3]'. The installation cannot continue.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2352</td><td>1033</td><td>Could not initialize cabinet file server. The required file 'CABINET.DLL' may be missing.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2353</td><td>1033</td><td>Not a cabinet.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2354</td><td>1033</td><td>Cannot handle cabinet.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2355</td><td>1033</td><td>Corrupt cabinet.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2356</td><td>1033</td><td>Could not locate cabinet in stream: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2357</td><td>1033</td><td>Cannot set attributes.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2358</td><td>1033</td><td>Error determining whether file is in-use: [3]. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2359</td><td>1033</td><td>Unable to create the target file - file may be in use.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2360</td><td>1033</td><td>Progress tick.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2361</td><td>1033</td><td>Need next cabinet.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2362</td><td>1033</td><td>Folder not found: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2363</td><td>1033</td><td>Could not enumerate subfolders for folder: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2364</td><td>1033</td><td>Bad enumeration constant in CreateCopier call.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2365</td><td>1033</td><td>Could not BindImage exe file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2366</td><td>1033</td><td>User failure.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2367</td><td>1033</td><td>User abort.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2368</td><td>1033</td><td>Failed to get network resource information. Error [2], network path [3]. Extended error: network provider [5], error code [4], error description [6].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2370</td><td>1033</td><td>Invalid CRC checksum value for [2] file.{ Its header says [3] for checksum, its computed value is [4].}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2371</td><td>1033</td><td>Could not apply patch to file [2]. GetLastError: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2372</td><td>1033</td><td>Patch file [2] is corrupt or of an invalid format. Attempting to patch file [3]. GetLastError: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2373</td><td>1033</td><td>File [2] is not a valid patch file.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2374</td><td>1033</td><td>File [2] is not a valid destination file for patch file [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2375</td><td>1033</td><td>Unknown patching error: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2376</td><td>1033</td><td>Cabinet not found.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2379</td><td>1033</td><td>Error opening file for read: [3] GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2380</td><td>1033</td><td>Error opening file for write: [3]. GetLastError: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2381</td><td>1033</td><td>Directory does not exist: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2382</td><td>1033</td><td>Drive not ready: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_24</td><td>1033</td><td>Please insert the disk: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2401</td><td>1033</td><td>64-bit registry operation attempted on 32-bit operating system for key [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2402</td><td>1033</td><td>Out of memory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_25</td><td>1033</td><td>The installer has insufficient privileges to access this directory: [2].  The installation cannot continue.  Log on as an administrator or contact your system administrator.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2501</td><td>1033</td><td>Could not create rollback script enumerator.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2502</td><td>1033</td><td>Called InstallFinalize when no install in progress.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2503</td><td>1033</td><td>Called RunScript when not marked in progress.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_26</td><td>1033</td><td>Error writing to file [2].  Verify that you have access to that directory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2601</td><td>1033</td><td>Invalid value for property [2]: '[3]'</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2602</td><td>1033</td><td>The [2] table entry '[3]' has no associated entry in the Media table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2603</td><td>1033</td><td>Duplicate table name [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2604</td><td>1033</td><td>[2] Property undefined.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2605</td><td>1033</td><td>Could not find server [2] in [3] or [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2606</td><td>1033</td><td>Value of property [2] is not a valid full path: '[3]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2607</td><td>1033</td><td>Media table not found or empty (required for installation of files).</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2608</td><td>1033</td><td>Could not create security descriptor for object. Error: '[2]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2609</td><td>1033</td><td>Attempt to migrate product settings before initialization.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2611</td><td>1033</td><td>The file [2] is marked as compressed, but the associated media entry does not specify a cabinet.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2612</td><td>1033</td><td>Stream not found in '[2]' column. Primary key: '[3]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2613</td><td>1033</td><td>RemoveExistingProducts action sequenced incorrectly.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2614</td><td>1033</td><td>Could not access IStorage object from installation package.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2615</td><td>1033</td><td>Skipped unregistration of Module [2] due to source resolution failure.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2616</td><td>1033</td><td>Companion file [2] parent missing.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2617</td><td>1033</td><td>Shared component [2] not found in Component table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2618</td><td>1033</td><td>Isolated application component [2] not found in Component table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2619</td><td>1033</td><td>Isolated components [2], [3] not part of same feature.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2620</td><td>1033</td><td>Key file of isolated application component [2] not in File table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2621</td><td>1033</td><td>Resource DLL or Resource ID information for shortcut [2] set incorrectly.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27</td><td>1033</td><td>Error reading from file [2].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2701</td><td>1033</td><td>The depth of a feature exceeds the acceptable tree depth of [2] levels.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2702</td><td>1033</td><td>A Feature table record ([2]) references a non-existent parent in the Attributes field.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2703</td><td>1033</td><td>Property name for root source path not defined: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2704</td><td>1033</td><td>Root directory property undefined: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2705</td><td>1033</td><td>Invalid table: [2]; Could not be linked as tree.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2706</td><td>1033</td><td>Source paths not created. No path exists for entry [2] in Directory table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2707</td><td>1033</td><td>Target paths not created. No path exists for entry [2] in Directory table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2708</td><td>1033</td><td>No entries found in the file table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2709</td><td>1033</td><td>The specified Component name ('[2]') not found in Component table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2710</td><td>1033</td><td>The requested 'Select' state is illegal for this Component.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2711</td><td>1033</td><td>The specified Feature name ('[2]') not found in Feature table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2712</td><td>1033</td><td>Invalid return from modeless dialog: [3], in action [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2713</td><td>1033</td><td>Null value in a non-nullable column ('[2]' in '[3]' column of the '[4]' table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2714</td><td>1033</td><td>Invalid value for default folder name: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2715</td><td>1033</td><td>The specified File key ('[2]') not found in the File table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2716</td><td>1033</td><td>Could not create a random subcomponent name for component '[2]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2717</td><td>1033</td><td>Bad action condition or error calling custom action '[2]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2718</td><td>1033</td><td>Missing package name for product code '[2]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2719</td><td>1033</td><td>Neither UNC nor drive letter path found in source '[2]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2720</td><td>1033</td><td>Error opening source list key. Error: '[2]'</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2721</td><td>1033</td><td>Custom action [2] not found in Binary table stream.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2722</td><td>1033</td><td>Custom action [2] not found in File table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2723</td><td>1033</td><td>Custom action [2] specifies unsupported type.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2724</td><td>1033</td><td>The volume label '[2]' on the media you're running from does not match the label '[3]' given in the Media table. This is allowed only if you have only 1 entry in your Media table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2725</td><td>1033</td><td>Invalid database tables</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2726</td><td>1033</td><td>Action not found: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2727</td><td>1033</td><td>The directory entry '[2]' does not exist in the Directory table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2728</td><td>1033</td><td>Table definition error: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2729</td><td>1033</td><td>Install engine not initialized.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2730</td><td>1033</td><td>Bad value in database. Table: '[2]'; Primary key: '[3]'; Column: '[4]'</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2731</td><td>1033</td><td>Selection Manager not initialized.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2732</td><td>1033</td><td>Directory Manager not initialized.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2733</td><td>1033</td><td>Bad foreign key ('[2]') in '[3]' column of the '[4]' table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2734</td><td>1033</td><td>Invalid reinstall mode character.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2735</td><td>1033</td><td>Custom action '[2]' has caused an unhandled exception and has been stopped. This may be the result of an internal error in the custom action, such as an access violation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2736</td><td>1033</td><td>Generation of custom action temp file failed: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2737</td><td>1033</td><td>Could not access custom action [2], entry [3], library [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2738</td><td>1033</td><td>Could not access VBScript run time for custom action [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2739</td><td>1033</td><td>Could not access JavaScript run time for custom action [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2740</td><td>1033</td><td>Custom action [2] script error [3], [4]: [5] Line [6], Column [7], [8].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2741</td><td>1033</td><td>Configuration information for product [2] is corrupt. Invalid info: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2742</td><td>1033</td><td>Marshaling to Server failed: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2743</td><td>1033</td><td>Could not execute custom action [2], location: [3], command: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2744</td><td>1033</td><td>EXE failed called by custom action [2], location: [3], command: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2745</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected language [4], found language [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2746</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product [4], found product [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2747</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &lt; [4], found product version [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2748</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &lt;= [4], found product version [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2749</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version == [4], found product version [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2750</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &gt;= [4], found product version [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27502</td><td>1033</td><td>Could not connect to [2] '[3]'. [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27503</td><td>1033</td><td>Error retrieving version string from [2] '[3]'. [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27504</td><td>1033</td><td>SQL version requirements not met: [3]. This installation requires [2] [4] or later.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27505</td><td>1033</td><td>Could not open SQL script file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27506</td><td>1033</td><td>Error executing SQL script [2]. Line [3]. [4]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27507</td><td>1033</td><td>Connection or browsing for database servers requires that MDAC be installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27508</td><td>1033</td><td>Error installing COM+ application [2]. [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27509</td><td>1033</td><td>Error uninstalling COM+ application [2]. [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2751</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &gt; [4], found product version [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27510</td><td>1033</td><td>Error installing COM+ application [2].  Could not load Microsoft(R) .NET class libraries. Registering .NET serviced components requires that Microsoft(R) .NET Framework be installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27511</td><td>1033</td><td>Could not execute SQL script file [2]. Connection not open: [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27512</td><td>1033</td><td>Error beginning transactions for [2] '[3]'. Database [4]. [5]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27513</td><td>1033</td><td>Error committing transactions for [2] '[3]'. Database [4]. [5]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27514</td><td>1033</td><td>This installation requires a Microsoft SQL Server. The specified server '[3]' is a Microsoft SQL Server Desktop Engine or SQL Server Express.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27515</td><td>1033</td><td>Error retrieving schema version from [2] '[3]'. Database: '[4]'. [5]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27516</td><td>1033</td><td>Error writing schema version to [2] '[3]'. Database: '[4]'. [5]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27517</td><td>1033</td><td>This installation requires Administrator privileges for installing COM+ applications. Log on as an administrator and then retry this installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27518</td><td>1033</td><td>The COM+ application "[2]" is configured to run as an NT service; this requires COM+ 1.5 or later on the system. Since your system has COM+ 1.0, this application will not be installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27519</td><td>1033</td><td>Error updating XML file [2]. [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2752</td><td>1033</td><td>Could not open transform [2] stored as child storage of package [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27520</td><td>1033</td><td>Error opening XML file [2]. [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27521</td><td>1033</td><td>This setup requires MSXML 3.0 or higher for configuring XML files. Please make sure that you have version 3.0 or higher.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27522</td><td>1033</td><td>Error creating XML file [2]. [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27523</td><td>1033</td><td>Error loading servers.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27524</td><td>1033</td><td>Error loading NetApi32.DLL. The ISNetApi.dll needs to have NetApi32.DLL properly loaded and requires an NT based operating system.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27525</td><td>1033</td><td>Server not found. Verify that the specified server exists. The server name can not be empty.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27526</td><td>1033</td><td>Unspecified error from ISNetApi.dll.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27527</td><td>1033</td><td>The buffer is too small.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27528</td><td>1033</td><td>Access denied. Check administrative rights.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27529</td><td>1033</td><td>Invalid computer.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2753</td><td>1033</td><td>The File '[2]' is not marked for installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27530</td><td>1033</td><td>Unknown error returned from NetAPI. System error: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27531</td><td>1033</td><td>Unhandled exception.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27532</td><td>1033</td><td>Invalid user name for this server or domain.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27533</td><td>1033</td><td>The case-sensitive passwords do not match.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27534</td><td>1033</td><td>The list is empty.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27535</td><td>1033</td><td>Access violation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27536</td><td>1033</td><td>Error getting group.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27537</td><td>1033</td><td>Error adding user to group. Verify that the group exists for this domain or server.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27538</td><td>1033</td><td>Error creating user.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27539</td><td>1033</td><td>ERROR_NETAPI_ERROR_NOT_PRIMARY returned from NetAPI.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2754</td><td>1033</td><td>The File '[2]' is not a valid patch file.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27540</td><td>1033</td><td>The specified user already exists.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27541</td><td>1033</td><td>The specified group already exists.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27542</td><td>1033</td><td>Invalid password. Verify that the password is in accordance with your network password policy.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27543</td><td>1033</td><td>Invalid name.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27544</td><td>1033</td><td>Invalid group.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27545</td><td>1033</td><td>The user name can not be empty and must be in the format DOMAIN\Username.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27546</td><td>1033</td><td>Error loading or creating INI file in the user TEMP directory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27547</td><td>1033</td><td>ISNetAPI.dll is not loaded or there was an error loading the dll. This dll needs to be loaded for this operation. Verify that the dll is in the SUPPORTDIR directory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27548</td><td>1033</td><td>Error deleting INI file containing new user information from the user's TEMP directory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27549</td><td>1033</td><td>Error getting the primary domain controller (PDC).</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2755</td><td>1033</td><td>Server returned unexpected error [2] attempting to install package [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27550</td><td>1033</td><td>Every field must have a value in order to create a user.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27551</td><td>1033</td><td>ODBC driver for [2] not found. This is required to connect to [2] database servers.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27552</td><td>1033</td><td>Error creating database [4]. Server: [2] [3]. [5]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27553</td><td>1033</td><td>Error connecting to database [4]. Server: [2] [3]. [5]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27554</td><td>1033</td><td>Error attempting to open connection [2]. No valid database metadata associated with this connection.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_27555</td><td>1033</td><td>Error attempting to apply permissions to object '[2]'. System error: [3] ([4])</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2756</td><td>1033</td><td>The property '[2]' was used as a directory property in one or more tables, but no value was ever assigned.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2757</td><td>1033</td><td>Could not create summary info for transform [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2758</td><td>1033</td><td>Transform [2] does not contain an MSI version.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2759</td><td>1033</td><td>Transform [2] version [3] incompatible with engine; Min: [4], Max: [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2760</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected upgrade code [4], found [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2761</td><td>1033</td><td>Cannot begin transaction. Global mutex not properly initialized.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2762</td><td>1033</td><td>Cannot write script record. Transaction not started.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2763</td><td>1033</td><td>Cannot run script. Transaction not started.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2765</td><td>1033</td><td>Assembly name missing from AssemblyName table : Component: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2766</td><td>1033</td><td>The file [2] is an invalid MSI storage file.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2767</td><td>1033</td><td>No more data{ while enumerating [2]}.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2768</td><td>1033</td><td>Transform in patch package is invalid.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2769</td><td>1033</td><td>Custom Action [2] did not close [3] MSIHANDLEs.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2770</td><td>1033</td><td>Cached folder [2] not defined in internal cache folder table.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2771</td><td>1033</td><td>Upgrade of feature [2] has a missing component.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2772</td><td>1033</td><td>New upgrade feature [2] must be a leaf feature.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_28</td><td>1033</td><td>Another application has exclusive access to the file [2].  Please shut down all other applications, then click Retry.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2801</td><td>1033</td><td>Unknown Message -- Type [2]. No action is taken.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2802</td><td>1033</td><td>No publisher is found for the event [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2803</td><td>1033</td><td>Dialog View did not find a record for the dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2804</td><td>1033</td><td>On activation of the control [3] on dialog [2] CMsiDialog failed to evaluate the condition [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2806</td><td>1033</td><td>The dialog [2] failed to evaluate the condition [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2807</td><td>1033</td><td>The action [2] is not recognized.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2808</td><td>1033</td><td>Default button is ill-defined on dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2809</td><td>1033</td><td>On the dialog [2] the next control pointers do not form a cycle. There is a pointer from [3] to [4], but there is no further pointer.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2810</td><td>1033</td><td>On the dialog [2] the next control pointers do not form a cycle. There is a pointer from both [3] and [5] to [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2811</td><td>1033</td><td>On dialog [2] control [3] has to take focus, but it is unable to do so.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2812</td><td>1033</td><td>The event [2] is not recognized.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2813</td><td>1033</td><td>The EndDialog event was called with the argument [2], but the dialog has a parent.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2814</td><td>1033</td><td>On the dialog [2] the control [3] names a nonexistent control [4] as the next control.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2815</td><td>1033</td><td>ControlCondition table has a row without condition for the dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2816</td><td>1033</td><td>The EventMapping table refers to an invalid control [4] on dialog [2] for the event [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2817</td><td>1033</td><td>The event [2] failed to set the attribute for the control [4] on dialog [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2818</td><td>1033</td><td>In the ControlEvent table EndDialog has an unrecognized argument [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2819</td><td>1033</td><td>Control [3] on dialog [2] needs a property linked to it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2820</td><td>1033</td><td>Attempted to initialize an already initialized handler.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2821</td><td>1033</td><td>Attempted to initialize an already initialized dialog: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2822</td><td>1033</td><td>No other method can be called on dialog [2] until all the controls are added.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2823</td><td>1033</td><td>Attempted to initialize an already initialized control: [3] on dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2824</td><td>1033</td><td>The dialog attribute [3] needs a record of at least [2] field(s).</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2825</td><td>1033</td><td>The control attribute [3] needs a record of at least [2] field(s).</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2826</td><td>1033</td><td>Control [3] on dialog [2] extends beyond the boundaries of the dialog [4] by [5] pixels.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2827</td><td>1033</td><td>The button [4] on the radio button group [3] on dialog [2] extends beyond the boundaries of the group [5] by [6] pixels.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2828</td><td>1033</td><td>Tried to remove control [3] from dialog [2], but the control is not part of the dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2829</td><td>1033</td><td>Attempt to use an uninitialized dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2830</td><td>1033</td><td>Attempt to use an uninitialized control on dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2831</td><td>1033</td><td>The control [3] on dialog [2] does not support [5] the attribute [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2832</td><td>1033</td><td>The dialog [2] does not support the attribute [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2833</td><td>1033</td><td>Control [4] on dialog [3] ignored the message [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2834</td><td>1033</td><td>The next pointers on the dialog [2] do not form a single loop.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2835</td><td>1033</td><td>The control [2] was not found on dialog [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2836</td><td>1033</td><td>The control [3] on the dialog [2] cannot take focus.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2837</td><td>1033</td><td>The control [3] on dialog [2] wants the winproc to return [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2838</td><td>1033</td><td>The item [2] in the selection table has itself as a parent.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2839</td><td>1033</td><td>Setting the property [2] failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2840</td><td>1033</td><td>Error dialog name mismatch.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2841</td><td>1033</td><td>No OK button was found on the error dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2842</td><td>1033</td><td>No text field was found on the error dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2843</td><td>1033</td><td>The ErrorString attribute is not supported for standard dialogs.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2844</td><td>1033</td><td>Cannot execute an error dialog if the Errorstring is not set.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2845</td><td>1033</td><td>The total width of the buttons exceeds the size of the error dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2846</td><td>1033</td><td>SetFocus did not find the required control on the error dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2847</td><td>1033</td><td>The control [3] on dialog [2] has both the icon and the bitmap style set.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2848</td><td>1033</td><td>Tried to set control [3] as the default button on dialog [2], but the control does not exist.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2849</td><td>1033</td><td>The control [3] on dialog [2] is of a type, that cannot be integer valued.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2850</td><td>1033</td><td>Unrecognized volume type.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2851</td><td>1033</td><td>The data for the icon [2] is not valid.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2852</td><td>1033</td><td>At least one control has to be added to dialog [2] before it is used.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2853</td><td>1033</td><td>Dialog [2] is a modeless dialog. The execute method should not be called on it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2854</td><td>1033</td><td>On the dialog [2] the control [3] is designated as first active control, but there is no such control.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2855</td><td>1033</td><td>The radio button group [3] on dialog [2] has fewer than 2 buttons.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2856</td><td>1033</td><td>Creating a second copy of the dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2857</td><td>1033</td><td>The directory [2] is mentioned in the selection table but not found.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2858</td><td>1033</td><td>The data for the bitmap [2] is not valid.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2859</td><td>1033</td><td>Test error message.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2860</td><td>1033</td><td>Cancel button is ill-defined on dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2861</td><td>1033</td><td>The next pointers for the radio buttons on dialog [2] control [3] do not form a cycle.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2862</td><td>1033</td><td>The attributes for the control [3] on dialog [2] do not define a valid icon size. Setting the size to 16.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2863</td><td>1033</td><td>The control [3] on dialog [2] needs the icon [4] in size [5]x[5], but that size is not available. Loading the first available size.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2864</td><td>1033</td><td>The control [3] on dialog [2] received a browse event, but there is no configurable directory for the present selection. Likely cause: browse button is not authored correctly.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2865</td><td>1033</td><td>Control [3] on billboard [2] extends beyond the boundaries of the billboard [4] by [5] pixels.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2866</td><td>1033</td><td>The dialog [2] is not allowed to return the argument [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2867</td><td>1033</td><td>The error dialog property is not set.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2868</td><td>1033</td><td>The error dialog [2] does not have the error style bit set.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2869</td><td>1033</td><td>The dialog [2] has the error style bit set, but is not an error dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2870</td><td>1033</td><td>The help string [4] for control [3] on dialog [2] does not contain the separator character.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2871</td><td>1033</td><td>The [2] table is out of date: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2872</td><td>1033</td><td>The argument of the CheckPath control event on dialog [2] is invalid.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2873</td><td>1033</td><td>On the dialog [2] the control [3] has an invalid string length limit: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2874</td><td>1033</td><td>Changing the text font to [2] failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2875</td><td>1033</td><td>Changing the text color to [2] failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2876</td><td>1033</td><td>The control [3] on dialog [2] had to truncate the string: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2877</td><td>1033</td><td>The binary data [2] was not found</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2878</td><td>1033</td><td>On the dialog [2] the control [3] has a possible value: [4]. This is an invalid or duplicate value.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2879</td><td>1033</td><td>The control [3] on dialog [2] cannot parse the mask string: [4].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2880</td><td>1033</td><td>Do not perform the remaining control events.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2881</td><td>1033</td><td>CMsiHandler initialization failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2882</td><td>1033</td><td>Dialog window class registration failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2883</td><td>1033</td><td>CreateNewDialog failed for the dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2884</td><td>1033</td><td>Failed to create a window for the dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2885</td><td>1033</td><td>Failed to create the control [3] on the dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2886</td><td>1033</td><td>Creating the [2] table failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2887</td><td>1033</td><td>Creating a cursor to the [2] table failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2888</td><td>1033</td><td>Executing the [2] view failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2889</td><td>1033</td><td>Creating the window for the control [3] on dialog [2] failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2890</td><td>1033</td><td>The handler failed in creating an initialized dialog.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2891</td><td>1033</td><td>Failed to destroy window for dialog [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2892</td><td>1033</td><td>[2] is an integer only control, [3] is not a valid integer value.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2893</td><td>1033</td><td>The control [3] on dialog [2] can accept property values that are at most [5] characters long. The value [4] exceeds this limit, and has been truncated.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2894</td><td>1033</td><td>Loading RICHED20.DLL failed. GetLastError() returned: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2895</td><td>1033</td><td>Freeing RICHED20.DLL failed. GetLastError() returned: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2896</td><td>1033</td><td>Executing action [2] failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2897</td><td>1033</td><td>Failed to create any [2] font on this system.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2898</td><td>1033</td><td>For [2] textstyle, the system created a '[3]' font, in [4] character set.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2899</td><td>1033</td><td>Failed to create [2] textstyle. GetLastError() returned: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_29</td><td>1033</td><td>There is not enough disk space to install the file [2].  Free some disk space and click Retry, or click Cancel to exit.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2901</td><td>1033</td><td>Invalid parameter to operation [2]: Parameter [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2902</td><td>1033</td><td>Operation [2] called out of sequence.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2903</td><td>1033</td><td>The file [2] is missing.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2904</td><td>1033</td><td>Could not BindImage file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2905</td><td>1033</td><td>Could not read record from script file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2906</td><td>1033</td><td>Missing header in script file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2907</td><td>1033</td><td>Could not create secure security descriptor. Error: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2908</td><td>1033</td><td>Could not register component [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2909</td><td>1033</td><td>Could not unregister component [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2910</td><td>1033</td><td>Could not determine user's security ID.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2911</td><td>1033</td><td>Could not remove the folder [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2912</td><td>1033</td><td>Could not schedule file [2] for removal on restart.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2919</td><td>1033</td><td>No cabinet specified for compressed file: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2920</td><td>1033</td><td>Source directory not specified for file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2924</td><td>1033</td><td>Script [2] version unsupported. Script version: [3], minimum version: [4], maximum version: [5].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2927</td><td>1033</td><td>ShellFolder id [2] is invalid.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2928</td><td>1033</td><td>Exceeded maximum number of sources. Skipping source '[2]'.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2929</td><td>1033</td><td>Could not determine publishing root. Error: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2932</td><td>1033</td><td>Could not create file [2] from script data. Error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2933</td><td>1033</td><td>Could not initialize rollback script [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2934</td><td>1033</td><td>Could not secure transform [2]. Error [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2935</td><td>1033</td><td>Could not unsecure transform [2]. Error [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2936</td><td>1033</td><td>Could not find transform [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2937</td><td>1033</td><td>Windows Installer cannot install a system file protection catalog. Catalog: [2], Error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2938</td><td>1033</td><td>Windows Installer cannot retrieve a system file protection catalog from the cache. Catalog: [2], Error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2939</td><td>1033</td><td>Windows Installer cannot delete a system file protection catalog from the cache. Catalog: [2], Error: [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2940</td><td>1033</td><td>Directory Manager not supplied for source resolution.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2941</td><td>1033</td><td>Unable to compute the CRC for file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2942</td><td>1033</td><td>BindImage action has not been executed on [2] file.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2943</td><td>1033</td><td>This version of Windows does not support deploying 64-bit packages. The script [2] is for a 64-bit package.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2944</td><td>1033</td><td>GetProductAssignmentType failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_2945</td><td>1033</td><td>Installation of ComPlus App [2] failed with error [3].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_3</td><td>1033</td><td>Info [1]. </td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_30</td><td>1033</td><td>Source file not found: [2].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_3001</td><td>1033</td><td>The patches in this list contain incorrect sequencing information: [2][3][4][5][6][7][8][9][10][11][12][13][14][15][16].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_3002</td><td>1033</td><td>Patch [2] contains invalid sequencing information. </td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_31</td><td>1033</td><td>Error reading from file: [3]. {{ System error [2].}}  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_32</td><td>1033</td><td>Error writing to file: [3]. {{ System error [2].}}  Verify that you have access to that directory.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_33</td><td>1033</td><td>Source file not found{{(cabinet)}}: [2].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_34</td><td>1033</td><td>Cannot create the directory [2].  A file with this name already exists.  Please rename or remove the file and click Retry, or click Cancel to exit.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_35</td><td>1033</td><td>The volume [2] is currently unavailable.  Please select another.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_36</td><td>1033</td><td>The specified path [2] is unavailable.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_37</td><td>1033</td><td>Unable to write to the specified folder [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_38</td><td>1033</td><td>A network error occurred while attempting to read from the file [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_39</td><td>1033</td><td>An error occurred while attempting to create the directory [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_4</td><td>1033</td><td>Internal Error [1]. [2]{, [3]}{, [4]}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_40</td><td>1033</td><td>A network error occurred while attempting to create the directory [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_41</td><td>1033</td><td>A network error occurred while attempting to open the source file cabinet [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_42</td><td>1033</td><td>The specified path is too long [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_43</td><td>1033</td><td>The Installer has insufficient privileges to modify the file [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_44</td><td>1033</td><td>A portion of the path [2] exceeds the length allowed by the system.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_45</td><td>1033</td><td>The path [2] contains words that are not valid in folders.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_46</td><td>1033</td><td>The path [2] contains an invalid character.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_47</td><td>1033</td><td>[2] is not a valid short file name.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_48</td><td>1033</td><td>Error getting file security: [3] GetLastError: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_49</td><td>1033</td><td>Invalid Drive: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_5</td><td>1033</td><td>{{Disk full: }}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_50</td><td>1033</td><td>Could not create key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_51</td><td>1033</td><td>Could not open key: [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_52</td><td>1033</td><td>Could not delete value [2] from key [3]. {{ System error [4].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_53</td><td>1033</td><td>Could not delete key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_54</td><td>1033</td><td>Could not read value [2] from key [3]. {{ System error [4].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_55</td><td>1033</td><td>Could not write value [2] to key [3]. {{ System error [4].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_56</td><td>1033</td><td>Could not get value names for key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_57</td><td>1033</td><td>Could not get sub key names for key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_58</td><td>1033</td><td>Could not read security information for key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_59</td><td>1033</td><td>Could not increase the available registry space. [2] KB of free registry space is required for the installation of this application.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_6</td><td>1033</td><td>Action [Time]: [1]. [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_60</td><td>1033</td><td>Another installation is in progress. You must complete that installation before continuing this one.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_61</td><td>1033</td><td>Error accessing secured data. Please make sure the Windows Installer is configured properly and try the installation again.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_62</td><td>1033</td><td>User [2] has previously initiated an installation for product [3].  That user will need to run that installation again before using that product.  Your current installation will now continue.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_63</td><td>1033</td><td>User [2] has previously initiated an installation for product [3].  That user will need to run that installation again before using that product.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_64</td><td>1033</td><td>Out of disk space -- Volume: '[2]'; required space: [3] KB; available space: [4] KB.  Free some disk space and retry.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_65</td><td>1033</td><td>Are you sure you want to cancel?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_66</td><td>1033</td><td>The file [2][3] is being held in use{ by the following process: Name: [4], ID: [5], Window Title: [6]}.  Close that application and retry.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_67</td><td>1033</td><td>The product [2] is already installed, preventing the installation of this product.  The two products are incompatible.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_68</td><td>1033</td><td>Out of disk space -- Volume: [2]; required space: [3] KB; available space: [4] KB.  If rollback is disabled, enough space is available. Click Cancel to quit, Retry to check available disk space again, or Ignore to continue without rollback.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_69</td><td>1033</td><td>Could not access network location [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_7</td><td>1033</td><td>[ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_70</td><td>1033</td><td>The following applications should be closed before continuing the installation:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_71</td><td>1033</td><td>Could not find any previously installed compliant products on the machine for installing this product.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_72</td><td>1033</td><td>The key [2] is not valid.  Verify that you entered the correct key.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_73</td><td>1033</td><td>The installer must restart your system before configuration of [2] can continue.  Click Yes to restart now or No if you plan to restart later.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_74</td><td>1033</td><td>You must restart your system for the configuration changes made to [2] to take effect. Click Yes to restart now or No if you plan to restart later.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_75</td><td>1033</td><td>An installation for [2] is currently suspended.  You must undo the changes made by that installation to continue.  Do you want to undo those changes?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_76</td><td>1033</td><td>A previous installation for this product is in progress.  You must undo the changes made by that installation to continue.  Do you want to undo those changes?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_77</td><td>1033</td><td>No valid source could be found for product [2].  The Windows Installer cannot continue.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_78</td><td>1033</td><td>Installation operation completed successfully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_79</td><td>1033</td><td>Installation operation failed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_8</td><td>1033</td><td>{[2]}{, [3]}{, [4]}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_80</td><td>1033</td><td>Product: [2] -- [3]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_81</td><td>1033</td><td>You may either restore your computer to its previous state or continue the installation later. Would you like to restore?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_82</td><td>1033</td><td>An error occurred while writing installation information to disk.  Check to make sure enough disk space is available, and click Retry, or Cancel to end the installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_83</td><td>1033</td><td>One or more of the files required to restore your computer to its previous state could not be found.  Restoration will not be possible.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_84</td><td>1033</td><td>The path [2] is not valid.  Please specify a valid path.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_85</td><td>1033</td><td>Out of memory. Shut down other applications before retrying.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_86</td><td>1033</td><td>There is no disk in drive [2]. Please insert one and click Retry, or click Cancel to go back to the previously selected volume.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_87</td><td>1033</td><td>There is no disk in drive [2]. Please insert one and click Retry, or click Cancel to return to the browse dialog and select a different volume.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_88</td><td>1033</td><td>The folder [2] does not exist.  Please enter a path to an existing folder.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_89</td><td>1033</td><td>You have insufficient privileges to read this folder.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_9</td><td>1033</td><td>Message type: [1], Argument: [2]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_90</td><td>1033</td><td>A valid destination folder for the installation could not be determined.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_91</td><td>1033</td><td>Error attempting to read from the source installation database: [2].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_92</td><td>1033</td><td>Scheduling reboot operation: Renaming file [2] to [3]. Must reboot to complete operation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_93</td><td>1033</td><td>Scheduling reboot operation: Deleting file [2]. Must reboot to complete operation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_94</td><td>1033</td><td>Module [2] failed to register.  HRESULT [3].  Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_95</td><td>1033</td><td>Module [2] failed to unregister.  HRESULT [3].  Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_96</td><td>1033</td><td>Failed to cache package [2]. Error: [3]. Contact your support personnel.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_97</td><td>1033</td><td>Could not register font [2].  Verify that you have sufficient permissions to install fonts, and that the system supports this font.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_98</td><td>1033</td><td>Could not unregister font [2]. Verify that you have sufficient permissions to remove fonts.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ERROR_99</td><td>1033</td><td>Could not create shortcut [2]. Verify that the destination folder exists and that you can access it.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_INSTALLDIR</td><td>1033</td><td>[INSTALLDIR]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_INSTALLSHIELD</td><td>1033</td><td>InstallShield</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_INSTALLSHIELD_FORMATTED</td><td>1033</td><td>{&amp;MSSWhiteSerif8}InstallShield</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ISSCRIPT_VERSION_MISSING</td><td>1033</td><td>The InstallScript engine is missing from this machine.  If available, please run ISScript.msi, or contact your support personnel for further assistance.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_ISSCRIPT_VERSION_OLD</td><td>1033</td><td>The InstallScript engine on this machine is older than the version required to run this setup.  If available, please install the latest version of ISScript.msi, or contact your support personnel for further assistance.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_NEXT</td><td>1033</td><td>&amp;Next &gt;</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PREREQUISITE_SETUP_BROWSE</td><td>1033</td><td>Open [ProductName]'s original [SETUPEXENAME]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PREREQUISITE_SETUP_INVALID</td><td>1033</td><td>This executable file does not appear to be the original executable file for [ProductName]. Without using the original [SETUPEXENAME] to install additional dependencies, [ProductName] may not work correctly. Would you like to find the original [SETUPEXENAME]?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PREREQUISITE_SETUP_SEARCH</td><td>1033</td><td>This installation may require additional dependencies. Without its dependencies, [ProductName] may not work correctly. Would you like to find the original [SETUPEXENAME]?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PREVENT_DOWNGRADE_EXIT</td><td>1033</td><td>A newer version of this application is already installed on this computer. If you wish to install this version, please uninstall the newer version first. Click OK to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PRINT_BUTTON</td><td>1033</td><td>&amp;Print</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PRODUCTNAME_INSTALLSHIELD</td><td>1033</td><td>[ProductName] - InstallShield Wizard</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEAPPPOOL</td><td>1033</td><td>Creating application pool %s</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEAPPPOOLS</td><td>1033</td><td>Creating application Pools...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEVROOT</td><td>1033</td><td>Creating IIS virtual directory %s</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEVROOTS</td><td>1033</td><td>Creating IIS virtual directories...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSION</td><td>1033</td><td>Creating web service extension</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSIONS</td><td>1033</td><td>Creating web service extensions...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSITE</td><td>1033</td><td>Creating IIS website %s</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSITES</td><td>1033</td><td>Creating IIS websites...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_EXTRACT</td><td>1033</td><td>Extracting information for IIS virtual directories...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_EXTRACTDONE</td><td>1033</td><td>Extracted information for IIS virtual directories...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEAPPPOOL</td><td>1033</td><td>Removing application pool</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEAPPPOOLS</td><td>1033</td><td>Removing application pools...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVESITE</td><td>1033</td><td>Removing web site at port %d</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEVROOT</td><td>1033</td><td>Removing IIS virtual directory %s</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEVROOTS</td><td>1033</td><td>Removing IIS virtual directories...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSION</td><td>1033</td><td>Removing web service extension</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSIONS</td><td>1033</td><td>Removing web service extensions...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEWEBSITES</td><td>1033</td><td>Removing IIS websites...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_ROLLBACKAPPPOOLS</td><td>1033</td><td>Rolling back application pools...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_ROLLBACKVROOTS</td><td>1033</td><td>Rolling back virtual directory and web site changes...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_IIS_ROLLBACKWEBSERVICEEXTENSIONS</td><td>1033</td><td>Rolling back web service extensions...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_TEXTFILECHANGS_REPLACE</td><td>1033</td><td>Replacing %s with %s in %s...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_XML_COSTING</td><td>1033</td><td>Costing XML files...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_XML_CREATE_FILE</td><td>1033</td><td>Creating XML file %s...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_XML_FILES</td><td>1033</td><td>Performing XML file changes...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_XML_REMOVE_FILE</td><td>1033</td><td>Removing XML file %s...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_XML_ROLLBACK_FILES</td><td>1033</td><td>Rolling back XML file changes...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_PROGMSG_XML_UPDATE_FILE</td><td>1033</td><td>Updating XML file %s...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SETUPEXE_EXPIRE_MSG</td><td>1033</td><td>This setup works until %s. The setup will now exit.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME10</td><td>1033</td><td>LAUNCH~1.EXE|Launch tee.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME100</td><td>1033</td><td>LAUNCH~1.EXE|Launch xzcat.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME101</td><td>1033</td><td>LAUNCH~1.EXE|Launch xzdec.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME102</td><td>1033</td><td>LAUNCH~1.EXE|Launch grcat.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME103</td><td>1033</td><td>LAUNCH~1.EXE|Launch pwcat.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME104</td><td>1033</td><td>LAUNCH~1.EXE|Launch ncat.exe</td><td>0</td><td/><td>639577904</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME105</td><td>1033</td><td>LAUNCH~1.EXE|Launch nmap.exe</td><td>0</td><td/><td>639577904</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME106</td><td>1033</td><td>LAUNCH~1.EXE|Launch nping.exe</td><td>0</td><td/><td>639577904</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME107</td><td>1033</td><td>LAUNCH~1.EXE|Launch vcredist_x86.exe</td><td>0</td><td/><td>639577904</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME108</td><td>1033</td><td>Install WinPcap 4.1.2</td><td>0</td><td/><td>639598641</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME109</td><td>1033</td><td>LAUNCH~1.EXE|Launch psexec.exe</td><td>0</td><td/><td>639604528</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME11</td><td>1033</td><td>LAUNCH~1.EXE|Launch awk.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME110</td><td>1033</td><td>LAUNCH~1.EXE|Launch pageant.exe</td><td>0</td><td/><td>639618864</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME111</td><td>1033</td><td>LAUNCH~1.EXE|Launch plink.exe</td><td>0</td><td/><td>639618864</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME112</td><td>1033</td><td>LAUNCH~1.EXE|Launch pscp.exe</td><td>0</td><td/><td>639618864</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME113</td><td>1033</td><td>LAUNCH~1.EXE|Launch psftp.exe</td><td>0</td><td/><td>639618864</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME114</td><td>1033</td><td>LAUNCH~1.EXE|Launch putty.exe</td><td>0</td><td/><td>639618864</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME115</td><td>1033</td><td>LAUNCH~1.EXE|Launch puttygen.exe</td><td>0</td><td/><td>639618864</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME116</td><td>1033</td><td>Session Shell</td><td>0</td><td/><td>639582385</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME12</td><td>1033</td><td>LAUNCH~1.EXE|Launch basename.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME13</td><td>1033</td><td>LAUNCH~1.EXE|Launch bash.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME14</td><td>1033</td><td>LAUNCH~1.EXE|Launch bunzip2.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME15</td><td>1033</td><td>LAUNCH~1.EXE|Launch bzcat.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME16</td><td>1033</td><td>LAUNCH~1.EXE|Launch bzip2.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME17</td><td>1033</td><td>LAUNCH~1.EXE|Launch bzip2recover.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME18</td><td>1033</td><td>LAUNCH~1.EXE|Launch cat.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME19</td><td>1033</td><td>LAUNCH~1.EXE|Launch chmod.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME20</td><td>1033</td><td>LAUNCH~1.EXE|Launch cmp.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME21</td><td>1033</td><td>LAUNCH~1.EXE|Launch comm.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME22</td><td>1033</td><td>LAUNCH~1.EXE|Launch conv.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME23</td><td>1033</td><td>LAUNCH~1.EXE|Launch cp.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME24</td><td>1033</td><td>LAUNCH~1.EXE|Launch cut.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME25</td><td>1033</td><td>LAUNCH~1.EXE|Launch d2u.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME26</td><td>1033</td><td>LAUNCH~1.EXE|Launch date.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME27</td><td>1033</td><td>LAUNCH~1.EXE|Launch diff.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME28</td><td>1033</td><td>LAUNCH~1.EXE|Launch diff3.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME29</td><td>1033</td><td>LAUNCH~1.EXE|Launch dirname.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME30</td><td>1033</td><td>LAUNCH~1.EXE|Launch dos2unix.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME31</td><td>1033</td><td>LAUNCH~1.EXE|Launch echo.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME32</td><td>1033</td><td>LAUNCH~1.EXE|Launch egrep.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME33</td><td>1033</td><td>LAUNCH~1.EXE|Launch env.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME34</td><td>1033</td><td>LAUNCH~1.EXE|Launch error-mode.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME35</td><td>1033</td><td>LAUNCH~1.EXE|Launch expr.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME36</td><td>1033</td><td>LAUNCH~1.EXE|Launch false.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME37</td><td>1033</td><td>LAUNCH~1.EXE|Launch fgrep.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME38</td><td>1033</td><td>LAUNCH~1.EXE|Launch file.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME39</td><td>1033</td><td>LAUNCH~1.EXE|Launch find.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME4</td><td>1033</td><td>LAUNCH~1.EXE|Launch cryptRDP5.exe</td><td>0</td><td/><td>639618800</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME40</td><td>1033</td><td>LAUNCH~1.EXE|Launch fold.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME41</td><td>1033</td><td>LAUNCH~1.EXE|Launch gawk-3.1.7.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME42</td><td>1033</td><td>LAUNCH~1.EXE|Launch gawk.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME43</td><td>1033</td><td>LAUNCH~1.EXE|Launch grep.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME44</td><td>1033</td><td>LAUNCH~1.EXE|Launch gzip.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME45</td><td>1033</td><td>LAUNCH~1.EXE|Launch head.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME46</td><td>1033</td><td>LAUNCH~1.EXE|Launch id.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME47</td><td>1033</td><td>LAUNCH~1.EXE|Launch info.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME48</td><td>1033</td><td>LAUNCH~1.EXE|Launch infokey.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME49</td><td>1033</td><td>LAUNCH~1.EXE|Launch install-info.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME5</td><td>1033</td><td>LAUNCH~1.EXE|Launch mingw-get.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME50</td><td>1033</td><td>LAUNCH~1.EXE|Launch install.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME51</td><td>1033</td><td>LAUNCH~1.EXE|Launch join.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME52</td><td>1033</td><td>LAUNCH~1.EXE|Launch less.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME53</td><td>1033</td><td>LAUNCH~1.EXE|Launch lessecho.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME54</td><td>1033</td><td>LAUNCH~1.EXE|Launch lesskey.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME55</td><td>1033</td><td>LAUNCH~1.EXE|Launch ln.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME56</td><td>1033</td><td>LAUNCH~1.EXE|Launch ls.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME57</td><td>1033</td><td>LAUNCH~1.EXE|Launch lzcat.exe</td><td>0</td><td/><td>639590160</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME58</td><td>1033</td><td>LAUNCH~1.EXE|Launch lzma.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME59</td><td>1033</td><td>LAUNCH~1.EXE|Launch lzmadec.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME6</td><td>1033</td><td>LAUNCH~1.EXE|Launch pkginfo.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME60</td><td>1033</td><td>LAUNCH~1.EXE|Launch lzmainfo.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME61</td><td>1033</td><td>LAUNCH~1.EXE|Launch make.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME62</td><td>1033</td><td>LAUNCH~1.EXE|Launch makeinfo.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME63</td><td>1033</td><td>LAUNCH~1.EXE|Launch md5sum.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME64</td><td>1033</td><td>LAUNCH~1.EXE|Launch mkdir.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME65</td><td>1033</td><td>LAUNCH~1.EXE|Launch msysmnt.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME66</td><td>1033</td><td>LAUNCH~1.EXE|Launch mv.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME67</td><td>1033</td><td>LAUNCH~1.EXE|Launch od.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME68</td><td>1033</td><td>LAUNCH~1.EXE|Launch oldfind.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME69</td><td>1033</td><td>LAUNCH~1.EXE|Launch paste.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME7</td><td>1033</td><td>LAUNCH~1.EXE|Launch cleanfile.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME70</td><td>1033</td><td>LAUNCH~1.EXE|Launch pgawk-3.1.7.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME71</td><td>1033</td><td>LAUNCH~1.EXE|Launch pgawk.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME72</td><td>1033</td><td>LAUNCH~1.EXE|Launch printf.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME73</td><td>1033</td><td>LAUNCH~1.EXE|Launch ps.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME74</td><td>1033</td><td>LAUNCH~1.EXE|Launch pwd.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME75</td><td>1033</td><td>LAUNCH~1.EXE|Launch rm.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME76</td><td>1033</td><td>LAUNCH~1.EXE|Launch rmdir.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME77</td><td>1033</td><td>LAUNCH~1.EXE|Launch sdiff.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME78</td><td>1033</td><td>LAUNCH~1.EXE|Launch sed.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME79</td><td>1033</td><td>LAUNCH~1.EXE|Launch sh.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME8</td><td>1033</td><td>LAUNCH~1.EXE|Launch gui.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME80</td><td>1033</td><td>LAUNCH~1.EXE|Launch sleep.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME81</td><td>1033</td><td>LAUNCH~1.EXE|Launch sort.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME82</td><td>1033</td><td>LAUNCH~1.EXE|Launch split.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME83</td><td>1033</td><td>LAUNCH~1.EXE|Launch stty.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME84</td><td>1033</td><td>LAUNCH~1.EXE|Launch tail.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME85</td><td>1033</td><td>LAUNCH~1.EXE|Launch tar.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME86</td><td>1033</td><td>LAUNCH~1.EXE|Launch tee.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME87</td><td>1033</td><td>LAUNCH~1.EXE|Launch texindex.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME88</td><td>1033</td><td>LAUNCH~1.EXE|Launch touch.exe</td><td>0</td><td/><td>639592208</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME89</td><td>1033</td><td>LAUNCH~1.EXE|Launch tr.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME9</td><td>1033</td><td>LAUNCH~1.EXE|Launch lastrites.exe</td><td>0</td><td/><td>639588112</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME90</td><td>1033</td><td>LAUNCH~1.EXE|Launch true.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME91</td><td>1033</td><td>LAUNCH~1.EXE|Launch u2d.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME92</td><td>1033</td><td>LAUNCH~1.EXE|Launch uname.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME93</td><td>1033</td><td>LAUNCH~1.EXE|Launch uniq.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME94</td><td>1033</td><td>LAUNCH~1.EXE|Launch unix2dos.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME95</td><td>1033</td><td>LAUNCH~1.EXE|Launch unlzma.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME96</td><td>1033</td><td>LAUNCH~1.EXE|Launch unxz.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME97</td><td>1033</td><td>LAUNCH~1.EXE|Launch wc.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME98</td><td>1033</td><td>LAUNCH~1.EXE|Launch xargs.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SHORTCUT_DISPLAY_NAME99</td><td>1033</td><td>LAUNCH~1.EXE|Launch xz.exe</td><td>0</td><td/><td>639594256</td></row>
		<row><td>IDS_SQLBROWSE_INTRO</td><td>1033</td><td>From the list of servers below, select the database server you would like to target.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLBROWSE_INTRO_DB</td><td>1033</td><td>From the list of catalog names below, select the database catalog you would like to target.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLBROWSE_INTRO_TEMPLATE</td><td>1033</td><td>[IS_SQLBROWSE_INTRO]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_BROWSE</td><td>1033</td><td>B&amp;rowse...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_BROWSE_DB</td><td>1033</td><td>Br&amp;owse...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_CATALOG</td><td>1033</td><td>&amp;Name of database catalog:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_CONNECT</td><td>1033</td><td>Connect using:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_DESC</td><td>1033</td><td>Select database server and authentication method</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_ID</td><td>1033</td><td>&amp;Login ID:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_INTRO</td><td>1033</td><td>Select the database server to install to from the list below or click Browse to see a list of all database servers. You can also specify the way to authenticate your login using your current credentials or a SQL Login ID and Password.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_PSWD</td><td>1033</td><td>&amp;Password:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_SERVER</td><td>1033</td><td>&amp;Database Server:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_SERVER2</td><td>1033</td><td>&amp;Database server that you are installing to:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_SQL</td><td>1033</td><td>S&amp;erver authentication using the Login ID and password below</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_TITLE</td><td>1033</td><td>{&amp;MSSansBold8}Database Server</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLLOGIN_WIN</td><td>1033</td><td>&amp;Windows authentication credentials of current user</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLSCRIPT_INSTALLING</td><td>1033</td><td>Executing SQL Install Script...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SQLSCRIPT_UNINSTALLING</td><td>1033</td><td>Executing SQL Uninstall Script...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_STANDARD_USE_SETUPEXE</td><td>1033</td><td>This installation cannot be run by directly launching the MSI package. You must run setup.exe.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_Advertise</td><td>1033</td><td>Will be installed on first use. (Available only if the feature supports this option.)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_AllInstalledLocal</td><td>1033</td><td>Will be completely installed to the local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_CustomSetup</td><td>1033</td><td>{&amp;MSSansBold8}Custom Setup Tips</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_CustomSetupDescription</td><td>1033</td><td>Custom Setup allows you to selectively install program features.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_IconInstallState</td><td>1033</td><td>The icon next to the feature name indicates the install state of the feature. Click the icon to drop down the install state menu for each feature.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_InstallState</td><td>1033</td><td>This install state means the feature...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_Network</td><td>1033</td><td>Will be installed to run from the network. (Available only if the feature supports this option.)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_SubFeaturesInstalledLocal</td><td>1033</td><td>Will have some subfeatures installed to the local hard drive. (Available only if the feature has subfeatures.)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_SetupTips_WillNotBeInstalled</td><td>1033</td><td>Will not be installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_Available</td><td>1033</td><td>Available</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_Bytes</td><td>1033</td><td>bytes</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_CompilingFeaturesCost</td><td>1033</td><td>Compiling cost for this feature...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_Differences</td><td>1033</td><td>Differences</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_DiskSize</td><td>1033</td><td>Disk Size</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureCompletelyRemoved</td><td>1033</td><td>This feature will be completely removed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureContinueNetwork</td><td>1033</td><td>This feature will continue to be run from the network</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureFreeSpace</td><td>1033</td><td>This feature frees up [1] on your hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledCD</td><td>1033</td><td>This feature, and all subfeatures, will be installed to run from the CD.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledCD2</td><td>1033</td><td>This feature will be installed to run from CD.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledLocal</td><td>1033</td><td>This feature, and all subfeatures, will be installed on local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledLocal2</td><td>1033</td><td>This feature will be installed on local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledNetwork</td><td>1033</td><td>This feature, and all subfeatures, will be installed to run from the network.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledNetwork2</td><td>1033</td><td>This feature will be installed to run from network.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledRequired</td><td>1033</td><td>Will be installed when required.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledWhenRequired</td><td>1033</td><td>This feature will be set to be installed when required.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledWhenRequired2</td><td>1033</td><td>This feature will be installed when required.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureLocal</td><td>1033</td><td>This feature will be installed on the local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureLocal2</td><td>1033</td><td>This feature will be installed on your local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureNetwork</td><td>1033</td><td>This feature will be installed to run from the network.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureNetwork2</td><td>1033</td><td>This feature will be available to run from the network.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureNotAvailable</td><td>1033</td><td>This feature will not be available.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureOnCD</td><td>1033</td><td>This feature will be installed to run from CD.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureOnCD2</td><td>1033</td><td>This feature will be available to run from CD.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureRemainLocal</td><td>1033</td><td>This feature will remain on your local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureRemoveNetwork</td><td>1033</td><td>This feature will be removed from your local hard drive, but will be still available to run from the network.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureRemovedCD</td><td>1033</td><td>This feature will be removed from your local hard drive but will still be available to run from CD.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureRemovedUnlessRequired</td><td>1033</td><td>This feature will be removed from your local hard drive but will be set to be installed when required.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureRequiredSpace</td><td>1033</td><td>This feature requires [1] on your hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureRunFromCD</td><td>1033</td><td>This feature will continue to be run from the CD</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree</td><td>1033</td><td>This feature frees up [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures free up [4] on your hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree2</td><td>1033</td><td>This feature frees up [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures require [4] on your hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree3</td><td>1033</td><td>This feature requires [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures free up [4] on your hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree4</td><td>1033</td><td>This feature requires [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures require [4] on your hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureUnavailable</td><td>1033</td><td>This feature will become unavailable.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureUninstallNoNetwork</td><td>1033</td><td>This feature will be uninstalled completely, and you won't be able to run it from the network.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureWasCD</td><td>1033</td><td>This feature was run from the CD but will be set to be installed when required.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureWasCDLocal</td><td>1033</td><td>This feature was run from the CD but will be installed on the local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureWasOnNetworkInstalled</td><td>1033</td><td>This feature was run from the network but will be installed when required.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureWasOnNetworkLocal</td><td>1033</td><td>This feature was run from the network but will be installed on the local hard drive.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_FeatureWillBeUninstalled</td><td>1033</td><td>This feature will be uninstalled completely, and you won't be able to run it from CD.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_Folder</td><td>1033</td><td>Fldr|New Folder</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_GB</td><td>1033</td><td>GB</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_KB</td><td>1033</td><td>KB</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_MB</td><td>1033</td><td>MB</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_Required</td><td>1033</td><td>Required</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_TimeRemaining</td><td>1033</td><td>Time remaining: {[1] min }{[2] sec}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS_UITEXT_Volume</td><td>1033</td><td>Volume</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__AgreeToLicense_0</td><td>1033</td><td>I &amp;do not accept the terms in the license agreement</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__AgreeToLicense_1</td><td>1033</td><td>I &amp;accept the terms in the license agreement</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DatabaseFolder_ChangeFolder</td><td>1033</td><td>Click Next to install to this folder, or click Change to install to a different folder.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DatabaseFolder_DatabaseDir</td><td>1033</td><td>[DATABASEDIR]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DatabaseFolder_DatabaseFolder</td><td>1033</td><td>{&amp;MSSansBold8}Database Folder</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DestinationFolder_Change</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DestinationFolder_ChangeFolder</td><td>1033</td><td>Click Next to install to this folder, or click Change to install to a different folder.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DestinationFolder_DestinationFolder</td><td>1033</td><td>{&amp;MSSansBold8}Destination Folder</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DestinationFolder_InstallTo</td><td>1033</td><td>Install [ProductName] to:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DisplayName_Custom</td><td>1033</td><td>Custom</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DisplayName_Minimal</td><td>1033</td><td>Minimal</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__DisplayName_Typical</td><td>1033</td><td>Typical</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_11</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_4</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_8</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_BrowseDestination</td><td>1033</td><td>Browse to the destination folder.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_ChangeDestination</td><td>1033</td><td>{&amp;MSSansBold8}Change Current Destination Folder</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_CreateFolder</td><td>1033</td><td>Create new folder|</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_FolderName</td><td>1033</td><td>&amp;Folder name:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_LookIn</td><td>1033</td><td>&amp;Look in:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallBrowse_UpOneLevel</td><td>1033</td><td>Up one level|</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPointWelcome_ServerImage</td><td>1033</td><td>The InstallShield(R) Wizard will create a server image of [ProductName] at a specified network location. To continue, click Next.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPointWelcome_Wizard</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPoint_Change</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPoint_EnterNetworkLocation</td><td>1033</td><td>Enter the network location or click Change to browse to a location.  Click Install to create a server image of [ProductName] at the specified network location or click Cancel to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPoint_Install</td><td>1033</td><td>&amp;Install</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPoint_NetworkLocation</td><td>1033</td><td>&amp;Network location:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPoint_NetworkLocationFormatted</td><td>1033</td><td>{&amp;MSSansBold8}Network Location</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsAdminInstallPoint_SpecifyNetworkLocation</td><td>1033</td><td>Specify a network location for the server image of the product.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseButton</td><td>1033</td><td>&amp;Browse...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_11</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_4</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_8</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_BrowseDestFolder</td><td>1033</td><td>Browse to the destination folder.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_ChangeCurrentFolder</td><td>1033</td><td>{&amp;MSSansBold8}Change Current Destination Folder</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_CreateFolder</td><td>1033</td><td>Create New Folder|</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_FolderName</td><td>1033</td><td>&amp;Folder name:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_LookIn</td><td>1033</td><td>&amp;Look in:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseFolderDlg_UpOneLevel</td><td>1033</td><td>Up One Level|</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseForAccount</td><td>1033</td><td>Browse for a User Account</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseGroup</td><td>1033</td><td>Select a Group</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsBrowseUsernameTitle</td><td>1033</td><td>Select a User Name</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCancelDlg_ConfirmCancel</td><td>1033</td><td>Are you sure you want to cancel [ProductName] installation?</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCancelDlg_No</td><td>1033</td><td>&amp;No</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCancelDlg_Yes</td><td>1033</td><td>&amp;Yes</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsConfirmPassword</td><td>1033</td><td>Con&amp;firm password:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCreateNewUserTitle</td><td>1033</td><td>New User Information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCreateUserBrowse</td><td>1033</td><td>N&amp;ew User Information...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_Change</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_ClickFeatureIcon</td><td>1033</td><td>Click on an icon in the list below to change how a feature is installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_CustomSetup</td><td>1033</td><td>{&amp;MSSansBold8}Custom Setup</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_FeatureDescription</td><td>1033</td><td>Feature Description</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_FeaturePath</td><td>1033</td><td>&lt;selected feature path&gt;</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_FeatureSize</td><td>1033</td><td>Feature size</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_Help</td><td>1033</td><td>&amp;Help</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_InstallTo</td><td>1033</td><td>Install to:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_MultilineDescription</td><td>1033</td><td>Multiline description of the currently selected item</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_SelectFeatures</td><td>1033</td><td>Select the program features you want installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsCustomSelectionDlg_Space</td><td>1033</td><td>&amp;Space</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsDiskSpaceDlg_DiskSpace</td><td>1033</td><td>Disk space required for the installation exceeds available disk space.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsDiskSpaceDlg_HighlightedVolumes</td><td>1033</td><td>The highlighted volumes do not have enough disk space available for the currently selected features. You can remove files from the highlighted volumes, choose to install fewer features onto local drives, or select different destination drives.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsDiskSpaceDlg_Numbers</td><td>1033</td><td>{120}{70}{70}{70}{70}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsDiskSpaceDlg_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsDiskSpaceDlg_OutOfDiskSpace</td><td>1033</td><td>{&amp;MSSansBold8}Out of Disk Space</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsDomainOrServer</td><td>1033</td><td>&amp;Domain or server:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_Abort</td><td>1033</td><td>&amp;Abort</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_ErrorText</td><td>1033</td><td>&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_Ignore</td><td>1033</td><td>&amp;Ignore</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_InstallerInfo</td><td>1033</td><td>[ProductName] Installer Information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_NO</td><td>1033</td><td>&amp;No</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_OK</td><td>1033</td><td>&amp;OK</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_Retry</td><td>1033</td><td>&amp;Retry</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsErrorDlg_Yes</td><td>1033</td><td>&amp;Yes</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_Finish</td><td>1033</td><td>&amp;Finish</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_InstallSuccess</td><td>1033</td><td>The InstallShield Wizard has successfully installed [ProductName]. Click Finish to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_LaunchProgram</td><td>1033</td><td>Launch the program</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_ShowReadMe</td><td>1033</td><td>Show the readme file</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_UninstallSuccess</td><td>1033</td><td>The InstallShield Wizard has successfully uninstalled [ProductName]. Click Finish to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_Update_InternetConnection</td><td>1033</td><td>Your Internet connection can be used to make sure that you have the latest updates.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_Update_PossibleUpdates</td><td>1033</td><td>Some program files might have been updated since you purchased your copy of [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_Update_SetupFinished</td><td>1033</td><td>Setup has finished installing [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_Update_YesCheckForUpdates</td><td>1033</td><td>&amp;Yes, check for program updates (Recommended) after the setup completes.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsExitDialog_WizardCompleted</td><td>1033</td><td>{&amp;TahomaBold10}InstallShield Wizard Completed</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_ClickFinish</td><td>1033</td><td>Click Finish to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_Finish</td><td>1033</td><td>&amp;Finish</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_KeepOrRestore</td><td>1033</td><td>You can either keep any existing installed elements on your system to continue this installation at a later time or you can restore your system to its original state prior to the installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_NotModified</td><td>1033</td><td>Your system has not been modified. To complete installation at another time, please run setup again.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_RestoreOrContinueLater</td><td>1033</td><td>Click Restore or Continue Later to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_WizardCompleted</td><td>1033</td><td>{&amp;TahomaBold10}InstallShield Wizard Completed</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFatalError_WizardInterrupted</td><td>1033</td><td>The wizard was interrupted before [ProductName] could be completely installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_DiskSpaceRequirements</td><td>1033</td><td>{&amp;MSSansBold8}Disk Space Requirements</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_Numbers</td><td>1033</td><td>{120}{70}{70}{70}{70}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_SpaceRequired</td><td>1033</td><td>The disk space required for the installation of the selected features.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_VolumesTooSmall</td><td>1033</td><td>The highlighted volumes do not have enough disk space available for the currently selected features. You can remove files from the highlighted volumes, choose to install fewer features onto local drives, or select different destination drives.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFilesInUse_ApplicationsUsingFiles</td><td>1033</td><td>The following applications are using files that need to be updated by this setup. Close these applications and click Retry to continue.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFilesInUse_Exit</td><td>1033</td><td>&amp;Exit</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFilesInUse_FilesInUse</td><td>1033</td><td>{&amp;MSSansBold8}Files in Use</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFilesInUse_FilesInUseMessage</td><td>1033</td><td>Some files that need to be updated are currently in use.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFilesInUse_Ignore</td><td>1033</td><td>&amp;Ignore</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsFilesInUse_Retry</td><td>1033</td><td>&amp;Retry</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsGroup</td><td>1033</td><td>&amp;Group:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsGroupLabel</td><td>1033</td><td>Gr&amp;oup:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsInitDlg_1</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsInitDlg_2</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsInitDlg_PreparingWizard</td><td>1033</td><td>[ProductName] Setup is preparing the InstallShield Wizard which will guide you through the program setup process.  Please wait.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsInitDlg_WelcomeWizard</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsLicenseDlg_LicenseAgreement</td><td>1033</td><td>{&amp;MSSansBold8}License Agreement</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsLicenseDlg_ReadLicenseAgreement</td><td>1033</td><td>Please read the following license agreement carefully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsLogonInfoDescription</td><td>1033</td><td>Specify the user name and password of the user account that will logon to use this application. The user account must be in the form DOMAIN\Username.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsLogonInfoTitle</td><td>1033</td><td>{&amp;MSSansBold8}Logon Information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsLogonInfoTitleDescription</td><td>1033</td><td>Specify a user name and password</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsLogonNewUserDescription</td><td>1033</td><td>Select the button below to specify information about a new user that will be created during the installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_ChangeFeatures</td><td>1033</td><td>Change which program features are installed. This option displays the Custom Selection dialog in which you can change the way features are installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_MaitenanceOptions</td><td>1033</td><td>Modify, repair, or remove the program.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_Modify</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Modify</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_ProgramMaintenance</td><td>1033</td><td>{&amp;MSSansBold8}Program Maintenance</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_Remove</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Remove</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_RemoveProductName</td><td>1033</td><td>Remove [ProductName] from your computer.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_Repair</td><td>1033</td><td>{&amp;MSSansBold8}Re&amp;pair</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceDlg_RepairMessage</td><td>1033</td><td>Repair installation errors in the program. This option fixes missing or corrupt files, shortcuts, and registry entries.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceWelcome_MaintenanceOptionsDescription</td><td>1033</td><td>The InstallShield(R) Wizard will allow you to modify, repair, or remove [ProductName]. To continue, click Next.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMaintenanceWelcome_WizardWelcome</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMsiRMFilesInUse_ApplicationsUsingFiles</td><td>1033</td><td>The following applications are using files that need to be updated by this setup.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMsiRMFilesInUse_CloseRestart</td><td>1033</td><td>Automatically close and attempt to restart applications.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsMsiRMFilesInUse_RebootAfter</td><td>1033</td><td>Do not close applications. (A reboot will be required.)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsPatchDlg_PatchClickUpdate</td><td>1033</td><td>The InstallShield(R) Wizard will install the Patch for [ProductName] on your computer.  To continue, click Update.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsPatchDlg_PatchWizard</td><td>1033</td><td>[ProductName] Patch - InstallShield Wizard</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsPatchDlg_Update</td><td>1033</td><td>&amp;Update &gt;</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsPatchDlg_WelcomePatchWizard</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the Patch for [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_2</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_Hidden</td><td>1033</td><td>(Hidden for now)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_HiddenTimeRemaining</td><td>1033</td><td>)Hidden for now)Estimated time remaining:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_InstallingProductName</td><td>1033</td><td>{&amp;MSSansBold8}Installing [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_ProgressDone</td><td>1033</td><td>Progress done</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_SecHidden</td><td>1033</td><td>(Hidden for now)Sec.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_Status</td><td>1033</td><td>Status:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_Uninstalling</td><td>1033</td><td>{&amp;MSSansBold8}Uninstalling [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_UninstallingFeatures</td><td>1033</td><td>The program features you selected are being uninstalled.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_UninstallingFeatures2</td><td>1033</td><td>The program features you selected are being installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_WaitUninstall</td><td>1033</td><td>Please wait while the InstallShield Wizard uninstalls [ProductName]. This may take several minutes.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsProgressDlg_WaitUninstall2</td><td>1033</td><td>Please wait while the InstallShield Wizard installs [ProductName]. This may take several minutes.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsReadmeDlg_Cancel</td><td>1033</td><td>&amp;Cancel</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsReadmeDlg_PleaseReadInfo</td><td>1033</td><td>Please read the following readme information carefully.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsReadmeDlg_ReadMeInfo</td><td>1033</td><td>{&amp;MSSansBold8}Readme Information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_16</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_Anyone</td><td>1033</td><td>&amp;Anyone who uses this computer (all users)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_CustomerInformation</td><td>1033</td><td>{&amp;MSSansBold8}Customer Information</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_InstallFor</td><td>1033</td><td>Install this application for:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_OnlyMe</td><td>1033</td><td>Only for &amp;me ([USERNAME])</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_Organization</td><td>1033</td><td>&amp;Organization:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_PleaseEnterInfo</td><td>1033</td><td>Please enter your information.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_SerialNumber</td><td>1033</td><td>&amp;Serial Number:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_Tahoma50</td><td>1033</td><td>{\Tahoma8}{50}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_Tahoma80</td><td>1033</td><td>{\Tahoma8}{80}</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsRegisterUserDlg_UserName</td><td>1033</td><td>&amp;User Name:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsResumeDlg_ResumeSuspended</td><td>1033</td><td>The InstallShield(R) Wizard will complete the suspended installation of [ProductName] on your computer. To continue, click Next.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsResumeDlg_Resuming</td><td>1033</td><td>{&amp;TahomaBold10}Resuming the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsResumeDlg_WizardResume</td><td>1033</td><td>The InstallShield(R) Wizard will complete the installation of [ProductName] on your computer. To continue, click Next.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSelectDomainOrServer</td><td>1033</td><td>Select a Domain or Server</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSelectDomainUserInstructions</td><td>1033</td><td>Use the browse buttons to select a domain\server and a user name.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupComplete_ShowMsiLog</td><td>1033</td><td>Show the Windows Installer log</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_13</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_AllFeatures</td><td>1033</td><td>All program features will be installed. (Requires the most disk space.)</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_ChooseFeatures</td><td>1033</td><td>Choose which program features you want installed and where they will be installed. Recommended for advanced users.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_ChooseSetupType</td><td>1033</td><td>Choose the setup type that best suits your needs.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Complete</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Complete</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Custom</td><td>1033</td><td>{&amp;MSSansBold8}Cu&amp;stom</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Minimal</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Minimal</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_MinimumFeatures</td><td>1033</td><td>Minimum required features will be installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_SelectSetupType</td><td>1033</td><td>Please select a setup type.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_SetupType</td><td>1033</td><td>{&amp;MSSansBold8}Setup Type</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Typical</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Typical</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_ClickFinish</td><td>1033</td><td>Click Finish to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_Finish</td><td>1033</td><td>&amp;Finish</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_KeepOrRestore</td><td>1033</td><td>You can either keep any existing installed elements on your system to continue this installation at a later time or you can restore your system to its original state prior to the installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_NotModified</td><td>1033</td><td>Your system has not been modified. To install this program at a later time, please run the installation again.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_RestoreOrContinue</td><td>1033</td><td>Click Restore or Continue Later to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_WizardCompleted</td><td>1033</td><td>{&amp;TahomaBold10}InstallShield Wizard Completed</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserExit_WizardInterrupted</td><td>1033</td><td>The wizard was interrupted before [ProductName] could be completely installed.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsUserNameLabel</td><td>1033</td><td>&amp;User name:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_BackOrCancel</td><td>1033</td><td>If you want to review or change any of your installation settings, click Back. Click Cancel to exit the wizard.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ClickInstall</td><td>1033</td><td>Click Install to begin the installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Company</td><td>1033</td><td>Company: [COMPANYNAME]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_CurrentSettings</td><td>1033</td><td>Current Settings:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_DestFolder</td><td>1033</td><td>Destination Folder:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Install</td><td>1033</td><td>&amp;Install</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Installdir</td><td>1033</td><td>[INSTALLDIR]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ModifyReady</td><td>1033</td><td>{&amp;MSSansBold8}Ready to Modify the Program</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ReadyInstall</td><td>1033</td><td>{&amp;MSSansBold8}Ready to Install the Program</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ReadyRepair</td><td>1033</td><td>{&amp;MSSansBold8}Ready to Repair the Program</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_SelectedSetupType</td><td>1033</td><td>[SelectedSetupType]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Serial</td><td>1033</td><td>Serial: [ISX_SERIALNUM]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_SetupType</td><td>1033</td><td>Setup Type:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_UserInfo</td><td>1033</td><td>User Information:</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_UserName</td><td>1033</td><td>Name: [USERNAME]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyReadyDlg_WizardReady</td><td>1033</td><td>The wizard is ready to begin installation.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_ChoseRemoveProgram</td><td>1033</td><td>You have chosen to remove the program from your system.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_ClickBack</td><td>1033</td><td>If you want to review or change any settings, click Back.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_ClickRemove</td><td>1033</td><td>Click Remove to remove [ProductName] from your computer. After removal, this program will no longer be available for use.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_Remove</td><td>1033</td><td>&amp;Remove</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_RemoveProgram</td><td>1033</td><td>{&amp;MSSansBold8}Remove the Program</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsWelcomeDlg_InstallProductName</td><td>1033</td><td>The InstallShield(R) Wizard will install [ProductName] on your computer. To continue, click Next.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsWelcomeDlg_WarningCopyright</td><td>1033</td><td>WARNING: This program is protected by copyright law and international treaties.</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__IsWelcomeDlg_WelcomeProductName</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__TargetReq_DESC_COLOR</td><td>1033</td><td>The color settings of your system are not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__TargetReq_DESC_OS</td><td>1033</td><td>The operating system is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__TargetReq_DESC_PROCESSOR</td><td>1033</td><td>The processor is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__TargetReq_DESC_RAM</td><td>1033</td><td>The amount of RAM is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>IDS__TargetReq_DESC_RESOLUTION</td><td>1033</td><td>The screen resolution is not adequate for running [ProductName].</td><td>0</td><td/><td>639615660</td></row>
		<row><td>ID_STRING1</td><td>1033</td><td/><td>0</td><td/><td>639615660</td></row>
		<row><td>ID_STRING10</td><td>1033</td><td>KNOWNI~1|Known Issues</td><td>0</td><td/><td>773838861</td></row>
		<row><td>ID_STRING11</td><td>1033</td><td>Details various known issues, mostly related to various Windows versions</td><td>0</td><td/><td>773816365</td></row>
		<row><td>ID_STRING117</td><td>1033</td><td>Session's interactive MSYS shell</td><td>0</td><td/><td>639605265</td></row>
		<row><td>ID_STRING118</td><td>1033</td><td>Install WinPcap which is used by nmap if you want to use Session's discover function</td><td>0</td><td/><td>773794891</td></row>
		<row><td>ID_STRING119</td><td>1033</td><td>=-*Path</td><td>0</td><td/><td>639570545</td></row>
		<row><td>ID_STRING12</td><td>1033</td><td>DOWNLO~1|Download Remote Desktop Connection Client 6 for Windows 2003 x64</td><td>0</td><td/><td>773801462</td></row>
		<row><td>ID_STRING120</td><td>1033</td><td>[~];[INSTALLDIR]</td><td>0</td><td/><td>639588977</td></row>
		<row><td>ID_STRING13</td><td>1033</td><td>Follow this link to download a newer version of mstsc which also works when called from 32-bit applications like msys bash (default mstsc on Windows 2003 x64 does not support this)</td><td>0</td><td/><td>773834262</td></row>
		<row><td>ID_STRING14</td><td>1033</td><td>INSTAL~1|Install Visual C++ 2008 SP1 Runtime Redistributable</td><td>0</td><td/><td>1713365454</td></row>
		<row><td>ID_STRING15</td><td>1033</td><td>INSTAL~1|Install Visual C++ 2010 SP1 Runtime Redistributable</td><td>0</td><td/><td>1713349102</td></row>
		<row><td>ID_STRING16</td><td>1033</td><td>Installs Visual C++ 2008 SP1 runtime redistributables. Most systems have this already. This is needed for nmap to function (observed on Windows 2003 Server x64).</td><td>0</td><td/><td>1713351246</td></row>
		<row><td>ID_STRING17</td><td>1033</td><td>Installs Visual C++ 2010 SP1 runtime redistributables. Most systems have this already. This is needed for nmap to function (observed on Windows 7 x64).</td><td>0</td><td/><td>1713322606</td></row>
		<row><td>ID_STRING2</td><td>1033</td><td>http://www.raaftech.nl/</td><td>0</td><td/><td>639587856</td></row>
		<row><td>ID_STRING3</td><td>1033</td><td>RAAF Technology</td><td>0</td><td/><td>639608304</td></row>
		<row><td>ID_STRING4</td><td>1033</td><td>This installation program installs Session on your computer</td><td>0</td><td/><td>639581873</td></row>
		<row><td>ID_STRING5</td><td>1033</td><td>INSTAL~1|Install VCRedist 2008</td><td>0</td><td/><td>773823531</td></row>
		<row><td>ID_STRING6</td><td>1033</td><td>Install the Visual C 2008 SP1 redistributable package which is required by nmap. Most systems have this package already</td><td>0</td><td/><td>773786731</td></row>
		<row><td>ID_STRING7</td><td>1033</td><td>DOWNLO~1.NET|Download .NET Framework 4 (Standalone Installer)</td><td>0</td><td/><td>773809612</td></row>
		<row><td>ID_STRING8</td><td>1033</td><td>Follow this link to download .NET Framework 4 which includes .NET Framework version 2 which is required by cryptrdp5. This can embed encrypted passwords in rdp files. Only needed if you want to use Session's access function with mstsc *and* stored credentials</td><td>0</td><td/><td>773799500</td></row>
		<row><td>ID_STRING9</td><td>1033</td><td>OPTION~1|Optional Dependencies</td><td>0</td><td/><td>773785196</td></row>
		<row><td>IIDS_UITEXT_FeatureUninstalled</td><td>1033</td><td>This feature will remain uninstalled.</td><td>0</td><td/><td>639615660</td></row>
	</table>

	<table name="ISTargetImage">
		<col key="yes" def="s13">UpgradedImage_</col>
		<col key="yes" def="s13">Name</col>
		<col def="s0">MsiPath</col>
		<col def="i2">Order</col>
		<col def="I4">Flags</col>
		<col def="i2">IgnoreMissingFiles</col>
	</table>

	<table name="ISUpgradeMsiItem">
		<col key="yes" def="s72">UpgradeItem</col>
		<col def="s0">ObjectSetupPath</col>
		<col def="S255">ISReleaseFlags</col>
		<col def="i2">ISAttributes</col>
	</table>

	<table name="ISUpgradedImage">
		<col key="yes" def="s13">Name</col>
		<col def="s0">MsiPath</col>
		<col def="s8">Family</col>
	</table>

	<table name="ISVirtualDirectory">
		<col key="yes" def="s72">Directory_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualPackage">
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualRegistry">
		<col key="yes" def="s72">Registry_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualRelease">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="s255">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualShortcut">
		<col key="yes" def="s72">Shortcut_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISXmlElement">
		<col key="yes" def="s72">ISXmlElement</col>
		<col def="s72">ISXmlFile_</col>
		<col def="S72">ISXmlElement_Parent</col>
		<col def="L0">XPath</col>
		<col def="L0">Content</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISXmlElementAttrib">
		<col key="yes" def="s72">ISXmlElementAttrib</col>
		<col key="yes" def="s72">ISXmlElement_</col>
		<col def="L255">Name</col>
		<col def="L0">Value</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISXmlFile">
		<col key="yes" def="s72">ISXmlFile</col>
		<col def="l255">FileName</col>
		<col def="s72">Component_</col>
		<col def="s72">Directory</col>
		<col def="I4">ISAttributes</col>
		<col def="S0">SelectionNamespaces</col>
		<col def="S255">Encoding</col>
	</table>

	<table name="ISXmlLocator">
		<col key="yes" def="s72">Signature_</col>
		<col key="yes" def="S72">Parent</col>
		<col def="S255">Element</col>
		<col def="S255">Attribute</col>
		<col def="I2">ISAttributes</col>
	</table>

	<table name="Icon">
		<col key="yes" def="s72">Name</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="I2">ISIconIndex</col>
		<row><td>ARPPRODUCTICON.exe</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-installer-icon.ico</td><td>0</td></row>
		<row><td>NewShortcut1_77FC1BEE2C7448E3BB30EBB5429B7A35.exe</td><td/><td>C:\Users\Rubin\Source\Projects\Session\ext\win\nmap\vc2008sp1-redist_x86.exe</td><td>0</td></row>
		<row><td>NewShortcut1_AE28D6AC6CA94922AC886BCB51D558F7.exe</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\vcredist_x86.exe</td><td>0</td></row>
		<row><td>NewShortcut5_47EFE33A65174E43A94297143B12E428.exe</td><td/><td>C:\Users\Rubin\Source\Projects\Session\ext\win\nmap\vc2010sp1-redist_x86.exe</td><td>0</td></row>
		<row><td>session_shell.bat_BE326B339C954734B0198F6DFD037BA1.exe</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\session\session-shell-icon.ico</td><td>0</td></row>
		<row><td>winpcap_nmap_4.12._A19ABFBF037D4AAA9AC9580D6201CECE.exe</td><td/><td>C:\Users\rubin\Source\Projects\Session\ext\win\nmap\winpcap-nmap-4.12.exe</td><td>0</td></row>
	</table>

	<table name="IniFile">
		<col key="yes" def="s72">IniFile</col>
		<col def="l255">FileName</col>
		<col def="S72">DirProperty</col>
		<col def="l255">Section</col>
		<col def="l128">Key</col>
		<col def="s255">Value</col>
		<col def="i2">Action</col>
		<col def="s72">Component_</col>
	</table>

	<table name="IniLocator">
		<col key="yes" def="s72">Signature_</col>
		<col def="s255">FileName</col>
		<col def="s96">Section</col>
		<col def="s128">Key</col>
		<col def="I2">Field</col>
		<col def="I2">Type</col>
	</table>

	<table name="InstallExecuteSequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>AllocateRegistrySpace</td><td>NOT Installed</td><td>1550</td><td>AllocateRegistrySpace</td><td/></row>
		<row><td>AppSearch</td><td/><td>400</td><td>AppSearch</td><td/></row>
		<row><td>BindImage</td><td/><td>4300</td><td>BindImage</td><td/></row>
		<row><td>CCPSearch</td><td>CCP_TEST</td><td>500</td><td>CCPSearch</td><td/></row>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>CreateFolders</td><td/><td>3700</td><td>CreateFolders</td><td/></row>
		<row><td>CreateShortcuts</td><td/><td>4500</td><td>CreateShortcuts</td><td/></row>
		<row><td>DeleteServices</td><td>VersionNT</td><td>2000</td><td>DeleteServices</td><td/></row>
		<row><td>DuplicateFiles</td><td/><td>4210</td><td>DuplicateFiles</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>FindRelatedProducts</td><td>NOT ISSETUPDRIVEN</td><td>420</td><td>FindRelatedProducts</td><td/></row>
		<row><td>ISPreventDowngrade</td><td>ISFOUNDNEWERPRODUCTVERSION</td><td>450</td><td>ISPreventDowngrade</td><td/></row>
		<row><td>ISRunSetupTypeAddLocalEvent</td><td>Not Installed And Not ISRUNSETUPTYPEADDLOCALEVENT</td><td>1050</td><td>ISRunSetupTypeAddLocalEvent</td><td/></row>
		<row><td>ISSelfRegisterCosting</td><td/><td>2201</td><td/><td/></row>
		<row><td>ISSelfRegisterFiles</td><td/><td>5601</td><td/><td/></row>
		<row><td>ISSelfRegisterFinalize</td><td/><td>6601</td><td/><td/></row>
		<row><td>ISUnSelfRegisterFiles</td><td/><td>2202</td><td/><td/></row>
		<row><td>InstallFiles</td><td/><td>4000</td><td>InstallFiles</td><td/></row>
		<row><td>InstallFinalize</td><td/><td>6600</td><td>InstallFinalize</td><td/></row>
		<row><td>InstallInitialize</td><td/><td>1501</td><td>InstallInitialize</td><td/></row>
		<row><td>InstallODBC</td><td/><td>5400</td><td>InstallODBC</td><td/></row>
		<row><td>InstallServices</td><td>VersionNT</td><td>5800</td><td>InstallServices</td><td/></row>
		<row><td>InstallValidate</td><td/><td>1400</td><td>InstallValidate</td><td/></row>
		<row><td>IsolateComponents</td><td/><td>950</td><td>IsolateComponents</td><td/></row>
		<row><td>LaunchConditions</td><td>Not Installed</td><td>410</td><td>LaunchConditions</td><td/></row>
		<row><td>MigrateFeatureStates</td><td/><td>1010</td><td>MigrateFeatureStates</td><td/></row>
		<row><td>MoveFiles</td><td/><td>3800</td><td>MoveFiles</td><td/></row>
		<row><td>MsiConfigureServices</td><td>VersionMsi &gt;= "5.00"</td><td>5850</td><td>MSI5 MsiConfigureServices</td><td/></row>
		<row><td>MsiPublishAssemblies</td><td/><td>6250</td><td>MsiPublishAssemblies</td><td/></row>
		<row><td>MsiUnpublishAssemblies</td><td/><td>1750</td><td>MsiUnpublishAssemblies</td><td/></row>
		<row><td>PatchFiles</td><td/><td>4090</td><td>PatchFiles</td><td/></row>
		<row><td>ProcessComponents</td><td/><td>1600</td><td>ProcessComponents</td><td/></row>
		<row><td>PublishComponents</td><td/><td>6200</td><td>PublishComponents</td><td/></row>
		<row><td>PublishFeatures</td><td/><td>6300</td><td>PublishFeatures</td><td/></row>
		<row><td>PublishProduct</td><td/><td>6400</td><td>PublishProduct</td><td/></row>
		<row><td>RMCCPSearch</td><td>Not CCP_SUCCESS And CCP_TEST</td><td>600</td><td>RMCCPSearch</td><td/></row>
		<row><td>RegisterClassInfo</td><td/><td>4600</td><td>RegisterClassInfo</td><td/></row>
		<row><td>RegisterComPlus</td><td/><td>5700</td><td>RegisterComPlus</td><td/></row>
		<row><td>RegisterExtensionInfo</td><td/><td>4700</td><td>RegisterExtensionInfo</td><td/></row>
		<row><td>RegisterFonts</td><td/><td>5300</td><td>RegisterFonts</td><td/></row>
		<row><td>RegisterMIMEInfo</td><td/><td>4900</td><td>RegisterMIMEInfo</td><td/></row>
		<row><td>RegisterProduct</td><td/><td>6100</td><td>RegisterProduct</td><td/></row>
		<row><td>RegisterProgIdInfo</td><td/><td>4800</td><td>RegisterProgIdInfo</td><td/></row>
		<row><td>RegisterTypeLibraries</td><td/><td>5500</td><td>RegisterTypeLibraries</td><td/></row>
		<row><td>RegisterUser</td><td/><td>6000</td><td>RegisterUser</td><td/></row>
		<row><td>RemoveDuplicateFiles</td><td/><td>3400</td><td>RemoveDuplicateFiles</td><td/></row>
		<row><td>RemoveEnvironmentStrings</td><td/><td>3300</td><td>RemoveEnvironmentStrings</td><td/></row>
		<row><td>RemoveExistingProducts</td><td/><td>1410</td><td>RemoveExistingProducts</td><td/></row>
		<row><td>RemoveFiles</td><td/><td>3500</td><td>RemoveFiles</td><td/></row>
		<row><td>RemoveFolders</td><td/><td>3600</td><td>RemoveFolders</td><td/></row>
		<row><td>RemoveIniValues</td><td/><td>3100</td><td>RemoveIniValues</td><td/></row>
		<row><td>RemoveODBC</td><td/><td>2400</td><td>RemoveODBC</td><td/></row>
		<row><td>RemoveRegistryValues</td><td/><td>2600</td><td>RemoveRegistryValues</td><td/></row>
		<row><td>RemoveShortcuts</td><td/><td>3200</td><td>RemoveShortcuts</td><td/></row>
		<row><td>ResolveSource</td><td>Not Installed</td><td>850</td><td>ResolveSource</td><td/></row>
		<row><td>ScheduleReboot</td><td>ISSCHEDULEREBOOT</td><td>6410</td><td>ScheduleReboot</td><td/></row>
		<row><td>SelfRegModules</td><td/><td>5600</td><td>SelfRegModules</td><td/></row>
		<row><td>SelfUnregModules</td><td/><td>2200</td><td>SelfUnregModules</td><td/></row>
		<row><td>SessionConfigure</td><td>Not Installed</td><td>6405</td><td/><td/></row>
		<row><td>SetARPINSTALLLOCATION</td><td/><td>1100</td><td>SetARPINSTALLLOCATION</td><td/></row>
		<row><td>SetAllUsersProfileNT</td><td>VersionNT = 400</td><td>970</td><td/><td/></row>
		<row><td>SetODBCFolders</td><td/><td>1200</td><td>SetODBCFolders</td><td/></row>
		<row><td>StartServices</td><td>VersionNT</td><td>5900</td><td>StartServices</td><td/></row>
		<row><td>StopServices</td><td>VersionNT</td><td>1900</td><td>StopServices</td><td/></row>
		<row><td>UnpublishComponents</td><td/><td>1700</td><td>UnpublishComponents</td><td/></row>
		<row><td>UnpublishFeatures</td><td/><td>1800</td><td>UnpublishFeatures</td><td/></row>
		<row><td>UnregisterClassInfo</td><td/><td>2700</td><td>UnregisterClassInfo</td><td/></row>
		<row><td>UnregisterComPlus</td><td/><td>2100</td><td>UnregisterComPlus</td><td/></row>
		<row><td>UnregisterExtensionInfo</td><td/><td>2800</td><td>UnregisterExtensionInfo</td><td/></row>
		<row><td>UnregisterFonts</td><td/><td>2500</td><td>UnregisterFonts</td><td/></row>
		<row><td>UnregisterMIMEInfo</td><td/><td>3000</td><td>UnregisterMIMEInfo</td><td/></row>
		<row><td>UnregisterProgIdInfo</td><td/><td>2900</td><td>UnregisterProgIdInfo</td><td/></row>
		<row><td>UnregisterTypeLibraries</td><td/><td>2300</td><td>UnregisterTypeLibraries</td><td/></row>
		<row><td>ValidateProductID</td><td/><td>700</td><td>ValidateProductID</td><td/></row>
		<row><td>WriteEnvironmentStrings</td><td/><td>5200</td><td>WriteEnvironmentStrings</td><td/></row>
		<row><td>WriteIniValues</td><td/><td>5100</td><td>WriteIniValues</td><td/></row>
		<row><td>WriteRegistryValues</td><td/><td>5000</td><td>WriteRegistryValues</td><td/></row>
		<row><td>setAllUsersProfile2K</td><td>VersionNT &gt;= 500</td><td>980</td><td/><td/></row>
		<row><td>setUserProfileNT</td><td>VersionNT</td><td>960</td><td/><td/></row>
	</table>

	<table name="InstallShield">
		<col key="yes" def="s72">Property</col>
		<col def="S0">Value</col>
		<row><td>ActiveLanguage</td><td>1033</td></row>
		<row><td>Comments</td><td/></row>
		<row><td>CurrentMedia</td><td dt:dt="bin.base64" md5="de9f554a3bc05c12be9c31b998217995">
UwBpAG4AZwBsAGUASQBtAGEAZwBlAAEARQB4AHAAcgBlAHMAcwA=
			</td></row>
		<row><td>DefaultProductConfiguration</td><td>Express</td></row>
		<row><td>ISCompilerOption_CompileBeforeBuild</td><td>1</td></row>
		<row><td>ISCompilerOption_Debug</td><td>0</td></row>
		<row><td>ISCompilerOption_IncludePath</td><td/></row>
		<row><td>ISCompilerOption_LibraryPath</td><td/></row>
		<row><td>ISCompilerOption_MaxErrors</td><td>50</td></row>
		<row><td>ISCompilerOption_MaxWarnings</td><td>50</td></row>
		<row><td>ISCompilerOption_OutputPath</td><td>&lt;ISProjectDataFolder&gt;\Script Files</td></row>
		<row><td>ISCompilerOption_PreProcessor</td><td>_ISSCRIPT_NEW_STYLE_DLG_DEFS</td></row>
		<row><td>ISCompilerOption_WarningLevel</td><td>3</td></row>
		<row><td>ISCompilerOption_WarningsAsErrors</td><td>1</td></row>
		<row><td>ISTheme</td><td>InstallShield Blue.theme</td></row>
		<row><td>ISUSLock</td><td>{9226C1B1-3BDA-475F-B40F-2AE6C812A216}</td></row>
		<row><td>ISUSSignature</td><td>{E6062A5A-29EA-4D80-9AD5-244D46399706}</td></row>
		<row><td>ISVisitedViews</td><td>viewAssistant,viewISToday,viewProject,viewRealSetupDesign,viewSetupDesign,viewSetupTypes,viewAppFiles,viewFeatureFiles,viewDependencies,viewEnvironmentVariables,viewShortcuts,viewRegistry,viewIniFiles,viewTextFiles,viewUI,viewBillboards,viewTextMessages,viewSystemSearch,viewInstallScriptStd,viewCustomActions,viewSupportFiles,viewRelease,viewDesignPatches,viewObjects</td></row>
		<row><td>Limited</td><td>1</td></row>
		<row><td>LockPermissionMode</td><td>1</td></row>
		<row><td>MsiExecCmdLineOptions</td><td/></row>
		<row><td>MsiLogFile</td><td/></row>
		<row><td>OnUpgrade</td><td>0</td></row>
		<row><td>Owner</td><td/></row>
		<row><td>PatchFamily</td><td>MyPatchFamily1</td></row>
		<row><td>PatchSequence</td><td>1.0.0</td></row>
		<row><td>SaveAsSchema</td><td/></row>
		<row><td>SccEnabled</td><td>0</td></row>
		<row><td>SccPath</td><td/></row>
		<row><td>SchemaVersion</td><td>771</td></row>
		<row><td>Type</td><td>MSIE</td></row>
	</table>

	<table name="InstallUISequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>AppSearch</td><td/><td>400</td><td>AppSearch</td><td/></row>
		<row><td>CCPSearch</td><td>CCP_TEST</td><td>500</td><td>CCPSearch</td><td/></row>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>ExecuteAction</td><td/><td>1300</td><td>ExecuteAction</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>FindRelatedProducts</td><td/><td>430</td><td>FindRelatedProducts</td><td/></row>
		<row><td>ISPreventDowngrade</td><td>ISFOUNDNEWERPRODUCTVERSION</td><td>450</td><td>ISPreventDowngrade</td><td/></row>
		<row><td>InstallWelcome</td><td>Not Installed</td><td>1210</td><td>InstallWelcome</td><td/></row>
		<row><td>IsolateComponents</td><td/><td>950</td><td>IsolateComponents</td><td/></row>
		<row><td>LaunchConditions</td><td>Not Installed</td><td>410</td><td>LaunchConditions</td><td/></row>
		<row><td>MaintenanceWelcome</td><td>Installed And Not RESUME And Not Preselected And Not PATCH</td><td>1230</td><td>MaintenanceWelcome</td><td/></row>
		<row><td>MigrateFeatureStates</td><td/><td>1200</td><td>MigrateFeatureStates</td><td/></row>
		<row><td>PatchWelcome</td><td>Installed And PATCH And Not IS_MAJOR_UPGRADE</td><td>1205</td><td>Patch Panel</td><td/></row>
		<row><td>RMCCPSearch</td><td>Not CCP_SUCCESS And CCP_TEST</td><td>600</td><td>RMCCPSearch</td><td/></row>
		<row><td>ResolveSource</td><td>Not Installed</td><td>990</td><td>ResolveSource</td><td/></row>
		<row><td>SetAllUsersProfileNT</td><td>VersionNT = 400</td><td>970</td><td/><td/></row>
		<row><td>SetupCompleteError</td><td/><td>-3</td><td>SetupCompleteError</td><td/></row>
		<row><td>SetupCompleteSuccess</td><td/><td>-1</td><td>SetupCompleteSuccess</td><td/></row>
		<row><td>SetupInitialization</td><td/><td>420</td><td>SetupInitialization</td><td/></row>
		<row><td>SetupInterrupted</td><td/><td>-2</td><td>SetupInterrupted</td><td/></row>
		<row><td>SetupProgress</td><td/><td>1240</td><td>SetupProgress</td><td/></row>
		<row><td>SetupResume</td><td>Installed And (RESUME Or Preselected) And Not PATCH</td><td>1220</td><td>SetupResume</td><td/></row>
		<row><td>ValidateProductID</td><td/><td>700</td><td>ValidateProductID</td><td/></row>
		<row><td>setAllUsersProfile2K</td><td>VersionNT &gt;= 500</td><td>980</td><td/><td/></row>
		<row><td>setUserProfileNT</td><td>VersionNT</td><td>960</td><td/><td/></row>
	</table>

	<table name="IsolatedComponent">
		<col key="yes" def="s72">Component_Shared</col>
		<col key="yes" def="s72">Component_Application</col>
	</table>

	<table name="LaunchCondition">
		<col key="yes" def="s255">Condition</col>
		<col def="l255">Description</col>
	</table>

	<table name="ListBox">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="L64">Text</col>
	</table>

	<table name="ListView">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="L64">Text</col>
		<col def="S72">Binary_</col>
	</table>

	<table name="LockPermissions">
		<col key="yes" def="s72">LockObject</col>
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="S255">Domain</col>
		<col key="yes" def="s255">User</col>
		<col def="I4">Permission</col>
	</table>

	<table name="MIME">
		<col key="yes" def="s64">ContentType</col>
		<col def="s255">Extension_</col>
		<col def="S38">CLSID</col>
	</table>

	<table name="Media">
		<col key="yes" def="i2">DiskId</col>
		<col def="i2">LastSequence</col>
		<col def="L64">DiskPrompt</col>
		<col def="S255">Cabinet</col>
		<col def="S32">VolumeLabel</col>
		<col def="S32">Source</col>
	</table>

	<table name="MoveFile">
		<col key="yes" def="s72">FileKey</col>
		<col def="s72">Component_</col>
		<col def="L255">SourceName</col>
		<col def="L255">DestName</col>
		<col def="S72">SourceFolder</col>
		<col def="s72">DestFolder</col>
		<col def="i2">Options</col>
	</table>

	<table name="MsiAssembly">
		<col key="yes" def="s72">Component_</col>
		<col def="s38">Feature_</col>
		<col def="S72">File_Manifest</col>
		<col def="S72">File_Application</col>
		<col def="I2">Attributes</col>
	</table>

	<table name="MsiAssemblyName">
		<col key="yes" def="s72">Component_</col>
		<col key="yes" def="s255">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="MsiDigitalCertificate">
		<col key="yes" def="s72">DigitalCertificate</col>
		<col def="v0">CertData</col>
	</table>

	<table name="MsiDigitalSignature">
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="s72">SignObject</col>
		<col def="s72">DigitalCertificate_</col>
		<col def="V0">Hash</col>
	</table>

	<table name="MsiDriverPackages">
		<col key="yes" def="s72">Component</col>
		<col def="i4">Flags</col>
		<col def="I4">Sequence</col>
		<col def="S0">ReferenceComponents</col>
	</table>

	<table name="MsiEmbeddedChainer">
		<col key="yes" def="s72">MsiEmbeddedChainer</col>
		<col def="S255">Condition</col>
		<col def="S255">CommandLine</col>
		<col def="s72">Source</col>
		<col def="I4">Type</col>
	</table>

	<table name="MsiEmbeddedUI">
		<col key="yes" def="s72">MsiEmbeddedUI</col>
		<col def="s255">FileName</col>
		<col def="i2">Attributes</col>
		<col def="I4">MessageFilter</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="MsiFileHash">
		<col key="yes" def="s72">File_</col>
		<col def="i2">Options</col>
		<col def="i4">HashPart1</col>
		<col def="i4">HashPart2</col>
		<col def="i4">HashPart3</col>
		<col def="i4">HashPart4</col>
	</table>

	<table name="MsiLockPermissionsEx">
		<col key="yes" def="s72">MsiLockPermissionsEx</col>
		<col def="s72">LockObject</col>
		<col def="s32">Table</col>
		<col def="s0">SDDLText</col>
		<col def="S255">Condition</col>
	</table>

	<table name="MsiPackageCertificate">
		<col key="yes" def="s72">PackageCertificate</col>
		<col def="s72">DigitalCertificate_</col>
	</table>

	<table name="MsiPatchCertificate">
		<col key="yes" def="s72">PatchCertificate</col>
		<col def="s72">DigitalCertificate_</col>
	</table>

	<table name="MsiPatchMetadata">
		<col key="yes" def="s72">PatchConfiguration_</col>
		<col key="yes" def="S72">Company</col>
		<col key="yes" def="s72">Property</col>
		<col def="S0">Value</col>
	</table>

	<table name="MsiPatchOldAssemblyFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="S72">Assembly_</col>
	</table>

	<table name="MsiPatchOldAssemblyName">
		<col key="yes" def="s72">Assembly</col>
		<col key="yes" def="s255">Name</col>
		<col def="S255">Value</col>
	</table>

	<table name="MsiPatchSequence">
		<col key="yes" def="s72">PatchConfiguration_</col>
		<col key="yes" def="s0">PatchFamily</col>
		<col key="yes" def="S0">Target</col>
		<col def="s0">Sequence</col>
		<col def="i2">Supersede</col>
	</table>

	<table name="MsiServiceConfig">
		<col key="yes" def="s72">MsiServiceConfig</col>
		<col def="s255">Name</col>
		<col def="i2">Event</col>
		<col def="i4">ConfigType</col>
		<col def="S0">Argument</col>
		<col def="s72">Component_</col>
	</table>

	<table name="MsiServiceConfigFailureActions">
		<col key="yes" def="s72">MsiServiceConfigFailureActions</col>
		<col def="s255">Name</col>
		<col def="i2">Event</col>
		<col def="I4">ResetPeriod</col>
		<col def="L255">RebootMessage</col>
		<col def="L255">Command</col>
		<col def="S0">Actions</col>
		<col def="S0">DelayActions</col>
		<col def="s72">Component_</col>
	</table>

	<table name="MsiShortcutProperty">
		<col key="yes" def="s72">MsiShortcutProperty</col>
		<col def="s72">Shortcut_</col>
		<col def="s0">PropertyKey</col>
		<col def="s0">PropVariantValue</col>
	</table>

	<table name="ODBCAttribute">
		<col key="yes" def="s72">Driver_</col>
		<col key="yes" def="s40">Attribute</col>
		<col def="S255">Value</col>
	</table>

	<table name="ODBCDataSource">
		<col key="yes" def="s72">DataSource</col>
		<col def="s72">Component_</col>
		<col def="s255">Description</col>
		<col def="s255">DriverDescription</col>
		<col def="i2">Registration</col>
	</table>

	<table name="ODBCDriver">
		<col key="yes" def="s72">Driver</col>
		<col def="s72">Component_</col>
		<col def="s255">Description</col>
		<col def="s72">File_</col>
		<col def="S72">File_Setup</col>
	</table>

	<table name="ODBCSourceAttribute">
		<col key="yes" def="s72">DataSource_</col>
		<col key="yes" def="s32">Attribute</col>
		<col def="S255">Value</col>
	</table>

	<table name="ODBCTranslator">
		<col key="yes" def="s72">Translator</col>
		<col def="s72">Component_</col>
		<col def="s255">Description</col>
		<col def="s72">File_</col>
		<col def="S72">File_Setup</col>
	</table>

	<table name="Patch">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="i2">Sequence</col>
		<col def="i4">PatchSize</col>
		<col def="i2">Attributes</col>
		<col def="V0">Header</col>
		<col def="S38">StreamRef_</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="PatchPackage">
		<col key="yes" def="s38">PatchId</col>
		<col def="i2">Media_</col>
	</table>

	<table name="ProgId">
		<col key="yes" def="s255">ProgId</col>
		<col def="S255">ProgId_Parent</col>
		<col def="S38">Class_</col>
		<col def="L255">Description</col>
		<col def="S72">Icon_</col>
		<col def="I2">IconIndex</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="Property">
		<col key="yes" def="s72">Property</col>
		<col def="L0">Value</col>
		<col def="S255">ISComments</col>
		<row><td>ALLUSERS</td><td>1</td><td/></row>
		<row><td>ARPINSTALLLOCATION</td><td/><td/></row>
		<row><td>ARPPRODUCTICON</td><td>ARPPRODUCTICON.exe</td><td/></row>
		<row><td>ARPSIZE</td><td/><td/></row>
		<row><td>ARPURLINFOABOUT</td><td>##ID_STRING2##</td><td/></row>
		<row><td>AgreeToLicense</td><td>No</td><td/></row>
		<row><td>ApplicationUsers</td><td>AllUsers</td><td/></row>
		<row><td>DWUSINTERVAL</td><td>30</td><td/></row>
		<row><td>DWUSLINK</td><td>CE6BD7AFCEBB90F8C9AC8738DEAC978FF97CF08F79FBD0B8CEACC098E9DB77AF7E2BC79FCEAC</td><td/></row>
		<row><td>DefaultUIFont</td><td>ExpressDefault</td><td/></row>
		<row><td>DialogCaption</td><td>InstallShield for Windows Installer</td><td/></row>
		<row><td>DiskPrompt</td><td>[1]</td><td/></row>
		<row><td>DiskSerial</td><td>1234-5678</td><td/></row>
		<row><td>DisplayNameCustom</td><td>##IDS__DisplayName_Custom##</td><td/></row>
		<row><td>DisplayNameMinimal</td><td>##IDS__DisplayName_Minimal##</td><td/></row>
		<row><td>DisplayNameTypical</td><td>##IDS__DisplayName_Typical##</td><td/></row>
		<row><td>Display_IsBitmapDlg</td><td>1</td><td/></row>
		<row><td>ErrorDialog</td><td>SetupError</td><td/></row>
		<row><td>INSTALLLEVEL</td><td>200</td><td/></row>
		<row><td>ISCHECKFORPRODUCTUPDATES</td><td>1</td><td/></row>
		<row><td>ISENABLEDWUSFINISHDIALOG</td><td/><td/></row>
		<row><td>ISSHOWMSILOG</td><td/><td/></row>
		<row><td>ISVROOT_PORT_NO</td><td>0</td><td/></row>
		<row><td>IS_COMPLUS_PROGRESSTEXT_COST</td><td>##IDS_COMPLUS_PROGRESSTEXT_COST##</td><td/></row>
		<row><td>IS_COMPLUS_PROGRESSTEXT_INSTALL</td><td>##IDS_COMPLUS_PROGRESSTEXT_INSTALL##</td><td/></row>
		<row><td>IS_COMPLUS_PROGRESSTEXT_UNINSTALL</td><td>##IDS_COMPLUS_PROGRESSTEXT_UNINSTALL##</td><td/></row>
		<row><td>IS_PREVENT_DOWNGRADE_EXIT</td><td>##IDS_PREVENT_DOWNGRADE_EXIT##</td><td/></row>
		<row><td>IS_PROGMSG_TEXTFILECHANGS_REPLACE</td><td>##IDS_PROGMSG_TEXTFILECHANGS_REPLACE##</td><td/></row>
		<row><td>IS_PROGMSG_XML_COSTING</td><td>##IDS_PROGMSG_XML_COSTING##</td><td/></row>
		<row><td>IS_PROGMSG_XML_CREATE_FILE</td><td>##IDS_PROGMSG_XML_CREATE_FILE##</td><td/></row>
		<row><td>IS_PROGMSG_XML_FILES</td><td>##IDS_PROGMSG_XML_FILES##</td><td/></row>
		<row><td>IS_PROGMSG_XML_REMOVE_FILE</td><td>##IDS_PROGMSG_XML_REMOVE_FILE##</td><td/></row>
		<row><td>IS_PROGMSG_XML_ROLLBACK_FILES</td><td>##IDS_PROGMSG_XML_ROLLBACK_FILES##</td><td/></row>
		<row><td>IS_PROGMSG_XML_UPDATE_FILE</td><td>##IDS_PROGMSG_XML_UPDATE_FILE##</td><td/></row>
		<row><td>IS_SQLSERVER_AUTHENTICATION</td><td>0</td><td/></row>
		<row><td>IS_SQLSERVER_DATABASE</td><td/><td/></row>
		<row><td>IS_SQLSERVER_PASSWORD</td><td/><td/></row>
		<row><td>IS_SQLSERVER_SERVER</td><td/><td/></row>
		<row><td>IS_SQLSERVER_USERNAME</td><td>sa</td><td/></row>
		<row><td>InstallChoice</td><td>AR</td><td/></row>
		<row><td>LAUNCHPROGRAMCOMPCODE</td><td>{D414649D-1056-47BB-B597-0D715391743A}</td><td/></row>
		<row><td>LAUNCHPROGRAMFILEKEY</td><td>session_shell.bat</td><td/></row>
		<row><td>LAUNCHREADME</td><td>1</td><td/></row>
		<row><td>MSIFASTINSTALL</td><td>7</td><td/></row>
		<row><td>Manufacturer</td><td>##COMPANY_NAME##</td><td/></row>
		<row><td>PIDKEY</td><td/><td/></row>
		<row><td>PIDTemplate</td><td>12345&lt;###-%%%%%%%&gt;@@@@@</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEAPPPOOL</td><td>##IDS_PROGMSG_IIS_CREATEAPPPOOL##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEAPPPOOLS</td><td>##IDS_PROGMSG_IIS_CREATEAPPPOOLS##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEVROOT</td><td>##IDS_PROGMSG_IIS_CREATEVROOT##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEVROOTS</td><td>##IDS_PROGMSG_IIS_CREATEVROOTS##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSERVICEEXTENSION</td><td>##IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSION##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSERVICEEXTENSIONS</td><td>##IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSIONS##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSITE</td><td>##IDS_PROGMSG_IIS_CREATEWEBSITE##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSITES</td><td>##IDS_PROGMSG_IIS_CREATEWEBSITES##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACT</td><td>##IDS_PROGMSG_IIS_EXTRACT##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACTDONE</td><td>##IDS_PROGMSG_IIS_EXTRACTDONE##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACTDONEz</td><td>##IDS_PROGMSG_IIS_EXTRACTDONE##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACTzDONE</td><td>##IDS_PROGMSG_IIS_EXTRACTDONE##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEAPPPOOL</td><td>##IDS_PROGMSG_IIS_REMOVEAPPPOOL##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEAPPPOOLS</td><td>##IDS_PROGMSG_IIS_REMOVEAPPPOOLS##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVESITE</td><td>##IDS_PROGMSG_IIS_REMOVESITE##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEVROOT</td><td>##IDS_PROGMSG_IIS_REMOVEVROOT##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEVROOTS</td><td>##IDS_PROGMSG_IIS_REMOVEVROOTS##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEWEBSERVICEEXTENSION</td><td>##IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSION##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEWEBSERVICEEXTENSIONS</td><td>##IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSIONS##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEWEBSITES</td><td>##IDS_PROGMSG_IIS_REMOVEWEBSITES##</td><td/></row>
		<row><td>PROGMSG_IIS_ROLLBACKAPPPOOLS</td><td>##IDS_PROGMSG_IIS_ROLLBACKAPPPOOLS##</td><td/></row>
		<row><td>PROGMSG_IIS_ROLLBACKVROOTS</td><td>##IDS_PROGMSG_IIS_ROLLBACKVROOTS##</td><td/></row>
		<row><td>PROGMSG_IIS_ROLLBACKWEBSERVICEEXTENSIONS</td><td>##IDS_PROGMSG_IIS_ROLLBACKWEBSERVICEEXTENSIONS##</td><td/></row>
		<row><td>PROGRAMFILETOLAUNCHATEND</td><td>[INSTALLDIR]session\session-shell.bat</td><td/></row>
		<row><td>ProductCode</td><td>{99CCB549-EA23-49E3-A6F7-72BF0541B3CB}</td><td/></row>
		<row><td>ProductName</td><td>Session</td><td/></row>
		<row><td>ProductVersion</td><td>0.9.1</td><td/></row>
		<row><td>ProgressType0</td><td>install</td><td/></row>
		<row><td>ProgressType1</td><td>Installing</td><td/></row>
		<row><td>ProgressType2</td><td>installed</td><td/></row>
		<row><td>ProgressType3</td><td>installs</td><td/></row>
		<row><td>RebootYesNo</td><td>Yes</td><td/></row>
		<row><td>ReinstallFileVersion</td><td>o</td><td/></row>
		<row><td>ReinstallModeText</td><td>omus</td><td/></row>
		<row><td>ReinstallRepair</td><td>r</td><td/></row>
		<row><td>RestartManagerOption</td><td>CloseRestart</td><td/></row>
		<row><td>SERIALNUMBER</td><td/><td/></row>
		<row><td>SERIALNUMVALSUCCESSRETVAL</td><td>1</td><td/></row>
		<row><td>SHOWLAUNCHPROGRAM</td><td>0</td><td/></row>
		<row><td>SecureCustomProperties</td><td>ISFOUNDNEWERPRODUCTVERSION;USERNAME;COMPANYNAME;ISX_SERIALNUM;SUPPORTDIR</td><td/></row>
		<row><td>SelectedSetupType</td><td>##IDS__DisplayName_Typical##</td><td/></row>
		<row><td>SetupType</td><td>Typical</td><td/></row>
		<row><td>UpgradeCode</td><td>{477C7E21-8E69-462B-83E5-7A268F8453EC}</td><td/></row>
		<row><td>_IsMaintenance</td><td>Change</td><td/></row>
		<row><td>_IsSetupTypeMin</td><td>Typical</td><td/></row>
	</table>

	<table name="PublishComponent">
		<col key="yes" def="s38">ComponentId</col>
		<col key="yes" def="s255">Qualifier</col>
		<col key="yes" def="s72">Component_</col>
		<col def="L0">AppData</col>
		<col def="s38">Feature_</col>
	</table>

	<table name="RadioButton">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="L64">Text</col>
		<col def="L50">Help</col>
		<col def="I4">ISControlId</col>
		<row><td>AgreeToLicense</td><td>1</td><td>No</td><td>0</td><td>15</td><td>291</td><td>15</td><td>##IDS__AgreeToLicense_0##</td><td/><td/></row>
		<row><td>AgreeToLicense</td><td>2</td><td>Yes</td><td>0</td><td>0</td><td>291</td><td>15</td><td>##IDS__AgreeToLicense_1##</td><td/><td/></row>
		<row><td>ApplicationUsers</td><td>1</td><td>AllUsers</td><td>1</td><td>7</td><td>290</td><td>14</td><td>##IDS__IsRegisterUserDlg_Anyone##</td><td/><td/></row>
		<row><td>ApplicationUsers</td><td>2</td><td>OnlyCurrentUser</td><td>1</td><td>23</td><td>290</td><td>14</td><td>##IDS__IsRegisterUserDlg_OnlyMe##</td><td/><td/></row>
		<row><td>RestartManagerOption</td><td>1</td><td>CloseRestart</td><td>6</td><td>9</td><td>331</td><td>14</td><td>##IDS__IsMsiRMFilesInUse_CloseRestart##</td><td/><td/></row>
		<row><td>RestartManagerOption</td><td>2</td><td>Reboot</td><td>6</td><td>21</td><td>331</td><td>14</td><td>##IDS__IsMsiRMFilesInUse_RebootAfter##</td><td/><td/></row>
		<row><td>_IsMaintenance</td><td>1</td><td>Change</td><td>0</td><td>0</td><td>290</td><td>14</td><td>##IDS__IsMaintenanceDlg_Modify##</td><td/><td/></row>
		<row><td>_IsMaintenance</td><td>2</td><td>Reinstall</td><td>0</td><td>60</td><td>290</td><td>14</td><td>##IDS__IsMaintenanceDlg_Repair##</td><td/><td/></row>
		<row><td>_IsMaintenance</td><td>3</td><td>Remove</td><td>0</td><td>120</td><td>290</td><td>14</td><td>##IDS__IsMaintenanceDlg_Remove##</td><td/><td/></row>
		<row><td>_IsSetupTypeMin</td><td>1</td><td>Typical</td><td>1</td><td>6</td><td>264</td><td>14</td><td>##IDS__IsSetupTypeMinDlg_Typical##</td><td/><td/></row>
	</table>

	<table name="RegLocator">
		<col key="yes" def="s72">Signature_</col>
		<col def="i2">Root</col>
		<col def="s255">Key</col>
		<col def="S255">Name</col>
		<col def="I2">Type</col>
	</table>

	<table name="Registry">
		<col key="yes" def="s72">Registry</col>
		<col def="i2">Root</col>
		<col def="s255">Key</col>
		<col def="S255">Name</col>
		<col def="S0">Value</col>
		<col def="s72">Component_</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="RemoveFile">
		<col key="yes" def="s72">FileKey</col>
		<col def="s72">Component_</col>
		<col def="L255">FileName</col>
		<col def="s72">DirProperty</col>
		<col def="i2">InstallMode</col>
		<row><td>FileKey1</td><td>cryptRDP5.exe</td><td/><td>raafte_1_raaf_technology</td><td>2</td></row>
		<row><td>FileKey2</td><td>cryptRDP5.exe</td><td/><td>session</td><td>2</td></row>
		<row><td>NewShortcut1</td><td>vc2008sp1_redist_x86.exe</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut2</td><td>ISX_DEFAULTCOMPONENT40</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut3</td><td>ISX_DEFAULTCOMPONENT40</td><td/><td>raafte_1_raaf_technology</td><td>2</td></row>
		<row><td>NewShortcut4</td><td>ISX_DEFAULTCOMPONENT40</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut5</td><td>vc2010sp1_redist_x86.exe</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>session_shell.bat</td><td>ISX_DEFAULTCOMPONENT40</td><td/><td>raafte_1_raaf_technology</td><td>2</td></row>
		<row><td>winpcap_nmap_4.12.exe</td><td>winpcap_nmap_4.12.exe</td><td/><td>newfolder1</td><td>2</td></row>
	</table>

	<table name="RemoveIniFile">
		<col key="yes" def="s72">RemoveIniFile</col>
		<col def="l255">FileName</col>
		<col def="S72">DirProperty</col>
		<col def="l96">Section</col>
		<col def="l128">Key</col>
		<col def="L255">Value</col>
		<col def="i2">Action</col>
		<col def="s72">Component_</col>
	</table>

	<table name="RemoveRegistry">
		<col key="yes" def="s72">RemoveRegistry</col>
		<col def="i2">Root</col>
		<col def="l255">Key</col>
		<col def="L255">Name</col>
		<col def="s72">Component_</col>
	</table>

	<table name="ReserveCost">
		<col key="yes" def="s72">ReserveKey</col>
		<col def="s72">Component_</col>
		<col def="S72">ReserveFolder</col>
		<col def="i4">ReserveLocal</col>
		<col def="i4">ReserveSource</col>
	</table>

	<table name="SFPCatalog">
		<col key="yes" def="s255">SFPCatalog</col>
		<col def="V0">Catalog</col>
		<col def="S0">Dependency</col>
	</table>

	<table name="SelfReg">
		<col key="yes" def="s72">File_</col>
		<col def="I2">Cost</col>
	</table>

	<table name="ServiceControl">
		<col key="yes" def="s72">ServiceControl</col>
		<col def="s255">Name</col>
		<col def="i2">Event</col>
		<col def="S255">Arguments</col>
		<col def="I2">Wait</col>
		<col def="s72">Component_</col>
	</table>

	<table name="ServiceInstall">
		<col key="yes" def="s72">ServiceInstall</col>
		<col def="s255">Name</col>
		<col def="L255">DisplayName</col>
		<col def="i4">ServiceType</col>
		<col def="i4">StartType</col>
		<col def="i4">ErrorControl</col>
		<col def="S255">LoadOrderGroup</col>
		<col def="S255">Dependencies</col>
		<col def="S255">StartName</col>
		<col def="S255">Password</col>
		<col def="S255">Arguments</col>
		<col def="s72">Component_</col>
		<col def="L255">Description</col>
	</table>

	<table name="Shortcut">
		<col key="yes" def="s72">Shortcut</col>
		<col def="s72">Directory_</col>
		<col def="l128">Name</col>
		<col def="s72">Component_</col>
		<col def="s255">Target</col>
		<col def="S255">Arguments</col>
		<col def="L255">Description</col>
		<col def="I2">Hotkey</col>
		<col def="S72">Icon_</col>
		<col def="I2">IconIndex</col>
		<col def="I2">ShowCmd</col>
		<col def="S72">WkDir</col>
		<col def="S255">DisplayResourceDLL</col>
		<col def="I2">DisplayResourceId</col>
		<col def="S255">DescriptionResourceDLL</col>
		<col def="I2">DescriptionResourceId</col>
		<col def="S255">ISComments</col>
		<col def="S255">ISShortcutName</col>
		<col def="I4">ISAttributes</col>
		<row><td>NewShortcut1</td><td>newfolder1</td><td>##ID_STRING14##</td><td>vc2008sp1_redist_x86.exe</td><td>[INSTALLDIR]nmap\vc2008sp1-redist_x86.exe</td><td/><td>##ID_STRING16##</td><td/><td>NewShortcut1_77FC1BEE2C7448E3BB30EBB5429B7A35.exe</td><td>1</td><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut2</td><td>newfolder1</td><td>##ID_STRING7##</td><td>ISX_DEFAULTCOMPONENT40</td><td>[INSTALLDIR]session\dotnet4link.url</td><td/><td>##ID_STRING8##</td><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut3</td><td>raafte_1_raaf_technology</td><td>##ID_STRING10##</td><td>ISX_DEFAULTCOMPONENT40</td><td>[INSTALLDIR]session\issues.txt</td><td/><td>##ID_STRING11##</td><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut4</td><td>newfolder1</td><td>##ID_STRING12##</td><td>ISX_DEFAULTCOMPONENT40</td><td>[INSTALLDIR]session\rdcclient6link.url</td><td/><td>##ID_STRING13##</td><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut5</td><td>newfolder1</td><td>##ID_STRING15##</td><td>vc2010sp1_redist_x86.exe</td><td>[INSTALLDIR]nmap\vc2010sp1-redist_x86.exe</td><td/><td>##ID_STRING17##</td><td/><td>NewShortcut5_47EFE33A65174E43A94297143B12E428.exe</td><td>1</td><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>session_shell.bat</td><td>raafte_1_raaf_technology</td><td>##IDS_SHORTCUT_DISPLAY_NAME116##</td><td>ISX_DEFAULTCOMPONENT40</td><td>[INSTALLDIR]\session-shell.bat</td><td/><td>##ID_STRING117##</td><td/><td>session_shell.bat_BE326B339C954734B0198F6DFD037BA1.exe</td><td>0</td><td>1</td><td>INSTALLDIR</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>winpcap_nmap_4.12.exe</td><td>newfolder1</td><td>##IDS_SHORTCUT_DISPLAY_NAME108##</td><td>winpcap_nmap_4.12.exe</td><td>AlwaysInstall</td><td/><td>##ID_STRING118##</td><td/><td>winpcap_nmap_4.12._A19ABFBF037D4AAA9AC9580D6201CECE.exe</td><td>1</td><td>1</td><td>NMAP</td><td/><td/><td/><td/><td/><td/><td/></row>
	</table>

	<table name="Signature">
		<col key="yes" def="s72">Signature</col>
		<col def="s255">FileName</col>
		<col def="S20">MinVersion</col>
		<col def="S20">MaxVersion</col>
		<col def="I4">MinSize</col>
		<col def="I4">MaxSize</col>
		<col def="I4">MinDate</col>
		<col def="I4">MaxDate</col>
		<col def="S255">Languages</col>
	</table>

	<table name="TextStyle">
		<col key="yes" def="s72">TextStyle</col>
		<col def="s32">FaceName</col>
		<col def="i2">Size</col>
		<col def="I4">Color</col>
		<col def="I2">StyleBits</col>
		<row><td>Arial8</td><td>Arial</td><td>8</td><td/><td/></row>
		<row><td>Arial9</td><td>Arial</td><td>9</td><td/><td/></row>
		<row><td>ArialBlue10</td><td>Arial</td><td>10</td><td>16711680</td><td/></row>
		<row><td>ArialBlueStrike10</td><td>Arial</td><td>10</td><td>16711680</td><td>8</td></row>
		<row><td>CourierNew8</td><td>Courier New</td><td>8</td><td/><td/></row>
		<row><td>CourierNew9</td><td>Courier New</td><td>9</td><td/><td/></row>
		<row><td>ExpressDefault</td><td>Tahoma</td><td>8</td><td/><td/></row>
		<row><td>MSGothic9</td><td>MS Gothic</td><td>9</td><td/><td/></row>
		<row><td>MSSGreySerif8</td><td>MS Sans Serif</td><td>8</td><td>8421504</td><td/></row>
		<row><td>MSSWhiteSerif8</td><td>Tahoma</td><td>8</td><td>16777215</td><td/></row>
		<row><td>MSSansBold8</td><td>Tahoma</td><td>8</td><td/><td>1</td></row>
		<row><td>MSSansSerif8</td><td>MS Sans Serif</td><td>8</td><td/><td/></row>
		<row><td>MSSansSerif9</td><td>MS Sans Serif</td><td>9</td><td/><td/></row>
		<row><td>Tahoma10</td><td>Tahoma</td><td>10</td><td/><td/></row>
		<row><td>Tahoma8</td><td>Tahoma</td><td>8</td><td/><td/></row>
		<row><td>Tahoma9</td><td>Tahoma</td><td>9</td><td/><td/></row>
		<row><td>TahomaBold10</td><td>Tahoma</td><td>10</td><td/><td>1</td></row>
		<row><td>TahomaBold8</td><td>Tahoma</td><td>8</td><td/><td>1</td></row>
		<row><td>Times8</td><td>Times New Roman</td><td>8</td><td/><td/></row>
		<row><td>Times9</td><td>Times New Roman</td><td>9</td><td/><td/></row>
		<row><td>TimesItalic12</td><td>Times New Roman</td><td>12</td><td/><td>2</td></row>
		<row><td>TimesItalicBlue10</td><td>Times New Roman</td><td>10</td><td>16711680</td><td>2</td></row>
		<row><td>TimesRed16</td><td>Times New Roman</td><td>16</td><td>255</td><td/></row>
		<row><td>VerdanaBold14</td><td>Verdana</td><td>13</td><td/><td>1</td></row>
	</table>

	<table name="TypeLib">
		<col key="yes" def="s38">LibID</col>
		<col key="yes" def="i2">Language</col>
		<col key="yes" def="s72">Component_</col>
		<col def="I4">Version</col>
		<col def="L128">Description</col>
		<col def="S72">Directory_</col>
		<col def="s38">Feature_</col>
		<col def="I4">Cost</col>
	</table>

	<table name="UIText">
		<col key="yes" def="s72">Key</col>
		<col def="L255">Text</col>
		<row><td>AbsentPath</td><td/></row>
		<row><td>GB</td><td>##IDS_UITEXT_GB##</td></row>
		<row><td>KB</td><td>##IDS_UITEXT_KB##</td></row>
		<row><td>MB</td><td>##IDS_UITEXT_MB##</td></row>
		<row><td>MenuAbsent</td><td>##IDS_UITEXT_FeatureNotAvailable##</td></row>
		<row><td>MenuAdvertise</td><td>##IDS_UITEXT_FeatureInstalledWhenRequired2##</td></row>
		<row><td>MenuAllCD</td><td>##IDS_UITEXT_FeatureInstalledCD##</td></row>
		<row><td>MenuAllLocal</td><td>##IDS_UITEXT_FeatureInstalledLocal##</td></row>
		<row><td>MenuAllNetwork</td><td>##IDS_UITEXT_FeatureInstalledNetwork##</td></row>
		<row><td>MenuCD</td><td>##IDS_UITEXT_FeatureInstalledCD2##</td></row>
		<row><td>MenuLocal</td><td>##IDS_UITEXT_FeatureInstalledLocal2##</td></row>
		<row><td>MenuNetwork</td><td>##IDS_UITEXT_FeatureInstalledNetwork2##</td></row>
		<row><td>NewFolder</td><td>##IDS_UITEXT_Folder##</td></row>
		<row><td>SelAbsentAbsent</td><td>##IDS_UITEXT_GB##</td></row>
		<row><td>SelAbsentAdvertise</td><td>##IDS_UITEXT_FeatureInstalledWhenRequired##</td></row>
		<row><td>SelAbsentCD</td><td>##IDS_UITEXT_FeatureOnCD##</td></row>
		<row><td>SelAbsentLocal</td><td>##IDS_UITEXT_FeatureLocal##</td></row>
		<row><td>SelAbsentNetwork</td><td>##IDS_UITEXT_FeatureNetwork##</td></row>
		<row><td>SelAdvertiseAbsent</td><td>##IDS_UITEXT_FeatureUnavailable##</td></row>
		<row><td>SelAdvertiseAdvertise</td><td>##IDS_UITEXT_FeatureInstalledRequired##</td></row>
		<row><td>SelAdvertiseCD</td><td>##IDS_UITEXT_FeatureOnCD2##</td></row>
		<row><td>SelAdvertiseLocal</td><td>##IDS_UITEXT_FeatureLocal2##</td></row>
		<row><td>SelAdvertiseNetwork</td><td>##IDS_UITEXT_FeatureNetwork2##</td></row>
		<row><td>SelCDAbsent</td><td>##IDS_UITEXT_FeatureWillBeUninstalled##</td></row>
		<row><td>SelCDAdvertise</td><td>##IDS_UITEXT_FeatureWasCD##</td></row>
		<row><td>SelCDCD</td><td>##IDS_UITEXT_FeatureRunFromCD##</td></row>
		<row><td>SelCDLocal</td><td>##IDS_UITEXT_FeatureWasCDLocal##</td></row>
		<row><td>SelChildCostNeg</td><td>##IDS_UITEXT_FeatureFreeSpace##</td></row>
		<row><td>SelChildCostPos</td><td>##IDS_UITEXT_FeatureRequiredSpace##</td></row>
		<row><td>SelCostPending</td><td>##IDS_UITEXT_CompilingFeaturesCost##</td></row>
		<row><td>SelLocalAbsent</td><td>##IDS_UITEXT_FeatureCompletelyRemoved##</td></row>
		<row><td>SelLocalAdvertise</td><td>##IDS_UITEXT_FeatureRemovedUnlessRequired##</td></row>
		<row><td>SelLocalCD</td><td>##IDS_UITEXT_FeatureRemovedCD##</td></row>
		<row><td>SelLocalLocal</td><td>##IDS_UITEXT_FeatureRemainLocal##</td></row>
		<row><td>SelLocalNetwork</td><td>##IDS_UITEXT_FeatureRemoveNetwork##</td></row>
		<row><td>SelNetworkAbsent</td><td>##IDS_UITEXT_FeatureUninstallNoNetwork##</td></row>
		<row><td>SelNetworkAdvertise</td><td>##IDS_UITEXT_FeatureWasOnNetworkInstalled##</td></row>
		<row><td>SelNetworkLocal</td><td>##IDS_UITEXT_FeatureWasOnNetworkLocal##</td></row>
		<row><td>SelNetworkNetwork</td><td>##IDS_UITEXT_FeatureContinueNetwork##</td></row>
		<row><td>SelParentCostNegNeg</td><td>##IDS_UITEXT_FeatureSpaceFree##</td></row>
		<row><td>SelParentCostNegPos</td><td>##IDS_UITEXT_FeatureSpaceFree2##</td></row>
		<row><td>SelParentCostPosNeg</td><td>##IDS_UITEXT_FeatureSpaceFree3##</td></row>
		<row><td>SelParentCostPosPos</td><td>##IDS_UITEXT_FeatureSpaceFree4##</td></row>
		<row><td>TimeRemaining</td><td>##IDS_UITEXT_TimeRemaining##</td></row>
		<row><td>VolumeCostAvailable</td><td>##IDS_UITEXT_Available##</td></row>
		<row><td>VolumeCostDifference</td><td>##IDS_UITEXT_Differences##</td></row>
		<row><td>VolumeCostRequired</td><td>##IDS_UITEXT_Required##</td></row>
		<row><td>VolumeCostSize</td><td>##IDS_UITEXT_DiskSize##</td></row>
		<row><td>VolumeCostVolume</td><td>##IDS_UITEXT_Volume##</td></row>
		<row><td>bytes</td><td>##IDS_UITEXT_Bytes##</td></row>
	</table>

	<table name="Upgrade">
		<col key="yes" def="s38">UpgradeCode</col>
		<col key="yes" def="S20">VersionMin</col>
		<col key="yes" def="S20">VersionMax</col>
		<col key="yes" def="S255">Language</col>
		<col key="yes" def="i4">Attributes</col>
		<col def="S255">Remove</col>
		<col def="s72">ActionProperty</col>
		<col def="S72">ISDisplayName</col>
		<row><td>{00000000-0000-0000-0000-000000000000}</td><td>***ALL_VERSIONS***</td><td></td><td></td><td>2</td><td/><td>ISFOUNDNEWERPRODUCTVERSION</td><td>ISPreventDowngrade</td></row>
	</table>

	<table name="Verb">
		<col key="yes" def="s255">Extension_</col>
		<col key="yes" def="s32">Verb</col>
		<col def="I2">Sequence</col>
		<col def="L255">Command</col>
		<col def="L255">Argument</col>
	</table>

	<table name="_Validation">
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="s32">Column</col>
		<col def="s4">Nullable</col>
		<col def="I4">MinValue</col>
		<col def="I4">MaxValue</col>
		<col def="S255">KeyTable</col>
		<col def="I2">KeyColumn</col>
		<col def="S32">Category</col>
		<col def="S255">Set</col>
		<col def="S255">Description</col>
		<row><td>ActionText</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to be described.</td></row>
		<row><td>ActionText</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized description displayed in progress dialog and log when action is executing.</td></row>
		<row><td>ActionText</td><td>Template</td><td>Y</td><td/><td/><td/><td/><td>Template</td><td/><td>Optional localized format template used to format action data records for display during action execution.</td></row>
		<row><td>AdminExecuteSequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdminExecuteSequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdminExecuteSequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdminExecuteSequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdminExecuteSequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AdminUISequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdminUISequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdminUISequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdminUISequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdminUISequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AdvtExecuteSequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdvtExecuteSequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdvtExecuteSequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdvtExecuteSequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdvtExecuteSequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AdvtUISequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdvtUISequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdvtUISequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdvtUISequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdvtUISequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AppId</td><td>ActivateAtStorage</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td/></row>
		<row><td>AppId</td><td>AppId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td/></row>
		<row><td>AppId</td><td>DllSurrogate</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>AppId</td><td>LocalService</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>AppId</td><td>RemoteServerName</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>AppId</td><td>RunAsInteractiveUser</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td/></row>
		<row><td>AppId</td><td>ServiceParameters</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>AppSearch</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The property associated with a Signature</td></row>
		<row><td>AppSearch</td><td>Signature_</td><td>N</td><td/><td/><td>ISXmlLocator;Signature</td><td>1</td><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature,  RegLocator, IniLocator, CompLocator and the DrLocator tables.</td></row>
		<row><td>BBControl</td><td>Attributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this control.</td></row>
		<row><td>BBControl</td><td>BBControl</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the control. This name must be unique within a billboard, but can repeat on different billboard.</td></row>
		<row><td>BBControl</td><td>Billboard_</td><td>N</td><td/><td/><td>Billboard</td><td>1</td><td>Identifier</td><td/><td>External key to the Billboard table, name of the billboard.</td></row>
		<row><td>BBControl</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the control.</td></row>
		<row><td>BBControl</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A string used to set the initial text contained within a control (if appropriate).</td></row>
		<row><td>BBControl</td><td>Type</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The type of the control.</td></row>
		<row><td>BBControl</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the control.</td></row>
		<row><td>BBControl</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Horizontal coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>BBControl</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Vertical coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>Billboard</td><td>Action</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The name of an action. The billboard is displayed during the progress messages received from this action.</td></row>
		<row><td>Billboard</td><td>Billboard</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the billboard.</td></row>
		<row><td>Billboard</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>An external key to the Feature Table. The billboard is shown only if this feature is being installed.</td></row>
		<row><td>Billboard</td><td>Ordering</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>A positive integer. If there is more than one billboard corresponding to an action they will be shown in the order defined by this column.</td></row>
		<row><td>Binary</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The binary icon data in PE (.DLL or .EXE) or icon (.ICO) format.</td></row>
		<row><td>Binary</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to the ICO or EXE file.</td></row>
		<row><td>Binary</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique key identifying the binary data.</td></row>
		<row><td>BindImage</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>The index into the File table. This must be an executable file.</td></row>
		<row><td>BindImage</td><td>Path</td><td>Y</td><td/><td/><td/><td/><td>Paths</td><td/><td>A list of ;  delimited paths that represent the paths to be searched for the import DLLS. The list is usually a list of properties each enclosed within square brackets [] .</td></row>
		<row><td>CCPSearch</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature,  RegLocator, IniLocator, CompLocator and the DrLocator tables.</td></row>
		<row><td>CheckBox</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to the item.</td></row>
		<row><td>CheckBox</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with the item.</td></row>
		<row><td>Class</td><td>AppId_</td><td>Y</td><td/><td/><td>AppId</td><td>1</td><td>Guid</td><td/><td>Optional AppID containing DCOM information for associated application (string GUID).</td></row>
		<row><td>Class</td><td>Argument</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>optional argument for LocalServers.</td></row>
		<row><td>Class</td><td>Attributes</td><td>Y</td><td/><td>32767</td><td/><td/><td/><td/><td>Class registration attributes.</td></row>
		<row><td>Class</td><td>CLSID</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>The CLSID of an OLE factory.</td></row>
		<row><td>Class</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table, specifying the component for which to return a path when called through LocateComponent.</td></row>
		<row><td>Class</td><td>Context</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The numeric server context for this server. CLSCTX_xxxx</td></row>
		<row><td>Class</td><td>DefInprocHandler</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td>1;2;3</td><td>Optional default inproc handler.  Only optionally provided if Context=CLSCTX_LOCAL_SERVER.  Typically "ole32.dll" or "mapi32.dll"</td></row>
		<row><td>Class</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized description for the Class.</td></row>
		<row><td>Class</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table, specifying the feature to validate or install in order for the CLSID factory to be operational.</td></row>
		<row><td>Class</td><td>FileTypeMask</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Optional string containing information for the HKCRthis CLSID) key. If multiple patterns exist, they must be delimited by a semicolon, and numeric subkeys will be generated: 0,1,2...</td></row>
		<row><td>Class</td><td>IconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>Optional icon index.</td></row>
		<row><td>Class</td><td>Icon_</td><td>Y</td><td/><td/><td>Icon</td><td>1</td><td>Identifier</td><td/><td>Optional foreign key into the Icon Table, specifying the icon file associated with this CLSID. Will be written under the DefaultIcon key.</td></row>
		<row><td>Class</td><td>ProgId_Default</td><td>Y</td><td/><td/><td>ProgId</td><td>1</td><td>Text</td><td/><td>Optional ProgId associated with this CLSID.</td></row>
		<row><td>ComboBox</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list.	The integers do not have to be consecutive.</td></row>
		<row><td>ComboBox</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this item. All the items tied to the same property become part of the same combobox.</td></row>
		<row><td>ComboBox</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The visible text to be assigned to the item. Optional. If this entry or the entire column is missing, the text is the same as the value.</td></row>
		<row><td>ComboBox</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with this item. Selecting the line will set the associated property to this value.</td></row>
		<row><td>CompLocator</td><td>ComponentId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>A string GUID unique to this component, version, and language.</td></row>
		<row><td>CompLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The table key. The Signature_ represents a unique file signature and is also the foreign key in the Signature table.</td></row>
		<row><td>CompLocator</td><td>Type</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td>A boolean value that determines if the registry value is a filename or a directory location.</td></row>
		<row><td>Complus</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the ComPlus component.</td></row>
		<row><td>Complus</td><td>ExpType</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>ComPlus component attributes.</td></row>
		<row><td>Component</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Remote execution option, one of irsEnum</td></row>
		<row><td>Component</td><td>Component</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular component record.</td></row>
		<row><td>Component</td><td>ComponentId</td><td>Y</td><td/><td/><td/><td/><td>Guid</td><td/><td>A string GUID unique to this component, version, and language.</td></row>
		<row><td>Component</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>A conditional statement that will disable this component if the specified condition evaluates to the 'True' state. If a component is disabled, it will not be installed, regardless of the 'Action' state associated with the component.</td></row>
		<row><td>Component</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Required key of a Directory table record. This is actually a property name whose value contains the actual path, set either by the AppSearch action or with the default setting obtained from the Directory table.</td></row>
		<row><td>Component</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a component.</td></row>
		<row><td>Component</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>User Comments.</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsCommit</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsInstall</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsRollback</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsUninstall</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISRegFileToMergeAtBuild</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Path and File name of a .REG file to merge into the component at build time.</td></row>
		<row><td>Component</td><td>ISScanAtBuildFile</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>File used by the Dot Net scanner to populate dependant assemblies' File_Application field.</td></row>
		<row><td>Component</td><td>KeyPath</td><td>Y</td><td/><td/><td>File;ODBCDataSource;Registry</td><td>1</td><td>Identifier</td><td/><td>Either the primary key into the File table, Registry table, or ODBCDataSource table. This extract path is stored when the component is installed, and is used to detect the presence of the component and to return the path to it.</td></row>
		<row><td>Condition</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Expression evaluated to determine if Level in the Feature table is to change.</td></row>
		<row><td>Condition</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Reference to a Feature entry in Feature table.</td></row>
		<row><td>Condition</td><td>Level</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>New selection Level to set in Feature table if Condition evaluates to TRUE.</td></row>
		<row><td>Control</td><td>Attributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this control.</td></row>
		<row><td>Control</td><td>Binary_</td><td>Y</td><td/><td/><td>Binary</td><td>1</td><td>Identifier</td><td/><td>External key to the Binary table.</td></row>
		<row><td>Control</td><td>Control</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the control. This name must be unique within a dialog, but can repeat on different dialogs.</td></row>
		<row><td>Control</td><td>Control_Next</td><td>Y</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>The name of an other control on the same dialog. This link defines the tab order of the controls. The links have to form one or more cycles!</td></row>
		<row><td>Control</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>External key to the Dialog table, name of the dialog.</td></row>
		<row><td>Control</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the control.</td></row>
		<row><td>Control</td><td>Help</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The help strings used with the button. The text is optional.</td></row>
		<row><td>Control</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to .rtf file for scrollable text control</td></row>
		<row><td>Control</td><td>ISControlId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A number used to represent the control ID of the Control, Used in Dialog export</td></row>
		<row><td>Control</td><td>ISWindowStyle</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies non-MSI window styles to be applied to this control.</td></row>
		<row><td>Control</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The name of a defined property to be linked to this control.</td></row>
		<row><td>Control</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A string used to set the initial text contained within a control (if appropriate).</td></row>
		<row><td>Control</td><td>Type</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The type of the control.</td></row>
		<row><td>Control</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the control.</td></row>
		<row><td>Control</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Horizontal coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>Control</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Vertical coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>ControlCondition</td><td>Action</td><td>N</td><td/><td/><td/><td/><td/><td>Default;Disable;Enable;Hide;Show</td><td>The desired action to be taken on the specified control.</td></row>
		<row><td>ControlCondition</td><td>Condition</td><td>N</td><td/><td/><td/><td/><td>Condition</td><td/><td>A standard conditional statement that specifies under which conditions the action should be triggered.</td></row>
		<row><td>ControlCondition</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>A foreign key to the Control table, name of the control.</td></row>
		<row><td>ControlCondition</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the Dialog table, name of the dialog.</td></row>
		<row><td>ControlEvent</td><td>Argument</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A value to be used as a modifier when triggering a particular event.</td></row>
		<row><td>ControlEvent</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>A standard conditional statement that specifies under which conditions an event should be triggered.</td></row>
		<row><td>ControlEvent</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>A foreign key to the Control table, name of the control</td></row>
		<row><td>ControlEvent</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the Dialog table, name of the dialog.</td></row>
		<row><td>ControlEvent</td><td>Event</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>An identifier that specifies the type of the event that should take place when the user interacts with control specified by the first two entries.</td></row>
		<row><td>ControlEvent</td><td>Ordering</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>An integer used to order several events tied to the same control. Can be left blank.</td></row>
		<row><td>CreateFolder</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table.</td></row>
		<row><td>CreateFolder</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Primary key, could be foreign key into the Directory table.</td></row>
		<row><td>CustomAction</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, name of action, normally appears in sequence table unless private use.</td></row>
		<row><td>CustomAction</td><td>ExtendedType</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The numeric custom action type info flags.</td></row>
		<row><td>CustomAction</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments for this custom action.</td></row>
		<row><td>CustomAction</td><td>Source</td><td>Y</td><td/><td/><td/><td/><td>CustomSource</td><td/><td>The table reference of the source of the code.</td></row>
		<row><td>CustomAction</td><td>Target</td><td>Y</td><td/><td/><td>ISDLLWrapper;ISInstallScriptAction</td><td>1</td><td>Formatted</td><td/><td>Excecution parameter, depends on the type of custom action</td></row>
		<row><td>CustomAction</td><td>Type</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>The numeric custom action type, consisting of source location, code type, entry, option flags.</td></row>
		<row><td>Dialog</td><td>Attributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this dialog.</td></row>
		<row><td>Dialog</td><td>Control_Cancel</td><td>Y</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Defines the cancel control. Hitting escape or clicking on the close icon on the dialog is equivalent to pushing this button.</td></row>
		<row><td>Dialog</td><td>Control_Default</td><td>Y</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Defines the default control. Hitting return is equivalent to pushing this button.</td></row>
		<row><td>Dialog</td><td>Control_First</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Defines the control that has the focus when the dialog is created.</td></row>
		<row><td>Dialog</td><td>Dialog</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the dialog.</td></row>
		<row><td>Dialog</td><td>HCentering</td><td>N</td><td>0</td><td>100</td><td/><td/><td/><td/><td>Horizontal position of the dialog on a 0-100 scale. 0 means left end, 100 means right end of the screen, 50 center.</td></row>
		<row><td>Dialog</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the dialog.</td></row>
		<row><td>Dialog</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments for this dialog.</td></row>
		<row><td>Dialog</td><td>ISResourceId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A Number the Specifies the Dialog ID to be used in Dialog Export</td></row>
		<row><td>Dialog</td><td>ISWindowStyle</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A 32-bit word that specifies non-MSI window styles to be applied to this control. This is only used in Script Based Setups.</td></row>
		<row><td>Dialog</td><td>TextStyle_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign Key into TextStyle table, only used in Script Based Projects.</td></row>
		<row><td>Dialog</td><td>Title</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A text string specifying the title to be displayed in the title bar of the dialog's window.</td></row>
		<row><td>Dialog</td><td>VCentering</td><td>N</td><td>0</td><td>100</td><td/><td/><td/><td/><td>Vertical position of the dialog on a 0-100 scale. 0 means top end, 100 means bottom end of the screen, 50 center.</td></row>
		<row><td>Dialog</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the dialog.</td></row>
		<row><td>Directory</td><td>DefaultDir</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The default sub-path under parent's path.</td></row>
		<row><td>Directory</td><td>Directory</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for directory entry, primary key. If a property by this name is defined, it contains the full path to the directory.</td></row>
		<row><td>Directory</td><td>Directory_Parent</td><td>Y</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Reference to the entry in this table specifying the default parent directory. A record parented to itself or with a Null parent represents a root of the install tree.</td></row>
		<row><td>Directory</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2;3;4;5;6;7</td><td>This is used to store Installshield custom properties of a directory.  Currently the only one is Shortcut.</td></row>
		<row><td>Directory</td><td>ISDescription</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description of folder</td></row>
		<row><td>Directory</td><td>ISFolderName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>This is used in Pro projects because the pro identifier used in the tree wasn't necessarily unique.</td></row>
		<row><td>DrLocator</td><td>Depth</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The depth below the path to which the Signature_ is recursively searched. If absent, the depth is assumed to be 0.</td></row>
		<row><td>DrLocator</td><td>Parent</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The parent file signature. It is also a foreign key in the Signature table. If null and the Path column does not expand to a full path, then all the fixed drives of the user system are searched using the Path.</td></row>
		<row><td>DrLocator</td><td>Path</td><td>Y</td><td/><td/><td/><td/><td>AnyPath</td><td/><td>The path on the user system. This is a either a subpath below the value of the Parent or a full path. The path may contain properties enclosed within [ ] that will be expanded.</td></row>
		<row><td>DrLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature table.</td></row>
		<row><td>DuplicateFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the duplicate file.</td></row>
		<row><td>DuplicateFile</td><td>DestFolder</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full pathname to a destination folder.</td></row>
		<row><td>DuplicateFile</td><td>DestName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Filename to be given to the duplicate file.</td></row>
		<row><td>DuplicateFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular file entry</td></row>
		<row><td>DuplicateFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing the source file to be duplicated.</td></row>
		<row><td>Environment</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the installing of the environmental value.</td></row>
		<row><td>Environment</td><td>Environment</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for the environmental variable setting</td></row>
		<row><td>Environment</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the environmental value.</td></row>
		<row><td>Environment</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value to set in the environmental settings.</td></row>
		<row><td>Error</td><td>Error</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Integer error number, obtained from header file IError(...) macros.</td></row>
		<row><td>Error</td><td>Message</td><td>Y</td><td/><td/><td/><td/><td>Template</td><td/><td>Error formatting template, obtained from user ed. or localizers.</td></row>
		<row><td>EventMapping</td><td>Attribute</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The name of the control attribute, that is set when this event is received.</td></row>
		<row><td>EventMapping</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>A foreign key to the Control table, name of the control.</td></row>
		<row><td>EventMapping</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the Dialog table, name of the Dialog.</td></row>
		<row><td>EventMapping</td><td>Event</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>An identifier that specifies the type of the event that the control subscribes to.</td></row>
		<row><td>Extension</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table, specifying the component for which to return a path when called through LocateComponent.</td></row>
		<row><td>Extension</td><td>Extension</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The extension associated with the table row.</td></row>
		<row><td>Extension</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table, specifying the feature to validate or install in order for the CLSID factory to be operational.</td></row>
		<row><td>Extension</td><td>MIME_</td><td>Y</td><td/><td/><td>MIME</td><td>1</td><td>Text</td><td/><td>Optional Context identifier, typically "type/format" associated with the extension</td></row>
		<row><td>Extension</td><td>ProgId_</td><td>Y</td><td/><td/><td>ProgId</td><td>1</td><td>Text</td><td/><td>Optional ProgId associated with this extension.</td></row>
		<row><td>Feature</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;2;4;5;6;8;9;10;16;17;18;20;21;22;24;25;26;32;33;34;36;37;38;48;49;50;52;53;54</td><td>Feature attributes</td></row>
		<row><td>Feature</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Longer descriptive text describing a visible feature item.</td></row>
		<row><td>Feature</td><td>Directory_</td><td>Y</td><td/><td/><td>Directory</td><td>1</td><td>UpperCase</td><td/><td>The name of the Directory that can be configured by the UI. A non-null value will enable the browse button.</td></row>
		<row><td>Feature</td><td>Display</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Numeric sort order, used to force a specific display ordering.</td></row>
		<row><td>Feature</td><td>Feature</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular feature record.</td></row>
		<row><td>Feature</td><td>Feature_Parent</td><td>Y</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Optional key of a parent record in the same table. If the parent is not selected, then the record will not be installed. Null indicates a root item.</td></row>
		<row><td>Feature</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Comments</td></row>
		<row><td>Feature</td><td>ISFeatureCabName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Name of CAB used when compressing CABs by Feature. Used to override build generated name for CAB file.</td></row>
		<row><td>Feature</td><td>ISProFeatureName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the feature used by pro projects.  This doesn't have to be unique.</td></row>
		<row><td>Feature</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Release Flags that specify whether this  feature will be built in a particular release.</td></row>
		<row><td>Feature</td><td>Level</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The install level at which record will be initially selected. An install level of 0 will disable an item and prevent its display.</td></row>
		<row><td>Feature</td><td>Title</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Short text identifying a visible feature item.</td></row>
		<row><td>FeatureComponents</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>FeatureComponents</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>File</td><td>Attributes</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Integer containing bit flags representing file attributes (with the decimal value of each bit position in parentheses)</td></row>
		<row><td>File</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the file.</td></row>
		<row><td>File</td><td>File</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token, must match identifier in cabinet.  For uncompressed files, this field is ignored.</td></row>
		<row><td>File</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>File name used for installation.  This may contain a "short name|long name" pair.  It may be just a long name, hence it cannot be of the Filename data type.</td></row>
		<row><td>File</td><td>FileSize</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>File</td><td>ISAttributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>This field contains the following attributes: UseSystemSettings(0x1)</td></row>
		<row><td>File</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>File</td><td>ISComponentSubFolder_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key referencing component subfolder containing this file.  Only for Pro.</td></row>
		<row><td>File</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Language</td><td/><td>List of decimal language Ids, comma-separated if more than one.</td></row>
		<row><td>File</td><td>Sequence</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>Sequence with respect to the media images; order must track cabinet order.</td></row>
		<row><td>File</td><td>Version</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Version</td><td/><td>Version string for versioned files;  Blank for unversioned files.</td></row>
		<row><td>FileSFPCatalog</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>File associated with the catalog</td></row>
		<row><td>FileSFPCatalog</td><td>SFPCatalog_</td><td>N</td><td/><td/><td>SFPCatalog</td><td>1</td><td>Text</td><td/><td>Catalog associated with the file</td></row>
		<row><td>Font</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Primary key, foreign key into File table referencing font file.</td></row>
		<row><td>Font</td><td>FontTitle</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Font name.</td></row>
		<row><td>ISAssistantTag</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISAssistantTag</td><td>Tag</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Color</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Duration</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Effect</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Font</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>ISBillboard</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Origin</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Sequence</td><td>N</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Style</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Target</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Title</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>AppName</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>CompanyName</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>Component_</td><td>Y</td><td/><td/><td>Component</td><td>1</td><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>DefDir</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>DeleteMedia</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>DesktopTargetDir</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>DeviceFile</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>IconIndex</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>IconPath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallNetCF</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallNetCF2</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallSQLClient</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallSQLClient2</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallSQLDev</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallSQLDev2</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallSQLServer</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>InstallSQLServer2</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>NoUninstall</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>PVKFile</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>PostXML</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>PreXML</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>RawDeviceFile</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>SPCFile</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEApp</td><td>SPCPwd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEDir</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEDir</td><td>DirKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEDir</td><td>DirParent</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEDir</td><td>DirValue</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>AdvancedOptions</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>CopyOption</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>Destination</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>FileOption</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>Platform</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>Processor</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFile</td><td>Source</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFileExt</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFileExt</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFileExt</td><td>ExtKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFileExt</td><td>Extension</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFileExt</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEFileExt</td><td>IconIndex</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>CEAppName</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>CECabs</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>CEDesktopDir</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>CEIcoFile</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>CEIniFileKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>CEInstallKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>Component_</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEInstall</td><td>DeleteMedia</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEOtherAppCABs</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEOtherAppCABs</td><td>BuildSourcePath</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEOtherAppCABs</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERedist</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERedist</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERedist</td><td>Platforms</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Key</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Overwrite</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Platform</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Processor</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>RegKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Root</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCERegistry</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCESetupFile</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCESetupFile</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCESetupFile</td><td>Platform</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCESetupFile</td><td>Processor</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCESetupFile</td><td>SetupFileKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCESetupFile</td><td>Source</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>AppKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>Destination</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>DisplayName</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>Platform</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>ShtCutKey</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>StartScreenIcon</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISCEShtCut</td><td>Target</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackage</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Display name for the chained package. Used only in the IDE.</td></row>
		<row><td>ISChainPackage</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackage</td><td>InstallCondition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>InstallProperties</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>Options</td><td>N</td><td/><td/><td/><td/><td>Integer</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>Order</td><td>N</td><td/><td/><td/><td/><td>Integer</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>Package</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>ProductCode</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackage</td><td>RemoveCondition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>RemoveProperties</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>SourcePath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackageData</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The binary icon data in PE (.DLL or .EXE) or icon (.ICO) format.</td></row>
		<row><td>ISChainPackageData</td><td>File</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td/></row>
		<row><td>ISChainPackageData</td><td>FilePath</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>ISChainPackageData</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to the ICO or EXE file.</td></row>
		<row><td>ISChainPackageData</td><td>Options</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackageData</td><td>Package_</td><td>N</td><td/><td/><td>ISChainPackage</td><td>1</td><td>Identifier</td><td/><td/></row>
		<row><td>ISClrWrap</td><td>Action_</td><td>N</td><td/><td/><td>CustomAction</td><td>1</td><td>Identifier</td><td/><td>Foreign key into CustomAction table</td></row>
		<row><td>ISClrWrap</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Property associated with this Action</td></row>
		<row><td>ISClrWrap</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value associated with this Property</td></row>
		<row><td>ISComCatalogAttribute</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComCatalogAttribute</td><td>ItemName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The named attribute for a catalog object.</td></row>
		<row><td>ISComCatalogAttribute</td><td>ItemValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A value associated with the attribute defined in the ItemName column.</td></row>
		<row><td>ISComCatalogCollection</td><td>CollectionName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>A catalog collection name.</td></row>
		<row><td>ISComCatalogCollection</td><td>ISComCatalogCollection</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComCatalogCollection table.</td></row>
		<row><td>ISComCatalogCollection</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComCatalogCollectionObjects</td><td>ISComCatalogCollection_</td><td>N</td><td/><td/><td>ISComCatalogCollection</td><td>1</td><td>Identifier</td><td/><td>A unique key for the ISComCatalogCollection table.</td></row>
		<row><td>ISComCatalogCollectionObjects</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComCatalogObject</td><td>DisplayName</td><td>N</td><td/><td/><td/><td/><td/><td/><td>The display name of a catalog object.</td></row>
		<row><td>ISComCatalogObject</td><td>ISComCatalogObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComCatalogObject table.</td></row>
		<row><td>ISComPlusApplication</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table that a COM+ application belongs to.</td></row>
		<row><td>ISComPlusApplication</td><td>ComputerName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Computer name that a COM+ application belongs to.</td></row>
		<row><td>ISComPlusApplication</td><td>DepFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>List of the dependent files.</td></row>
		<row><td>ISComPlusApplication</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>InstallShield custom attributes associated with a COM+ application.</td></row>
		<row><td>ISComPlusApplication</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>AlterDLL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Alternate filename of the COM+ application component. Will be used for a .NET serviced component.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>CLSID</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>CLSID of the COM+ application component.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>DLL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Filename of the COM+ application component.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ISComPlusApplicationDLL</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComPlusApplicationDLL table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ProgId</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>ProgId of the COM+ application component.</td></row>
		<row><td>ISComPlusProxy</td><td>Component_</td><td>Y</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table that a COM+ application proxy belongs to.</td></row>
		<row><td>ISComPlusProxy</td><td>DepFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>List of the dependent files.</td></row>
		<row><td>ISComPlusProxy</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>InstallShield custom attributes associated with a COM+ application proxy.</td></row>
		<row><td>ISComPlusProxy</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table that a COM+ application proxy belongs to.</td></row>
		<row><td>ISComPlusProxy</td><td>ISComPlusProxy</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComPlusProxy table.</td></row>
		<row><td>ISComPlusProxyDepFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusProxyDepFile</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table.</td></row>
		<row><td>ISComPlusProxyDepFile</td><td>ISPath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of the dependent file.</td></row>
		<row><td>ISComPlusProxyFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusProxyFile</td><td>ISComPlusApplicationDLL_</td><td>N</td><td/><td/><td>ISComPlusApplicationDLL</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplicationDLL table.</td></row>
		<row><td>ISComPlusServerDepFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusServerDepFile</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table.</td></row>
		<row><td>ISComPlusServerDepFile</td><td>ISPath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of the dependent file.</td></row>
		<row><td>ISComPlusServerFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusServerFile</td><td>ISComPlusApplicationDLL_</td><td>N</td><td/><td/><td>ISComPlusApplicationDLL</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplicationDLL table.</td></row>
		<row><td>ISComponentExtended</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Primary key used to identify a particular component record.</td></row>
		<row><td>ISComponentExtended</td><td>FTPLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>FTP Location</td></row>
		<row><td>ISComponentExtended</td><td>FilterProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property to set if you want to filter a component</td></row>
		<row><td>ISComponentExtended</td><td>HTTPLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>HTTP Location</td></row>
		<row><td>ISComponentExtended</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Language</td></row>
		<row><td>ISComponentExtended</td><td>Miscellaneous</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Miscellaneous</td></row>
		<row><td>ISComponentExtended</td><td>OS</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>bitwise addition of OSs</td></row>
		<row><td>ISComponentExtended</td><td>Platforms</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>bitwise addition of Platforms.</td></row>
		<row><td>ISCustomActionReference</td><td>Action_</td><td>N</td><td/><td/><td>CustomAction</td><td>1</td><td>Identifier</td><td/><td>Foreign key into theICustomAction table.</td></row>
		<row><td>ISCustomActionReference</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Contents of the file speciifed in ISCAReferenceFilePath. This column is only used by MSI.</td></row>
		<row><td>ISCustomActionReference</td><td>FileType</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>file type of the file specified  ISCAReferenceFilePath. This column is only used by MSI.</td></row>
		<row><td>ISCustomActionReference</td><td>ISCAReferenceFilePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.  This column only exists in ISM.</td></row>
		<row><td>ISDIMDependency</td><td>ISDIMReference_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISDIMDependency table</td></row>
		<row><td>ISDIMDependency</td><td>RequiredBuildVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the build version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredMajorVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the major version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredMinorVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the minor version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredRevisionVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the revision version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredUUID</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>the UUID identifying the required DIM</td></row>
		<row><td>ISDIMReference</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>ISDIMReference</td><td>ISDIMReference</td><td>N</td><td/><td/><td>ISDIMDependency</td><td>1</td><td>Identifier</td><td/><td>This is the primary key to the ISDIMReference table</td></row>
		<row><td>ISDIMReferenceDependencies</td><td>ISDIMDependency_</td><td>N</td><td/><td/><td>ISDIMDependency</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMDependency table.</td></row>
		<row><td>ISDIMReferenceDependencies</td><td>ISDIMReference_Parent</td><td>N</td><td/><td/><td>ISDIMReference</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMReference table.</td></row>
		<row><td>ISDIMVariable</td><td>ISDIMReference_</td><td>N</td><td/><td/><td>ISDIMReference</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMReference table.</td></row>
		<row><td>ISDIMVariable</td><td>ISDIMVariable</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISDIMVariable table</td></row>
		<row><td>ISDIMVariable</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of a variable defined in the .dim file</td></row>
		<row><td>ISDIMVariable</td><td>NewValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>New value that you want to override with</td></row>
		<row><td>ISDIMVariable</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Type of the variable. 0: Build Variable, 1: Runtime Variable</td></row>
		<row><td>ISDLLWrapper</td><td>EntryPoint</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is a foreign key to the target column in the CustomAction table</td></row>
		<row><td>ISDLLWrapper</td><td>Source</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This is column points to the source file for the DLLWrapper Custom Action</td></row>
		<row><td>ISDLLWrapper</td><td>Target</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The function signature</td></row>
		<row><td>ISDLLWrapper</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Type</td></row>
		<row><td>ISDRMFile</td><td>File_</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into File table.  A null value will cause a build warning.</td></row>
		<row><td>ISDRMFile</td><td>ISDRMFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for this item.</td></row>
		<row><td>ISDRMFile</td><td>ISDRMLicense_</td><td>Y</td><td/><td/><td>ISDRMLicense</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing License that packages this file.</td></row>
		<row><td>ISDRMFile</td><td>Shell</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text indicating the activation shell used at runtime.</td></row>
		<row><td>ISDRMFileAttribute</td><td>ISDRMFile_</td><td>N</td><td/><td/><td>ISDRMFile</td><td>1</td><td>Identifier</td><td/><td>Primary foreign key into ISDRMFile table.</td></row>
		<row><td>ISDRMFileAttribute</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the attribute</td></row>
		<row><td>ISDRMFileAttribute</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The value of the attribute</td></row>
		<row><td>ISDRMLicense</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Bitwise field used to specify binary attributes of this license.</td></row>
		<row><td>ISDRMLicense</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>An internal description of this license.</td></row>
		<row><td>ISDRMLicense</td><td>ISDRMLicense</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique key identifying the license record.</td></row>
		<row><td>ISDRMLicense</td><td>LicenseNumber</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The license number.</td></row>
		<row><td>ISDRMLicense</td><td>ProjectVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The version of the project that this license is tied to.</td></row>
		<row><td>ISDRMLicense</td><td>RequestCode</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The request code.</td></row>
		<row><td>ISDRMLicense</td><td>ResponseCode</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The response code.</td></row>
		<row><td>ISDependency</td><td>Exclude</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISDependency</td><td>ISDependency</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISDisk1File</td><td>Disk</td><td>Y</td><td/><td/><td/><td/><td/><td>-1;0;1</td><td>Used to differentiate between disk1(1), last disk(-1), and other(0).</td></row>
		<row><td>ISDisk1File</td><td>ISBuildSourcePath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of file to be copied to Disk1 folder</td></row>
		<row><td>ISDisk1File</td><td>ISDisk1File</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key for ISDisk1File table</td></row>
		<row><td>ISDynamicFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the file.</td></row>
		<row><td>ISDynamicFile</td><td>ExcludeFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Wildcards for excluded files.</td></row>
		<row><td>ISDynamicFile</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15</td><td>This is used to store Installshield custom properties of a dynamic filet.  Currently the only one is SelfRegister.</td></row>
		<row><td>ISDynamicFile</td><td>IncludeFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Wildcards for included files.</td></row>
		<row><td>ISDynamicFile</td><td>IncludeFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Include flags.</td></row>
		<row><td>ISDynamicFile</td><td>SourceFolder</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>ISFeatureDIMReferences</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureDIMReferences</td><td>ISDIMReference_</td><td>N</td><td/><td/><td>ISDIMReference</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMReference table.</td></row>
		<row><td>ISFeatureMergeModuleExcludes</td><td>Feature_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureMergeModuleExcludes</td><td>Language</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureMergeModuleExcludes</td><td>ModuleID</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureMergeModules</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureMergeModules</td><td>ISMergeModule_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>1</td><td>Text</td><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureMergeModules</td><td>Language_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>2</td><td/><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureSetupPrerequisites</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureSetupPrerequisites</td><td>ISSetupPrerequisites_</td><td>N</td><td/><td/><td>ISSetupPrerequisites</td><td>1</td><td/><td/><td/></row>
		<row><td>ISFileManifests</td><td>File_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into File table.</td></row>
		<row><td>ISFileManifests</td><td>Manifest_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into File table.</td></row>
		<row><td>ISIISItem</td><td>Component_</td><td>Y</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key to Component table.</td></row>
		<row><td>ISIISItem</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localizable Item Name.</td></row>
		<row><td>ISIISItem</td><td>ISIISItem</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key for each item.</td></row>
		<row><td>ISIISItem</td><td>ISIISItem_Parent</td><td>Y</td><td/><td/><td>ISIISItem</td><td>1</td><td>Identifier</td><td/><td>This record's parent record.</td></row>
		<row><td>ISIISItem</td><td>Type</td><td>N</td><td/><td/><td/><td/><td/><td/><td>IIS resource type.</td></row>
		<row><td>ISIISProperty</td><td>FriendlyName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>IIS property name.</td></row>
		<row><td>ISIISProperty</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Flags.</td></row>
		<row><td>ISIISProperty</td><td>ISIISItem_</td><td>N</td><td/><td/><td>ISIISItem</td><td>1</td><td>Identifier</td><td/><td>Primary key for table, foreign key into ISIISItem.</td></row>
		<row><td>ISIISProperty</td><td>ISIISProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key for table.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property attributes.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataProp</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property ID.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataType</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property data type.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataUserType</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property user data type.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>IIS property value.</td></row>
		<row><td>ISIISProperty</td><td>Order</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Order sequencing.</td></row>
		<row><td>ISIISProperty</td><td>Schema</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>IIS7 schema information.</td></row>
		<row><td>ISInstallScriptAction</td><td>EntryPoint</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is a foreign key to the target column in the CustomAction table</td></row>
		<row><td>ISInstallScriptAction</td><td>Source</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This is column points to the source file for the DLLWrapper Custom Action</td></row>
		<row><td>ISInstallScriptAction</td><td>Target</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The function signature</td></row>
		<row><td>ISInstallScriptAction</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Type</td></row>
		<row><td>ISLanguage</td><td>ISLanguage</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is the language ID.</td></row>
		<row><td>ISLanguage</td><td>Included</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1</td><td>Specify whether this language should be included.</td></row>
		<row><td>ISLinkerLibrary</td><td>ISLinkerLibrary</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for the link library.</td></row>
		<row><td>ISLinkerLibrary</td><td>Library</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of the object library (.obl file).</td></row>
		<row><td>ISLinkerLibrary</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Order of the Library</td></row>
		<row><td>ISLocalControl</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this control.</td></row>
		<row><td>ISLocalControl</td><td>Binary_</td><td>Y</td><td/><td/><td>Binary</td><td>1</td><td>Identifier</td><td/><td>External key to the Binary table.</td></row>
		<row><td>ISLocalControl</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Name of the control. This name must be unique within a dialog, but can repeat on different dialogs.</td></row>
		<row><td>ISLocalControl</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>External key to the Dialog table, name of the dialog.</td></row>
		<row><td>ISLocalControl</td><td>Height</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Height of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalControl</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to .rtf file for scrollable text control</td></row>
		<row><td>ISLocalControl</td><td>ISLanguage_</td><td>N</td><td/><td/><td>ISLanguage</td><td>1</td><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISLocalControl</td><td>Width</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Width of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalControl</td><td>X</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Horizontal coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalControl</td><td>Y</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Vertical coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalDialog</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this dialog.</td></row>
		<row><td>ISLocalDialog</td><td>Dialog_</td><td>Y</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>Name of the dialog.</td></row>
		<row><td>ISLocalDialog</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the dialog.</td></row>
		<row><td>ISLocalDialog</td><td>ISLanguage_</td><td>Y</td><td/><td/><td>ISLanguage</td><td>1</td><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISLocalDialog</td><td>TextStyle_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign Key into TextStyle table, only used in Script Based Projects.</td></row>
		<row><td>ISLocalDialog</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the dialog.</td></row>
		<row><td>ISLocalRadioButton</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The height of the button.</td></row>
		<row><td>ISLocalRadioButton</td><td>ISLanguage_</td><td>N</td><td/><td/><td>ISLanguage</td><td>1</td><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISLocalRadioButton</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td>RadioButton</td><td>2</td><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>ISLocalRadioButton</td><td>Property</td><td>N</td><td/><td/><td>RadioButton</td><td>1</td><td>Identifier</td><td/><td>A named property to be tied to this radio button. All the buttons tied to the same property become part of the same group.</td></row>
		<row><td>ISLocalRadioButton</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The width of the button.</td></row>
		<row><td>ISLocalRadioButton</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The horizontal coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>ISLocalRadioButton</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The vertical coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>ISLockPermissions</td><td>Attributes</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Permissions attributes mask, 1==Deny access; 2==No inherit</td></row>
		<row><td>ISLockPermissions</td><td>Domain</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Domain name for user whose permissions are being set.</td></row>
		<row><td>ISLockPermissions</td><td>LockObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into CreateFolder, Registry, or File table</td></row>
		<row><td>ISLockPermissions</td><td>Permission</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Permission Access mask.</td></row>
		<row><td>ISLockPermissions</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td>CreateFolder;File;Registry</td><td>Reference to another table name</td></row>
		<row><td>ISLockPermissions</td><td>User</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>User for permissions to be set. This can be a property, hardcoded named, or SID string</td></row>
		<row><td>ISLogicalDisk</td><td>Cabinet</td><td>Y</td><td/><td/><td/><td/><td>Cabinet</td><td/><td>If some or all of the files stored on the media are compressed in a cabinet, the name of that cabinet.</td></row>
		<row><td>ISLogicalDisk</td><td>DiskId</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>Primary key, integer to determine sort order for table.</td></row>
		<row><td>ISLogicalDisk</td><td>DiskPrompt</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Disk name: the visible text actually printed on the disk.  This will be used to prompt the user when this disk needs to be inserted.</td></row>
		<row><td>ISLogicalDisk</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISLogicalDisk</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISRelease table.</td></row>
		<row><td>ISLogicalDisk</td><td>LastSequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>File sequence number for the last file for this media.</td></row>
		<row><td>ISLogicalDisk</td><td>Source</td><td>Y</td><td/><td/><td/><td/><td>Property</td><td/><td>The property defining the location of the cabinet file.</td></row>
		<row><td>ISLogicalDisk</td><td>VolumeLabel</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The label attributed to the volume.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>Feature_</td><td>Y</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table,</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties, like Compressed, etc.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISLogicalDisk_</td><td>N</td><td>1</td><td>32767</td><td>ISLogicalDisk</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISLogicalDisk table.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISRelease table.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>Sequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>File sequence number for the file for this media.</td></row>
		<row><td>ISMergeModule</td><td>Destination</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Destination.</td></row>
		<row><td>ISMergeModule</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a merge module.</td></row>
		<row><td>ISMergeModule</td><td>ISMergeModule</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The GUID identifying the merge module.</td></row>
		<row><td>ISMergeModule</td><td>Language</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Default decimal language of module.</td></row>
		<row><td>ISMergeModule</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the merge module.</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Attributes (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>ContextData</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>ContextData  (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>DefaultValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>DefaultValue  (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>DisplayName (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Format</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Format (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>HelpKeyword</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>HelpKeyword (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>HelpLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>HelpLocation (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>ISMergeModule_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>1</td><td>Text</td><td/><td>The module signature, a foreign key into the ISMergeModule table</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Language_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>2</td><td/><td/><td>Default decimal language of module.</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>ModuleConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Identifier, foreign key into ModuleConfiguration table (ModuleConfiguration.Name)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Type (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value for this item.</td></row>
		<row><td>ISObject</td><td>Language</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISObject</td><td>ObjectName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISObjectProperty</td><td>IncludeInBuild</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Boolean, 0 for false non 0 for true</td></row>
		<row><td>ISObjectProperty</td><td>ObjectName</td><td>Y</td><td/><td/><td>ISObject</td><td>1</td><td>Text</td><td/><td/></row>
		<row><td>ISObjectProperty</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISObjectProperty</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISPalmApp</td><td>Component</td><td>N</td><td/><td/><td>Component</td><td>1</td><td/><td/><td/></row>
		<row><td>ISPalmApp</td><td>PalmApp</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISPalmAppFile</td><td>Destination</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISPalmAppFile</td><td>FileKey</td><td>N</td><td/><td/><td>File</td><td>1</td><td/><td/><td/></row>
		<row><td>ISPalmAppFile</td><td>PalmApp</td><td>N</td><td/><td/><td>ISPalmApp</td><td>1</td><td/><td/><td/></row>
		<row><td>ISPatchConfigImage</td><td>PatchConfiguration_</td><td>Y</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key to the ISPatchConfigurationTable</td></row>
		<row><td>ISPatchConfigImage</td><td>UpgradedImage_</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>Foreign key to the ISUpgradedImageTable</td></row>
		<row><td>ISPatchConfiguration</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>PatchConfiguration attributes</td></row>
		<row><td>ISPatchConfiguration</td><td>CanPCDiffer</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether Product Codes may differ</td></row>
		<row><td>ISPatchConfiguration</td><td>CanPVDiffer</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether the Major Product Version may differ</td></row>
		<row><td>ISPatchConfiguration</td><td>EnablePatchCache</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to Enable Patch cacheing</td></row>
		<row><td>ISPatchConfiguration</td><td>Flags</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Patching API Flags</td></row>
		<row><td>ISPatchConfiguration</td><td>IncludeWholeFiles</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to build a binary level patch</td></row>
		<row><td>ISPatchConfiguration</td><td>LeaveDecompressed</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to leave intermediate files devcompressed when finished</td></row>
		<row><td>ISPatchConfiguration</td><td>MinMsiVersion</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Minimum Required MSI Version</td></row>
		<row><td>ISPatchConfiguration</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the Patch Configuration</td></row>
		<row><td>ISPatchConfiguration</td><td>OptimizeForSize</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to Optimize for large files</td></row>
		<row><td>ISPatchConfiguration</td><td>OutputPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Build Location</td></row>
		<row><td>ISPatchConfiguration</td><td>PatchCacheDir</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Directory to recieve the Patch Cache information</td></row>
		<row><td>ISPatchConfiguration</td><td>PatchGuid</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Unique Patch Identifier</td></row>
		<row><td>ISPatchConfiguration</td><td>PatchGuidsToReplace</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>List Of Patch Guids to unregister</td></row>
		<row><td>ISPatchConfiguration</td><td>TargetProductCodes</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>List Of target Product Codes</td></row>
		<row><td>ISPatchConfigurationProperty</td><td>ISPatchConfiguration_</td><td>Y</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Name of the Patch Configuration</td></row>
		<row><td>ISPatchConfigurationProperty</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the Patch Configuration Property value</td></row>
		<row><td>ISPatchConfigurationProperty</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value of the Patch Configuration Property</td></row>
		<row><td>ISPatchExternalFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Filekey</td></row>
		<row><td>ISPatchExternalFile</td><td>FilePath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Filepath</td></row>
		<row><td>ISPatchExternalFile</td><td>ISUpgradedImage_</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>Foreign key to the isupgraded image table</td></row>
		<row><td>ISPatchExternalFile</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Uniqu name to identify this record.</td></row>
		<row><td>ISPatchWholeFile</td><td>Component</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Component containing file key</td></row>
		<row><td>ISPatchWholeFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Key of file to be included as whole</td></row>
		<row><td>ISPatchWholeFile</td><td>UpgradedImage</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>Foreign key to ISUpgradedImage Table</td></row>
		<row><td>ISPathVariable</td><td>ISPathVariable</td><td>N</td><td/><td/><td/><td/><td/><td/><td>The name of the path variable.</td></row>
		<row><td>ISPathVariable</td><td>TestValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The test value of the path variable.</td></row>
		<row><td>ISPathVariable</td><td>Type</td><td>N</td><td/><td/><td/><td/><td/><td>1;2;4;8</td><td>The type of the path variable.</td></row>
		<row><td>ISPathVariable</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The value of the path variable.</td></row>
		<row><td>ISProductConfiguration</td><td>GeneratePackageCode</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td>0;1</td><td>Indicates whether or not to generate a package code.</td></row>
		<row><td>ISProductConfiguration</td><td>ISProductConfiguration</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the product configuration.</td></row>
		<row><td>ISProductConfiguration</td><td>ProductConfigurationFlags</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Product configuration (release) flags.</td></row>
		<row><td>ISProductConfigurationInstance</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISProductConfigurationInstance</td><td>InstanceId</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Identifies the instance number of this instance. This value is stored in the Property InstanceId.</td></row>
		<row><td>ISProductConfigurationInstance</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Product Congiuration property name</td></row>
		<row><td>ISProductConfigurationInstance</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property.</td></row>
		<row><td>ISProductConfigurationProperty</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISProductConfigurationProperty</td><td>Property</td><td>N</td><td/><td/><td>Property</td><td>1</td><td>Text</td><td/><td>Product Congiuration property name</td></row>
		<row><td>ISProductConfigurationProperty</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property. Never null or empty.</td></row>
		<row><td>ISRelease</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding boolean values for various release attributes.</td></row>
		<row><td>ISRelease</td><td>BuildLocation</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Build location.</td></row>
		<row><td>ISRelease</td><td>CDBrowser</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Demoshield browser location.</td></row>
		<row><td>ISRelease</td><td>DefaultLanguage</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Default language for setup.</td></row>
		<row><td>ISRelease</td><td>DigitalPVK</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital signing private key (.pvk) file.</td></row>
		<row><td>ISRelease</td><td>DigitalSPC</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital signing Software Publisher Certificate (.spc) file.</td></row>
		<row><td>ISRelease</td><td>DigitalURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital signing URL.</td></row>
		<row><td>ISRelease</td><td>DiskClusterSize</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Disk cluster size.</td></row>
		<row><td>ISRelease</td><td>DiskSize</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Disk size.</td></row>
		<row><td>ISRelease</td><td>DiskSizeUnit</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;2</td><td>Disk size units (KB or MB).</td></row>
		<row><td>ISRelease</td><td>DiskSpanning</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;2</td><td>Disk spanning (automatic, enforce size, etc.).</td></row>
		<row><td>ISRelease</td><td>DotNetBuildConfiguration</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Build Configuration for .NET solutions.</td></row>
		<row><td>ISRelease</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISRelease</td><td>ISRelease</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the release.</td></row>
		<row><td>ISRelease</td><td>ISSetupPrerequisiteLocation</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2;3</td><td>Location the Setup Prerequisites will be placed in</td></row>
		<row><td>ISRelease</td><td>MediaLocation</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Media location on disk.</td></row>
		<row><td>ISRelease</td><td>MsiCommandLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command line passed to the msi package from setup.exe</td></row>
		<row><td>ISRelease</td><td>MsiSourceType</td><td>N</td><td>-1</td><td>4</td><td/><td/><td/><td/><td>MSI media source type.</td></row>
		<row><td>ISRelease</td><td>PackageName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Package name.</td></row>
		<row><td>ISRelease</td><td>Password</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Password.</td></row>
		<row><td>ISRelease</td><td>Platforms</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Platforms supported (Intel, Alpha, etc.).</td></row>
		<row><td>ISRelease</td><td>ReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Release flags.</td></row>
		<row><td>ISRelease</td><td>ReleaseType</td><td>N</td><td/><td/><td/><td/><td/><td>1;2;4</td><td>Release type (single, uncompressed, etc.).</td></row>
		<row><td>ISRelease</td><td>SupportedLanguagesData</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Languages supported (for component filtering).</td></row>
		<row><td>ISRelease</td><td>SupportedLanguagesUI</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>UI languages supported.</td></row>
		<row><td>ISRelease</td><td>SupportedOSs</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Indicate which operating systmes are supported.</td></row>
		<row><td>ISRelease</td><td>SynchMsi</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>MSI file to synchronize file keys and other data with (patch-like functionality).</td></row>
		<row><td>ISRelease</td><td>Type</td><td>N</td><td>0</td><td>6</td><td/><td/><td/><td/><td>Release type (CDROM, Network, etc.).</td></row>
		<row><td>ISRelease</td><td>URLLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Media location via URL.</td></row>
		<row><td>ISRelease</td><td>VersionCopyright</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Version stamp information.</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISRelease table.</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>AS Repository property name</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>AS Repository property value</td></row>
		<row><td>ISReleaseExtended</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding boolean values for various release attributes.</td></row>
		<row><td>ISReleaseExtended</td><td>CertPassword</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital certificate password</td></row>
		<row><td>ISReleaseExtended</td><td>DigitalCertificateDBaseNS</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to cerificate database for Netscape digital  signature</td></row>
		<row><td>ISReleaseExtended</td><td>DigitalCertificateIdNS</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to cerificate ID for Netscape digital  signature</td></row>
		<row><td>ISReleaseExtended</td><td>DigitalCertificatePasswordNS</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Password for Netscape digital  signature</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetBaseLanguage</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Base Languge of .NET Redist</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetFxCmdLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command Line to pass to DotNetFx.exe</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetLangPackCmdLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command Line to pass to LangPack.exe</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetLangaugePacks</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>.NET Redist language packs to include</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetRedistLocation</td><td>Y</td><td>0</td><td>3</td><td/><td/><td/><td/><td>Location of .NET framework Redist (Web, SetupExe, Source, None)</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetRedistURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to .NET framework Redist</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetVersion</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Version of .NET framework Redist (1.0, 1.1)</td></row>
		<row><td>ISReleaseExtended</td><td>EngineLocation</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Location of msi engine (Web, SetupExe...)</td></row>
		<row><td>ISReleaseExtended</td><td>ISEngineLocation</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Location of ISScript  engine (Web, SetupExe...)</td></row>
		<row><td>ISReleaseExtended</td><td>ISEngineURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to InstallShield scripting engine</td></row>
		<row><td>ISReleaseExtended</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISReleaseExtended</td><td>ISRelease_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the release.</td></row>
		<row><td>ISReleaseExtended</td><td>JSharpCmdLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command Line to pass to vjredist.exe</td></row>
		<row><td>ISReleaseExtended</td><td>JSharpRedistLocation</td><td>Y</td><td>0</td><td>3</td><td/><td/><td/><td/><td>Location of J# framework Redist (Web, SetupExe, Source, None)</td></row>
		<row><td>ISReleaseExtended</td><td>MsiEngineVersion</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding selected MSI engine versions included in this release</td></row>
		<row><td>ISReleaseExtended</td><td>OneClickCabName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>File name of generated cabfile</td></row>
		<row><td>ISReleaseExtended</td><td>OneClickHtmlName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>File name of generated html page</td></row>
		<row><td>ISReleaseExtended</td><td>OneClickTargetBrowser</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Target browser (IE, Netscape, both...)</td></row>
		<row><td>ISReleaseExtended</td><td>WebCabSize</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Size of the cabfile</td></row>
		<row><td>ISReleaseExtended</td><td>WebLocalCachePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Directory to cache downloaded package</td></row>
		<row><td>ISReleaseExtended</td><td>WebType</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Type of web install (One Executable, Downloader...)</td></row>
		<row><td>ISReleaseExtended</td><td>WebURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to .msi package</td></row>
		<row><td>ISReleaseExtended</td><td>Win9xMsiUrl</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to Ansi MSI engine</td></row>
		<row><td>ISReleaseExtended</td><td>WinMsi30Url</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to MSI 3.0 engine</td></row>
		<row><td>ISReleaseExtended</td><td>WinNTMsiUrl</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to Unicode MSI engine</td></row>
		<row><td>ISReleaseProperty</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISProductConfiguration table.</td></row>
		<row><td>ISReleaseProperty</td><td>ISRelease_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISRelease table.</td></row>
		<row><td>ISReleaseProperty</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property name</td></row>
		<row><td>ISReleaseProperty</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISReleasePublishInfo</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository item description</td></row>
		<row><td>ISReleasePublishInfo</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository item display name</td></row>
		<row><td>ISReleasePublishInfo</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding various attributes</td></row>
		<row><td>ISReleasePublishInfo</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISReleasePublishInfo</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>The name of the release.</td></row>
		<row><td>ISReleasePublishInfo</td><td>Publisher</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository item publisher</td></row>
		<row><td>ISReleasePublishInfo</td><td>Repository</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository which to  publish the built merge module</td></row>
		<row><td>ISSQLConnection</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Authentication</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>BatchSeparator</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>CmdTimeout</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Comments</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Database</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>ISSQLConnection</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLConnection record.</td></row>
		<row><td>ISSQLConnection</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Password</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>ScriptVersion_Column</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>ScriptVersion_Table</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Server</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>UserName</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnectionDBServer</td><td>ISSQLConnectionDBServer</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLConnectionDBServer record.</td></row>
		<row><td>ISSQLConnectionDBServer</td><td>ISSQLConnection_</td><td>N</td><td/><td/><td>ISSQLConnection</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnection table.</td></row>
		<row><td>ISSQLConnectionDBServer</td><td>ISSQLDBMetaData_</td><td>N</td><td/><td/><td>ISSQLDBMetaData</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLDBMetaData table.</td></row>
		<row><td>ISSQLConnectionDBServer</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnectionScript</td><td>ISSQLConnection_</td><td>N</td><td/><td/><td>ISSQLConnection</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnection table.</td></row>
		<row><td>ISSQLConnectionScript</td><td>ISSQLScriptFile_</td><td>N</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table.</td></row>
		<row><td>ISSQLConnectionScript</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnAdditional</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnDatabase</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnDriver</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnNetLibrary</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnPassword</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnPort</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnServer</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnUserID</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnWindowsSecurity</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoDriverName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>CreateDbCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>CreateTableCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>DsnODBCName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ISSQLDBMetaData</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLDBMetaData record.</td></row>
		<row><td>ISSQLDBMetaData</td><td>InsertRecordCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>LocalInstanceNames</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>QueryDatabasesCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ScriptVersion_Column</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ScriptVersion_ColumnType</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ScriptVersion_Table</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>SelectTableCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>SwitchDbCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>TestDatabaseCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>TestTableCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>TestTableCmd2</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>VersionBeginToken</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>VersionEndToken</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>VersionInfoCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>WinAuthentUserId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLRequirement</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLRequirement</td><td>ISSQLConnectionDBServer_</td><td>Y</td><td/><td/><td>ISSQLConnectionDBServer</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnectionDBServer table.</td></row>
		<row><td>ISSQLRequirement</td><td>ISSQLConnection_</td><td>N</td><td/><td/><td>ISSQLConnection</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnection table.</td></row>
		<row><td>ISSQLRequirement</td><td>ISSQLRequirement</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLRequirement record.</td></row>
		<row><td>ISSQLRequirement</td><td>MajorVersion</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLRequirement</td><td>ServicePackLevel</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>ErrHandling</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>ErrNumber</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>ISSQLScriptFile_</td><td>Y</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table</td></row>
		<row><td>ISSQLScriptError</td><td>Message</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Custom end-user message. Reserved for future use.</td></row>
		<row><td>ISSQLScriptFile</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptFile</td><td>Comments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Comments</td></row>
		<row><td>ISSQLScriptFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the SQL script.</td></row>
		<row><td>ISSQLScriptFile</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>A conditional statement that will disable this script if the specified condition evaluates to the 'False' state. If a script is disabled, it will not be installed regardless of the 'Action' state associated with the component.</td></row>
		<row><td>ISSQLScriptFile</td><td>ErrorHandling</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptFile</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>ISSQLScriptFile</td><td>ISSQLScriptFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISSQLScriptFile table</td></row>
		<row><td>ISSQLScriptFile</td><td>InstallText</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Feedback end-user text at install</td></row>
		<row><td>ISSQLScriptFile</td><td>Scheduling</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptFile</td><td>UninstallText</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Feedback end-user text at Uninstall</td></row>
		<row><td>ISSQLScriptFile</td><td>Version</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Schema Version (####.#####.####)</td></row>
		<row><td>ISSQLScriptImport</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Authentication</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Database</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>ExcludeTables</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>ISSQLScriptFile_</td><td>N</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table.</td></row>
		<row><td>ISSQLScriptImport</td><td>IncludeTables</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Password</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Server</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>UserName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptReplace</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptReplace</td><td>ISSQLScriptFile_</td><td>N</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table.</td></row>
		<row><td>ISSQLScriptReplace</td><td>ISSQLScriptReplace</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLScriptReplace record.</td></row>
		<row><td>ISSQLScriptReplace</td><td>Replace</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptReplace</td><td>Search</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISScriptFile</td><td>ISScriptFile</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is the full path of the script file. The path portion may be expressed in path variable form.</td></row>
		<row><td>ISSelfReg</td><td>CmdLine</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSelfReg</td><td>Cost</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSelfReg</td><td>FileKey</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key to the file table</td></row>
		<row><td>ISSelfReg</td><td>Order</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupFile</td><td>FileName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>This is the file name to use when streaming the file to the support files location</td></row>
		<row><td>ISSetupFile</td><td>ISSetupFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISSetupFile table</td></row>
		<row><td>ISSetupFile</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Four digit language identifier.  0 for Language Neutral</td></row>
		<row><td>ISSetupFile</td><td>Path</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Link to the source file on the build machine</td></row>
		<row><td>ISSetupFile</td><td>Splash</td><td>Y</td><td/><td/><td/><td/><td>Short</td><td/><td>Boolean value indication whether his setup file entry belongs in the Splasc Screen section</td></row>
		<row><td>ISSetupFile</td><td>Stream</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The bits to stream to the support location</td></row>
		<row><td>ISSetupPrerequisites</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupPrerequisites</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Release Flags that specify whether this prereq  will be included in a particular release.</td></row>
		<row><td>ISSetupPrerequisites</td><td>ISSetupLocation</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2</td><td/></row>
		<row><td>ISSetupPrerequisites</td><td>ISSetupPrerequisites</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupPrerequisites</td><td>Order</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupType</td><td>Comments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>User Comments.</td></row>
		<row><td>ISSetupType</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Longer descriptive text describing a visible feature item.</td></row>
		<row><td>ISSetupType</td><td>Display</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Numeric sort order, used to force a specific display ordering.</td></row>
		<row><td>ISSetupType</td><td>Display_Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A string used to set the initial text contained within a control (if appropriate).</td></row>
		<row><td>ISSetupType</td><td>ISSetupType</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular feature record.</td></row>
		<row><td>ISSetupTypeFeatures</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISSetupTypeFeatures</td><td>ISSetupType_</td><td>N</td><td/><td/><td>ISSetupType</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSetupType table.</td></row>
		<row><td>ISStorages</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Path to the file to stream into sub-storage</td></row>
		<row><td>ISStorages</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Name of the sub-storage key</td></row>
		<row><td>ISString</td><td>Comment</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Comment</td></row>
		<row><td>ISString</td><td>Encoded</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Encoding for multi-byte strings.</td></row>
		<row><td>ISString</td><td>ISLanguage_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISString</td><td>ISString</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>String id.</td></row>
		<row><td>ISString</td><td>TimeStamp</td><td>Y</td><td/><td/><td/><td/><td>Time/Date</td><td/><td>Time Stamp. MSI's Time/Date column type is just an int, with bits packed in a certain order.</td></row>
		<row><td>ISString</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>real string value.</td></row>
		<row><td>ISTargetImage</td><td>Flags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>relative order of the target image</td></row>
		<row><td>ISTargetImage</td><td>IgnoreMissingFiles</td><td>N</td><td/><td/><td/><td/><td/><td/><td>If true, ignore missing source files when creating patch</td></row>
		<row><td>ISTargetImage</td><td>MsiPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to the target image</td></row>
		<row><td>ISTargetImage</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the TargetImage</td></row>
		<row><td>ISTargetImage</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td>relative order of the target image</td></row>
		<row><td>ISTargetImage</td><td>UpgradedImage_</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>foreign key to the upgraded Image table</td></row>
		<row><td>ISUpgradeMsiItem</td><td>ISAttributes</td><td>N</td><td/><td/><td/><td/><td/><td>0;1</td><td/></row>
		<row><td>ISUpgradeMsiItem</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISUpgradeMsiItem</td><td>ObjectSetupPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The path to the setup you want to upgrade.</td></row>
		<row><td>ISUpgradeMsiItem</td><td>UpgradeItem</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the Upgrade Item.</td></row>
		<row><td>ISUpgradedImage</td><td>Family</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the image family</td></row>
		<row><td>ISUpgradedImage</td><td>MsiPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to the upgraded image</td></row>
		<row><td>ISUpgradedImage</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the UpgradedImage</td></row>
		<row><td>ISVirtualDirectory</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Directory table.</td></row>
		<row><td>ISVirtualDirectory</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualDirectory</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into File  table.</td></row>
		<row><td>ISVirtualFile</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualFile</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualPackage</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualPackage</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualRegistry</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualRegistry</td><td>Registry_</td><td>N</td><td/><td/><td>Registry</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Registry table.</td></row>
		<row><td>ISVirtualRegistry</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualRelease</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISProductConfiguration table.</td></row>
		<row><td>ISVirtualRelease</td><td>ISRelease_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISRelease table.</td></row>
		<row><td>ISVirtualRelease</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property name</td></row>
		<row><td>ISVirtualRelease</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualShortcut</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualShortcut</td><td>Shortcut_</td><td>N</td><td/><td/><td>Shortcut</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Shortcut table.</td></row>
		<row><td>ISVirtualShortcut</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISXmlElement</td><td>Content</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Element contents</td></row>
		<row><td>ISXmlElement</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Internal XML element attributes</td></row>
		<row><td>ISXmlElement</td><td>ISXmlElement</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized, internal token for Xml element</td></row>
		<row><td>ISXmlElement</td><td>ISXmlElement_Parent</td><td>Y</td><td/><td/><td>ISXmlElement</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISXMLElement table.</td></row>
		<row><td>ISXmlElement</td><td>ISXmlFile_</td><td>N</td><td/><td/><td>ISXmlFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into XmlFile table.</td></row>
		<row><td>ISXmlElement</td><td>XPath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>XPath fragment including any operators</td></row>
		<row><td>ISXmlElementAttrib</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Internal XML elementattib attributes</td></row>
		<row><td>ISXmlElementAttrib</td><td>ISXmlElementAttrib</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized, internal token for Xml element attribute</td></row>
		<row><td>ISXmlElementAttrib</td><td>ISXmlElement_</td><td>N</td><td/><td/><td>ISXmlElement</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISXMLElement table.</td></row>
		<row><td>ISXmlElementAttrib</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized attribute name</td></row>
		<row><td>ISXmlElementAttrib</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized attribute value</td></row>
		<row><td>ISXmlFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>ISXmlFile</td><td>Directory</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Directory table.</td></row>
		<row><td>ISXmlFile</td><td>Encoding</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>XML File Encoding</td></row>
		<row><td>ISXmlFile</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized XML file name</td></row>
		<row><td>ISXmlFile</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Internal XML file attributes</td></row>
		<row><td>ISXmlFile</td><td>ISXmlFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized,internal token for Xml file</td></row>
		<row><td>ISXmlFile</td><td>SelectionNamespaces</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Selection namespaces</td></row>
		<row><td>ISXmlLocator</td><td>Attribute</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>The name of an attribute within the XML element.</td></row>
		<row><td>ISXmlLocator</td><td>Element</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>XPath query that will locate an element in an XML file.</td></row>
		<row><td>ISXmlLocator</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2</td><td/></row>
		<row><td>ISXmlLocator</td><td>Parent</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The parent file signature. It is also a foreign key in the Signature table.</td></row>
		<row><td>ISXmlLocator</td><td>Signature_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature,  RegLocator, IniLocator, ISXmlLocator, CompLocator and the DrLocator tables.</td></row>
		<row><td>Icon</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The binary icon data in PE (.DLL or .EXE) or icon (.ICO) format.</td></row>
		<row><td>Icon</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to the ICO or EXE file.</td></row>
		<row><td>Icon</td><td>ISIconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>Optional icon index to be extracted.</td></row>
		<row><td>Icon</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key. Name of the icon file.</td></row>
		<row><td>IniFile</td><td>Action</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;3</td><td>The type of modification to be made, one of iifEnum</td></row>
		<row><td>IniFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the installing of the .INI value.</td></row>
		<row><td>IniFile</td><td>DirProperty</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into the Directory table denoting the directory where the .INI file is.</td></row>
		<row><td>IniFile</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The .INI file name in which to write the information</td></row>
		<row><td>IniFile</td><td>IniFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>IniFile</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file key below Section.</td></row>
		<row><td>IniFile</td><td>Section</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file Section.</td></row>
		<row><td>IniFile</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value to be written.</td></row>
		<row><td>IniLocator</td><td>Field</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The field in the .INI line. If Field is null or 0 the entire line is read.</td></row>
		<row><td>IniLocator</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The .INI file name.</td></row>
		<row><td>IniLocator</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Key value (followed by an equals sign in INI file).</td></row>
		<row><td>IniLocator</td><td>Section</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Section name within in file (within square brackets in INI file).</td></row>
		<row><td>IniLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The table key. The Signature_ represents a unique file signature and is also the foreign key in the Signature table.</td></row>
		<row><td>IniLocator</td><td>Type</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>An integer value that determines if the .INI value read is a filename or a directory location or to be used as is w/o interpretation.</td></row>
		<row><td>InstallExecuteSequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>InstallExecuteSequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>InstallExecuteSequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>InstallExecuteSequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>InstallExecuteSequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>InstallShield</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of property, uppercase if settable by launcher or loader.</td></row>
		<row><td>InstallShield</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property.</td></row>
		<row><td>InstallUISequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>InstallUISequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>InstallUISequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>InstallUISequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>InstallUISequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>IsolatedComponent</td><td>Component_Application</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Key to Component table item for application</td></row>
		<row><td>IsolatedComponent</td><td>Component_Shared</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Key to Component table item to be isolated</td></row>
		<row><td>LaunchCondition</td><td>Condition</td><td>N</td><td/><td/><td/><td/><td>Condition</td><td/><td>Expression which must evaluate to TRUE in order for install to commence.</td></row>
		<row><td>LaunchCondition</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Localizable text to display when condition fails and install must abort.</td></row>
		<row><td>ListBox</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>ListBox</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this item. All the items tied to the same property become part of the same listbox.</td></row>
		<row><td>ListBox</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The visible text to be assigned to the item. Optional. If this entry or the entire column is missing, the text is the same as the value.</td></row>
		<row><td>ListBox</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with this item. Selecting the line will set the associated property to this value.</td></row>
		<row><td>ListView</td><td>Binary_</td><td>Y</td><td/><td/><td>Binary</td><td>1</td><td>Identifier</td><td/><td>The name of the icon to be displayed with the icon. The binary information is looked up from the Binary Table.</td></row>
		<row><td>ListView</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>ListView</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this item. All the items tied to the same property become part of the same listview.</td></row>
		<row><td>ListView</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The visible text to be assigned to the item. Optional. If this entry or the entire column is missing, the text is the same as the value.</td></row>
		<row><td>ListView</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The value string associated with this item. Selecting the line will set the associated property to this value.</td></row>
		<row><td>LockPermissions</td><td>Domain</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Domain name for user whose permissions are being set. (usually a property)</td></row>
		<row><td>LockPermissions</td><td>LockObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Registry or File table</td></row>
		<row><td>LockPermissions</td><td>Permission</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Permission Access mask.  Full Control = 268435456 (GENERIC_ALL = 0x10000000)</td></row>
		<row><td>LockPermissions</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td>Directory;File;Registry</td><td>Reference to another table name</td></row>
		<row><td>LockPermissions</td><td>User</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>User for permissions to be set.  (usually a property)</td></row>
		<row><td>MIME</td><td>CLSID</td><td>Y</td><td/><td/><td>Class</td><td>1</td><td>Guid</td><td/><td>Optional associated CLSID.</td></row>
		<row><td>MIME</td><td>ContentType</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Primary key. Context identifier, typically "type/format".</td></row>
		<row><td>MIME</td><td>Extension_</td><td>N</td><td/><td/><td>Extension</td><td>1</td><td>Text</td><td/><td>Optional associated extension (without dot)</td></row>
		<row><td>Media</td><td>Cabinet</td><td>Y</td><td/><td/><td/><td/><td>Cabinet</td><td/><td>If some or all of the files stored on the media are compressed in a cabinet, the name of that cabinet.</td></row>
		<row><td>Media</td><td>DiskId</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>Primary key, integer to determine sort order for table.</td></row>
		<row><td>Media</td><td>DiskPrompt</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Disk name: the visible text actually printed on the disk.  This will be used to prompt the user when this disk needs to be inserted.</td></row>
		<row><td>Media</td><td>LastSequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>File sequence number for the last file for this media.</td></row>
		<row><td>Media</td><td>Source</td><td>Y</td><td/><td/><td/><td/><td>Property</td><td/><td>The property defining the location of the cabinet file.</td></row>
		<row><td>Media</td><td>VolumeLabel</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The label attributed to the volume.</td></row>
		<row><td>MoveFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>If this component is not "selected" for installation or removal, no action will be taken on the associated MoveFile entry</td></row>
		<row><td>MoveFile</td><td>DestFolder</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full path to the destination directory</td></row>
		<row><td>MoveFile</td><td>DestName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name to be given to the original file after it is moved or copied.  If blank, the destination file will be given the same name as the source file</td></row>
		<row><td>MoveFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key that uniquely identifies a particular MoveFile record</td></row>
		<row><td>MoveFile</td><td>Options</td><td>N</td><td>0</td><td>1</td><td/><td/><td/><td/><td>Integer value specifying the MoveFile operating mode, one of imfoEnum</td></row>
		<row><td>MoveFile</td><td>SourceFolder</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full path to the source directory</td></row>
		<row><td>MoveFile</td><td>SourceName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the source file(s) to be moved or copied.  Can contain the '*' or '?' wildcards.</td></row>
		<row><td>MsiAssembly</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Assembly attributes</td></row>
		<row><td>MsiAssembly</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>MsiAssembly</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>MsiAssembly</td><td>File_Application</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into File table, denoting the application context for private assemblies. Null for global assemblies.</td></row>
		<row><td>MsiAssembly</td><td>File_Manifest</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table denoting the manifest file for the assembly.</td></row>
		<row><td>MsiAssemblyName</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>MsiAssemblyName</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name part of the name-value pairs for the assembly name.</td></row>
		<row><td>MsiAssemblyName</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The value part of the name-value pairs for the assembly name.</td></row>
		<row><td>MsiDigitalCertificate</td><td>CertData</td><td>N</td><td/><td/><td/><td/><td>Binary</td><td/><td>A certificate context blob for a signer certificate</td></row>
		<row><td>MsiDigitalCertificate</td><td>DigitalCertificate</td><td>N</td><td/><td/><td>MsiPackageCertificate</td><td>2</td><td>Identifier</td><td/><td>A unique identifier for the row</td></row>
		<row><td>MsiDigitalSignature</td><td>DigitalCertificate_</td><td>N</td><td/><td/><td>MsiDigitalCertificate</td><td>1</td><td>Identifier</td><td/><td>Foreign key to MsiDigitalCertificate table identifying the signer certificate</td></row>
		<row><td>MsiDigitalSignature</td><td>Hash</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>The encoded hash blob from the digital signature</td></row>
		<row><td>MsiDigitalSignature</td><td>SignObject</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key to Media table</td></row>
		<row><td>MsiDigitalSignature</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Reference to another table name (only Media table is supported)</td></row>
		<row><td>MsiDriverPackages</td><td>Component</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Primary key used to identify a particular component record.</td></row>
		<row><td>MsiDriverPackages</td><td>Flags</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Driver package flags</td></row>
		<row><td>MsiDriverPackages</td><td>ReferenceComponents</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiDriverPackages</td><td>Sequence</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Installation sequence number</td></row>
		<row><td>MsiEmbeddedChainer</td><td>CommandLine</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>MsiEmbeddedChainer</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>Source</td><td>N</td><td/><td/><td/><td/><td>CustomSource</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td>Integer</td><td>2;18;50</td><td/></row>
		<row><td>MsiEmbeddedUI</td><td>Attributes</td><td>N</td><td>0</td><td>3</td><td/><td/><td>Integer</td><td/><td>Information about the data in the Data column.</td></row>
		<row><td>MsiEmbeddedUI</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>This column contains binary information.</td></row>
		<row><td>MsiEmbeddedUI</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Filename</td><td/><td>The name of the file that receives the binary information in the Data column.</td></row>
		<row><td>MsiEmbeddedUI</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>MsiEmbeddedUI</td><td>MessageFilter</td><td>Y</td><td>0</td><td>234913791</td><td/><td/><td>Integer</td><td/><td>Specifies the types of messages that are sent to the user interface DLL. This column is only relevant for rows with the msidbEmbeddedUI attribute.</td></row>
		<row><td>MsiEmbeddedUI</td><td>MsiEmbeddedUI</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The primary key for the table.</td></row>
		<row><td>MsiFileHash</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Primary key, foreign key into File table referencing file with this hash</td></row>
		<row><td>MsiFileHash</td><td>HashPart1</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>HashPart2</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>HashPart3</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>HashPart4</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>Options</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Various options and attributes for this hash.</td></row>
		<row><td>MsiLockPermissionsEx</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Expression which must evaluate to TRUE in order for this set of permissions to be applied</td></row>
		<row><td>MsiLockPermissionsEx</td><td>LockObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Registry, File, CreateFolder, or ServiceInstall table</td></row>
		<row><td>MsiLockPermissionsEx</td><td>MsiLockPermissionsEx</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token</td></row>
		<row><td>MsiLockPermissionsEx</td><td>SDDLText</td><td>N</td><td/><td/><td/><td/><td>FormattedSDDLText</td><td/><td>String to indicate permissions to be applied to the LockObject</td></row>
		<row><td>MsiLockPermissionsEx</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td>CreateFolder;File;Registry;ServiceInstall</td><td>Reference to another table name</td></row>
		<row><td>MsiPackageCertificate</td><td>DigitalCertificate_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A foreign key to the digital certificate table</td></row>
		<row><td>MsiPackageCertificate</td><td>PackageCertificate</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique identifier for the row</td></row>
		<row><td>MsiPatchCertificate</td><td>DigitalCertificate_</td><td>N</td><td/><td/><td>MsiDigitalCertificate</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the digital certificate table</td></row>
		<row><td>MsiPatchCertificate</td><td>PatchCertificate</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique identifier for the row</td></row>
		<row><td>MsiPatchMetadata</td><td>Company</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Optional company name</td></row>
		<row><td>MsiPatchMetadata</td><td>PatchConfiguration_</td><td>N</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key to the ISPatchConfiguration table</td></row>
		<row><td>MsiPatchMetadata</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the metadata</td></row>
		<row><td>MsiPatchMetadata</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value of the metadata</td></row>
		<row><td>MsiPatchOldAssemblyFile</td><td>Assembly_</td><td>Y</td><td/><td/><td>MsiPatchOldAssemblyName</td><td>1</td><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyName</td><td>Assembly</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyName</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyName</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiPatchSequence</td><td>PatchConfiguration_</td><td>N</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key to the patch configuration table</td></row>
		<row><td>MsiPatchSequence</td><td>PatchFamily</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the family to which this patch belongs</td></row>
		<row><td>MsiPatchSequence</td><td>Sequence</td><td>N</td><td/><td/><td/><td/><td>Version</td><td/><td>The version of this patch in this family</td></row>
		<row><td>MsiPatchSequence</td><td>Supersede</td><td>N</td><td/><td/><td/><td/><td>Integer</td><td/><td>Supersede</td></row>
		<row><td>MsiPatchSequence</td><td>Target</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Target product codes for this patch family</td></row>
		<row><td>MsiServiceConfig</td><td>Argument</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Argument(s) for service configuration. Value depends on the content of the ConfigType field</td></row>
		<row><td>MsiServiceConfig</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the configuration of the service</td></row>
		<row><td>MsiServiceConfig</td><td>ConfigType</td><td>N</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Service Configuration Option</td></row>
		<row><td>MsiServiceConfig</td><td>Event</td><td>N</td><td>0</td><td>7</td><td/><td/><td/><td/><td>Bit field:   0x1 = Install, 0x2 = Uninstall, 0x4 = Reinstall</td></row>
		<row><td>MsiServiceConfig</td><td>MsiServiceConfig</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>MsiServiceConfig</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Name of a service. /, \, comma and space are invalid</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Actions</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A list of integer actions separated by [~] delimiters: 0 = SC_ACTION_NONE, 1 = SC_ACTION_RESTART, 2 = SC_ACTION_REBOOT, 3 = SC_ACTION_RUN_COMMAND. Terminate with [~][~]</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Command</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Command line of the process to CreateProcess function to execute</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the configuration of the service</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>DelayActions</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A list of delays (time in milli-seconds), separated by [~] delmiters, to wait before taking the corresponding Action. Terminate with [~][~]</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Event</td><td>N</td><td>0</td><td>7</td><td/><td/><td/><td/><td>Bit field:   0x1 = Install, 0x2 = Uninstall, 0x4 = Reinstall</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>MsiServiceConfigFailureActions</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Name of a service. /, \, comma and space are invalid</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>RebootMessage</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Message to be broadcast to server users before rebooting</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>ResetPeriod</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Time in seconds after which to reset the failure count to zero. Leave blank if it should never be reset</td></row>
		<row><td>MsiShortcutProperty</td><td>MsiShortcutProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token</td></row>
		<row><td>MsiShortcutProperty</td><td>PropVariantValue</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>String representation of the value in the property</td></row>
		<row><td>MsiShortcutProperty</td><td>PropertyKey</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Canonical string representation of the Property Key being set</td></row>
		<row><td>MsiShortcutProperty</td><td>Shortcut_</td><td>N</td><td/><td/><td>Shortcut</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Shortcut table</td></row>
		<row><td>ODBCAttribute</td><td>Attribute</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of ODBC driver attribute</td></row>
		<row><td>ODBCAttribute</td><td>Driver_</td><td>N</td><td/><td/><td>ODBCDriver</td><td>1</td><td>Identifier</td><td/><td>Reference to ODBC driver in ODBCDriver table</td></row>
		<row><td>ODBCAttribute</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value for ODBC driver attribute</td></row>
		<row><td>ODBCDataSource</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reference to associated component</td></row>
		<row><td>ODBCDataSource</td><td>DataSource</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized.internal token for data source</td></row>
		<row><td>ODBCDataSource</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text used as registered name for data source</td></row>
		<row><td>ODBCDataSource</td><td>DriverDescription</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Reference to driver description, may be existing driver</td></row>
		<row><td>ODBCDataSource</td><td>Registration</td><td>N</td><td>0</td><td>1</td><td/><td/><td/><td/><td>Registration option: 0=machine, 1=user, others t.b.d.</td></row>
		<row><td>ODBCDriver</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reference to associated component</td></row>
		<row><td>ODBCDriver</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text used as registered name for driver, non-localized</td></row>
		<row><td>ODBCDriver</td><td>Driver</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized.internal token for driver</td></row>
		<row><td>ODBCDriver</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Reference to key driver file</td></row>
		<row><td>ODBCDriver</td><td>File_Setup</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Optional reference to key driver setup DLL</td></row>
		<row><td>ODBCSourceAttribute</td><td>Attribute</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of ODBC data source attribute</td></row>
		<row><td>ODBCSourceAttribute</td><td>DataSource_</td><td>N</td><td/><td/><td>ODBCDataSource</td><td>1</td><td>Identifier</td><td/><td>Reference to ODBC data source in ODBCDataSource table</td></row>
		<row><td>ODBCSourceAttribute</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value for ODBC data source attribute</td></row>
		<row><td>ODBCTranslator</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reference to associated component</td></row>
		<row><td>ODBCTranslator</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text used as registered name for translator</td></row>
		<row><td>ODBCTranslator</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Reference to key translator file</td></row>
		<row><td>ODBCTranslator</td><td>File_Setup</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Optional reference to key translator setup DLL</td></row>
		<row><td>ODBCTranslator</td><td>Translator</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized.internal token for translator</td></row>
		<row><td>Patch</td><td>Attributes</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Integer containing bit flags representing patch attributes</td></row>
		<row><td>Patch</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Primary key, non-localized token, foreign key to File table, must match identifier in cabinet.</td></row>
		<row><td>Patch</td><td>Header</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The patch header, used for patch validation.</td></row>
		<row><td>Patch</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to patch header.</td></row>
		<row><td>Patch</td><td>PatchSize</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Size of patch in bytes (long integer).</td></row>
		<row><td>Patch</td><td>Sequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Primary key, sequence with respect to the media images; order must track cabinet order.</td></row>
		<row><td>Patch</td><td>StreamRef_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>External key into the MsiPatchHeaders table specifying the row that contains the patch header stream.</td></row>
		<row><td>PatchPackage</td><td>Media_</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Foreign key to DiskId column of Media table. Indicates the disk containing the patch package.</td></row>
		<row><td>PatchPackage</td><td>PatchId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>A unique string GUID representing this patch.</td></row>
		<row><td>ProgId</td><td>Class_</td><td>Y</td><td/><td/><td>Class</td><td>1</td><td>Guid</td><td/><td>The CLSID of an OLE factory corresponding to the ProgId.</td></row>
		<row><td>ProgId</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized description for the Program identifier.</td></row>
		<row><td>ProgId</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a component, like ExtractIcon, etc.</td></row>
		<row><td>ProgId</td><td>IconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>Optional icon index.</td></row>
		<row><td>ProgId</td><td>Icon_</td><td>Y</td><td/><td/><td>Icon</td><td>1</td><td>Identifier</td><td/><td>Optional foreign key into the Icon Table, specifying the icon file associated with this ProgId. Will be written under the DefaultIcon key.</td></row>
		<row><td>ProgId</td><td>ProgId</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The Program Identifier. Primary key.</td></row>
		<row><td>ProgId</td><td>ProgId_Parent</td><td>Y</td><td/><td/><td>ProgId</td><td>1</td><td>Text</td><td/><td>The Parent Program Identifier. If specified, the ProgId column becomes a version independent prog id.</td></row>
		<row><td>Property</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>User Comments.</td></row>
		<row><td>Property</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of property, uppercase if settable by launcher or loader.</td></row>
		<row><td>Property</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property.</td></row>
		<row><td>PublishComponent</td><td>AppData</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>This is localisable Application specific data that can be associated with a Qualified Component.</td></row>
		<row><td>PublishComponent</td><td>ComponentId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>A string GUID that represents the component id that will be requested by the alien product.</td></row>
		<row><td>PublishComponent</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table.</td></row>
		<row><td>PublishComponent</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Feature table.</td></row>
		<row><td>PublishComponent</td><td>Qualifier</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is defined only when the ComponentId column is an Qualified Component Id. This is the Qualifier for ProvideComponentIndirect.</td></row>
		<row><td>RadioButton</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The height of the button.</td></row>
		<row><td>RadioButton</td><td>Help</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The help strings used with the button. The text is optional.</td></row>
		<row><td>RadioButton</td><td>ISControlId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A number used to represent the control ID of the Control, Used in Dialog export</td></row>
		<row><td>RadioButton</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>RadioButton</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this radio button. All the buttons tied to the same property become part of the same group.</td></row>
		<row><td>RadioButton</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The visible title to be assigned to the radio button.</td></row>
		<row><td>RadioButton</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with this button. Selecting the button will set the associated property to this value.</td></row>
		<row><td>RadioButton</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The width of the button.</td></row>
		<row><td>RadioButton</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The horizontal coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>RadioButton</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The vertical coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>RegLocator</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>RegPath</td><td/><td>The key for the registry value.</td></row>
		<row><td>RegLocator</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The registry value name.</td></row>
		<row><td>RegLocator</td><td>Root</td><td>N</td><td>0</td><td>3</td><td/><td/><td/><td/><td>The predefined root key for the registry value, one of rrkEnum.</td></row>
		<row><td>RegLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The table key. The Signature_ represents a unique file signature and is also the foreign key in the Signature table. If the type is 0, the registry values refers a directory, and _Signature is not a foreign key.</td></row>
		<row><td>RegLocator</td><td>Type</td><td>Y</td><td>0</td><td>18</td><td/><td/><td/><td/><td>An integer value that determines if the registry value is a filename or a directory location or to be used as is w/o interpretation.</td></row>
		<row><td>Registry</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the installing of the registry value.</td></row>
		<row><td>Registry</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a registry item.  Currently the only one is Automatic.</td></row>
		<row><td>Registry</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>RegPath</td><td/><td>The key for the registry value.</td></row>
		<row><td>Registry</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The registry value name.</td></row>
		<row><td>Registry</td><td>Registry</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>Registry</td><td>Root</td><td>N</td><td>-1</td><td>3</td><td/><td/><td/><td/><td>The predefined root key for the registry value, one of rrkEnum.</td></row>
		<row><td>Registry</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The registry value.</td></row>
		<row><td>RemoveFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the file to be removed.</td></row>
		<row><td>RemoveFile</td><td>DirProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full pathname to the folder of the file to be removed.</td></row>
		<row><td>RemoveFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular file entry</td></row>
		<row><td>RemoveFile</td><td>FileName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the file to be removed.</td></row>
		<row><td>RemoveFile</td><td>InstallMode</td><td>N</td><td/><td/><td/><td/><td/><td>1;2;3</td><td>Installation option, one of iimEnum.</td></row>
		<row><td>RemoveIniFile</td><td>Action</td><td>N</td><td/><td/><td/><td/><td/><td>2;4</td><td>The type of modification to be made, one of iifEnum.</td></row>
		<row><td>RemoveIniFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the deletion of the .INI value.</td></row>
		<row><td>RemoveIniFile</td><td>DirProperty</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into the Directory table denoting the directory where the .INI file is.</td></row>
		<row><td>RemoveIniFile</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The .INI file name in which to delete the information</td></row>
		<row><td>RemoveIniFile</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file key below Section.</td></row>
		<row><td>RemoveIniFile</td><td>RemoveIniFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>RemoveIniFile</td><td>Section</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file Section.</td></row>
		<row><td>RemoveIniFile</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value to be deleted. The value is required when Action is iifIniRemoveTag</td></row>
		<row><td>RemoveRegistry</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the deletion of the registry value.</td></row>
		<row><td>RemoveRegistry</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>RegPath</td><td/><td>The key for the registry value.</td></row>
		<row><td>RemoveRegistry</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The registry value name.</td></row>
		<row><td>RemoveRegistry</td><td>RemoveRegistry</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>RemoveRegistry</td><td>Root</td><td>N</td><td>-1</td><td>3</td><td/><td/><td/><td/><td>The predefined root key for the registry value, one of rrkEnum</td></row>
		<row><td>ReserveCost</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reserve a specified amount of space if this component is to be installed.</td></row>
		<row><td>ReserveCost</td><td>ReserveFolder</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full path to the destination directory</td></row>
		<row><td>ReserveCost</td><td>ReserveKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key that uniquely identifies a particular ReserveCost record</td></row>
		<row><td>ReserveCost</td><td>ReserveLocal</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Disk space to reserve if linked component is installed locally.</td></row>
		<row><td>ReserveCost</td><td>ReserveSource</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Disk space to reserve if linked component is installed to run from the source location.</td></row>
		<row><td>SFPCatalog</td><td>Catalog</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>SFP Catalog</td></row>
		<row><td>SFPCatalog</td><td>Dependency</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Parent catalog - only used by SFP</td></row>
		<row><td>SFPCatalog</td><td>SFPCatalog</td><td>N</td><td/><td/><td/><td/><td>Filename</td><td/><td>File name for the catalog.</td></row>
		<row><td>SelfReg</td><td>Cost</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The cost of registering the module.</td></row>
		<row><td>SelfReg</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table denoting the module that needs to be registered.</td></row>
		<row><td>ServiceControl</td><td>Arguments</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Arguments for the service.  Separate by [~].</td></row>
		<row><td>ServiceControl</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the startup of the service</td></row>
		<row><td>ServiceControl</td><td>Event</td><td>N</td><td>0</td><td>187</td><td/><td/><td/><td/><td>Bit field:  Install:  0x1 = Start, 0x2 = Stop, 0x8 = Delete, Uninstall: 0x10 = Start, 0x20 = Stop, 0x80 = Delete</td></row>
		<row><td>ServiceControl</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Name of a service. /, \, comma and space are invalid</td></row>
		<row><td>ServiceControl</td><td>ServiceControl</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>ServiceControl</td><td>Wait</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td>Boolean for whether to wait for the service to fully start</td></row>
		<row><td>ServiceInstall</td><td>Arguments</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Arguments to include in every start of the service, passed to WinMain</td></row>
		<row><td>ServiceInstall</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the startup of the service</td></row>
		<row><td>ServiceInstall</td><td>Dependencies</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Other services this depends on to start.  Separate by [~], and end with [~][~]</td></row>
		<row><td>ServiceInstall</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description of service.</td></row>
		<row><td>ServiceInstall</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>External Name of the Service</td></row>
		<row><td>ServiceInstall</td><td>ErrorControl</td><td>N</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Severity of error if service fails to start</td></row>
		<row><td>ServiceInstall</td><td>LoadOrderGroup</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>LoadOrderGroup</td></row>
		<row><td>ServiceInstall</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Internal Name of the Service</td></row>
		<row><td>ServiceInstall</td><td>Password</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>password to run service with.  (with StartName)</td></row>
		<row><td>ServiceInstall</td><td>ServiceInstall</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>ServiceInstall</td><td>ServiceType</td><td>N</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Type of the service</td></row>
		<row><td>ServiceInstall</td><td>StartName</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>User or object name to run service as</td></row>
		<row><td>ServiceInstall</td><td>StartType</td><td>N</td><td>0</td><td>4</td><td/><td/><td/><td/><td>Type of the service</td></row>
		<row><td>Shortcut</td><td>Arguments</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The command-line arguments for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table denoting the component whose selection gates the the shortcut creation/deletion.</td></row>
		<row><td>Shortcut</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The description for the shortcut.</td></row>
		<row><td>Shortcut</td><td>DescriptionResourceDLL</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This field contains a Formatted string value for the full path to the language neutral file that contains the MUI manifest.</td></row>
		<row><td>Shortcut</td><td>DescriptionResourceId</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The description name index for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Directory table denoting the directory where the shortcut file is created.</td></row>
		<row><td>Shortcut</td><td>DisplayResourceDLL</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This field contains a Formatted string value for the full path to the language neutral file that contains the MUI manifest.</td></row>
		<row><td>Shortcut</td><td>DisplayResourceId</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The display name index for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Hotkey</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The hotkey for the shortcut. It has the virtual-key code for the key in the low-order byte, and the modifier flags in the high-order byte.</td></row>
		<row><td>Shortcut</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a shortcut.  Mainly used in pro project types.</td></row>
		<row><td>Shortcut</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Shortcut.</td></row>
		<row><td>Shortcut</td><td>ISShortcutName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A non-unique name for the shortcut.  Mainly used by pro pro project types.</td></row>
		<row><td>Shortcut</td><td>IconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>The icon index for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Icon_</td><td>Y</td><td/><td/><td>Icon</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table denoting the external icon file for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the shortcut to be created.</td></row>
		<row><td>Shortcut</td><td>Shortcut</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>Shortcut</td><td>ShowCmd</td><td>Y</td><td/><td/><td/><td/><td/><td>1;3;7</td><td>The show command for the application window.The following values may be used.</td></row>
		<row><td>Shortcut</td><td>Target</td><td>N</td><td/><td/><td/><td/><td>Shortcut</td><td/><td>The shortcut target. This is usually a property that is expanded to a file or a folder that the shortcut points to.</td></row>
		<row><td>Shortcut</td><td>WkDir</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of property defining location of working directory.</td></row>
		<row><td>Signature</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the file. This may contain a "short name|long name" pair.</td></row>
		<row><td>Signature</td><td>Languages</td><td>Y</td><td/><td/><td/><td/><td>Language</td><td/><td>The languages supported by the file.</td></row>
		<row><td>Signature</td><td>MaxDate</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The maximum creation date of the file.</td></row>
		<row><td>Signature</td><td>MaxSize</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The maximum size of the file.</td></row>
		<row><td>Signature</td><td>MaxVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The maximum version of the file.</td></row>
		<row><td>Signature</td><td>MinDate</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The minimum creation date of the file.</td></row>
		<row><td>Signature</td><td>MinSize</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The minimum size of the file.</td></row>
		<row><td>Signature</td><td>MinVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The minimum version of the file.</td></row>
		<row><td>Signature</td><td>Signature</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The table key. The Signature represents a unique file signature.</td></row>
		<row><td>TextStyle</td><td>Color</td><td>Y</td><td>0</td><td>16777215</td><td/><td/><td/><td/><td>A long integer indicating the color of the string in the RGB format (Red, Green, Blue each 0-255, RGB = R + 256*G + 256^2*B).</td></row>
		<row><td>TextStyle</td><td>FaceName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>A string indicating the name of the font used. Required. The string must be at most 31 characters long.</td></row>
		<row><td>TextStyle</td><td>Size</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The size of the font used. This size is given in our units (1/12 of the system font height). Assuming that the system font is set to 12 point size, this is equivalent to the point size.</td></row>
		<row><td>TextStyle</td><td>StyleBits</td><td>Y</td><td>0</td><td>15</td><td/><td/><td/><td/><td>A combination of style bits.</td></row>
		<row><td>TextStyle</td><td>TextStyle</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the style. The primary key of this table. This name is embedded in the texts to indicate a style change.</td></row>
		<row><td>TypeLib</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table, specifying the component for which to return a path when called through LocateComponent.</td></row>
		<row><td>TypeLib</td><td>Cost</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The cost associated with the registration of the typelib. This column is currently optional.</td></row>
		<row><td>TypeLib</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>TypeLib</td><td>Directory_</td><td>Y</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Optional. The foreign key into the Directory table denoting the path to the help file for the type library.</td></row>
		<row><td>TypeLib</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table, specifying the feature to validate or install in order for the type library to be operational.</td></row>
		<row><td>TypeLib</td><td>Language</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The language of the library.</td></row>
		<row><td>TypeLib</td><td>LibID</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>The GUID that represents the library.</td></row>
		<row><td>TypeLib</td><td>Version</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The version of the library. The major version is in the upper 8 bits of the short integer. The minor version is in the lower 8 bits.</td></row>
		<row><td>UIText</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key that identifies the particular string.</td></row>
		<row><td>UIText</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The localized version of the string.</td></row>
		<row><td>Upgrade</td><td>ActionProperty</td><td>N</td><td/><td/><td/><td/><td>UpperCase</td><td/><td>The property to set when a product in this set is found.</td></row>
		<row><td>Upgrade</td><td>Attributes</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The attributes of this product set.</td></row>
		<row><td>Upgrade</td><td>ISDisplayName</td><td>Y</td><td/><td/><td>ISUpgradeMsiItem</td><td>1</td><td/><td/><td/></row>
		<row><td>Upgrade</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Language</td><td/><td>A comma-separated list of languages for either products in this set or products not in this set.</td></row>
		<row><td>Upgrade</td><td>Remove</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The list of features to remove when uninstalling a product from this set.  The default is "ALL".</td></row>
		<row><td>Upgrade</td><td>UpgradeCode</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>The UpgradeCode GUID belonging to the products in this set.</td></row>
		<row><td>Upgrade</td><td>VersionMax</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The maximum ProductVersion of the products in this set.  The set may or may not include products with this particular version.</td></row>
		<row><td>Upgrade</td><td>VersionMin</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The minimum ProductVersion of the products in this set.  The set may or may not include products with this particular version.</td></row>
		<row><td>Verb</td><td>Argument</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Optional value for the command arguments.</td></row>
		<row><td>Verb</td><td>Command</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The command text.</td></row>
		<row><td>Verb</td><td>Extension_</td><td>N</td><td/><td/><td>Extension</td><td>1</td><td>Text</td><td/><td>The extension associated with the table row.</td></row>
		<row><td>Verb</td><td>Sequence</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Order within the verbs for a particular extension. Also used simply to specify the default verb.</td></row>
		<row><td>Verb</td><td>Verb</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The verb for the command.</td></row>
		<row><td>_Validation</td><td>Category</td><td>Y</td><td/><td/><td/><td/><td/><td>"Text";"Formatted";"Template";"Condition";"Guid";"Path";"Version";"Language";"Identifier";"Binary";"UpperCase";"LowerCase";"Filename";"Paths";"AnyPath";"WildCardFilename";"RegPath";"KeyFormatted";"CustomSource";"Property";"Cabinet";"Shortcut";"URL";"DefaultDir"</td><td>String category</td></row>
		<row><td>_Validation</td><td>Column</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of column</td></row>
		<row><td>_Validation</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description of column</td></row>
		<row><td>_Validation</td><td>KeyColumn</td><td>Y</td><td>1</td><td>32</td><td/><td/><td/><td/><td>Column to which foreign key connects</td></row>
		<row><td>_Validation</td><td>KeyTable</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>For foreign key, Name of table to which data must link</td></row>
		<row><td>_Validation</td><td>MaxValue</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Maximum value allowed</td></row>
		<row><td>_Validation</td><td>MinValue</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Minimum value allowed</td></row>
		<row><td>_Validation</td><td>Nullable</td><td>N</td><td/><td/><td/><td/><td/><td>Y;N;@</td><td>Whether the column is nullable</td></row>
		<row><td>_Validation</td><td>Set</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Set of values that are permitted</td></row>
		<row><td>_Validation</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of table</td></row>
	</table>
</msi>
