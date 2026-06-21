@echo off
setlocal enabledelayedexpansion

:: Automatically relaunch as administrator if not already elevated
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:main_menu
color 0B
cls
echo  /\_/\  ===============================================
echo ( o.o )       GOATED SYSTEM MANAGER          
echo  ^> ^_ ^<  ===============================================
echo  1. Show All Applications
echo  2. Advanced Power Options
echo  3. Clear System Temporary Files
echo  4. Run System File Checker (SFC Scan)
echo  5. Check Disk Health (Chkdsk - Read Only)
echo  6. Flush DNS Cache (Fix Internet Issues)
echo  7. Show System Network Information (IP Config)
echo  8. Open Windows Task Manager
echo  9. Network and Internet Configuration
echo 10. Windows Settings and Control Panel
echo 11. System Optimization and Diagnostics
echo 12. Credits and Documentation Tutorial
echo 13. Gemini's Special Extras
echo 14. [INSTALL] Copy Script to AppData and Create Shortcuts
echo 15. Exit
echo ===================================================
set "main_choice="
set /p "main_choice=Select an option (1-15): "

:: Safe validation using delayed expansion (!) to completely prevent command crashes
if "!main_choice!"=="1" goto show_apps
if "!main_choice!"=="2" goto menu
if "!main_choice!"=="3" goto quick_clean
if "!main_choice!"=="4" goto run_sfc
if "!main_choice!"=="5" goto run_chkdsk
if "!main_choice!"=="6" goto flush_dns
if "!main_choice!"=="7" goto network_info
if "!main_choice!"=="8" goto open_taskmgr
if "!main_choice!"=="9" goto net_submenu
if "!main_choice!"=="10" goto config_submenu
if "!main_choice!"=="11" goto diag_submenu
if "!main_choice!"=="12" goto tutorial_submenu
if "!main_choice!"=="13" goto geminis_lab
if "!main_choice!"=="14" goto install_script
if "!main_choice!"=="15" goto exit

echo Invalid choice, please try again.
ping 127.0.0.1 -n 3 >nul
goto main_menu

:show_apps
echo Opening applications folder...
explorer.exe shell:AppsFolder
ping 127.0.0.1 -n 2 >nul
goto main_menu

:quick_clean
echo.
echo Clearing temporary files...
del /q /f /s "%TEMP%\*" >nul 2>&1
for /d %%i in ("%TEMP%\*") do rmdir /s /q "%%i" >nul 2>&1
echo Done! Temp files cleared.
ping 127.0.0.1 -n 3 >nul
goto main_menu

:run_sfc
echo.
echo Running System File Checker... This may take a few minutes.
sfc /scannow
echo.
pause
goto main_menu

:run_chkdsk
echo.
echo Checking disk health in read-only mode...
chkdsk
echo.
pause
goto main_menu

:flush_dns
echo.
echo Flushing DNS Resolver Cache...
ipconfig /flushdns
echo Done! DNS Cache cleared successfully.
ping 127.0.0.1 -n 3 >nul
goto main_menu

:network_info
echo.
echo Network Information:
echo ===================================================
ipconfig | findstr /i "ipv4 description subnet gateway"
echo ===================================================
echo.
pause
goto main_menu

:open_taskmgr
echo Opening Task Manager...
start taskmgr.exe
ping 127.0.0.1 -n 2 >nul
goto main_menu


:: ===================================================
::      SUBMENU 2: ADVANCED POWER OPTIONS
:: ===================================================
:menu
cls
echo ===================================================
echo                 ADVANCED POWER OPTIONS              
echo ===================================================
echo  1. Boot into Windows Recovery Environment (WinRE)
echo  2. Boot into Safe Mode (with Networking)
echo  3. Standard Power Off (Shutdown)
echo  4. Standard Reboot Normally
echo  5. Open Advanced / Hidden Shutdown Options
echo  6. View All Available Power Schemes
echo  7. Legacy Power Options Menu (Control Panel)
echo  8. Abort Scheduled Shutdown / Reset Safe Boot
echo  9. Back to Main Menu
echo ===================================================
set "pow_choice="
set /p "pow_choice=Select an option (1-9): "

