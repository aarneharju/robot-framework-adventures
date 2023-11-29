*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Destroy the One Ring
    Create Directory    ${CURDIR}/Shire
    Create Directory    ${CURDIR}/Shire/Frodo
    Create File    ${CURDIR}/Shire/Frodo/OneRing.txt    One ring to rule them all, one ring to find them, One ring to bring them all and in the darkness bind them.
    Should Exist    ${CURDIR}/Shire/Frodo/OneRing.txt
    ${onering}=    Get File    ${CURDIR}/Shire/Frodo/OneRing.txt
    Should Be Equal As Strings    ${onering}    One ring to rule them all, one ring to find them, One ring to bring them all and in the darkness bind them.
    Create Directory    ${CURDIR}/Mt Doom
    Move File    ${CURDIR}/Shire/Frodo/OneRing.txt    ${CURDIR}/Mt Doom/OneRing.txt
    File Should Exist    ${CURDIR}/Mt Doom/OneRing.txt
    Remove File    ${CURDIR}/Mt Doom/OneRing.txt
    File Should Not Exist    ${CURDIR}/Mt Doom/OneRing.txt
    Remove Directory    ${CURDIR}/Shire    true
    Remove Directory    ${CURDIR}/Mt Doom    true
    Directory Should Not Exist    ${CURDIR}/Shire
    Directory Should Not Exist    ${CURDIR}/Mt Doom