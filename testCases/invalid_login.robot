*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Invalid Login Shows Error
    Open SauceDemo
    Input Text    id:user-name    wrong_user
    Input Text    id:password     wrong_password
    Click Button  id:login-button
    Wait Until Element Is Visible    xpath://h3[@data-test='error']    timeout=10s
    ${msg}=    Get Text    xpath://h3[@data-test='error']
    Should Contain    ${msg}    Epic sadface
    Close Browser Session

