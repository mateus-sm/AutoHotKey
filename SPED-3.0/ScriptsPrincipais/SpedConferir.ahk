#Include %A_ScriptDir%\Lib\FindText.ahk
#SingleInstance Force
GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens
GroupAdd, SPED, REGISTRO - 0150 - Participante
GroupAdd, SPED, REGISTRO - C190 - ENTRADA - Analítico
GroupAdd, SPED, REGISTRO - C190 - SAIDA - Analítico
GroupAdd, SPED, REGISTRO - 0200 - Item/Produtos
GroupAdd, SPED, REGISTRO - 0450 - Informação Complementar
GroupAdd, SPED, REGISTRO - C500 - ENTRADA - Nota Fiscal/Conta de Energia Elétrica
GroupAdd, SPED, Sem título - Paint
GroupAdd, SPED, Pesquisar Dados Cadastrais

SetTitleMatchMode 2

;Imagens de referencias para clicks
Lupa:="|<Lupa>*210$18.0000z031k40M80A8Q4Ey2Fr2FX2EQ2Ey29r49X4A0860E31U0y0000U"
NFE:="|<NFE>*139$25.C2108200400031ncsl5YW4yWT1EF81g8a7XoFw"
NumeroDoc:="|<NumeroDoc>*137$107.0400000000000000014000000U04000000838000001008000000E6GHyQtkCC1llmHyQxneYYZ94UYY4YYIYZ999J99/u919899899/uGGaGGI4G2GEGGEGGI4YZAYYd8Y4YUYYWYYd99+9t9CEk760sktt9CGNY"
BaseCalcC100:="|<BaseCalcC100>*135$119.00000000200000000000w0000E000E040101C8Fl40000U000U080202mNYG8tss770stCGHUQQ50n87mGGEGG2+GWYd198+16Q8Xb7kYy43Z19G2GEI246F93819089+2GY4YUc5c2WGHG2GEFGIIZ8991NfG9swwQ3XUQwbD9UCA2SGXo"
IconeAnalitico:="|<IconeAnalitico>*204$23.00000000000000000E001k103k20DU40P080r0E360U7y10Tw20kQ43UM860sEQ0kUk1l1U1W00040008000nzzzk"
Item1Analitico:="|<Item1Analitico>*138$32.000000wyD7UE84N48222F20UUYEUD8948222S20UUY0E84N03m0sE000002"
Relatorios:="|<Relatorios>*137$50.0000000000000U000y0E402008U41000028tCtndnkWGIYYWYYDbot98dC2F1GGG+EkWGIYYWYa8nZta8aD000000002"
OBS:="|<OBS>*142$104.000000000000000000w4180001000000200E20E0000E000000M08004000040000000020QD8wQ1lQstsLXbXUU8YGF8UWN8FN89U948294YG88YH7oGCECF20WF94W294912YY4YEE8YGF8UWN1MEl9V943lkwXlk77XXoASCSC000004000000001U000000300000000080000007U00000000A008"
BaseCalcC170:="|<BaseCalcC170>*137$138.0000000000000000000000000000000100000000000000D0000400040100E0HW4Q1nw8U000400040100E0KHAW28E8XbXUQQ3XYt9C1lkI3AU20EDYYYUYY4IZ59G2GEI2As3UE8Xb7kYy43Z19G2GEI2460ME8YVY0YU44Z19G2GEI2o104E8YYoUYY4IZ59G2GEKOoW28ED7bXUQQ3bYttA1lUHmIS1sE00000000000000000000000U"
PrimeiroItemG5:="|<PrimeiroItemG5>*111$10.00020A0s3kDUz3sD0s308000002"
Klaus:="|<Klaus>*176$29.00000XE001AU002F00072SFCA44WEI8t4UYGG8l4gYEGBD7b00000E"
Localizar:="|<Localizar>*184$19.0000001kC0U1Uk0EM088064037zzXbxlVgMkqADny3ky0004|<Localizar2>*180$19.0000001sD0U0UE0EM0A8064013zzVbwkVg8MqADly3kS0004"
NumNotaKlaus:="|<NumNotaKlaus>*195$36.000000000000000010000010C483VQPY86tyEY8492kY8A12kY8A12EYM412NaM6N2D3s3l2000000000000U|<NumNotaKlaus2>*195$37.00000000000E0000080MEU75kn8E6ngEY869W8O420VAB210EW4V0k8FaNU8Y8S7k7m4000000U"
ChaveNFEG5:="|<ChaveNFEG5>*120$70.000000000000wU00049w01D4+0000MY0052E80001WE00I10gQWQ59072E438++8IbUW90E8bZDV+EPt410WWIU4N084E4++8W8FY0WV2D8bW712E1m3k000000000008"
AbrirPDFChrome:="|<AbrirPDFChrome>*130$22.0000zwU3zn0DzC0zww3znsDzDkzw03zs0Dzzkzbz3yDwDszkzbz3yDwDszkz8D3w0QDVVkwTz3XzwCTzkzzz3zzwU"
ItensG5:="|<ItensG5>*131$17.000E00Y01802NmYYK9DcGEEYWV4t0000000000003s0MA1DY4eY+ycfCdRzGjvZzz+zi+ysGfkHz0Nw0DU000001"
C197:="|<C197>*162$35.000000Aw8xyUH8l88V42aMl2814l34E2Da68U438AFa8YEMVsFsUUU00011U0004000000U"
C195:="|<C195>*162$35.000000Aw8wwUH8l90V42aO12814rX4E2DVa8U433AFa8YaMVsFtsUU00011U0004000000U|<C195-2>*160$35.0000004s8swUH8l90V42W+12814rU4E2DU28U4214Fa8YUEVsFlsUU00010U0004000000U"
C170:="|<C170>*151$35.000000As9yMUH8k98V42UWF28114W4E26968U48GAFa8EYEVsEUkUU00011U0004000000U|<C170-2>*159$35.0000004s8yMUH8k98V42UWF28114U4E26928U48G4Fa8EYEVsEUkUU00010U0004000000U"
C190:="|<C190>*160$34.000000HUXVW2N6994F0cWYF40WOE4E2Dd2F084Y96MWGF4D2C6480000EE0002000000U|<C1902>*143$35.0000004s8sMUH8l98V42W+F2814oU4E2Dd28U42G4Fa8YYEVsFkkUU00011U0004000000U"

