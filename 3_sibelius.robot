*** Settings ***
Documentation    Sibelius search
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Search Finna
    Open Browser    https://finna.fi    #Chrome
    # Wait Until Page Contains    Salli kaikki evästeet
    # Click Button    css:#cc-main > div > div > div > div.cm__btns > div > button:nth-child(1)
    Click Element    //*[@id="language_menu"]
    Click Element    //*[@id="language_menu"]/ul/li[3]/a
    Click Element    css:.search-tooltip a
    Wait Until Page Contains    
    Click Element    id:search_type0_0
    Click Element    //*[@id="search_type0_0"]/option[2]
    Input Text    id:searchForm_lookfor0_0    Sibelius
    Click Element    //*[@id="search_type0_1"]/option[5]
    Click Element    locator
    Wait Until Page Contains    Sibelius
    Click Element    //*[@id="result0"]/div/div/div[2]/div/div[1]/h2/a
    Wait Until Page Contains    P.A. Norstedt & Söners förlag
    Capture Page Screenshot
    