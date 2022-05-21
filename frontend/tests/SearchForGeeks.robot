*Settings*
Documentation    Search for Geeks test suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session    
Test Teardown    After Test       

*Test Cases*
Search For Alien Geek

    ${alien}                       Factory User    search_alien
    Create Geek Profile Service    ${alien} 

    ${searcher}    Factory User    searcher
    Do Login       ${searcher} 