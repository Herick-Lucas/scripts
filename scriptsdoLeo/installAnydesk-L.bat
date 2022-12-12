:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SCRIPT DESENVOLVIDO POR LEONARDO CHIMENE         :::
:: EMAIL: doleobr@gmail.com  			    :::
:: DATA DE CRIACAO: 17/05/2021			    :::
:: OBJETIVO: INSTALAR ANYDESK VIA GPO        	    :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
REM Nome do Servidor onde tem a instalação do ANYDESK
set DeployServer=\\10.11.40.11\AnyDesk\

if exist "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"( GOTO ATT
) ELSE (GOTO INSTALA)

:ATT
echo Umupr3v@123 | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password
for /f "delims=" %%i in ('"C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --get-id') do set CID=%%i
echo AnyDesk alias is: %CID% > %DeployServer%%username%.txt
exit

:INSTALA
%DeployServer%AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --start-with-win --silent --create-shortcuts --create-desktop-icon
echo Umupr3v@123 | "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --set-password
for /f "delims=" %%i in ('"C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --get-id') do set CID=%%i
echo AnyDesk alias is: %CID% > %DeployServer%%username%.txt
exit

