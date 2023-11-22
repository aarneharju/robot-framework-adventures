*** Settings ***
Documentation    Runeberg search
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Search Finna
    Open Browser    https://finna.fi    Chrome
    Click Element    //*[@id="language_menu"]
    Click Element    //*[@id="language_menu"]/ul/li[3]/a
    Input Text    id:searchForm_lookfor    Runeberg
    Click Element    //*[@id="searchForm"]/button[2]
    Wait Until Page Contains    Runeberg
    Click Element    //*[@id="result0"]/div/div/div[2]/div/div[1]/h2/a
    Wait Until Page Contains    P.A. Norstedt & Söners förlag
    Capture Page Screenshot
    