*** Settings ***
Documentation    Esse Suite testa o site da Amazon.com.br
Resource    amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador 

*** Test Cases ***

Caso de teste 01 - Acesso ao menu Eletrônicos
    [Documentation]    Esse teste verifica o menu eletronico do site Amazon.com.br
    ...                e verifica a categoria computadores e informatica
    [Tags]             Menus    categoria
    Acesso a home page do site Amazon.com.br
    Entrar no menu "Eletronicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Navegue por ambiente"

Caso de teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]            busca_produtos    lista_busca
    Acesso a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Serie S" no campo de pesquisa
    Cicar no botao de pesquisar
    Verificar resultado de pesquisa, listando o produto pesquisado