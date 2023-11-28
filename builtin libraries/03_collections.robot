*** Settings ***
Library    Collections
Library    String

*** Test Cases ***
Collections tests
    ${company}=    Set Variable    Fili, Kili, Balin, Dwalin, Oin, Gloin, Dori, Nori, Ori, Bifur, Bofur, Bombur, Thorin
    ${company}=    Remove String    ${company}    ,
    @{company}=    Split String    ${company}
    Append To List    ${company}    Bilbo
    Should Contain    ${company}    Bilbo
    Insert Into List    ${company}    0    Gandalf
    Should Contain    ${company}    Gandalf
    ${first_list_item_of_original_list}=    Get From List    ${company}    0
    Reverse List    ${company}
    Log To Console    ${company}
    ${last_list_item_of_reversed_list}=    Get From List    ${company}    -1
    Should Be Equal As Strings    ${first_list_item_of_original_list}    ${last_list_item_of_reversed_list}