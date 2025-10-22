*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

*** Test Cases ***
Logout Test
    Open SauceDemo
    Login to SauceDemo
    Logout of SauceDemo
    Page Should Contain Element    id:login-button
    Close Browser Session
