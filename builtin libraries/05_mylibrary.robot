*** Settings ***
Library    MyLib.py

*** Test Cases ***
Library test
    ${myString}=    Set Variable    What sorcery is this?
    ${numberOfWords}=    count_words    ${myString}
    