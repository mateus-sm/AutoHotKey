﻿#SingleInstance Force
#Include <FindText>
#Include <matFunctions>
#Include <Acc>
#Include <UIA_Interface>
#Include <Gdip>
#Include <ScreenClip2Win>
Menu, Tray, Icon, Shell32.dll, 14

GroupAdd, SPED, Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital
GroupAdd, SPED, Sistema Público de Escrituração Digital - EFD Contribuições
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica
GroupAdd, SPED, REGISTRO - C100 - ENTRADA - Nota Fiscal
GroupAdd, SPED, REGISTRO - C170 - ENTRADA - Itens
GroupAdd, SPED, REGISTRO - 0150 - Participante
GroupAdd, SPED, REGISTRO - C190 - ENTRADA - Analítico
GroupAdd, SPED, REGISTRO - C190 - SAIDA - Analítico
GroupAdd, SPED, REGISTRO - 0200 - Item/Produtos
GroupAdd, SPED, REGISTRO - 0450 - Informação Complementar
GroupAdd, SPED, REGISTRO - C500 - ENTRADA - Nota Fiscal/Conta de Energia Elétrica
GroupAdd, SPED, REGISTRO - C590 - ENTRADA - Registro Analítico de NF Elétrica
GroupAdd, SPED, REGISTRO - H010 - INVENTÁRIO
GroupAdd, SPED, Sem título - Paint
GroupAdd, SPED, Pesquisar Dados Cadastrais
GroupAdd, SPED, REGISTRO - H010 - INVENTÁRIO

SetTitleMatchMode 2

;Imagens de referencias para clicks
;Imagens SPED
piscof:="|<pis/cofins>*131$23.E0waU15FC2+WY4Jp8D8+EEEIUUca11C"
Lupa:="|<Lupa>*210$18.0000z031k40M80A8Q4Ey2Fr2FX2EQ2Ey29r49X4A0860E31U0y0000U"
NFE:="|<NFE>*139$25.C2108200400031ncsl5YW4yWT1EF81g8a7XoFw"
NumeroDoc:="|<NumeroDoc>*137$72.m000000E0200mGTnbC1lkCCCeGGIYG2GEGGFeGGLoG2GEGGEaGGI4G2GEGGEaGGIYG2GEGGFWSGHYA1lUCACU"
BaseCalcC100:="|<BaseCalcC100>*135$53.200U0gaN4Ys771EAm1+EGG2UFb2IUYY50V1Yd198+1O0dG2GEKOoWU"
IconeAnalitico:="|<IconeAnalitico>*197$14.0U0Q07U3s0q0Bk6A1zUzsA770lUCs1g0T03U"
Item1Analitico:="|<Item1Analitico>*138$32.000000wyD7UE84N48222F20UUYEUD8948222S20UUY0E84N03m0sE000002"
Relatorios:="|<Relatorios>*137$50.0000000000000U000y0E402008U41000028tCtndnkWGIYYWYYDbot98dC2F1GGG+EkWGIYYWYa8nZta8aD000000002"
OBS:="|<OBS>*142$73.1000010000007YSC0siQQw/loGF8UWN8FN89W98YEF8aDcYQV4YG88YEY4+GEWG944H8/269AD8wQ1lssx37XU02000000000s"
BaseCalcC170:="|<BaseCalcC170>*137$65.E0404sV70QyU080/9aF149C1lkI3AU20GY4YUc4Nk70Z8991E8EM1V+EGG2UKU80WIUYY5ah8UW5"
C197:="|<C197>*162$35.000000Aw8xyUH8l88V42aMl2814l34E2Da68U438AFa8YEMVsFsUUU00011U0004000000U|<C197-2>*162$35.0000004s8syUH8l88V42W8V2814l04E2Da28U4284Fa8YEEVsFkUUU00010U0004000000U"
C195:="|<C195>*162$35.000000Aw8wwUH8l90V42aO12814rX4E2DVa8U433AFa8YaMVsFtsUU00011U0004000000U|<C195-2>*160$35.0000004s8swUH8l90V42W+12814rU4E2DU28U4214Fa8YUEVsFlsUU00010U0004000000U"
C170:="|<C170>*151$35.000000As9yMUH8k98V42UWF28114W4E26968U48GAFa8EYEVsEUkUU00011U0004000000U|<C170-2>*159$35.0000004s8yMUH8k98V42UWF28114U4E26928U48G4Fa8EYEVsEUkUU00010U0004000000U|<c170m2>*146$25.C2DaAX0YY2UWG0EF908MYU48GNW497V238"
C190:="|<C190>*137$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738|<C190-2>*152$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738"
SetaBaixo:="|<SetaBaixo>*191$29.0004G0068Y004F8008WE00F4UH0W91y14G0k28Y1k4F8Dk8WE90F4U00W90014G0028Y004F8008WM|<>*186$34.00000800000U0000200000800000U0a00207s00806000U0Q00207s00809000U0000200000800000U0000200000+"
Operacao:="|<Operacao>*137$28.01000040071lkCE99190YQ4Y2GEGE99190Qw38"
Unitario:="|<Unitario>*146$15.00E54087bjYdAZ7YdAZ9Yhw"

