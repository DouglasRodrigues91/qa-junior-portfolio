Language: pt-BR

*** Settings ***
Documentation    Esse Suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu Eletrônicos
    [Documentation]    Esse teste verifica o menu eletronico do site Amazon.com.br
    ...                e verifica a categoria computadores e informatica
    [Tags]             Menus    categoria
    Dado Acesso a home page do site Amazon.com.br
    Quando Entrar no menu "Eletronicos"
    Então Verificar se aparece a frase "Eletrônicos e Tecnologia"
    E Verificar se o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    E Verificar se aparece a categoria "Navegue por ambiente"

Caso de teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]            busca_produtos    lista_busca
    Dado Acesso a home page do site Amazon.com.br
    Quando Digitar o nome de produto "Xbox Serie S" no campo de pesquisa
    E Cicar no botao de pesquisar
    Então Verificar resultado de pesquisa, listando o produto pesquisado
