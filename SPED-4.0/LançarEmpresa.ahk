#SingleInstance Force
#Include %A_ScriptDir%\Lib\matFunctions.ahk
Menu, Tray, Icon, Shell32.dll, 26

GroupAdd, PESQUISAR, Pesquisar Dados Cadastrais

SetTitleMatchMode 2

+=::

Menu:
Gui, Add, ListBox, x2 y0 w210 h250 vNomeEmpresa,-=-=-=-=-=-=-=- A -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- B -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- C -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- D -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- E -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- F -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- G -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- H -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- I -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- J -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- L -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- M -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- N -=-=-=-=-=-=-=-
|Nome1|Nome2|-=-=-=-=-=-=-=- O -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- P -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- Q -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- R -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- S -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- T -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- U -=-=-=-=-=-=-=-
|-=-=-=-=-=-=-=- V -=-=-=-=-=-=-=-|
Gui, Add, Button, x62 y250 w90 h30 gOK, Criar
Gui, Show, h298 w217, Lista de Empresas

Return

Ok:
Gui, Submit
Gui, Destroy
;MsgBox, %NomeEmpresa%
Gosub, Criar
Return

GuiClose:
ExitApp

Return


#IfWinActive ahk_group PESQUISAR

;LANÇAR EMPRESAS
Criar:
    switch NomeEmpresa {
        case "Nome1": CriarEmpresa("Nome", "CNPJ", "InscriçãoEstadual", "CodigoMunicipio", "Logradouro", "Numero", "Complemento", "Bairro")

        case "Nome2": CriarEmpresa("Nome", "CNPJ", "InscriçãoEstadual", "CodigoMunicipio", "Logradouro", "Numero", "Complemento", "Bairro")
    }
Gosub, Menu
Return

;Modelo de cadastro
;case "Nome": CriarEmpresa("Nome", "CNPJ", "InscriçãoEstadual", "CodigoMunicipio", "Logradouro", "Numero", "Complemento", "Bairro")

;LANÇAR ITENS
    +i::
        InputBox, NomeItem, Nome do item a criar, Digite o nome do item:, , 300, 130
        if (ErrorLevel == 0) {
            switch NomeItem {
                case "COMBUSTIVEL": 
                    if ExistActivate("Pesquisar Dados Cadastrais") {
                        Send,{Insert}{Tab 5}{CtrlDown}{Enter}{CtrlUp}{Sleep 20}{Tab 5}{Sleep 20}{Enter}{Sleep 20}LTS{Sleep 20}{Enter}{Sleep 40}LITROS{Sleep 40}{Enter 2}{Sleep 40}{Tab 3}{Sleep 40}{Enter}{Sleep 40}{Esc}{Sleep 20}{Tab}{Enter}{Sleep 80}
                    }
                    CriarItem("COMBUSTIVEL", "LTS", "material de uso e consumo")
                Return

                case "MATERIAL": CriarItem("MATERIAL DE USO E CONSUMO", "UNI", "material de uso e consumo")

                case "GLP": CriarItem("GLP", "KG", "material de uso e consumo")

                case "SERVICO": CriarItem("SERVIÇO", "UNI", "servi")
            }
        }
    Return