#SingleInstance Force
#Include <FindTextV2>
#Include <matFunctionsV2>
#Include <AccV2>
#Include <UIA>

SetTitleMatchMode(2)

C190:="|<C190>*137$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738|<C190-2>*152$25.C2C6AX4YY2W+G0FB908yYU42GNW997V738"
IconeAnalitico:="|<IconeAnalitico>*197$14.0U0Q07U3s0q0Bk6A1zUzsA770lUCs1g0T03U"
Item1Analitico:="|<Item1Analitico>*138$32.000000wyD7UE84N48222F20UUYEUD8948222S20UUY0E84N03m0sE000002"

;Testar recuperador automatico
NumLock:: {
    NumCasas := 0
    Coord := ClickOnImage(C190, 0, 0, "L", "C190")
    X := Coord.FoundX
    Y := Coord.FoundY
    FindText().Click(X, Y + 90, "L")

    IB := InputBox("Quantos CSTs deseja guardar?", "Itens Analitico", "w300 h130"), NumCasas := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
    if (ErrorLevel = 1)
        Return
    If (NumCasas == "" || NumCasas == 0)
        Return
    vet_CST_1 := []
    vet_CST_2 := []

    ;while True {
    Loop NumCasas {
        ;MsgBox, 4, Guardar Valores., Gostaria de copiar o Valor do CST atual?
        ;IfMsgBox No
        ;    return
        
        ;if (NumCasas == 0) {
        ;    vet_CST_2 := []
        ;}
        
        A_Clipboard := ""
        Send("{Enter}{Sleep 20}^a^a{Sleep 5}^c^c")
        ClipWait
        vet_CST_2.Push(A_Clipboard)
        vet_CST_1.Push(A_Clipboard)
        Global TrayCST := A_Clipboard
        Global len := StrLen(TrayCST)
        if (len > 3 || len < 3) {
            Sair()
        }

        Sleeper("{Tab}", 10, 4)
        A_Clipboard := ""
        Send "^a^a^c^c"
        ClipWait
        vet_CST_2.Push(A_Clipboard)
        vet_CST_1.Push(A_Clipboard)
        Global TrayALQ := A_Clipboard
        len := StrLen(TrayALQ)
        if (len > 2) {
            Sair()
        }

        flag := 0
        A_Clipboard := ""
        Send("{Tab}{Sleep 10}^c^c")
        ClipWait
        vet_CST_2.Push(A_Clipboard)
        vet_CST_1.Push(A_Clipboard)
        Global TrayTOTAL := StrReplace(A_Clipboard, ",", ".")
        if !isFloat(TrayTOTAL)
            flag := 1
        
        
        Send("{Sleep 200}!s{Sleep 200}{Down}{Sleep 40}")
        ;NumCasas += 1

        if (flag == 1) {
            msgResult := MsgBox("Confirma o Valor do CST atual?`n`nValores guardados:`nCST:`t" TrayCST "`nALQ:`t" TrayALQ "`nTOTAL:`t" TrayTOTAL, "Confirmar Valores.", 4)
            if (msgResult = "No")
                return
        }
    }


    ;Recalcular analitico
    ExistActivate("Sped Fiscal - EFD ICMS/IPI")
    ClickOnImage(IconeAnalitico, 0, 0, "L", "Icone Analitico")
        Send("{Sleep 40}{Enter}{Enter}{Sleep 40}")
    Sleep 200
    ClickOnImage(C190, 0, 0, "L", "C190")
    Click
    Sleep 200
    ClickOnImage(Item1Analitico, 90, 20, "L", "Item 1 Analitico")
    

    Loop NumCasas {
        aux := 999
        ;achar menor CST
        for index, value in vet_CST_2 {
            ;verifica se o valor tem 3 de tamanho para filtrara os CSTs
            len := StrLen(value)
            if (len == 3) {

                if (value < aux) {
                    menorCST := value
                    aux := value
                    pos := index + 2
                }

            }
        }

        ;Verificar se só tem uma copia do CST encontrado
        flagCST := 0
        for index, value in vet_CST_2 {
            if (value == menorCST) {

                ;Verifica se o valor encontrado é do tamanho de um CST
                len := StrLen(value)
                if (len == 3) {
                    flagCST := flagCST + 1
                }

            }
        }

        if (flagCST > 1) {
            ;Se tiver mais que uma copia, achar a copia com ALQ menor
            aux := 99
            for index, value in vet_CST_2 {
                if (value == menorCST) {

                    ;Verifica se o valor encontrado é do tamanho de um CST
                    len := StrLen(value)
                    if (len == 3) {

                        if (vet_CST_2[index + 1] < aux) {
                            menorALQ := vet_CST_2[index + 1]
                            aux := vet_CST_2[index + 1]
                            pos := index + 2
                        }

                    }

                }
            }
        } else {
            ;Se não tiver mais que uma copia achar a pos apenas com CST
            for index, value in vet_CST_2 {
                ;Encontra o CST
                if (value == menorCST) {
                    
                    ;Verifica se o valor encontrado é do tamanho de um CST
                    len := StrLen(value)
                    if (len == 3) {
                        ;O valor total do CST sera duas casas após o CST
                        pos := index + 2
                    }
                    
                }
            }
        }

        ;Entrar e enviar o valor total do CST que foi passado
        Send("{Enter}{Sleep 80}")
        WinActivate "REGISTRO - C190"
        WinWait "REGISTRO - C190"
        Sleeper("{Tab}", 20, 5)
            Send(vet_CST_2[pos])
        Sleep 20
            Send("{Tab}{Sleep 10}")

        ;Se o CST for 020 calcula valor nao tributado, caso contrario zera
        if (menorCST == 020) {
            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Send "+{Tab}"
            Send "^a^a^c^c"
            ClipWait
            A := StrReplace(A_Clipboard, ",", ".")

            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Sleeper("{Tab}", 5, 1)
            Send "^a^a^c^c"
            ClipWait
            B := StrReplace(A_Clipboard, ",", ".")

            Sub := A - B
            Sub := StrReplace(Sub, ".", ",")
            Sleeper("{Tab}", 10, 4)
            Send Sub "{Tab}+{Tab}"


            
            Send("+{Tab}^c^c")
            ;Esvazia clip, copia e aguarda conteudo estar preenchido
            A_Clipboard := ""
            Send "^a^a^c^c"
            ClipWait
            A := StrReplace(A_Clipboard, ",", ".")

            A_Clipboard := ""
            Send("{Enter}^a^a^c^c")
            ClipWait
            B := StrReplace(A_Clipboard, ",", ".")

            Sub := A - B
            Sub := StrReplace(Sub, ".", ",")
            Sleeper("{Tab}", 10, 4)
            Send Sub
            Send "{Tab}{Sleep 200}!s{Sleep 200}{Down}"
        } else {
            Sleeper("{Tab}", 10, 4)
            Send "0"
            Send "{Tab}{Sleep 200}!s{Sleep 200}{Down}"
        }

        Loop 3 {
            vet_CST_2.RemoveAt(pos)
            pos := pos - 1
        }
    }
Return
} ; Added bracket before function

Sair() {
    Send("{Esc 2}")
    Exit()
}