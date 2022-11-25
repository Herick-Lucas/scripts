cd %LOCALAPPDATA% & cd ../../../../Windows

& echo Set ArquivoExterno = CreateObject("Scripting.FileSystemObject") >> createCreateShowKey.vbs
& echo Set arq = ArquivoExterno.OpenTextFile("c:\windows\showKey.vbs",2,1) >> createCreateShowKey.vbs
& echo arq.writeLine "Option Explicit" >> createCreateShowKey.vbs
& echo arq.writeLine "Dim objshell, Caminho, ChaveDigitalProduto, Result " >> createCreateShowKey.vbs
& echo arq.writeLine "Set objshell = CreateObject("""+"WScript.Shell"+""")" >> createCreateShowKey.vbs
& echo arq.writeLine "Caminho = """+"HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\"+"""" >> createCreateShowKey.vbs
& echo arq.writeLine "ChaveDigitalProduto = objshell.RegRead(Caminho & """+"DigitalProductId"+""")" >> createCreateShowKey.vbs
& echo arq.writeLine "Dim NomeProduto, IDProduto, ChaveProduto, DadosProduto" >> createCreateShowKey.vbs
& echo arq.writeLine "NomeProduto  = """+"Nome do Produto: "+""" & objshell.RegRead(Caminho & """+"ProductName"+""")" >> createCreateShowKey.vbs
& echo arq.writeLine "IDProduto    = """+"ID do Produto: "+""" & objshell.RegRead(Caminho & """+"ProductID"+""")" >> createCreateShowKey.vbs
& echo arq.writeLine "ChaveProduto = """+"Chave Instalada: "+""" & ConverteChave(ChaveDigitalProduto) " >> createCreateShowKey.vbs
& echo arq.writeLine "DadosProduto = NomeProduto & vbNewLine & IDProduto  & vbNewLine & ChaveProduto" >> createCreateShowKey.vbs
& echo arq.writeLine "If vbYes = wscript.echo (DadosProduto  & vblf & vblf) then" >> createCreateShowKey.vbs
& echo arq.writeLine "DadosProduto " >> createCreateShowKey.vbs
& echo arq.writeLine "End If" >> createCreateShowKey.vbs
& echo arq.writeLine "Function ConverteChave(Chave)" >> createCreateShowKey.vbs
& echo arq.writeLine "Const OffsetChave = 52" >> createCreateShowKey.vbs
& echo arq.writeLine "Dim testaWin8, MapaChars, i, j, Corrente, ChaveFinal, Ultimo, partechave1, insert" >> createCreateShowKey.vbs
& echo arq.writeLine "testaWin8 = (Chave(66) \ 6) And 1" >> createCreateShowKey.vbs
& echo arq.writeLine "Chave(66) = (Chave(66) And &HF7) Or ((testaWin8 And 2) * 4)" >> createCreateShowKey.vbs
& echo arq.writeLine "i = 24" >> createCreateShowKey.vbs
& echo arq.writeLine "MapaChars = """+"BCDFGHJKMPQRTVWXY2346789"+"""" >> createCreateShowKey.vbs
& echo arq.writeLine "Do" >> createCreateShowKey.vbs
& echo arq.writeLine "Corrente = 0" >> createCreateShowKey.vbs
& echo arq.writeLine "j = 14" >> createCreateShowKey.vbs
& echo arq.writeLine "Do" >> createCreateShowKey.vbs
& echo arq.writeLine "Corrente = Corrente* 256" >> createCreateShowKey.vbs
& echo arq.writeLine "Corrente = Chave(j + OffsetChave) + Corrente" >> createCreateShowKey.vbs
& echo arq.writeLine "Chave(j + OffsetChave) = (Corrente \ 24)" >> createCreateShowKey.vbs
& echo arq.writeLine "Corrente=Corrente Mod 24" >> createCreateShowKey.vbs
& echo arq.writeLine "j = j -1" >> createCreateShowKey.vbs
& echo arq.writeLine "Loop While j >= 0" >> createCreateShowKey.vbs
& echo arq.writeLine "i = i -1" >> createCreateShowKey.vbs
& echo arq.writeLine "ChaveFinal = Mid(MapaChars, Corrente+ 1, 1) & ChaveFinal" >> createCreateShowKey.vbs
& echo arq.writeLine "Ultimo = Corrente" >> createCreateShowKey.vbs
& echo arq.writeLine "Loop While i >= 0 " >> createCreateShowKey.vbs
& echo arq.writeLine "partechave1 = Mid(ChaveFinal, 2, Ultimo)" >> createCreateShowKey.vbs
& echo arq.writeLine "insert = """+"N"+"""" >> createCreateShowKey.vbs
& echo arq.writeLine "ChaveFinal = Replace(ChaveFinal, partechave1, partechave1 & insert, 2, 1, 0)" >> createCreateShowKey.vbs
& echo arq.writeLine "If Ultimo = 0 Then ChaveFinal = insert & ChaveFinal" >> createCreateShowKey.vbs
& echo arq.writeLine "ConverteChave = Mid(ChaveFinal, 1, 5) & """+"-"+""" & Mid(ChaveFinal, 6, 5) & """+"-"+""" & Mid(ChaveFinal, 11, 5) & """+"-"+""" & Mid(ChaveFinal, 16, 5) & """+"-"+""" & Mid(ChaveFinal, 21, 5)" >> createCreateShowKey.vbs
& echo arq.writeLine "End Function" >> createCreateShowKey.vbs
& echo arq.close >> createCreateShowKey.vbs

& cscript createShowKey.vbs & cscript showKey.vbs & del createShowKey.vbs & del showKey.vbs