;Imagens Chrome
Klaus:="|<Klaus>*176$29.00000XE001AU002F00072SFCA44WEI8t4UYGG8l4gYEGBD7b00000E"

;Variaveis
FlagItens := ""
FlagEstado := ""

ClickACC(oAcc) {
    oRect := Acc_Location(oAcc)
    CoordMode, Mouse, Screen
    vCurX := oRect.x + oRect.w/2
    vCurY := oRect.y + oRect.h/2
    MouseClick,, % vCurX, % vCurY
    oAcc := oRect := ""
}

;Label para usar timer na notificação das flags
    RemoveToolTip:
    ToolTip
    Return

;Comandos para Usar em qualquer instancia, dentro ou fora do SPED
;Troca o Numlock por um Backspace
    ;NumLock::BackSpace
    ;Return

;click & drag to select area to clip
    XButton1 & RButton::SCW2_ScreenClip2Win() 

;destroys all screen clipping windows.
    +Esc::SCW2_DestroyAllClipWins()

;Melhora navegaçao dos itens
;Fecha a aba aberta em baixo dos itens
    +Down::ClickOnImage(SetaBaixo, 0, 0, "L", "SetaBaixo", X, Y)
    Return

;Vai direto para base de calculo
    +Right::Send,{Right 13}
    Return

;Volta a mesma quantidade que o comando anterior
    +Left::Send,{Left 13}
    Return

