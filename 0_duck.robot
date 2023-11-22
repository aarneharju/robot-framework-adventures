*** Settings ***
Documentation    Duck Duck Go search
Library    SeleniumLibrary
# Library    keywords.robot
# Test Setup    
# Test Teardown    Close Browser
# Suite Teardown    

*** Variables ***
${username}    Arnold

*** Test Cases ***
DuckDuckGo search
    [Tags]    test1    tagiGrouppi
    Open Browser    https://duckduckgo.com    Chrome
    Input Text    id:searchbox_input    Sogeti Finland
    Click Element    xpath://button[@aria-label="Search"]
    Wait Until Page Contains    Sogeti Finland
    Capture Page Screenshot

Test case 2
    [Tags]    test2    tagiGrouppi    # you can run only test case 2 by: robot -i (tai --include) test2 duckduckgo.robot (-e = --exclude)
    Log    Test2
Test case 3
    [Tags]    test3
    Log    The username is ${username}

*** Keywords ***
Log status
    Log    My status is:
    Log    Happy