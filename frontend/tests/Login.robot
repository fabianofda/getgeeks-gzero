*Settings*
Documentation    Login tests suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session     
Test Teardown    After Test   

*Test Cases*
User Login
    ${user}    Factory User    login

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials

    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]    

    ${user}    Create Dictionary    email=fabiano@gmail.com    password=abc123

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials

    Modal Content Should Be    Usuário e/ou senha inválidos.

User not found
    [Tags]    

    ${user}    Create Dictionary    email=user@404.io    password=abc123

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials

    Modal Content Should Be    Usuário e/ou senha inválidos.

Incorrect email
    [Tags]    

    ${user}    Create Dictionary    email=user.com.br    password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email

Required email
    [Tags]    

    ${user}    Create Dictionary    email=${EMPTY}    password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    E-mail obrigatório

Required password
    [Tags]    

    ${user}    Create Dictionary    email=fabiano@gmail.com    password=${EMPTY}

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    Senha obrigatória

Required fields
    [Tags]    i_pass

    @{alerts}    Create List
    ...          E-mail obrigatório
    ...          Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be    ${alerts}