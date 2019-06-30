*** Test Cases ***
Login With Wrong Credentials
    Open Browser To Login Page
    Input Username    test@test.pl
    Input Password    test
    Submit Credentials
    Error Messege Should be Show    Nieprawidłowy adres e-mail lub hasło
    [Teardown]    Close Browser