if "!pow_choice!"=="1" set "action=winre"    & goto delay_menu
if "!pow_choice!"=="2" set "action=safenet"  & goto delay_menu
if "!pow_choice!"=="3" set "action=poweroff" & goto delay_menu
if "!pow_choice!"=="4" set "action=reboot"   & goto delay_menu
if "!pow_choice!"=="5" goto advanced_menu
if "!pow_choice!"=="6" goto pwr_list
if "!pow_choice!"=="7" start powercfg.cpl & goto menu
if "!pow_choice!"=="8" goto do_abort
if "!pow_choice!"=="9" goto main_menu
echo Invalid option. & ping 127.0.0.1 -n 3 >nul & goto menu

:pwr_list
echo.
echo Active and Available Power Plans:
echo ===================================================
powercfg /list
echo ===================================================
echo.
pause
goto menu

:advanced_menu
cls
echo ===================================================
echo              ADVANCED POWER OFF OPTIONS             
echo ===================================================
echo  1. Hybrid Shutdown (Fast Startup)
echo  2. Soft Reboot (Restarts apps after login)
echo  3. Boot to Safe Mode (Minimal / Standard)
echo  4. Boot to Safe Mode (Command Prompt Only)
echo  5. Boot to BIOS/UEFI Firmware Settings
echo  6. Hibernate System
echo  7. Log Off Current User
echo  8. Back to Power Menu
echo ===================================================
set "adv_choice="
set /p "adv_choice=Choose an action (1-8): "

if "!adv_choice!"=="1" set "action=hybrid"   & goto delay_menu
if "!adv_choice!"=="2" set "action=soft"     & goto delay_menu
if "!adv_choice!"=="3" set "action=safemin"  & goto delay_menu
if "!adv_choice!"=="4" set "action=safecmd"  & goto delay_menu
if "!adv_choice!"=="5" set "action=bios"     & goto delay_menu
if "!adv_choice!"=="6" goto do_hibernate
if "!adv_choice!"=="7" goto do_logoff
if "!adv_choice!"=="8" goto menu
echo Invalid option. Try again.
ping 127.0.0.1 -n 3 >nul
goto advanced_menu

:delay_menu
cls
echo ===================================================
echo                     SET TIME DELAY                  
echo ===================================================
echo  1. Immediate (0 seconds)
echo  2. 5 seconds
echo  3. 10 seconds
echo  4. 15 seconds
echo  5. 20 seconds
echo  6. 1 minute (60 seconds)
echo  7. 10 minutes (600 seconds)
echo  8. Custom time (Enter in seconds)
echo ===================================================
set "t_choice="
set /p "t_choice=Select delay option (1-8): "

if "!t_choice!"=="1" set "seconds=0" & goto execute
if "!t_choice!"=="2" set "seconds=5" & goto execute
if "!t_choice!"=="3" set "seconds=10" & goto execute
if "!t_choice!"=="4" set "seconds=15" & goto execute
if "!t_choice!"=="5" set "seconds=20" & goto execute
if "!t_choice!"=="6" set "seconds=60" & goto execute
if "!t_choice!"=="7" set "seconds=600" & goto execute
if "!t_choice!"=="8" goto custom_time

echo Invalid option. Defaulting to immediate (0s).
set "seconds=0"
ping 127.0.0.1 -n 3 >nul
goto execute

:custom_time
echo.
set /p "seconds=Enter delay time in SECONDS: "
goto execute

:execute
echo.
echo Executing command in %seconds% seconds...
echo You can abort this countdown by running option 8 in the Power Menu.
echo.

if "%action%"=="winre" (
    shutdown /r /o /f /t %seconds% /c "Rebooting to Windows Recovery Environment"
)
if "%action%"=="safenet" (
    bcdedit /set {current} safeboot network
    shutdown /r /f /t %seconds% /c "Rebooting to Safe Mode with Networking"
)
if "%action%"=="safemin" (
    bcdedit /set {current} safeboot minimal
    shutdown /r /f /t %seconds% /c "Rebooting to Safe Mode"
)
if "%action%"=="safecmd" (
    bcdedit /set {current} safeboot minimal
    bcdedit /set {current} safebootalternateshell yes
    shutdown /r /f /t %seconds% /c "Rebooting to Safe Mode Command Prompt"
)
if "%action%"=="bios" (
    shutdown /r /fw /f /t %seconds% /c "Rebooting to Hardware BIOS Settings"
)
if "%action%"=="reboot" (
    shutdown /r /f /t %seconds%
)
if "%action%"=="soft" (
    shutdown /g /f /t %seconds%
)
if "%action%"=="poweroff" (
    shutdown /s /f /t %seconds%
)
if "%action%"=="hybrid" (
    shutdown /s /hybrid /f /t %seconds%
)
goto exit