;Funçoes
ClickOnImage(image, xOffset, yOffset, mouseClick, label, ByRef X, ByRef Y) {
    If (ok := FindText(X, Y, 572-150000, 549-150000, 572+150000, 549+150000, 0, 0, image)) {
        FindText().Click(X + xOffset, Y + yOffset, mouseClick)
        Return true
    } Else {
        MsgBox, 48, Aviso, %label% não encontrado.,1
        Return false
    }
}

ExistActivate(windowTitle) {
    If WinExist(windowTitle) {
        WinActivate
        return true ; Window exists and is activated.
    } Else {
        MsgBox, 48, Aviso, Janela "%windowTitle%" inativa.,2
        return false ; Window doesn't exist.
    }
}

ActiveActivate(windowTitle) {
    If WinActive(windowTitle) {
        WinActivate
        return true ; Window exists and is activated.
    } Else {
        MsgBox, 48, Aviso, Janela "%windowTitle%" inativa.,2
        return false ; Window doesn't exist.
    }
}

;Variaveis
FlagWASD := 0
FlagItens := 0
FlagAnalitico := 0
FlagEstado := 0

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip
    return

;Comandos para Usar em qualquer instancia, dentro ou fora do SPED
;Troca o Numlock por um Backspace
    NumLock::BackSpace
    Return

