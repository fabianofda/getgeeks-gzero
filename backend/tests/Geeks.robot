*Settings*
Documentation    Geeks router test suite

Resource    ${EXECDIR}/resources/Base.robot


*Test Cases*
Be a geek

    ${user}        Factory Be Geek
    Remove User    ${user} 

    POST User      ${user} 
    ${token}       Get Token    ${user}
    ${response}    POST Geek    ${token}    ${user}[geek_profile] 

    Status Should Be    201         ${response}
    ${response}         GET User    ${token} 

    Should Be Equal As Strings    ${user}[name]                      ${response.json()}[name]
    Should Be Equal As Strings    ${user}[email]                     ${response.json()}[email]
    Should Be Equal As Strings    ${user}[geek_profile][whatsapp]    ${response.json()}[whatsapp]
    Should Be Equal As Strings    ${user}[geek_profile][desc]        ${response.json()}[desc]

    ${expected_float}    Convert To Number    ${user}[geek_profile][cost] 
    ${got_float}         Convert To Number    ${response.json()}[cost]
    Should Be Equal      ${expected_float}    ${got_float}

    Should Be Equal As Strings    ${user}[geek_profile][printer_repair]    ${response.json()}[printer_repair]
    Should Be Equal As Strings    ${user}[geek_profile][work]              ${response.json()}[work]
    Should Be Equal As Strings    None                                     ${response.json()}[avatar]
    Should Be Equal As Strings    True                                     ${response.json()}[is_geek]

Get geek list
    [Tags]      ge

    ${data}    Factory Search For Geeks

    FOR    ${geek}    IN    @{data}[geeks]

    POST User    ${geek} 
    ${token}     Get Token    ${geek} 
    POST Geek    ${token}     ${geek}[geek_profile]

    END

    POST User    ${data}[user]
    ${token}     Get Token        ${data}[user]

    ${response}         GET Geeks    ${token} 
    Status Should Be    200          ${response} 

    ${total}          Get Length      ${response.json()}[Geeks] 
    Should Be True    ${total} > 0