:do_hibernate
echo Hibernating system now...
rundll32.exe powrprof.dll,SetSuspendState 1,1,0
goto menu

:do_logoff
echo Logging off current user...
shutdown /l
goto menu

:do_abort
shutdown /a >nul 2>&1
bcdedit /deletevalue {current} safeboot >nul 2>&1
bcdedit /deletevalue {current} safebootalternateshell >nul 2>&1
echo.
echo Active power plans/reboots canceled and Safe Boot variables reset!
pause
goto menu


:: ===================================================
::      SUBMENU 9: NETWORK AND INTERNET CONFIGURATION
:: ===================================================
:net_submenu
cls
echo ===================================================
echo            NETWORK AND INTERNET CONFIGURATION          
echo ===================================================
echo  1. Open Network Connections (ncpa.cpl)
echo  2. Renew IP Address Lease
echo  3. Reset Winsock (Fix Network Corruption)
echo  4. Ping Test (Google DNS)
echo  5. Back to Main Menu
echo ===================================================
set "net_choice="
set /p "net_choice=Select an option (1-5): "

if "!net_choice!"=="1" start ncpa.cpl & goto net_submenu
if "!net_choice!"=="2" goto net_renew
if "!net_choice!"=="3" goto net_winsock
if "!net_choice!"=="4" goto net_ping
if "!net_choice!"=="5" goto main_menu
echo Invalid option. & ping 127.0.0.1 -n 3 >nul & goto net_submenu

:net_renew
echo.
ipconfig /release
ipconfig /renew
pause
goto net_submenu

:net_winsock
echo.
netsh winsock reset
echo Please restart your PC later.
pause
goto net_submenu

:net_ping
echo.
ping 8.8.8.8
pause
goto net_submenu


:: ===================================================
::      SUBMENU 10: WINDOWS SETTINGS AND CONTROL PANEL
:: ===================================================
:config_submenu
cls
echo ===================================================
echo           WINDOWS SETTINGS AND CONTROL PANEL          
echo ===================================================
echo  1. Open Main Control Panel
echo  2. Open Windows Update Settings
echo  3. Back to Main Menu
echo ===================================================
set "config_choice="
set /p "config_choice=Select an option (1-3): "

if "!config_choice!"=="1" start control & goto config_submenu
if "!config_choice!"=="2" start ms-settings:windowsupdate & goto config_submenu
if "!config_choice!"=="3" goto main_menu
echo Invalid option. & ping 127.0.0.1 -n 3 >nul & goto config_submenu


:: ===================================================
::      SUBMENU 11: SYSTEM OPTIMIZATION AND DIAGNOSTICS
:: ===================================================
:diag_submenu
cls
echo ===================================================
echo         SYSTEM OPTIMIZATION AND DIAGNOSTICS        
echo ===================================================
echo  1. Run Deployment Image Service Tool (DISM Check)
echo  2. Launch Windows Memory Diagnostic
echo  3. Open Disk Defragmenter (dfrgui)
echo  4. Analyze Component Store (WinSXS Size Check)
echo  5. Back to Main Menu
echo ===================================================
set "diag_choice="
set /p "diag_choice=Select an option (1-5): "

if "!diag_choice!"=="1" goto opt_dism
if "!diag_choice!"=="2" start mdsched.exe & goto diag_submenu
if "!diag_choice!"=="3" start dfrgui.exe & goto diag_submenu
if "!diag_choice!"=="4" goto opt_winsxs
if "!diag_choice!"=="5" goto main_menu
echo Invalid option. & ping 127.0.0.1 -n 3 >nul & goto diag_submenu

:opt_dism
echo.
echo Running DISM Component Store Health Scan...
echo This verifies the integrity of critical Windows architecture system files.
dism /online /cleanup-image /checkhealth
echo.
pause
goto diag_submenu

:opt_winsxs
echo.
echo Analyzing Windows Component Store (WinSXS Size)...
echo This checks how much storage old system updates are taking up.
dism /online /cleanup-image /analyzecomponentstore
echo.
pause
goto diag_submenu


