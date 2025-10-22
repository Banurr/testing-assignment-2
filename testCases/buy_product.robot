*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Buy Product Test
    Open SauceDemo
    Login to SauceDemo
    Click Button  id:add-to-cart-sauce-labs-backpack
    Click Link    class:shopping_cart_link
    Wait Until Page Contains Element    id:checkout
    Click Button  id:checkout
    Input Text    id:first-name    John
    Input Text    id:last-name     Doe
    Input Text    id:postal-code   12345
    Click Button  id:continue
    Click Button  id:finish
    Page Should Contain    Thank you for your order!
    Close Browser Session
