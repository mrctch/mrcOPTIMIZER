@echo off
chcp 65001 >nul
title mrcOPTIMIZER
color 0A

:: Check Administrator permissions
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo =======================================================================
    echo  ERROR: This script requires ADMINISTRATOR permissions.
    echo  Right-click on the .bat file and select:
    echo  "Run as administrator".
    echo =======================================================================
    echo.
    pause
    exit /b
)

cls
echo.
echo =======================================================================
echo                             mrcOPTIMIZER
echo =======================================================================
echo.
echo Press ENTER to start the mass execution...
pause >nul

cls
:: --- SECTION 1: TELEMETRY AND TRACKING (1-15) ---
echo [1/101] Disabling HKLM Global Telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1

echo [2/101] Disabling HKCU Global Telemetry...
reg add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1

echo [3/101] Disabling Telemetry in User Policies...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1

echo [4/101] Disabling Connected Devices Platform (CDP)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Connected Devices Platform" /v "EnableCdp" /t REG_DWORD /d 0 /f >nul 2>&1

echo [5/101] Disabling Windows Application Inventory...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f >nul 2>&1

echo [6/101] Disabling Compatibility Evaluator...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d 1 /f >nul 2>&1

echo [7/101] Disabling CEIP in Windows Clients...
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul 2>&1

echo [8/101] Disabling Steps Recorder...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueries" /t REG_DWORD /d 1 /f >nul 2>&1

echo [9/101] Disabling Keyboard Data Collection (TIPC)...
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [10/101] Disabling Typing Privacy Policy...
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f >nul 2>&1

echo [11/101] Disabling Device History in Search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [12/101] Disabling Program Tracking in Start Menu...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul 2>&1

echo [13/101] Disabling Tailored Experiences with Diagnostic Data...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [14/101] Disabling Biometric Data Collection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [15/101] Disabling Diagnostic System Notifications...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "EnableDiagnostics" /t REG_DWORD /d 0 /f >nul 2>&1


:: --- SECTION 2: COPILOT, AI AND RECALL (16-25) ---
echo [16/101] Disabling Copilot HKLM...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1

echo [17/101] Disabling Copilot HKCU...
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1

echo [18/101] Disabling AI Data Analysis in HKLM...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f >nul 2>&1

echo [19/101] Disabling AI Data Analysis in HKCU...
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f >nul 2>&1

echo [20/101] Disabling Windows Recall in HKLM...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableRecall" /t REG_DWORD /d 1 /f >nul 2>&1

echo [21/101] Disabling Windows Recall in HKCU...
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsAI" /v "DisableRecall" /t REG_DWORD /d 1 /f >nul 2>&1

echo [22/101] Hiding Copilot Button on Taskbar...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f >nul 2>&1

echo [23/101] Disabling Copilot in Microsoft Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [24/101] Removing Copilot AppX Packages...
powershell -Command "Get-AppxPackage -AllUsers *Copilot* | Remove-AppxPackage -AllUsers" >nul 2>&1

echo [25/101] Removing Copilot Provisioned Packages...
powershell -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like '*Copilot*'} | Remove-AppxProvisionedPackage -Online" >nul 2>&1


:: --- SECTION 3: MICROSOFT EDGE (26-35) ---
echo [26/101] Disabling Telemetry in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [27/101] Disabling Ad Personalization in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [28/101] Disabling Search Suggestions in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [29/101] Disabling Shopping Assistant in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [30/101] Disabling Network Prediction in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d 2 /f >nul 2>&1

echo [31/101] Disabling First Run Experience / Auto-Import in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul 2>&1

echo [32/101] Disabling Automatic Sync in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SyncDisabled" /t REG_DWORD /d 1 /f >nul 2>&1

echo [33/101] Disabling Cloud Spellcheck Service in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SpellCheckServiceEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [34/101] Disabling Generative AI Inputs in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "GenAIPromptInputsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [35/101] Disabling Promotional Recommendations in Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowRecommendationsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1


:: --- SECTION 4: WEB SEARCH AND BING (36-45) ---
echo [36/101] Disabling Bing Suggestions in Windows Search...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul 2>&1

echo [37/101] Disabling BingSearchEnabled in Search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [38/101] Disabling Cortana HKLM...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1

echo [39/101] Disabling Integrated Web Search...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f >nul 2>&1

echo [40/101] Disabling Location Usage in Search...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f >nul 2>&1

echo [41/101] Disabling Cloud Search Indexing...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d 0 /f >nul 2>&1

echo [42/101] Disabling Search Highlights...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [43/101] Disabling People Indexing in Search...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingByPeopleProperty" /t REG_DWORD /d 0 /f >nul 2>&1

echo [44/101] Disabling Local Search History...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [45/101] Disabling Search Suggestions in Start Menu...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 1 /f >nul 2>&1


:: --- SECTION 5: LOCATION AND SENSORS (46-55) ---
echo [46/101] Disabling Global Location Service...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul 2>&1

echo [47/101] Disabling Location Sensors...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d 1 /f >nul 2>&1

echo [48/101] Disabling Location Scripting...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d 1 /f >nul 2>&1

echo [49/101] Disabling Ambient Light Sensor...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensorsLuminance" /t REG_DWORD /d 1 /f >nul 2>&1

echo [50/101] Disabling Find My Device Feature...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d 0 /f >nul 2>&1

echo [51/101] Disabling Global Camera Access for Apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCamera" /t REG_DWORD /d 2 /f >nul 2>&1

