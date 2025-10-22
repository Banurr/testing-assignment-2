*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Verify Tax And Total Calculation
    Open SauceDemo
    Login to SauceDemo
    Click Element    id:add-to-cart-sauce-labs-backpack
    Click Element    id:add-to-cart-sauce-labs-bolt-t-shirt
    Click Element    class:shopping_cart_link
    Click Element    id:checkout
    Input Text       id:first-name    QA
    Input Text       id:last-name     Tester
    Input Text       id:postal-code   1000
    Click Element    id:continue
    Wait Until Element Is Visible     id:finish    timeout=0.5s
    Click Element                     id:finish
    Wait Until Page Contains          Thank you for your order!    timeout=0.5s
    Close Browser
