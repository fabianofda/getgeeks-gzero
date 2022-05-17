*Settings*
Documentation    Signup Actions

*Keywords*
Go To Signup Form
    Go To                      ${BASE_URL}/signup
    Wait For Elements State    css=.signup-form      visible    10

Fill Signup Form
    [Arguments]    ${user}

    Fill Text    id=name        ${user}[name]         
    Fill Text    id=lastname    ${user}[lastname]     
    Fill Text    id=email       ${user}[email] 
    Fill Text    id=password    ${user}[password] 

Submit Signup Form
    Click    css=.submit-button >> text=Cadastrar

User Should Be Registered
    ${expect_menssage}    Set Variable    css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State    ${expect_menssage}    visible    10

Signup With Short Pass
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...        name=Fabiano         lastname=Andrade
    ...        email=fda@adf.io     password=${short_pass}

    Go To Signup Form
    Fill Signup Form      ${user}
    Submit Signup Form

    Alert Span Should Be    Informe uma senha com pelo menos 6 caracteres