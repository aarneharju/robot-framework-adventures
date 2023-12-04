*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${api_url}=    https://api.thecatapi.com/v1
${api_key}=    %{CAT_API_KEY}
#${api_key}=    Get Environment Variable    CAT_API_KEY

*** Test Cases ***
Get a random cat image
    Create New Session
    ${old_log_level}=    Set Log Level    NONE
    ${response}    GET On Session    catapiSession    ${api_url}/images/search
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    ${cat_url}=  Set Variable  ${data}[0][url]
    # Open the cat image in the browser
    Open Browser  ${cat_url}  Chrome
    Capture Page Screenshot
    Close Browser
Get Siberian breed website
    [Tags]    breed
    Create New Session
    ${old_log_level}=    Set Log Level    NONE
    ${response}    GET On Session    catapiSession    ${api_url}/breeds/search    params=q=Siberian
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    ${cfa_url}=  Set Variable  ${data}[0][cfa_url]
    Log To Console    ${data}
    # Open the cat image in the browser
    Open Browser  ${cfa_url}  Chrome
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Create New Session
    ${old_log_level}=    Set Log Level    NONE
    ${headers}=    Create Dictionary    x-api-key=${api_key}
    Create Session    catapiSession    ${api_url}    headers=${headers}
    Set Log Level    ${old_log_level}