;Apresenta as coordenadas do mouse
    F1 & Space::
        MouseGetPos, xpos, ypos
        MsgBox, 4, Aviso, Posição do mouse = X -> %xpos% Y -> %ypos%.`nGostaria de copiar o comando click?
        IfMsgBox, Yes
            Clipboard = {Click %xpos% %ypos%}
        Else
    Return

;Ativa e desativa flag de estado -> FlagEstado
    +F3::
        If (FlagEstado == "") {
            FlagEstado := 1
            ToolTip, OBS fora do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        } Else {
            FlagEstado := ""
            ToolTip, OBS dentro do estado, 1115, 972
            SetTimer, RemoveToolTip, -3000
        }
    Return

;Abrir e minimizar a calculadora
    SC07E::
        If WinExist("Calc") {
            If WinActive("Calc") {
                Send,!{Tab}
            } Else {
                WinActivate
            }
        } Else {
            Run Calc.exe
            WinWaitActive, ahk_exe Calc.exe
        }
    Return

;Lança componentes principais da nota fiscal
    Ctrl & Numpad1::
        InputBox, NomePartici, Nome do participante, Digite o nome do participante:, , 300, 130
        IfEqual, ErrorLevel, 1, Return
        InputBox, Serie, Serie, Digite a Serie:, , 300, 130
        IfEqual, ErrorLevel, 1, Return
        InputBox, Data, Data, Digite a Data:, , 300, 130
        IfEqual, ErrorLevel, 1, Return
        InputBox, TipoPag, Tipo de Pagamento, Digite o tipo de pagamento:, , 300, 130
        IfEqual, ErrorLevel, 1, Return
        InputBox, Valor, Valor da NFE, Digite o valor da NFE:, , 300, 130
        IfEqual, ErrorLevel, 1, Return
        InputBox, NumNFE, Numero da NFE, Digite o numero da NFE:, , 300, 130
        IfEqual, ErrorLevel, 1, Return

        ExistActivate("REGISTRO - C100 - ENTRADA - Nota Fiscal")
        ClickOnImage(NumeroDoc, 434, -23, "L", "NumeroDoc", X, Y)
            Send,{Sleep 5}%NomePartici%{Tab 2}{Sleep 5}%NumNFE%{Tab}{Sleep 5}%Serie%{Tab}{Sleep 5}%Data%{Tab}{Sleep 5}%Data%{Tab}{Sleep 5}%TipoPag%{Tab 2}{Sleep 5}
            Send,{Delete}9{Enter 3}
            Send,0{Enter}{Sleep 5}0{Enter}{Sleep 5}0{Enter}{Sleep 5}0{Tab}
            Send,{Sleep 5}%Valor%{Tab}{Sleep 5}%Valor%{Tab}
            loop 10 {
                Send,0{Enter}{Sleep 5}
            }
    Return

#IfWinActive ahk_group SPED

    +NumpadMult::
            ;Pegar a chave da nfe
            ClickOnImage(NumeroDoc, 230, 95, "L", "Chave NFE", X, Y)
            Sleep, 20
            Send, ^c^c
            Sleep, 40

            Send,{Shift Down}1{Shift Up}
            WinWaitActive, Extrator XML
            Sleep, 20
            Send,!x
            Sleep, 20
            Send,!b
    Return

    +NumpadSub::
        ;pagedown + ScrollLock
        InputBox, CFOP, CFOP para filtrar, Digite o CFOP a ser filtrado:, , 300, 130
        IfEqual, ErrorLevel, 1, Return

        MsgBox, 36, Pesquisar, Pesquisar por Numero da nota?
        IfMsgBox No
            OP := 0
        else
            OP := 1
        IfEqual, ErrorLevel, 1, Return

        ExistActivate("Sped Fiscal - EFD ICMS/IPI")

        if (OP != 0) {
            ClickOnImage(Lupa, -200, 37, "L", "Caixa Pesquisa", X, Y)
                Send,{Sleep 40}
                Send,{Click 2}
                Send,^c^c

            ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y)
            ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
        } else {
            ClickOnImage(Lupa, -200, 37, "L", "Caixa Pesquisa", X, Y)
            ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y)
            ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)

            ;Pegar a chave da nfe
            ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
                Send,{Click 2}
                Send,{Tab}
                Sleep, 40
                ;Send, {Tab 15}
                WinWaitActive, REGISTRO - C100
                Sleep, 1000
                ClickOnImage(NumeroDoc, 230, 95, "L", "Chave NFE", X, Y)
                Sleep, 20
                Send, ^c^c
                Sleep, 40
                WinClose, REGISTRO - C100
                ;Send, {Esc}{Esc}
        }

        ;F1 + F2
        ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
            Send,{Sleep 10}
        ClickOnImage(C170, -13, 31, "L", "Lupa Itens", X, Y)
            Send,{Sleep 10}

        ClickOnImage(C170, 3, 69, "L", "Caixa de seleção", X, Y)
            Send,{PgUp}{Down 9}{Enter}{Sleep 20}{Tab}{Sleep 20}%CFOP%{Sleep 20}{Tab}{Sleep 20}{Enter}
        FlagItens := 1
            Send,{Sleep 80}

        ;Achar nota no extrator
        if (OP != 0) {
            Send,{Shift Down}1{Shift Up}
            WinWaitActive, Extrator XML
            Send,{Space}
            WinWaitActive, Selecione
            Send,^V
            Sleep 1000
            Send,{Tab 3}
            Send,{Space}{Enter}
            WinWaitActive, Extrator XML
            WinWaitActive, Extrator XML
            Sleep, 80
            Send,{Tab 7}
            Send,{Enter}
            WinWaitActive, Dados Item
            send,{Tab 2}
            Send,{Enter}
            Sleep 40
            Send,%CFOP%
            Sleep 40
            Send,{Enter}
            WinWaitActive, Extrator XML
            Send,{Enter}
        } else {
            Send,{Shift Down}1{Shift Up}
            WinWaitActive, Extrator XML
            Send,{Space}
            WinWaitActive, Extrator XML
            Sleep, 80
            Send,{Tab 7}
            Send,{Enter}
            WinWaitActive, Dados Item
            send,{Tab 2}
            Send,{Enter}
            Sleep 40
            Send,%CFOP%
            Sleep 40
            Send,{Enter}
            WinWaitActive, Extrator XML
            Send,{Enter}
        }

        ;F1
        ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
        FindText().Click(X + 20, Y + 145, "L")
            Send,{Sleep 80}

        ;Caso CFOP for 1403 ou 2403, pula a etapa de deixar os itens com a base em evidencia
        if (!(CFOP == 1403 or CFOP == 2403)) {
            ;shift right
            Send,{Right 13}
            ;shift down
            ClickOnImage(SetaBaixo, 0, 0, "L", "SetaBaixo", X, Y)
                Send,{Sleep 80}
        } else {
            ;shift down
            ClickOnImage(SetaBaixo, 0, 0, "L", "SetaBaixo", X, Y)
                Send,{Sleep 80}            
        }

        ;ExistActivate("Extrator XML")
        ExistActivate("Dados Item")

    return    

    NumpadDiv::
        If WinExist("EFD ICMS/IPI") {
            if WinActive("REGISTRO - C190") or WinActive("REGISTRO - C590") {
                op1 := 0
                op2 := 0
                ClickOnImage(Operacao, 158, 0, "L", "Valor da operaçao", X, Y)
                SetFormat, float, 0.2
                    Send,^c^c
                op1 := StrReplace(Clipboard, ",", ".")
                Send,{Enter}^c^c
                op2 := StrReplace(Clipboard, ",", ".")
                diff := op1 - op2
                diff := StrReplace(diff, ".", ",")
                    Send,{Tab 4}{Sleep 5}%diff%{Tab}+{Tab}
            }
            If WinActive("REGISTRO - C170") {
                op1 := 0
                op2 := 0
                ClickOnImage(BaseCalcC170, -175, -23, "L", "ALQ", X, Y)
                SetFormat, float, 0.2
                    Send,{Sleep 5}^c^c
                op1 := Clipboard
                Send,{Tab}^c^c
                op2 := StrReplace(Clipboard, ",", ".")
                alq := (op1 * op2) / 100
                alq := StrReplace(alq, ".", ",")
                    Send,{Tab}{Sleep 5}%alq%
            }  
            if WinActive("REGISTRO - H010 - INVENTÁRIO") {
                op1 := 0
                op2 := 0
                ClickOnImage(unitario, -120, 0, "L", "ALQ", X, Y)
                SetFormat, float, 0.2
                    Send,{Sleep 5}^c^c
                op1 := (Clipboard, ",", ".")
                Send,{Tab}^c^c
                op2 := StrReplace(Clipboard, ",", ".")
                alq := op1 * op2
                alq := StrReplace(alq, ".", ",")
                    Send,{Tab}{Sleep 5}%alq%{Sleep 5}{TAB}{BS}0{Sleep 5}{TAB 2}
            }     
        }
        If WinActive("REGISTRO - H010") {
            if ClickOnImage(Unitario, -125, 0, "L", "Unitario", X, Y) {
                SetFormat, float, 0.2
                    Send,{Sleep 5}^c^c
                op1 := Clipboard
                Send,{Tab}^c^c
                op2 := StrReplace(Clipboard, ",", ".")
                alq := op1 * op2
                alq := StrReplace(alq, ".", ",")
                    Send,{Tab}{Sleep 5}%alq%
                ClickOnImage(Unitario, -125, 0, "L", "Unitario", X, Y)
            }
        }

        ;Pis/Cofins
        If WinExist("EFD Contribuições") {
            If WinActive("REGISTRO - C170 - ENTRADA - Itens Do Documento") {
                if ClickOnImage(piscof, 100, -25, "L", "ALQ", X, Y) {
                    ;Pis
                    SetFormat, float, 0.2
                    Send,{Sleep 5}^c^c
                    op1 := StrReplace(Clipboard, ",", ".")
                    Send,{Tab 2}^c^c
                    op2 := StrReplace(Clipboard, ",", ".")
                    alq := (op1 * op2) / 100
                    alq := StrReplace(alq, ".", ",")
                    Send,{Tab 2}{Sleep 5}%alq%

                    ;Cofins
                    Send, {Tab 3}{Sleep 5}
                    SetFormat, float, 0.2
                    Send,{Sleep 5}^c^c
                    op1 := StrReplace(Clipboard, ",", ".")
                    Send,{Tab 2}^c^c
                    op2 := StrReplace(Clipboard, ",", ".")
                    alq := (op1 * op2) / 100
                    alq := StrReplace(alq, ".", ",")
                    Send,{Tab 2}{Sleep 5}%alq%
                }
            }
        }
    Return

;Tira print da tela, guarda, recalcula analitico, entra no cfop especifico, 
;fica na posição, pesquisa nota no g5, e entra em itens
    End & ScrollLock::
        ;pagedown + ScrollLock
        InputBox, CFOP, CFOP para filtrar, Digite o CFOP a ser filtrado:, , 300, 130
        IfEqual, ErrorLevel, 1, Return
        ;Vai para o analitico
        ClickOnImage(C190, 0, 0, "L", "C190", X, Y)
        Sleep, 40
        ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico", X, Y)
        FlagItens := ""
            Send,{Sleep 80}
        ;Pagedown
        Send,{PrintScreen}
            if (ok:=FindText(X, Y, 114-150000, 491-150000, 114+150000, 491+150000, 0, 0, Item1Analitico)) {
                ; FindText().Click(X-97, Y-14, "L")
                Y := Y - 15

                ;https://www.autohotkey.com/boards/viewtopic.php?t=90933&p=401958
                WinGetPos, X, , WinWidth, , Sped Fiscal
                w := WinWidth
                h = 150

                SCW2_ScreenClip2WinAnalitico(X, Y, w, h)

                ;Get Taskbar height
                WinGetPos,,, tbW, tbH, ahk_class Shell_TrayWnd

                Y2 := A_ScreenHeight - tbH - h - 5

                ;WinActivate, ScreenClippingWindow
                WinMove X, Y2
            }

        ;NumpadSub para reiniciar menu de itens, sem a parte de voltar para pesquisa
        ExistActivate("Sped Fiscal - EFD ICMS/IPI")

        ClickOnImage(Lupa, -200, 37, "L", "Caixa Pesquisa", X, Y)
            Send,{Sleep 80}
            Send,^c^c

        ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y)
        ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
        ;F1 + F2
        ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
            Send,{Sleep 10}
        ClickOnImage(C170, -13, 31, "L", "Lupa Itens", X, Y)
            Send,{Sleep 10}

        ClickOnImage(C170, 3, 69, "L", "Caixa de seleção", X, Y)
            Send,{PgUp}{Down 9}{Enter}{Sleep 20}{Tab}{Sleep 20}%CFOP%{Sleep 20}{Tab}{Sleep 20}{Enter}
        FlagItens := 1
            Send,{Sleep 80}
        ;F1
        ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
        FindText().Click(X + 20, Y + 145, "L")
            Send,{Sleep 80}

        ;Caso CFOP for 1403 ou 2403, pula a etapa de deixar os itens com a base em evidencia
        if (CFOP == 1403 or CFOP == 2403) {

        } else {
            ;shift right
            Send,{Right 11}
            Send,{Sleep 80}
            ;shift down
            ClickOnImage(SetaBaixo, 0, 0, "L", "SetaBaixo", X, Y)
                Send,{Sleep 80}
        }

        ;end
        If WinExist("Itens da NF") {
            WinActivate
            WinClose
                Send,{Sleep 20}!n{Sleep 20}!h{Sleep 20}^v{Sleep 20}{Enter}
        } else {
            ExistActivate("Lançamentos Fiscais")
                Send,{Sleep 20}!h{Sleep 20}^v{Sleep 20}{Enter}
        }

        ;home
        ExistActivate("Lançamentos Fiscais")
        Sleep,10

        WinGet, hWnd, ID, A
        ItensG5 := ACC_Get("Object", "4.17.4.2.4.23.4.4", 0, "ahk_id" hWnd)
        ClickACC(ItensG5)

        Send,{Sleep 20}^{Enter}{Sleep 20}

        WinWaitActive, Itens da NF
        WinGet, hWnd, ID, A
        PrimeiroItemG5 := ACC_Get("Object", "4.8", 0, "ahk_id" hWnd)
        ClickACC(PrimeiroItemG5)
    Return

;Comandos que só funcionam dentro do SPED
;Pesquisa de nota
    NumpadSub::
        If WinExist("EFD ICMS/IPI") {
            If WinActive("REGISTRO - C100 - ENTRADA") {
                ClickOnImage(NumeroDoc, 239, 0, "L", "NumeroDoc", X, Y)
                    Send,^c^c
                ClickOnImage(BaseCalcC100, 239, 0, "L", "Base de Cálculo C100", X, Y)
                ExistActivate(".pdf")
                    Send,^f^v

            } Else {
                ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y)
                ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
                ClickOnImage(C190, 0, 0, "L", "C190", X, Y)
                ClickOnImage(Lupa, -200, 37, "L", "Caixa Pesquisa", X, Y)
                    Send,{PrintScreen}
                FlagItens := ""
            }
        }

        ;PisCofins
        If WinExist("Sistema Público de Escrituração Digital - EFD Contribuições") {
            ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y)
            ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
            ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
            ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y)
            Send,{PrintScreen}
            
            FlagItens := ""
        }
    Return

;Voltar do analitico para a Pesquisa
    NumpadAdd::
        If WinActive("REGISTRO - C190 - ENTRADA - Analítico") {
            Send,{Tab 5}
        } Else {
            ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y)
                Send,{Click}
        }
    Return

    +NumpadAdd::
    If WinActive("Sped Fiscal") {
        ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
            Send,{Click 2}
            Sleep 40
            Send, {Tab 16}
    }
    Return

;Pular 5 espaços analitico
    '::
        if WinActive("REGISTRO - C190") or WinActive("Pesquisar Dados Cadastrais") {
            Send,{tab 5}
        }
    Return

;Completar espaço zerado
    \::
        Send,0{Enter}0{Enter}0{Enter}0
    Return

;Guardar tela no paint ;Só funciona v1 + 32bit
    PgDn::
        Send,{PrintScreen}{Sleep 20}
        if (ok:=FindText(X, Y, 114-150000, 491-150000, 114+150000, 491+150000, 0, 0, Item1Analitico)) {
            ; FindText().Click(X-97, Y-14, "L")
            Y := Y - 15

            ;https://www.autohotkey.com/boards/viewtopic.php?t=90933&p=401958
            WinGetPos, X, , WinWidth, , Sped Fiscal
            w := WinWidth
            h = 150

            SCW2_ScreenClip2WinAnalitico(X, Y, w, h)

            ;Get Taskbar height
            WinGetPos,,, tbW, tbH, ahk_class Shell_TrayWnd

            Y2 := A_ScreenHeight - tbH - h - 5

            ;WinActivate, ScreenClippingWindow
            WinMove X, Y2
        }
    
        ;ExistActivate("Paint") 
        ;    Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
    Return

;Recalcula Analitico
    ScrollLock::
        ExistActivate("Sped Fiscal - EFD ICMS/IPI")
        ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico", X, Y)
            Send,{Sleep 40}{Enter}{Enter}{Sleep 40}
        ClickOnImage(C190, 0, 0, "L", "C190", X, Y)
        Sleep, 40
        ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico", X, Y)
        FlagItens := ""
    Return

;Combinas dois ultimos comandos
    PgDn & ScrollLock::
        ;Vai para analitico, se os dois comandos estao sendo combinados então o print em questão será o do analitico
        ClickOnImage(C190, 0, 0, "L", "C190", X, Y)
        Sleep, 40
        ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico", X, Y)
        FlagItens := ""

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

        ExistActivate("Sped Fiscal - EFD ICMS/IPI")
        ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico", X, Y)
            Send,{Sleep 40}{Enter}{Enter}{Sleep 40}
        ClickOnImage(C190, 0, 0, "L", "C190", X, Y)
        Sleep, 40
        ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico", X, Y)
        FlagItens := ""
    Return

;Volta para o analitico
    XButton1::
        If WinActive("REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica") {
            ClickOnImage(BaseCalcC100, 239, -20, "L", "Base de Cálculo C100", X, Y)
            Send,^c^c
        } else {
            ClickOnImage(Relatorios, 0, 0, "L", "Relatorios", X, Y)
            Send,{Sleep, 10}
            MouseMove, 611, 537
        }
    Return

    MButton::
        ClickOnImage(Relatorios, 0, 0, "L", "Relatorios", X, Y)
            Send,{Sleep, 10}{Click, 611, 537}
    Return

;ALQ
;7,00
    Ctrl & Numpad7:: 
        ActiveActivate("REGISTRO - C170")
            if substituirExc("000", "2102") {
                    Send,+{Tab 2}{Sleep 5}^c^c{Tab 2}{Sleep 5}7{Tab}{Sleep 5}^v{Sleep 5}{Enter}
                ClickOnImage(BaseCalcC170, -175, -23, "L", "ALQ", X, Y)
                SetFormat, float, 0.2
                    Send,{Sleep 5}^c^c
                op1 := Clipboard
                Send,{Tab}^c^c
                op2 := StrReplace(Clipboard, ",", ".")
                alq := (op1 * op2) / 100
                alq := StrReplace(alq, ".", ",")
                    Send,{Tab}{Sleep 5}%alq%{Enter}
            }
    Return

;Ir para Itens a partir da pesquisa
    F1::
        If (FlagItens == "") {
            ExistActivate("Sped Fiscal - EFD ICMS/IPI")
            ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
            FindText().Click(X + 30, Y + 90, "L")
        } Else {
            ExistActivate("Sped Fiscal - EFD ICMS/IPI")
            ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
            FindText().Click(X + 20, Y + 145, "L")
        }
    Return

;Ir para itens e filtrar por CST
    F1 & F2::
        If (FlagItens == "") {
            ActiveActivate("Sped Fiscal - EFD ICMS/IPI")
            ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
                Send,{Sleep 10}
            ClickOnImage(C170, -13, 31, "L", "Lupa Itens", X, Y)
                Send,{Sleep 10}
            ClickOnImage(C170, 3, 69, "L", "Caixa de seleção", X, Y) 
                Send,{PgUp}{Down 8}{Enter}
            FlagItens := 1
        } Else {
            ActiveActivate("Sped Fiscal - EFD ICMS/IPI")
            ClickOnImage(C170, 0, 0, "L", "C170", X, Y)
            FindText().Click(X + 540, Y + 64, "L")
        }
    Return

;Ir para Analitico pós validaçao
    F2::
        ClickOnImage(C190, 0, 0, "L", "C190", X, Y)
        FindText().Click(X, Y + 90, "L")
    Return

;Ir para Obs e alterar codigo da observação.
    F3::
        If (FlagEstado == "") {
            ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
            FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 1403{Enter 5}
        } Else {
            ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
            FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 2403{Enter 5}
        }
    Return

    NumpadMult::
        If (FlagEstado == "") {
            ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
            FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 1403{Enter 5}
        } Else {
            ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
            FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}0{Enter}OBSERVACAO PARA CFOP 2403{Enter 5}
        }
    Return

;Alterar valor da observação
    F4::
        If (FlagEstado == "") {
            ClickOnImage(C197, 0, 100, "L", "C197", X, Y)
                Send,{Click 2}{Sleep 20}{Tab 2}{Sleep 5}1403{Enter 4}{BS}{Enter}{BS}{Enter}{BS}{Enter}{Enter 2}{Sleep 20}
            FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}{Tab 2}{Sleep 5}1403{Tab 6}0{Enter}+{Tab}
        } Else {
            ClickOnImage(C197, 0, 100, "L", "C197", X, Y)
            FindText().Click(X, Y+100, "L")
                Send,{Click 2}{Sleep 20}{Tab 2}{Sleep 5}2403{Enter 4}{BS}{Enter}{BS}{Enter}{BS}{Enter}{Enter 2}{Sleep 20}
            FindText().Click(X, Y+90, "L")
                Send,{Click 2}{Sleep 20}{Tab 2}{Sleep 5}2403{Tab 6}0{Enter}+{Tab}
        }
    Return

;Empresa com erro de CST
    ;Em especial casos onde os erros do analitico apontam duplicidade de CST
    ;Sair da primeira tela apontando o erro e voltando para a nota será necessario pesquisar ela novamente
        ;Pesquisar a nota com erro apontada pelo relatorio
            ;NumpadMult::
            ;    Send,{Click 924 17}{Sleep 20}{Click 179 199}{Sleep 20}{Tab 9}{Sleep 40}{Enter}{Sleep 20}{Tab 7}{Sleep 20}^c{Sleep 20}{Click 924 17}{Sleep 20}{Click 1236 229}{Sleep 20}{Click 306 266}{Sleep 20}{Down 5}{Sleep 20}{Click 444 269}{Sleep 20}{Down 2}{Sleep 20}{Enter}{Sleep 20}{Tab}{Sleep 20}^v{Sleep 20}{Tab}{Sleep 20}{Enter}{Sleep 20}{Tab 5}{Down}{Sleep 20}{PrintScreen}{Sleep 20}
            ;    ;If ExistActivate("Paint") {
            ;    ;    Send,^v{Sleep 20}{AltDown}{Tab}{AltUp}
            ;    ;}
            ;Return

;Da inicio ao lançamento de uma nota do 0, a partir do numero dela na barra de pesquisa do SPED
    F5 & F6::
        ;Começa sequencia de comandos, cada if ja tem um else dentro da função
        ;Baseado na ideia de que a nota foi procurada e esta selecionada, 
        ; esse primeiro if copia o numero da nota na tela principal de correção
        ExistActivate("Sped Fiscal - EFD ICMS/IPI")
            Send,^c{Sleep 40}

        ;Abre o navegador e procura pela aba com icone do Klaus
        ExistActivate("Google Chrome")
        ClickOnImage(Klaus, 0, 0, "L", "Klaus", X, Y)

        ;Inicializar UIA
        UIA := UIA_Interface()

        ;Recebe elemento para ser trabalhado
        el := UIA.ElementFromHandle("Klaus Fiscal")
            Send,{Sleep 40}

        ;Clica no icone de pesquisar notas
        el.WaitElementExist("ControlType=Button AND Name=' Localizar nota'",,2).Click()
            Send,{Sleep 40}

        ;Clica na caixa de colocar o numero da nota e pesquisa ela
        NumNota := el.WaitElementExist("ControlType=Edit AND Name='Número ou chave'").Click() 
            Send,{Sleep 40}^v{Sleep 40}

        ;Clica na opção numero de nota
        el.WaitElementExist("ControlType=RadioButton AND Name='Número'").Click()

        ;Clica em pesquisar
        el.WaitElementExist("ControlType=Button AND Name='Localizar'").Click()
                        
        ;Volta pro SPED enquanto a nota carrega e ja abre uma tela de lançamento
        ;de nota fiscal e cola o numero da nota que esta na area de transferencia
        ExistActivate("Sped Fiscal")
        ClickOnImage(IconeAnalitico, 0, -60, "L", "Icone Analitico", X, Y)
            Send,{Sleep 20}{Tab 7}{Sleep 20}^v{Sleep 20}{Enter}{Sleep 40}

        ;fecha janela de itens se estiver ativa
        If WinExist("Itens da NF") {
            WinActivate
            WinClose
                Send,{Sleep 20}!n
        }

        ;Vai para a janela de notas fiscais do G5, procura pela nota fiscal
        ExistActivate("Lançamentos Fiscais")
            Send,{Sleep 40}!h{Sleep 40}^v{Sleep 40}{Enter}{Sleep 100}

        ;Pega a chave da NFE
        ;Inicializar ACC
        WinGet, hWnd, ID, A
        ChaveNFEG5 := ACC_Get("Object", "4.17.4.2.4.19", 0, "ahk_id" hWnd)
        ClickACC(ChaveNFEG5)
            Send,{Sleep 40}{Click 2}{Sleep 40}{Click Right}{Sleep 40}{Down 4}{Sleep 20}{Enter}{Sleep 40}
                                    
        ;Volta para o SPED e cola chave da NFE na tela de lançamento que foi iniciada
        ExistActivate("Sped Fiscal")
            Send,{Sleep 40}{Tab 7}{Sleep 40}^v{Sleep 40}+{Tab 10}{Sleep 40}

        ;Volta para o Navegador, e se deu tempo de carregar clica na NFE
        ExistActivate("Google Chrome")
            Send,{Sleep 40}

        ;Inicializar ACC
        ;WinGet, hWnd, ID, A
        ;AbrirPDFChrome := ACC_Get("Object", "4.1.1.6.2.2.1.1.4.1.22.3.2.1.1.14.1.2.1", 0, "ahk_id" hWnd)
        ;ClickACC(AbrirPDFChrome)
    Return

    F9::
        if (FlagEstado == "") {
            ; Entrada dentro do estado
            ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
                Send,{Click 2}{Sleep 20}{Tab 6}{Sleep 40}{Enter 2}{Sleep 40}OBSERVACAO PARA CFOP 1403{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 6}
        } else {
            ; Entrada fora do estado
            ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
                Send,{Click 2}{Sleep 20}{Tab 6}{Sleep 40}{Enter 2}{Sleep 40}OBSERVACAO PARA CFOP 2403{Sleep 40}{Enter 3}{Sleep 40}!s{Sleep 40}{Tab 9}{Sleep 40}{Enter}{Sleep 40}SP90090278{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 6}
        }

        WinWaitClose, REGISTRO - C197 - ENTRADA - Outras Obrigações
        Sleep 150

        if (FlagEstado == "") {
            ; Entrada dentro do estado
            Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 7}  
        } else {
            ; Entrada fora do estado
            Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 7}
        }
    Return

    F10::
        if (FlagEstado == "") {
            ; Entrada dentro do estado
            Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}1403{Sleep 40}{Enter 7}  
        } else {
            ; Entrada fora do estado
            Send,{Insert}{Sleep 40}SP90090104{Sleep 40}{Enter 2}{Sleep 40}2403{Sleep 40}{Enter 7}
        }
    Return

;Troca o frete
    ;f::
    ;    Send,{Enter}{Sleep 20}{Tab 13}{Sleep 20}^a{BS}{Sleep 20}9{Sleep 20}{Enter}{Sleep 20}{Down}
    ;Return

+Delete::
    If WinActive("REGISTRO - C170") {
        ClickOnImage(BaseCalcC170, +119, -48, "L", "ALQ", X, Y)
            Send,{Sleep 5}^c^c
        op1 := StrReplace(Clipboard, ",", ".")
        Send,{Tab}^c^c{BS}0
        op2 := StrReplace(Clipboard, ",", ".")
        diff := op1 - op2
        diff := StrReplace(diff, ".", ",")
            Send,+{Tab}{Sleep 5}%diff%{Enter}
    }
Return

;lançar item só com nome
    F12::
        InputBox, NomeItem, Nome do item a lançar, Digite o nome do item:, , 300, 130
        IfEqual, ErrorLevel, 1, Return

        if WinExist("REGISTRO - C170 - ENTRADA - Itens") {
            WinActivate
            Send,{Enter}{Sleep 5}^{Enter}{Sleep 10}
        }

        if WinExist("Pesquisar Dados Cadastrais") {
            WinActivate
            WinWaitActive, "Pesquisar Dados Cadastrais", ,1
            StringUpper, NomeItem, NomeItem
                Send,{Insert}{Sleep 20}000
            NumAleatorio(8)
                Send,{Enter}{Sleep 5}%NomeItem%{Sleep 20}{Tab 2}UNI{Sleep 20}{Enter 3}00{Sleep 20}{Enter}!s
                Send,{Sleep 20}{Tab 8}{Sleep 5}{Enter}{Sleep 5}+{Tab 2}
        }

    Return

#IfWinNotActive Sped Fiscal - EFD ICMS/IPI
;Comandos que só funcionam fora da janela principal de correção do SPED e a tecla original não perde a função dentro dele
;Pesquisar nota G5 - OBSOLETO
    ;Home::
    ;    Send,^v{Enter}
    ;Return

;Sair da nota no G5 e pesquisar
    Home::
        ;fechar itens caso esteja aberto 
        If WinExist("Itens da NF") {
            WinActivate
            WinClose
                Send,{Sleep 20}!n{Sleep 40}
        }

        Send,{Sleep 20}!h{Sleep 20}^v{Enter}{Sleep 20}

        If ExistActivate("Lançamentos Fiscais") {
            ;Inicializar ACC
            WinGet, hWnd, ID, A
            ItensG5 := ACC_Get("Object", "4.17.4.2.4.23.4.4", 0, "ahk_id" hWnd)
            ClickACC(ItensG5)

            Send,{Sleep 20}^{Enter}{Sleep 20}

            WinWaitActive, Itens da NF
            ;Inicializar ACC
            WinGet, hWnd, ID, A
            PrimeiroItemG5 := ACC_Get("Object", "4.8", 0, "ahk_id" hWnd)
            ClickACC(PrimeiroItemG5)
        
        }
    Return

    ;Pesquisar nota no G5
    +Home::
        Send,{Click 2}{Sleep 15}^c^c
        ExistActivate("Lançamentos Fiscais")
        Send,{Sleep 10}!h{Sleep 10}^v{Sleep 10}{Enter}
    Return

;Alterar base do ICMS
    Insert::
        ClickOnImage(BaseCalcC170, 125, -24, "L", "Base Calc C170", X, Y)
    Return

#IfWinNotActive ahk_group SPED
;Comandos que funcionam fora do SPED e a tecla original não perde a função dentro dele
;Controla ativação do shift + e, se for deixado para ser ativado em qualquer circunstancia
;Ao mandar um E com send ele ativa o comando durante o outro

;Copiar itens Klaus para 1556
    Delete::
        ExistActivate(".pdf")
            Send,^c{Sleep 40}
        ExistActivate("Sped Fiscal")
            Send,{Right}{Sleep 20}^v{Sleep 20} -{Space}
        ExistActivate(".pdf")
    Return

    +Delete::
        ExistActivate(".pdf")
            Send,^c{Sleep 40}
        ExistActivate("Sped Fiscal")
            Send,{Right}{Sleep 20}^v{Enter}
    Return

;Gerador de numero aleatorio para itens ou empresas
    F11::
        Send,000
        NumAleatorio(8)
    return

;Exclui Observação
    XButton2::
        ExistActivate("Sped Fiscal")
        ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y)
            Send,{Sleep 5}^a{BS}^v{Sleep 5}

        ClickOnImage(Lupa, -82, 37, "L", "Lupa", X, Y)
        ClickOnImage(NFE, 10, 20, "L", "NFE", X, Y)
        ClickOnImage(C195, 0, 0, "L", "C195", X, Y)
        ClickOnImage(OBS, 0, 19, "L", "OBS", X, Y)
            Send,+{Tab}{Enter 2}{Sleep 10}
        ClickOnImage(Lupa, -200, 37, "L", "Lupa", X, Y)
    Return

;Copiar e colar entre apps
    +c::
        if WinActive("Calc") {
                Send,^c{Sleep 10}
            ExistActivate("Sped Fiscal - EFD ICMS/IPI")
                Send,^v{Sleep 10}{Enter}{Sleep 10}{AltDown}{Tab}{AltUp}
        } else {
            InputBox, BaseIcms, Valor, Digite o valor a ser inserido na Base do ICMS:, , 300, 130
            IfEqual, ErrorLevel, 1, Return

            InputBox, Icms, Valor, Digite o valor a ser inserido no Valor do ICMS:, , 300, 130
            IfEqual, ErrorLevel, 1, Return

            ExistActivate("REGISTRO - C100 - ENTRADA - Nota Fiscal Eletrônica")
                Send,{Sleep 5}%BaseIcms%{Enter}{Sleep 5}%Icms%{Enter}
        }
    Return

Return
