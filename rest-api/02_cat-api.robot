*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${api_url}=    https://api.thecatapi.com/v1
#${api_key}=    %{CAT_API_KEY}
#${api_key}=    Get Environment Variable    CAT_API_KEY

*** Test Cases ***
Get a random cat image
    ${response}    GET On Session    catapiSession    ${api_url}/images/search
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    ${cat_url}=  Set Variable  ${data}[0][url]
    # Open the cat image in the browser
    Open Browser  ${cat_url}  Chrome
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Create New Session
    ${api_url}=    Get Environment Variable    CAT_API_KEY
    ${headers}=    Create Dictionary    x-api-key=${api_key}
    Create Session    catapiSession    ${api_url}    headers=${headers}