echo [52/101] Disabling Global Microphone Access for Apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMicrophone" /t REG_DWORD /d 2 /f >nul 2>&1

echo [53/101] Disabling Notification Access for Apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessNotifications" /t REG_DWORD /d 2 /f >nul 2>&1

echo [54/101] Disabling Account Info Access for Apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInformation" /t REG_DWORD /d 2 /f >nul 2>&1

echo [55/101] Disabling Contacts Access for Apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts" /t REG_DWORD /d 2 /f >nul 2>&1


:: --- SECTION 6: ACTIVITY AND CLIPBOARD (56-64) ---
echo [56/101] Disabling Activity Feed...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f >nul 2>&1

echo [57/101] Disabling Activity Publishing...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1

echo [58/101] Disabling Activity Upload...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1

echo [59/101] Disabling Cloud Clipboard (HKLM)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowClipboardHistory" /t REG_DWORD /d 0 /f >nul 2>&1

echo [60/101] Disabling Cross-Device Clipboard...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowCrossDeviceClipboard" /t REG_DWORD /d 0 /f >nul 2>&1

echo [61/101] Disabling Settings Sync (HKCU)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [62/101] Disabling Credentials Sync...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [63/101] Disabling Personalization Sync...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [64/101] Disabling Browser Settings Sync...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [65/101] Disabling Language Preferences Sync...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1


:: --- SECTION 7: ADVERTISING AND INTEGRATED ADS (66-74) ---
echo [66/101] Disabling Advertising ID...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [67/101] Disabling Start Menu Suggestions 1...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [68/101] Disabling Start Menu Suggestions 2...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [69/101] Disabling Suggested Content in Settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [70/101] Disabling Windows Tips and Tricks (SoftLanding)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [71/101] Disabling System Pane Suggestions...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [72/101] Disabling Welcome Experience Notifications...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [73/101] Disabling Automatic Installation of Promoted Apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [74/101] Disabling Lock Screen Ads...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f >nul 2>&1


:: --- SECTION 8: GAMING AND PERFORMANCE (75-84) ---
echo [75/101] Disabling Xbox Game Bar...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [76/101] Disabling Global Game DVR...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f >nul 2>&1

echo [77/101] Enabling Automated Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f >nul 2>&1

echo [78/101] Disabling In-Game Audio Recording...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_AudioCaptureEnabled" /t REG_DWORD /d 0 /f >nul 2>&1

echo [79/101] Disabling In-Game Screen Capture...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >nul 2>&1

echo [80/101] Enabling Hardware-Accelerated GPU Scheduling (HAGS)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1

echo [81/101] Disabling Window Animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f >nul 2>&1

echo [82/101] Adjusting GPU Priority for Games...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1

echo [83/101] Adjusting CPU Priority for Games...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1

echo [84/101] Disabling Power Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1


:: --- SECTION 9: EXPLORER AND SYSTEM (85-94) ---
echo [85/101] Enabling NCSI Active Probing for Network...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 1 /f >nul 2>&1

echo [86/101] Showing Known File Extensions...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul 2>&1

echo [87/101] Hiding Task View Button...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f >nul 2>&1

echo [88/101] Hiding Recommended Items in Start Menu...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1

echo [89/101] Opening File Explorer to 'This PC' instead of Quick Access...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul 2>&1

echo [90/101] Showing Hidden Files...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f >nul 2>&1

echo [91/101] Disabling Program Compatibility Assistant (PcaSvc)...
sc config PcaSvc start= disabled >nul 2>&1

echo [92/101] Disabling Windows Error Reporting (WER)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul 2>&1

echo [93/101] Disabling Reserved Storage...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d 0 /f >nul 2>&1

echo [94/101] Disabling SmartScreen for Unknown Files...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul 2>&1


:: --- SECTION 10: SERVICES AND FINAL CLEANUP (95-101) ---
echo [95/101] Disabling DiagTrack Service...
sc config DiagTrack start= disabled >nul 2>&1
net stop DiagTrack >nul 2>&1

echo [96/101] Disabling dmwappushservice Service...
sc config dmwappushservice start= disabled >nul 2>&1
net stop dmwappushservice >nul 2>&1

echo [97/101] Disabling Location and Maps Services (lfsvc, MapsBroker)...
sc config lfsvc start= disabled >nul 2>&1
sc config MapsBroker start= disabled >nul 2>&1
net stop MapsBroker >nul 2>&1

echo [98/101] Disabling Unnecessary System Services (Fax, RemoteRegistry, WalletService)...
sc config Fax start= disabled >nul 2>&1
net stop Fax >nul 2>&1
sc config RemoteRegistry start= disabled >nul 2>&1
net stop RemoteRegistry >nul 2>&1
sc config WalletService start= disabled >nul 2>&1

echo [99/101] Removing Unnecessary AppX Packages...
powershell -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" >nul 2>&1

echo [100/101] Cleaning System Cache and Temporary Files...
del /s /q /f "%windir%\SoftwareDistribution\Download\*" >nul 2>&1
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
rd /s /q C:\$Recycle.Bin >nul 2>&1

echo [101/101] Optimizing Network DNS Cache...
ipconfig /flushdns >nul 2>&1

echo [102/102] Disabling SysMain (Superfetch) Service...
sc config SysMain start= disabled >nul 2>&1
net stop SysMain >nul 2>&1

echo.
echo =======================================================================
echo                         OPTIMIZATION COMPLETED
echo =======================================================================
echo.
echo Please restart the device to apply tweaks.
echo.
pause
