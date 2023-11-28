*** Settings ***
Library    String

*** Test Cases ***
String tests
    ${mystring}=    Set Variable    THE QUICK, BROWN FOX JUMPS OVER THE LAZY, BLACK DOG
    ${mystring}=    Convert To Lower Case    ${mystring}
    Should Be Lower Case    ${mystring}
    ${mystring}=    Remove String    ${mystring}    ,
    Should Not Contain    ${mystring}    ,
    ${mystring}=    Replace String    ${mystring}    fox    cat
    ${mystring}=    Replace String    ${mystring}    dog    pig
    ${firstsubstring}=    Get Substring    ${mystring}    0    4
    ${lastsubstring}=    Get Substring    ${mystring}    -3
    Log To Console    ${firstsubstring}
    Log To Console    ${lastsubstring}
    @{mylist}=    Split String    ${mystring}
    ${numberOfWords}=    Evaluate    len(@{mylist})
    Log To Console    ${numberOfWords}