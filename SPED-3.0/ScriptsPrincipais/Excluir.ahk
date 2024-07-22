#SingleInstance Force
Menu, Tray, Icon, pifmgr.dll, 35

SetTitleMatchMode 2


Flag := 0
;X 1920 1080 -> 605
;x 1440 900 -> 351
;Excluir uma pagina de itens, participantes ou observaçoes
PgUp:: 
    if WinExist("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
        If WinActive("Sped Fiscal - EFD ICMS/IPI - Sistema Público de Escrituração Digital") {
            Flag := 1
            Loop, 7 {
                If (flag == 1) {
                    Send,{Click 271 779}{Sleep 40}
                    Deletar()
                    Flag := Flag + 1
                } else if (flag == 2) {
                    Send,{Click 271 704}{Sleep 40}
                    Deletar()
                    Flag := Flag + 1
                } else if (flag == 3) {
                    Send,{Click 271 629}{Sleep 40}
                    Deletar()
                    Flag := Flag + 1
                } else if (flag == 4) {
                    Send,{Click 271 553}{Sleep 40}
                    Deletar()
                    Flag := Flag + 1
                } else if (flag == 5) {
                    Send,{Click 271 477}{Sleep 40}
                    Deletar()
                    Flag := Flag + 1
                } else if (flag == 6) {
                    Send,{Click 271 402}{Sleep 40}
                    Deletar()
                    Flag := Flag + 1
                } else if (flag == 7) {
                    Send,{Click 271 326}{Sleep 40}
                    Deletar()
                    Send,{Sleep 20}{Click 241 243}
                    Flag := 0
                } else {
                    Exit
                }
            }    
        }
    } Else {
        MsgBox,48, Aviso, Janela principal de correção inativa.,1
    }
Return

Deletar() {
    if WinActive("Aviso") {
        Exit
    } Else {   
        if WinActive("REGISTRO - 0200 - Item/Produtos") or WinActive("REGISTRO - 0150") or WinActive("REGISTRO - 0450") or WinActive("REGISTRO - 0460"){
            Send,{Esc}{Sleep 20}{Click 139 297}{Sleep 20}{Enter}{Sleep 20}{Click 43 97}
        } Else {
            Exit
        }
    }
}