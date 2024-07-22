#SingleInstance Force
#Include <matFunctions>
Menu, Tray, Icon, Shell32.dll, 26

GroupAdd, PESQUISAR, Pesquisar Dados Cadastrais

SetTitleMatchMode 2

#IfWinActive ahk_group PESQUISAR

;LANÇAR EMPRESAS
    +e::
        InputBox, NomeEmpresa, Nome da empresa a criar, Digite o nome da empresa:, , 300, 130
        if (ErrorLevel == 0) {
            switch NomeEmpresa {
                case "Nome": CriarEmpresa("Nome", "CNPJ", "InscriçãoEstadual", "CodigoMunicipio", "Logradouro", "Numero", "Complemento", "Bairro")

                case "Nome": CriarEmpresa("Nome", "CNPJ", "InscriçãoEstadual", "CodigoMunicipio", "Logradouro", "Numero", "Complemento", "Bairro")
            }
        }
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