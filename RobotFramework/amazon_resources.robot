*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                https://www.amazon.com.br
${CART}               xpath://*[@id="nav-cart"]
${SEARCH_BUTTON}      id:nav-search-submit-button
${CAMPO_PESQUISA}     css:#nav-search-bar-form input#twotabsearchtextbox
${CARD_RESULTADO}     xpath:(//div[@data-component-type="s-search-result"])[1]
${MENU_ELETRONICOS}    xpath://a[contains(@href, "/Eletronicos-e-Tecnologia/b/")]
${FRASE_ELETRONICOS}   xpath://h2[normalize-space()="Eletrônicos e Tecnologia"]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia


*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acesso a home page do site Amazon.com.br
    Go To    url=${URL}
    #Wait Until Element Is Visible    ${CART}
    
Entrar no menu "Eletronicos"
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains     text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    ${FRASE_ELETRONICOS}

Verificar se o titulo da pagina fica "${TITULO}"
    Title Should Be    ${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//*[@id="anonCarousel3"]/ol/li[1]/div/div/a

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible    ${CAMPO_PESQUISA}    timeout=15s
    Wait Until Element Is Enabled    ${CAMPO_PESQUISA}    timeout=15s
    Wait Until Keyword Succeeds    3x    2s    Input Text    ${CAMPO_PESQUISA}    ${PRODUTO}
    Textfield Value Should Be    ${CAMPO_PESQUISA}    ${PRODUTO}

Cicar no botao de pesquisar
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    timeout=10s
    Wait Until Element Is Enabled    ${SEARCH_BUTTON}    timeout=10s
    Scroll Element Into View    ${SEARCH_BUTTON}
    Wait Until Keyword Succeeds    3x    2s    Click Element    ${SEARCH_BUTTON}


Destacar elemento "${LOCATOR}"
    [Documentation]    Marca o elemento com borda vermelha e salva um print como prova
    ${elemento} =    Get WebElement    ${LOCATOR}
    Scroll Element Into View    ${LOCATOR}
    Execute Javascript    arguments[0].style.outline='3px solid red'    ARGUMENTS    ${elemento}
    Capture Page Screenshot

Verificar resultado de pesquisa, listando o produto pesquisado
    Wait Until Location Contains    /s?k=    timeout=15s
    Wait Until Element Is Visible    ${CARD_RESULTADO}    timeout=15s
    Destacar elemento "${CARD_RESULTADO}"




#GHERKIN STEPS
Dado Acesso a home page do site Amazon.com.br
    Acesso a home page do site Amazon.com.br

Quando Entrar no menu "Eletronicos"
    Entrar no menu "Eletronicos"

Então Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E Verificar se o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o titulo da pagina fica "${TITULO}"

E Verificar se aparece a categoria "Navegue por ambiente"
    Verificar se aparece a categoria "${NOME_CATEGORIA}"