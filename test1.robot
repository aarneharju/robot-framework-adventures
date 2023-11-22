*** Settings ***
Documentation    This is the real deal
...    you can continue on multiple lines

*** Test Cases ***
Hello World Test
    Log status

*** Keywords ***
Log status
    Log    My status is:
    Log    Happy