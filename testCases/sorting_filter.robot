*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ../resources/keywords.robot

*** Test Cases ***
Sort Products High To Low And Verify Order
    [Documentation]    Verify that sorting high→low works correctly.
    Open SauceDemo
    Login to SauceDemo

    Select From List By Value    class:product_sort_container    hilo
    ${prices}=    Get WebElements    xpath://div[@class='inventory_item_price']
    ${values}=    Create List
    FOR    ${price}    IN    @{prices}
        ${text}=    Get Text    ${price}
        ${num}=     Convert To Number    ${text.replace('$','')}
        Append To List    ${values}    ${num}
    END

    ${sorted}=    Copy List    ${values}
    Sort List    ${sorted}
    Reverse List    ${sorted}
    Lists Should Be Equal    ${values}    ${sorted}

    Close Browser Session