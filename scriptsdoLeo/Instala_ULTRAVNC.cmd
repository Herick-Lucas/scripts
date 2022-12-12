:::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SCRIPT DESENVOLVIDO POR LEONARDO DUARTE			:::
:: EMAIL: info@comoaprenderwindows.com.br		:::
:: DATA DE CRIACAO: 22/07/17						:::
:: OBJETIVO: INSTALAR ULTRAVNC NOS COMPUTADORES		:::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

REM Nome do Servidor onde tem a instalação do ULTRAVNC
set DeployServer=\\10.11.40.11\ultravnc\ULTRAVNC\

REM VERIFICA SE ULTRAVNC ESTA INSTALADO

if exist "C:\Program Files\UltraVNC\acl.txt" GOTO SAIR

if not exist "C:\Program Files\UltraVNC\acl.txt" (
mkdir "C:\Program Files\UltraVNC"
)

REM *********************************************************************
REM VERIFICO SE O SO É 32BITS OU 64 BITS
IF NOT "%ProgramFiles(x86)%"=="" (goto X64) else (goto X86)

 
:X64

copy /Y "%DeployServer%SCHook.dll" "C:\Program Files\UltraVNC\SCHook.dll"
copy /Y "%DeployServer%SCHook64.dll" "C:\Program Files\UltraVNC\SCHook64.dll"
copy /Y "%DeployServer%acl.txt" "C:\Program Files\UltraVNC\acl.txt"

start /wait %DeployServer%UltraVNC_1_2_12_X64_Setup.exe /verysilent /loadinf=%DeployServer%vncserver.inf /norestart
copy /Y "%DeployServer%ultravnc.ini" "C:\Program Files\UltraVNC\ultravnc.ini"
"%ProgramFiles%\UltraVNC\MSLogonACL.exe" /i /o "C:\Program Files\UltraVNC\acl.txt"

net stop uvnc_service
net start uvnc_service
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC\"
exit

 
:X86

copy /Y "%DeployServer%SCHook.dll" "C:\Program Files\UltraVNC\SCHook.dll"
copy /Y "%DeployServer%SCHook64.dll" "C:\Program Files\UltraVNC\SCHook64.dll"
copy /Y "%DeployServer%acl.txt" "C:\Program Files\UltraVNC\acl.txt"

start /wait %DeployServer%UltraVNC_1_2_12_X86_Setup.exe /verysilent /loadinf=%DeployServer%vncserver.inf /norestart
copy /Y "%DeployServer%ultravnc.ini" "C:\Program Files\UltraVNC\ultravnc.ini"
"%ProgramFiles%\UltraVNC\MSLogonACL.exe" /i /o "C:\Program Files\UltraVNC\acl.txt"

net stop uvnc_service
net start uvnc_service
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC\"
exit 

:SAIR
exit 