*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Verify Checkout Validation
    Open SauceDemo
    Login to SauceDemo
    Click Element    id:add-to-cart-sauce-labs-backpack
    Click Element    class:shopping_cart_link
    Click Element    id:checkout
    Click Element    id:continue
    Wait Until Element Is Visible    xpath://h3[@data-test='error']    timeout=0.5s
    ${error}=    Get Text    xpath://h3[@data-test='error']
    Should Contain    ${error}    Error: First Name is required

    Close Browser
