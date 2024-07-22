#SingleInstance Force
#Include <matFunctions>
#Include <FindText>
Menu, Tray, Icon, pifmgr.dll, 15

GroupAdd, SpedG5, Visual Studio Code
GroupAdd, SpedG5, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital

SetTitleMatchMode, 2

SetaCima:="|<SetaCima>*200$12.1U3k6MAAM6k3U1U"
Zero:="|<Zero>*194$18.C2QH2mF4Wl4XlAXl8XF8WHEmCEQ0k0U|<>*122$18.lxXgxBivRCvQCnQCrQirRgjBljXzDzU"
PixelVerde:="|<>0x99C100@1.00$2.y"
;Verde:="|<>0x99C100@1.00$4.zzzzU|<>0x99C100@1.00$3.zzzU|<>0x99C100@1.00$3.zzw|<>0x99C100@1.00$6.zzzzzU"
;Verde:="|<>0x99C100@1.00$6.zzzzzU"

SomaX := 0
SomaY := 0
flagVolta := 0

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip
    return

#IfWinNotActive ahk_group SpedG5

;Ativa e desativa Entrada/Saida
    +1::
        If (Flag == "") {
            Flag := 1 
            ToolTip, Orientacao: CIMA, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            Flag := ""
            ToolTip, Orientacao: BAIXO, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return

    ;Retorno
    q::
        if (flag == "") {
            Send,^2^g
        } else {
            ;Retorno para cima
            Send,^2{Sleep 20}{Click}
            ClickOnImage(SetaCima, 0, 0, "L", "Seta Cima", X, Y)
            Click -77 430 0
        }
    Return

    ;Busca com retorno automatico
    w::
        Send,{Click 2}{Sleep 15}^c^c^3{Sleep 15}^f{BS}^v{Sleep 20}
        
        ;Verifica se achou algo
        if (ok:=FindText(X, Y, 901-150000, 88-150000, 901+150000, 88+150000, 0, 0, Zero)) {
            Exit   
        }

        ;Retorno
        Send,^2^g  
    Return

    ;Busca sem retorno
    +w::
        Send,{Click 2}{Sleep 15}^c^c^3{Sleep 15}^f{BS}^v{Sleep 20}
    Return

    ;Testar posiçoes
    F1 & Space::

        Principal:
            ;Titulo
            Gui, Font, Bold
            Gui, Font, s13
            Gui, Add, Text, x32 y30 h40, Configuracoes de pesquisa
            Gui, Font
            ;Descrição e edit 1
            Gui, Font, s11
            Gui, Add, Text, x32 y100, Quantidade a ser somada a X. Valor atual: %SomaX%: 
            Gui, Add, Edit, x320 y100 vSomaX
            ;Descrição e edit 2
            Gui, Add, Text, x32 y150, Quantidade a ser somada a Y. Valor atual: %SomaY%: 
            Gui, Add, Edit, x320 y150 vSomaY
            ;Descrição e edit 3
            Gui, Add, Text, x32 y200, Maximo de vezes de volta e soma. Max Atual: %flagVolta%
            Gui, Add, Edit, x320 y200 vflagVolta
            ;Botoes
            Gui, Add, Button, x82 y250 w100 h30 gOK, Testar
            Gui, Add, Button, x200 y250 w100 h30 gExec, Executar
            Gui, Add, Button, x318 y250 w100 h30 gCancelar, Cancelar
            Gui, Show, w500 h295, SPED X G5
        Return

        OK:
            Gui, Submit, NoHide
            GuiControl, , SomaX 
            GuiControl, , SomaY
            Gui, Destroy
            if (ok:=FindText(X:="wait", Y:=-1, 437-150000, 430-150000, 437+150000, 430+150000, 0, 0, PixelVerde)) {
                FindText().MouseTip(X, Y)
                FindText().MouseTip(X+SomaX, Y+SomaY)
            }
            Gosub, Principal
        Return

        Cancelar:
            GuiControl, , SomaX 
            GuiControl, , SomaY
            Gui, Submit, NoHide
            Gui, Destroy
        Return

        Exec:
            Gui, Destroy
            InputBox, NumCasas , Repeticao, Quantas vezes ira rodar?, , 300, 130
            IfEqual, ErrorLevel, 1, Return

            loop %NumCasas% {
                ;Procura o pixel verde para clicar corretamente no valor da seleção do CTRL F
                if (ok:=FindText(X:="wait", Y:=-1, 437-150000, 430-150000, 437+150000, 430+150000, 0, 0, PixelVerde)) {
                    ;Clicar no valor desejado
                    FindText().Click(X+SomaX, Y+SomaY, "L")

                    var2 := StrReplace(StrReplace(Clipboard, ".", ""), ",", ".")

                    ;Copia o valor do elemento selecionado com CTRL F
                    clipboard := ""
                    SetFormat, float, 0.2
                    Send,{Click}^c^c
                    ClipWait
                    Sleep 200
                    var1 := StrReplace(StrReplace(Clipboard, ".", ""), ",", ".") ;Guarda e formata primeiro valor
                    
                    if (var1 == var2) {
                        Send,^2^g  
                        Sleep 200 
                    } else {
                        ;Vai para proxima pagina e pesquisa o valor
                        Send,^3{Sleep 15}^f{BS} ^v {Sleep 20}
                        Sleep 1000

                        ;Verifica se achou algo
                        if (ok:=FindText(X, Y, 901-150000, 88-150000, 901+150000, 88+150000, 0, 0, Zero)) {
                            
                            ;Caso não achar nada volta e pega o proximo valor para pesquisar a soma
                            if (flagVolta != 0) {
                                soma := var1
                                Loop %flagVolta% {
                                    Send,^2^g  
                                    Sleep 200

                                    if (ok:=FindText(X:="wait", Y:=-1, 437-150000, 430-150000, 437+150000, 430+150000, 0, 0, PixelVerde)){
                                        FindText().Click(X+SomaX, Y+SomaY, "L")
                                        Send,{Click}^c^c
                                        ClipWait
                                        Sleep 200
                                        var2 := StrReplace(StrReplace(Clipboard, ".", ""), ",", ".")
                                        Sleep 100

                                        soma := soma + var2
                                        
                                        soma := CasaDosMilhares(soma)
                                        soma := StrReplace(soma, ".", "+")
                                        soma := StrReplace(soma, ",", ".")
                                        soma := StrReplace(soma, "+", ",")
                                        Send,^3{Sleep 15}^f{BS} %soma% {Sleep 20}
                                        Sleep 1000
                                        if (ok:=FindText(X, Y, 901-150000, 88-150000, 901+150000, 88+150000, 0, 0, Zero)){
                                            Exit
                                        }
                                    }
                                }
                            }

                        }

                        ;Retorno
                        Sleep 10
                        Send,^2^g  
                        Sleep 200                        
                    }
                }
            }
            Gosub, Principal
        Return

        GuiClose:
            Gui, Destroy
        Return

    Return

CasaDosMilhares(x, s = ",") {
    return RegExReplace(x, "\G\d+?(?=(\d{3})+(?:\D|$))", "$0" s)
}


