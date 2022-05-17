*Settings*
Documentation    Base Test

Library    Browser
Library    Collections

Library    factories/Users.py
Library    Utils.py

Resource    actions/_SharedActions.robot
Resource    actions/AuthActions.robot
Resource    actions/GeekActions.robot
Resource    actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}    https://getgeeks-fabiano.herokuapp.com

*Keywords*
Start Session
    New Browser          chromium       headless=true    #slowMo=00:00:00.1
    New Page             ${BASE_URL}
    Set Viewport Size    1280           768

After Test
    sleep              0.5
    ${shot_name}       Screenshot Name
    Take Screenshot    fullPage=True      filename=${shot_name}