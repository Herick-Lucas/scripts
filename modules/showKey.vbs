Option Explicit 
Dim objshell, Caminho, ChaveDigitalProduto, Result 
Set objshell = CreateObject("WScript.Shell")
Caminho = "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\"
ChaveDigitalProduto = objshell.RegRead(Caminho & "DigitalProductId")
Dim NomeProduto, IDProduto, ChaveProduto, DadosProduto
NomeProduto  = "Nome do Produto: " & objshell.RegRead(Caminho & "ProductName")
IDProduto    = "ID do Produto: " & objshell.RegRead(Caminho & "ProductID")
ChaveProduto = "Chave Instalada: " & ConverteChave(ChaveDigitalProduto) 
DadosProduto = NomeProduto & vbNewLine & IDProduto  & vbNewLine & ChaveProduto
If vbYes = wscript.echo (DadosProduto  & vblf & vblf) then
DadosProduto 
End If
Function ConverteChave(Chave)
Const OffsetChave = 52
Dim testaWin8, MapaChars, i, j, Corrente, ChaveFinal, Ultimo, partechave1, insert
testaWin8 = (Chave(66) \ 6) And 1
Chave(66) = (Chave(66) And &HF7) Or ((testaWin8 And 2) * 4)
i = 24
MapaChars = "BCDFGHJKMPQRTVWXY2346789"
Do
Corrente = 0
j = 14
Do
Corrente = Corrente* 256
Corrente = Chave(j + OffsetChave) + Corrente
Chave(j + OffsetChave) = (Corrente \ 24)
Corrente=Corrente Mod 24
j = j -1
Loop While j >= 0
i = i -1
ChaveFinal = Mid(MapaChars, Corrente+ 1, 1) & ChaveFinal
Ultimo = Corrente
Loop While i >= 0 
partechave1 = Mid(ChaveFinal, 2, Ultimo)
insert = "N"
ChaveFinal = Replace(ChaveFinal, partechave1, partechave1 & insert, 2, 1, 0)
If Ultimo = 0 Then ChaveFinal = insert & ChaveFinal
ConverteChave = Mid(ChaveFinal, 1, 5) & "-" & Mid(ChaveFinal, 6, 5) & "-" & Mid(ChaveFinal, 11, 5) & "-" & Mid(ChaveFinal, 16, 5) & "-" & Mid(ChaveFinal, 21, 5)
End Function