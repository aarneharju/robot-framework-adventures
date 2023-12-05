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
    # Capture Page Screenshot
    Close Browser
Get Siberian breed website
    [Tags]    breed
    Create New Session
    ${old_log_level}=    Set Log Level    NONE
    ${response}    GET On Session    catapiSession    ${api_url}/breeds/search    params=q=Siberian
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    ${cfa_url}=  Set Variable  ${data}[0][cfa_url]
    # Log To Console    ${data}
    # Open the cat image in the browser
    Open Browser  ${cfa_url}  Chrome
    # Capture Page Screenshot
    Close Browser

Post An Image To Favourites List
    [Tags]    favourite
    Create New Session
    &{favourite_to_add}=    Create Dictionary    image_id=g5
    ${old_log_level}=    Set Log Level    NONE
    ${response}    POST On Session    catapiSession    ${api_url}/favourites    json=${favourite_to_add}
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    Log To Console    ${data}
    ${favourite_id_from_response}=    Set Variable    ${data}[1]
    ${old_log_level}=    Set Log Level    NONE
    ${response}    GET On Session    catapiSession    ${api_url}/images/search    params=${favourite_id_from_response}
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    ${cat_url}=  Set Variable  ${data}[0][url]
    # Open the cat image in the browser
    Open Browser  ${cat_url}  Chrome
    Capture Page Screenshot
    
Delete An Image From Favourites List
    [Tags]    delete favourite
    Create New Session
    ${old_log_level}=    Set Log Level    NONE
    # Get favourites list
    ${response}    GET On Session    catapiSession    ${api_url}/favourites
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    # Get the latest favourite
    ${latest_favourite_before_deleting}=    Set Variable    ${data}[-1][id]
    Log To Console    ${latest_favourite_before_deleting}
    # Delete the latest favourite
    ${old_log_level}=    Set Log Level    NONE
    ${response}    DELETE On Session    catapiSession    ${api_url}/favourites/${latest_favourite_before_deleting}
    Log To Console    ${response}
    # Get the favourites list again
    ${response}    GET On Session    catapiSession    ${api_url}/favourites
    Set Log Level    ${old_log_level}
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    # Get the latest favourite again
    ${latest_favourite_after_deleting}=    Set Variable    ${data}[-1][id]
    Log To Console    ${latest_favourite_after_deleting}
    # Confirm that the favourite was deleted
    Should Not Be Equal As Strings    ${latest_favourite_after_deleting}    ${latest_favourite_before_deleting}


*** Keywords ***
Create New Session
    ${old_log_level}=    Set Log Level    NONE
    ${headers}=    Create Dictionary    x-api-key=${api_key}
    Create Session    catapiSession    ${api_url}    headers=${headers}
    Set Log Level    ${old_log_level}