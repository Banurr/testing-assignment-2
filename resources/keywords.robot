*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

*** Keywords ***
Open SauceDemo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login to SauceDemo
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Button  id:login-button
    Wait Until Page Contains Element    class:inventory_list

Logout of SauceDemo
    Click Button    id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=5s
    Click Element   id:logout_sidebar_link
    Wait Until Page Contains Element    id:login-button

Close Browser Session
    Close Browser
