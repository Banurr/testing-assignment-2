*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Verify Logout Functionality
    Open SauceDemo
    Login to SauceDemo
    Click Element    id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=0.5s
    Click Element    id:logout_sidebar_link
    Wait Until Element Is Visible    id:login-button    timeout=0.5s
    Page Should Contain Element      id:user-name
    Page Should Not Contain Element  class:shopping_cart_badge
    Close Browser