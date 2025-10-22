*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Login Test
    Open SauceDemo
    Login to SauceDemo
    Page Should Contain Element    class:inventory_list
    Close Browser Session
