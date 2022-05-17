*Settings*
Documentation    Signup Test Suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session     
Test Teardown    After Test   

*Test Cases*
Register a new user
    ${user}    Factory User    fake

    Go To Signup Form
    Fill Signup Form             ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user
    [Tags]    attempt_signup

    ${user}                   Factory User    fake
    Add User From Database    ${user}

    Go To Signup Form
    Fill Signup Form           ${user}
    Submit Signup Form
    Modal Content Should Be    Já temos um usuário com o e-mail informado.

Wrong Email
    [Tags]    attempt_signup

    ${user}    Factory User    wrong_email

    Go To Signup Form
    Fill Signup Form      ${user}
    Submit Signup Form

    Alert Span Should Be    O email está estranho

Required Field
    [Tags]    attempt_signup    rf

    @{expected_alerts}    Create List
    ...                   Cadê o seu nome?
    ...                   E o sobrenome?
    ...                   O email é importante também!
    ...                   Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be    ${expected_alerts} 

Short Password
    [Tags]        attempt_signup            short
    [Template]    Signup With Short Pass
    1
    1a
    1a!
    -1aB#
    0z+%9
    1 b 3
    -9821