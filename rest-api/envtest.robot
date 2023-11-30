*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Log Environment Variables
    ${env}=    Get Environment Variable    APPDATA
    Log To Console    ${env}
    ${catapi}=    Get Environment Variable    CAT_API_KEY
    #Log To Console    ${catapi}
