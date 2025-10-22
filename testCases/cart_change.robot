*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Verify Add And Remove Cart Items
    Open SauceDemo
    Login to SauceDemo
    Click Element    id:add-to-cart-sauce-labs-backpack
    Click Element    id:add-to-cart-sauce-labs-bike-light
    Click Element    id:add-to-cart-sauce-labs-bolt-t-shirt
    Wait Until Element Is Visible    class:shopping_cart_badge    timeout=1s
    ${count}=    Get Text    class:shopping_cart_badge
    Should Be Equal As Strings    ${count}    3
    Click Element    id:remove-sauce-labs-bike-light
    ${new_count}=    Get Text    class:shopping_cart_badge
    Should Be Equal As Strings    ${new_count}    2
    Close Browser Session
