*** Settings ***
Documentation    Finna search
Library    SeleniumLibrary
# Test Teardown    Close Browser

*** Test Cases ***
Search Finna
    Open Browser    https://finna.fi    #Chrome
    Click Element    //*[@id="language_menu"]
    Click Element    //*[@id="language_menu"]/ul/li[3]/a
    Input Text    id:searchForm_lookfor    Seitsemän veljestä
    Click Element    //*[@id="searchForm"]/button[2]
    Wait Until Page Contains    Kivi, Aleksis
    Capture Page Screenshot