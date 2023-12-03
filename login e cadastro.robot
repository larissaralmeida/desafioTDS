*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${Browser}        chrome
${URL}        https://www.automationexercise.com/
${Expected Title}        Logged in as larissa
${Expected message error}    Your email or password is incorrect!
${Expected success message}    ENTER ACCOUNT INFORMATION
${Expected message create_account}    ACCOUNT CREATED!


*** Test Cases ***
Cenario 1: Abrir o site e clicar no login
    Open Browser          ${URL}    ${Browser}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Close Browser

Cenario 2: Preencher os campos de login com credenciais válidas
    Open Browser        ${URL}    ${Browser}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Input Text    css=input[data-qa="login-email"]    larissa@test.com
    Input Password    css=input[data-qa="login-password"]    123456
    Click Element    css=button[data-qa="login-button"]
    ${element title}     Get Text    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a
    Should Be Equal    ${element title}    ${Expected Title}
    Log to Console    ${element title}

Cenario 3: Preencher os campos de login com credenciais inválidas
    Open Browser         ${URL}    ${Browser}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Input Text    css=input[data-qa="login-email"]    larissa@test
    Input Password    css=input[data-qa="login-password"]    123456
    Click Element    css=button[data-qa="login-button"]
    ${error message}    Get Text    xpath=//*[@id="form"]/div/div/div[1]/div/form/p
    Should Be Equal    ${error message}    ${Expected message error}
    Log To Console    ${error message}

Cenario 4: Realizar cadastro com credenciais válidas
    Open Browser        ${URL}    ${Browser}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Input Text    css=input[data-qa="signup-name"]    Larissa 
    Input Text    css=[data-qa="signup-email"]    larissar@teste.com.br 
    Click Button    css=[data-qa="signup-button"]
    ${success message}    Get Text    xpath=//*[@id="form"]/div/div/div/div/h2/b
    Should Be Equal    ${success message}    ${Expected success message}
    Log To Console    ${success message}
    Input Password    css=input[data-qa="password"]    123456
    Input Text    css=input[data-qa="first_name"]    Larissa
    Input Text    css=input[data-qa="last_name"]    Rodrigues
    Input Text    css=input[data-qa="address"]    Rua da Guia
    Select From List By Value    css=[data-qa="country"]    United States
    Input Text    css=input[data-qa="state"]    Pernambuco
    Input Text    css=input[data-qa="city"]    Recife
    Input Text    css=input[data-qa="zipcode"]    000111333
    Input Text    css=input[data-qa="mobile_number"]    81 983947364
    Click Button    css=[data-qa="create-account"]
    ${created_account}    Get Text    xpath=//*[@id="form"]/div/div/div/h2/b
    Should Be Equal    ${created_account}    ${Expected message create_account}
    Log To Console    ${created_account}
    Click Element    css=[data-qa="continue-button"]

