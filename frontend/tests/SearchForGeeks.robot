*Settings*
Documentation    Search for Geeks test suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session    
Test Teardown    After Test       

*Test Cases*
Search For Alien Geek

    ${alien}                       Factory User    search_alien
    Create Geek Profile Service    ${alien} 

    ${searcher}                     Factory User    searcher
    Do Login                        ${searcher} 
    Go To Geeks
    Fill Search Form                Sim             fita matricial
    Submit Search Form 
    Geek Should Be Found            ${alien}        
    Alien Icon Should Be Visible    

Search For Common Geek

    ${common}                      Factory User    search_common
    Create Geek Profile Service    ${common} 

    ${searcher}             Factory User    searcher
    Do Login                ${searcher} 
    Go To Geeks
    Fill Search Form        Não             formatação de SO
    Submit Search Form 
    Geek Should Be Found    ${common}       

Search Not Fould

    ${searcher}            Factory User    searcher
    Do Login               ${searcher} 
    Go To Geeks
    Fill Search Form       Não             Gamer atari da polivox
    Submit Search Form 
    Geek Not Fould
