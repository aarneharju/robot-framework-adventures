*** Settings ***
Library    RequestsLibrary

*** Variables ***
${api_url}=    https://api.punkapi.com/v2

*** Test Cases ***
Get First Beer
    ${response}=    GET    ${api_url}/beers/1
    Log    ${response}

Get Random Beer
    [Tags]    random
    ${response}=    GET    ${api_url}/beers/random
    @{data}=  Evaluate  json.loads('''${response.content}''')  json
    ${beer_name}=    Set Variable    ${data}[0][name]

Get Rabiator Beer
    [Tags]    rabiator
    ${response}=    GET    ${api_url}/beers    params=beer_name=Rabiator
    @{data}=    Evaluate    json.loads('''${response.content}''')    json
    ${beer_name}=    Set Variable    ${data}[0][name]

Get All Beers With Hersbrucker Hops
    [Tags]    hersbrucker
    ${response}=    GET    ${api_url}/beers    params=hops=hersbrucker
    @{data}=    Evaluate    json.loads('''${response.content}''')    json
    ${beer_name}=    Set Variable    ${data}[0][name]
    FOR    ${beer}    IN    @{data}
        Log    ${beer}[name]
        Log To Console    ${beer}[name]
    END

Get All Beers With Alcohol Content Less Than 5.5
    [Tags]    ABVFinland
    ${response}=    GET    ${api_url}/beers    params=abv_lt=5.5
    @{data}=    Evaluate    json.loads('''${response.content}''')    json
    # ${beer_name}=    Set Variable    ${data}[0][name]
    FOR    ${beer}    IN    @{data}
        Log    ${beer}[name]
        Log To Console    ${beer}[name]
    END
Get All Beers Brewed Before 2011 With Alcohol Content More Than 8
    [Tags]    Before2011over8ABV
    ${response}=    GET    ${api_url}/beers    params=brewed_before=01-2011&abv_lt=8
    @{data}=    Evaluate    json.loads('''${response.content}''')    json
    # ${beer_name}=    Set Variable    ${data}[0][name]
    FOR    ${beer}    IN    @{data}
        Log    ${beer}[name]
        Log To Console    ${beer}[name]
    END

    
*** Keywords ***
