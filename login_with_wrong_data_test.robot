*** Settings ***
Documentation     Login with wrong Credentials
Library           Selenium2Library

*** Variables ***
${LOGIN URL}      https://skyscanner.pl
${BROWSER}        Chrome
${SPEED}    0.5
${PAGE_TITLE}    Tanie loty | Bezpłatna wyszukiwarka lotów Skyscanner
${LOGIN_BTN}    //span[@class="login"]
${LOGIN_BY_MAIL_BTN}    //div[@data-testid="login-email-button"]
${EMAIL_FIELD}    //input[@type='email']
${PASSWORD_FIELD}    //input[@type='password']
${SUBMIT_CREDEMTIALS_BTN}    //button[@data-testid='login-button']
${ERROR_MSG}    //header[@role='alert']
${MSG}    Nieprawidłowy adres e-mail lub hasło

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    test@test.pl
    Input Password    test
    Submit Credentials
    Error Messege Should be Show
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Set Selenium Speed    ${SPEED}
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    ${PAGE_TITLE}
    Click Element    ${LOGIN_BTN}
    Click Element    ${LOGIN_BY_MAIL_BTN}

Input Username
    [Arguments]    ${username}
    Input Text    ${EMAIL_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Submit Credentials
    Click Button    ${SUBMIT_CREDEMTIALS_BTN}
Error Messege Should be Show
    Element Should Contain    ${ERROR_MSG}      ${MSG}
