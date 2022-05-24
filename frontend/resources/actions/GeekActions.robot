*Settings*
Documentation    Geek Actions

*Keywords*
Go To Geeks
    Click    css=a[href="/geeks"] >> text=Geeks

    Wait For Elements State    css=.title strong >> text=Estes são os Geeks disponíveis. 
    ...                        visible                                                       10

Fill Search Form
    [Arguments]    ${option}    ${text}

    IF                   '${option}'
    Select Options By    id=printer_repair    value    ${option} 
    END

    Fill Text    id=desc    ${text}

Submit Search Form
    Click    css=button[type="submit"] >> text=Buscar

Geek Should Be Found
    [Arguments]    ${geek}

    ${nome}    Set Variable    ${geek}[name] ${geek}[lastname]

    ${target_geek}    Get Element    xpath=//strong[contains(text(), "${nome}")]/../../..

    ${work}    Convert To Lower Case    ${geek}[geek_profile][work] 

    Get Text    ${target_geek}    contains    Atendimento ${work} 
    Get Text    ${target_geek}    contains    ${geek}[geek_profile][desc]
    Get Text    ${target_geek}    contains    ${geek}[geek_profile][cost]

    Set Suite Variable    ${target_geek}

Alien Icon Should Be Visible
    Get Text    ${target_geek}    contains    👽

Geek Not Fould
    Wait For Elements State    css=.search-not-found p >> text=Não encontramos Geeks com o(s) termo(s) informado na busca! 
    ...                        visible                                     10    

Go To Geek From
    Click    css=a[href="/be-geek"] >> text=Seja um Geek

    Wait For Elements State    css=.be-geek-form    visible    10

Fill Geek Form
    [Arguments]    ${geek_profile}

    Reset Geek Form
    Fill Text          id=whatsapp    ${geek_profile}[whats]
    Fill Text          id=desc        ${geek_profile}[desc]

    IF    '${geek_profile}[printer_repair]'

    Select Options By    id=printer_repair    value    ${geek_profile}[printer_repair]

    END

    IF    '${geek_profile}[work]'

    Select Options By    id=work    text    ${geek_profile}[work]

    END


    Fill Text    id=cost    ${geek_profile}[cost]

Submit Geek Form
    Click    css=button >> text=Quero ser um Geek

Geek Form Should Be Sucess
    ${expected_message}    Set Variable    Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State    css=p >> text=${expected_message}    visible    10

Attempt Be a Geek
    [Arguments]    ${key}    ${input}    ${output}

    ${user}    Factory User    attempt_be_geek

    Set To Dictionary       ${user}[geek_profile]    ${key}    ${input}
    Fill Geek Form          ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    ${output}

    After Test

Start Session For Attempt Be a Geek
    ${user}    Factory User    attempt_be_geek

    Start Session
    Do Login           ${user} 
    Go To Geek From

Reset Geek Form
    Execute Javascript    document.getElementsByClassName("be-geek-form")[0].reset();

    #Evaluate JavaScript    ${None}    () => document.getElementsByClassName("be-geek-form")[0].reset();