;Apresenta as coordenadas do mouse
    F1 & Space::
        MouseGetPos, xpos, ypos 
        MsgBox,4, Aviso, Posição do mouse = X -> %xpos% Y -> %ypos%.`nGostaria de copiar o comando click?
        IfMsgBox, Yes
            Clipboard = {Click %xpos% %ypos%}
        Else
    Return

;Ativa e desativa WASD
    +1::
        If (FlagWASD == 0) {
            FlagWASD := 1 
            ToolTip, WASD ativado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            FlagWASD := 0
            ToolTip, WASD desativado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return

;Ativa e desativa flag de estado -> FlagEstado
    +F3::
        If (FlagEstado == 0) {
            FlagEstado := 1 
            ToolTip, OBS fora do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            FlagEstado := 0
            ToolTip, OBS dentro do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    return        

;Abrir e minimizar a calculadora
    SC07E::
        If WinExist("Calculadora") {
            If WinActive("Calculadora") {
                Send,!{Tab}
            } Else {
                WinActivate 
            }
        } Else {
            Run Calc.exe
            WinWaitActive, ahk_exe Calc.exe
            If WinActive("Calculadora") {
                MsgBox, 48, Aviso, A Calculadora foi aberta.,1
            } Else {
                MsgBox, 48, Aviso, A Calculadora não pôde ser aberta.,1
            }
        }
    Return   

#IfWinActive ahk_group SPED
;Comandos que só funcionam dentro do SPED
;Pesquisa de nota
    NumpadSub::
        If WinActive("REGISTRO - C100 - ENTRADA") {
            if ClickOnImage(NumeroDoc, 239, 0, "L", "NumeroDoc", X, Y) {
               Send,^c 
               if ClickOnImage(BaseCalcC100, 239, 0, "L", "Base de Cálculo C100", X, Y) {
                    If ExistActivate("REGISTRO - C100 - ENTRADA") {
                    Send,^f^v
                    }
                }
            }
        } Else {
            if ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y) {
                Send, ^c
                if ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y) {
                    if ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
                        if ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y) {
                            Send, {PrintScreen}
                        }
                    }
                }
            }
            FlagItens := 0
            FlagWASD := 0
        }
    Return

;Voltar do analitico para a Pesquisa
    NumpadAdd::
        If WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            Send,{Tab 5}
        } Else {
            ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y)
        }
    Return

;Pular 5 espaços analitico
    '::
        If WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            switch FlagAnalitico {
                Case 0:
                    Send,{Tab 5}
                    FlagAnalitico := 1
                Return  
                Case 1:
                    Send,{Tab 5}
                    FlagAnalitico := 2
                Return 
                Case 2:
                    Send,{Enter}!s
                    FlagAnalitico := 0
                Return    
            }
        } Else {
            Send,{tab 5}
        }  
    Return

;Completar espaço zerado
    \::
        Send,0{Enter}0{Enter}0{Enter}0
    Return

;Guardar tela no paint
    PgDn::
        Send,{PrintScreen}{Sleep 20}
            If ExistActivate("Paint") {
                Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
            } Else {
                Run, mspaint.exe
                WinWaitActive, ahk_exe mspaint.exe

                If ActiveActivate("Paint") {
                    MsgBox, 48, Aviso, O Paint foi aberto para uso do comando.,1
                } 
            }    
    Return

;Recalcula Analitico
    ScrollLock::
        If ExistActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
            if ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico", X, Y) {
                Send, {Sleep 40}{Enter}{Enter}
                if ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
                    if ClickOnImage(Item1Analitico, 106, 20, "L", "Item 1 Analitico", X, Y) {
                        FlagItens := 0
                    }
                }
            }
        }
    Return

;Combinas dois ultimos comandos
    PgDn & ScrollLock::
        Send,{PrintScreen}{Sleep 20}

        If WinExist("Paint") {
            WinActivate
            Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
        } Else {
            Run, mspaint.exe
            WinWaitActive, ahk_exe mspaint.exe

            If WinActive("Paint") {
                MsgBox, 48, Aviso, O Paint foi aberto para uso do comando.,1
            } Else {
                MsgBox, 48, Aviso, O Paint não pôde ser aberto.,1
            }

        }

        If ExistActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
            if ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico", X, Y) {
                Send,{Sleep 40}{Enter}{Enter}
                if ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
                    if ClickOnImage(Item1Analitico, 106, 20, "L", "Item 1 Analitico", X, Y) {
                        FlagItens := 0
                    }
                }
            }
        }
    Return

;Volta para o analitico
    XButton1::
        if ClickOnImage(Relatorios, 0, 0, "L", "Relatorios", X, Y) {
            Send,{Sleep, 10}{Click, 611, 537}
        }   
    Return

;Exclui Observação
    XButton2::
        if ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y) {
            if ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y) {
                if ClickOnImage(C195, 0, 0, "L", "C195", X, Y) {
                    if ClickOnImage(OBS, 0, 19, "L", "OBS", X, Y) {
                        Send, +{Tab}{Enter 2}{Sleep 10}
                        ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y)
                    }
                }
            }
        }
    Return

;Ir para Itens a partir da pesquisa
    F1::
        If (FlagItens == 0) {
            If ExistActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if ClickOnImage(C170, 0, 0, "L", "C170", X, Y) {
                    FindText().Click(X + 30, Y + 90, "L")
                }
            }
        } Else {
            If ExistActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if ClickOnImage(C170, 0, 0, "L", "C170", X, Y) {
                    FindText().Click(X + 20, Y + 145, "L")  
                }
            }
        }
    Return

;Ir para itens e filtrar por CST
    F1 & F2::
        If (FlagItens == 0){
            If ActiveActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if ClickOnImage(C170, 0, 0, "L", "C170", X, Y) {
                    Send, {Sleep 10}
                    if ClickOnImage(YourNextImage, -13, 31, "L", "YourNextImage", X, Y) {
                        Send, {Sleep 10}
                        if ClickOnImage(AnotherImage, 3, 69, "L", "AnotherImage", X, Y) {
                            Send, {PgUp}{Down 8}{Enter}
                            FlagItens := 1
                        }
                    }
                }
            }
        } Else {
            If ActiveActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
                if ClickOnImage(C170, 0, 0, "L", "C170", X, Y) {
                    FindText().Click(X + 540, Y + 64, "L")
                }  
            }
        }
    Return

;Ir para Analitico pós validaçao
    F2::
        If ClickOnImage(C190, 0, 0, "L", "C190", X, Y) {
            FindText().Click(X, Y + 90, "L")
        }
    Return

;Ir para Obs e alterar codigo da observação.
    F3::
        If (FlagEstado == 0) {
            if ClickOnImage(C195, 0, 0, "L", "C195", X, Y) {
                FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 1403{Enter 5}
            }
        } Else {
            if ClickOnImage(C195, 0, 0, "L", "C195", X, Y) {
                FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 2403{Enter 5}
            }
        }
    Return

;Alterar valor da observação
    F4::
        If (FlagEstado == 0) {
            if ClickOnImage(C197, 0, 100, "L", "C197", X, Y) {
                Send,{Click 2}{Sleep 20}{Tab 2}1403{Enter 9}{Sleep 20}
                FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}{Tab 2}1403{Tab 6}0{Enter}+{Tab}
            }
        } Else {
            if ClickOnImage(C197, 0, 100, "L", "C197", X, Y) {
                FindText().Click(X, Y+100, "L")
                Send,{Click 2}{Sleep 20}{Tab 2}2403{Enter 9}{Sleep 20}
                FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}{Tab 2}2403{Tab 6}0{Enter}+{Tab}
            }
        }
    Return

;Empresa com erro de CST
    ;Em especial casos onde os erros do analitico apontam duplicidade de CST
    ;Sair da primeira tela apontando o erro e voltando para a nota será necessario pesquisar ela novamente
        ;Pesquisar a nota com erro apontada pelo relatorio
            NumpadMult::
                Send,{Click 924 17}{Sleep 20}{Click 179 199}{Sleep 20}{Tab 9}{Sleep 40}{Enter}{Sleep 20}{Tab 7}{Sleep 20}^c{Sleep 20}{Click 924 17}{Sleep 20}{Click 1236 229}{Sleep 20}{Click 306 266}{Sleep 20}{Down 5}{Sleep 20}{Click 444 269}{Sleep 20}{Down 2}{Sleep 20}{Enter}{Sleep 20}{Tab}{Sleep 20}^v{Sleep 20}{Tab}{Sleep 20}{Enter}{Sleep 20}{Tab 5}{Down}{Sleep 20}{PrintScreen}{Sleep 20}
                If ExistActivate("Paint") {
                    Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
                }
            Return

;Da inicio ao lançamento de uma nota do 0, a partir do numero dela na barra de pesquisa do SPED
    F5 & F6::
        If ExistActivate("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração") {
            Send, ^c{Sleep 40}
            If ExistActivate("Google Chrome") { ;{Sleep 40}{Click 918 409}
                if ClickOnImage(Klaus, 0, 0, "L", "Klaus", X, Y) {
                    Send,{Sleep 40}
                    if ClickOnImage(Localizar, 0, 0, "L", "Localizar", X, Y) {
                        Send,{Sleep 40}
                        if ClickOnImage(NumNotaKlaus, 0, 0, "L", "Numero da nota - Klaus", X, Y) {
                            Send,{Sleep 40}^v{Sleep 40}{Tab}{Sleep 40}{Right}{Sleep 40}{Tab 2}{Sleep 40}{Enter}{Sleep 80}
                            If ExistActivate("Sped Fiscal") {
                                if ClickOnImage(IconeAnalitico, 0, -60, "L", "Icone Analitico", X, Y) {
                                    Send,{Sleep 20}{Tab 7}{Sleep 20}^v{Sleep 20}{Enter}{Sleep 40}
                                    If ExistActivate("Lançamentos Fiscais") {
                                        Send,{Sleep 40}!h{Sleep 40}^v{Sleep 40}{Enter}{Sleep 100}
                                        if ClickOnImage(ChaveNFEG5, 0, 20, "L", "Chave NFE G5", X, Y) {
                                            Send, {Sleep 40}{Click 2}{Sleep 40}{Click Right}{Sleep 40}{Down 4}{Sleep 20}{Enter}{Sleep 40}
                                            If ExistActivate("Sped Fiscal") {
                                                Send,{Sleep 40}{Tab 7}{Sleep 40}^v{Sleep 40}+{Tab 10}{Sleep 40}
                                                If ExistActivate("Google Chrome") {
                                                    Send,{Sleep 40}
                                                    ClickOnImage(AbrirPDFChrome, 0, 0, "L", "Abrir PDF no Chrome", X, Y)
                                                }
                                            }
                                        }
                                    } 
                                }
                            }
                        }  
                    }
                }
            } 
        }
    Return

;Troca o frete
    ;f::
    ;    Send,{Enter}{Sleep 20}{Tab 13}{Sleep 20}{Down}{Sleep 20}+{Tab}{Sleep 20}{Enter}!s{Sleep 20}{Down}
    ;Return

;Esquema WASD, pode ser ativado ou desativado
    #If FlagWASD == 1

        w::send,{up}
        Return

        s::ClickOnImage(X, 0, 0, "L", "X", X, Y)
        Return

        d::Right
        Return 
        +d::Send,{Right 10}
        Return

        a::Left
        Return
        +a::Send,{Left 10}
        Return

    Return

Return

#IfWinNotActive, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
;Comandos que só funcionam fora da janela principal de correção do SPED e a tecla original não perde a função dentro dele
;Pesquisar nota G5
    Home::
        Send,^v{Enter}
        If ExistActivate("Lançamentos Fiscais") {
            if ClickOnImage(ItensG5, 103, 6, "L", "Itens G5", X, Y) {
                Send,{Sleep 20}^{Enter}{Sleep 20}
                WinWaitActive, Itens da NF
                ClickOnImage(PrimeiroItemG5, 0, 0, "L", "Primeiro Item G5", X, Y)
            }   
        }
    Return

;Sair da nota no G5
    End::
        If ExistActivate("Itens da NF") {
            WinClose
            Send,{Sleep 20}!n{Sleep 20}!h
        }
    Return

Return    

;Alterar base do ICMS
    Insert::
        ClickOnImage(BaseCalcC170, 125, -24, "L", "Base Calc C170", X, Y)
    Return

#IfWinNotActive, ahk_group SPED
;Comandos que funcionam fora do SPED e a tecla original não perde a função dentro dele

;Copiar itens Klaus para 1556
    Delete::
        If ExistActivate(".pdf - Google Chrome") {
            Send, ^c{Sleep 40}
            If ExistActivate("Sped Fiscal") {
                Send,{Right}{Sleep 20}^v{Sleep 20} -{Space}
                ExistActivate(".pdf - Google Chrome")
            } 
        }     
    Return

Return      
