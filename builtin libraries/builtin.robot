*** Test Cases ***
Final Frontier
    Set Test Variable    ${quote}    Space: the final frontier. These are the voyages of the starship Enterprise. Its five-year mission: to explore strange new worlds. To seek out new life and new civilizations. To boldly go where no man has gone before!
    Variable Should Exist    ${quote}
    Should Not Be Empty    ${quote}
    Should Start With    ${quote}    Space
    Should Match Regexp    ${quote}    ^Space
    Should Contain    ${quote}    to explore strange new worlds
    Should Match Regexp    ${quote}    to explore strange new worlds
    Should Not Match    ${quote}    Space: the final frontier. These are the voyages of the starship Enterprise. Its continuing mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no one has gone before.
    Should End With    ${quote}    before!
    Should Match Regexp    ${quote}    before!$