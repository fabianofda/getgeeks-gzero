*Settings*
Documentation    Test helpers

*Keywords*
Add User From Database
    [Arguments]    ${user}    

    Connect To Postgres
    Insert User                 ${user}
    Disconnect From Database

Do Login
    [Arguments]    ${user}

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials

    User Should Be Logged In    ${user}

Create Geek Profile Service
    [Arguments]    ${user}

    ${token}             Get Token Service        ${user}
    Be a Geek Service    ${user}[geek_profile]    ${token} 