:: ===================================================
::      SUBMENU 12: CREDITS AND DOCUMENTATION
:: ===================================================
:tutorial_submenu
cls
echo ===================================================
echo             CREDITS AND DOCUMENTATION TUTORIAL          
echo ===================================================
echo  1. View Software Credits
echo  2. Read Basic Tutorial Guide
echo  3. Back to Main Menu
echo ===================================================
set "tutor_choice="
set /p "tutor_choice=Select an option (1-3): "

if "!tutor_choice!"=="1" goto view_credits
if "!tutor_choice!"=="2" goto view_guide
if "!tutor_choice!"=="3" goto main_menu
echo Invalid option. & ping 127.0.0.1 -n 3 >nul & goto tutorial_submenu

:view_credits
cls
echo ===================================================
echo                    SOFTWARE CREDITS                    
echo ===================================================
echo.
echo  This tool was proudly created and optimized by:
echo  - gemini
echo  - nyxoraRL
echo.
echo ===================================================
pause
goto tutorial_submenu

:view_guide
cls
echo ===================================================
echo               BASIC TUTORIAL / HOW TO USE          
echo ===================================================
echo.
echo  1. Administrator Rights: Essential for deep system paths.
echo     The program automatically checks and handles elevation.
echo.
echo  2. Menu Inputs: Type your chosen option number and press
echo     ENTER. Invalid choices reset safely without breaking.
echo.
echo  3. Preventive Care: Run Temp Clean option 3 and DNS Flush
echo     option 6 weekly to avoid disk clutter and network issues.
echo.
echo  4. Diagnostic Safety: Scans like SFC option 4 and DISM menu
echo     11-1 repair files using official Windows system stores.
echo.
echo  5. Emergency Fallbacks: Use Option 8 in the Power Menu
echo     to halt timers or reset stuck Safe Mode boots instantly.
echo ===================================================
pause
goto tutorial_submenu


:: ===================================================
::      SUBMENU 13: GEMINI'S SPECIAL EXTRAS (15 OPTIONS)
:: ===================================================
:geminis_lab
cls
echo ===================================================
echo               GEMINI'S SPECIAL LAB EXTRAS            
echo ===================================================
echo  1. Open God Mode Folder Creator (Secret Settings)
echo  2. Launch Direct X Diagnostic Tool (DxDiag)
echo  3. Open Disk Management Console
echo  4. Open Registry Editor (Regedit)
echo  5. Open System Configuration (Msconfig)
echo  6. Check Windows Activation Status
echo  7. Extract SFC Error Logs to Desktop (.txt)
echo  8. Safely Clear All Windows Event Viewer Logs
echo  9. Clear Thumbnail Cache (Fixes Glitched Icons)
echo 10. Generate Battery Health Report (HTML)
echo 11. Turn On Ultimate Performance Power Plan
echo 12. View System Boot Up Configuration Data
echo 13. Check PC Architecture and OS Details
echo 14. Restart Windows Explorer (Refreshes Desktop)
echo 15. [INSTALLER] Install Software Apps to PC (Winget)
echo 16. Back to Main Menu
echo ===================================================
echo  *** EXPERIMENTAL - MIGHT NOT WORK ***
echo ===================================================
set "gem_choice="
set /p "gem_choice=Select a special option (1-16): "

if "!gem_choice!"=="1" goto gem_godmode
if "!gem_choice!"=="2" start dxdiag & goto geminis_lab
if "!gem_choice!"=="3" start diskmgmt.msc & goto geminis_lab
if "!gem_choice!"=="4" start regedit & goto geminis_lab
if "!gem_choice!"=="5" start msconfig & goto geminis_lab
if "!gem_choice!"=="6" goto gem_activation
if "!gem_choice!"=="7" goto gem_sfclog
if "!gem_choice!"=="8" goto gem_clearlogs
if "!gem_choice!"=="9" goto gem_thumb
if "!gem_choice!"=="10" goto gem_battery
if "!gem_choice!"=="11" goto gem_ultimateplan
if "!gem_choice!"=="12" goto gem_bootdata
if "!gem_choice!"=="13" goto gem_sysinfo
if "!gem_choice!"=="14" goto gem_explorer
if "!gem_choice!"=="15" goto gem_installer_menu
if "!gem_choice!"=="16" goto main_menu

echo Invalid option. & ping 127.0.0.1 -n 3 >nul & goto geminis_lab

:gem_godmode
echo Creating God Mode Folder on Desktop...
mkdir "%USERPROFILE%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" >nul 2>&1
echo Done! Check your Desktop for the folder containing all settings.
ping 127.0.0.1 -n 4 >nul
goto geminis_lab

