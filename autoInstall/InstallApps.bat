@ECHO OFF

:Loop

CLS

ECHO 1.7zip
ECHO 2.AnyDesk
ECHO 3.GoogleChrome
ECHO 4.LibreOffice
ECHO 5.Office
ECHO 6.Sair

CHOICE /C 123456 /M "Selecione uma opcao: "

:: Note - list ERRORLEVELS in decreasing order

IF ERRORLEVEL 6 GOTO Sair
IF ERRORLEVEL 5 GOTO Office
IF ERRORLEVEL 4 GOTO LibreOffice
IF ERRORLEVEL 3 GOTO GoogleChrome
IF ERRORLEVEL 2 GOTO AnyDesk
IF ERRORLEVEL 1 GOTO 7zip

:7zip
    winget install --id=7zip.7zip -e
GOTO Loop

:AnyDesk
    winget install --id=AnyDeskSoftwareGmbH.AnyDesk -e
GOTO Loop

:GoogleChrome
    winget install -e --id Google.Chrome
GOTO Loop

:LibreOffice
    winget install --id=TheDocumentFoundation.LibreOffice -e
GOTO Loop

:Office
    pushd \\10.11.40.11\Drive-Umuprev\TI\INSTALADORES\autoInstall\Apps & start OfficeSetup.exe
GOTO Loop

:Sair