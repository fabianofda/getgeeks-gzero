*Settings*
Documentation    Session router test suite

Resource    ${EXECDIR}/resources/Base.robot

*Variables*
&{Incorrect_pass}     email=kate@homail.com    password=abc123
&{Incorrect_email}    email=kate.com.br        password=abc123
&{User_not_found}     email=kate@404.com       password=abc123
&{Required_email}     email=${EMPTY}           password=abc123
&{Without_email}      password=abc123
&{Required_pass}      email=kate@homail.com    password=${EMPTY} 
&{Without_pass}       email=kate@homail.com    

*Test Cases*
User Session
    ${payload}    Factory User Session    signup
    POST User     ${payload}              

    ${payload}     Factory User Session    login
    ${response}    POST Session            ${payload}    

    Status Should Be    200            ${response}
    ${size}             Get Length     ${response.json()}[token]
   # ${expected_size}    Convert To Integer    140
   # Should Be Equal     ${expected_size}      ${size}
    Should Be True      ${size} > 0
    Should Be Equal     10d            ${response.json()}[expires_in]

Should Not Get Token
    [Template]    Attempt POST Session

    ${Incorrect_pass}     401    Unauthorized 
    ${Incorrect_email}    400    Incorrect email
    ${User_not_found}     401    Unauthorized 
    ${Required_email}     400    Required email 
    ${Without_email}      400    Required email 
    ${Required_pass}      400    Required pass
    ${Without_pass}       400    Required pass

*Keywords*
Attempt POST Session
    [Arguments]    ${payload}    ${status_code}    ${error_message} 

    ${response}         POST Session        ${payload} 
    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]