:gem_activation
echo.
slmgr /dli
pause
goto geminis_lab

:gem_sfclog
echo Extracting SFC scan error files from CBS.log...
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log > "%USERPROFILE%\Desktop\SFC_Errors.txt" 2>nul
echo Done! Only the relevant error logs have been dropped onto your Desktop as 'SFC_Errors.txt'.
pause
goto geminis_lab

:gem_clearlogs
echo.
echo Cleansing old Event Viewer logs to free space...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G" >nul 2>&1)
echo Done! System Event logs cleared completely.
ping 127.0.0.1 -n 3 >nul
goto geminis_lab

:gem_thumb
echo Clearing Thumbnail Cache...
taskkill /f /im explorer.exe >nul 2>&1
del /f /s /q /a %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db >nul 2>&1
start explorer.exe
echo Thumbnail Cache reset successfully.
ping 127.0.0.1 -n 3 >nul
goto geminis_lab

:gem_battery
echo Generating detailed Battery Health Report...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\Battery_Report.html" >nul
echo Done! Report saved to Desktop as 'Battery_Report.html'.
ping 127.0.0.1 -n 3 >nul
goto geminis_lab

:gem_ultimateplan
echo Unlocking Ultimate Performance power plan...
powercfg /duplicateScheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
echo Ultimate Performance Plan successfully unlocked!
pause
goto geminis_lab

:gem_bootdata
echo.
echo Displaying Boot Configuration Data:
echo ===================================================
bcdedit
echo ===================================================
pause
goto geminis_lab

:gem_sysinfo
echo.
echo Gathering System and Architecture Information...
echo ===================================================
systeminfo | findstr /b /c:"OS Name" /c:"OS Version" /c:"System Type" /c:"Total Physical Memory"
echo ===================================================
pause
goto geminis_lab

:gem_explorer
echo Restarting Windows Explorer shell...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo Shell refresh sequence complete.
ping 127.0.0.1 -n 2 >nul
goto geminis_lab

:gem_installer_menu
cls
echo ===================================================
echo          WINGET UNATTENDED APP INSTALLER
echo ===================================================
echo This safely pulls official installers directly from MS Windows.
echo Choose an application to install:
echo 1. Google Chrome        4. Discord
echo 2. Brave Browser        5. Steam
echo 3. Visual Studio Code   6. Back to Extras
echo ===================================================
set "inst_choice="
set /p "inst_choice=Select App (1-6): "
if "!inst_choice!"=="1" winget install Google.Chrome --silent & pause & goto gem_installer_menu
if "!inst_choice!"=="2" winget install Brave.Brave --silent & pause & goto gem_installer_menu
if "!inst_choice!"=="3" winget install Microsoft.VisualStudioCode --silent & pause & goto gem_installer_menu
if "!inst_choice!"=="4" winget install Discord.Discord --silent & pause & goto gem_installer_menu
if "!inst_choice!"=="5" winget install Valve.Steam --silent & pause & goto gem_installer_menu
if "!inst_choice!"=="6" goto geminis_lab
echo Invalid option. & ping 127.0.0.1 -n 2 >nul & goto gem_installer_menu


:: ===================================================
::      SUBMENU 14: INSTALL SCRIPT TO APPDATA
:: ===================================================
:install_script
echo.
echo Installing script payload into Local AppData folder structure...
set "target_dir=%LocalAppData%\GoatedSystemManager"
if not exist "%target_dir%" mkdir "%target_dir%"

:: Using quotes around paths protects against folder structures containing spaces
copy /y "%~f0" "%target_dir%\GoatedManager.bat" >nul

echo Generating desktop shortcut securely via pure background PowerShell strings...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$Code = { $shell = New-Object -ComObject WScript.Shell; $desktop = [System.IO.Path]::Combine([Environment]::GetFolderPath('Desktop'), 'Goated System Manager.lnk'); $shortcut = $shell.CreateShortcut($desktop); $shortcut.TargetPath = [System.IO.Path]::Combine($env:LocalAppData, 'GoatedSystemManager', 'GoatedManager.bat'); $shortcut.IconLocation = 'cmd.exe,0'; $shortcut.Save() }; & $Code"

echo Dynamic installations completed. Look for the file on your Desktop!
pause
goto main_menu


:exit
cls
echo Closing down terminal workspace. Have a good one!
ping 127.0.0.1 -n 2 >nul
exit /b