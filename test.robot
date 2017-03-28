*** Settings ***
Library    Selenium2Library
Suite Teardown    Close Browser

*** Variables ***
#CONFIG
${LOGIN URL}    https://www.facebook.com/
${LIKE LIMIT}    100
${USERNAME}    your_username
${PASSWORD}    your_password
${BROWSER}    CHROME
${DELAY}    1

#INPUT&BUTTON
${LOGIN BUTTON}    u_0_q
${INPUT EMAIL}    email
${INPUT PASSWORD}    pass

*** Testcases ***
Auto Like Facebook
    Go Like


*** Keywords ***
Go Like
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${INPUT EMAIL}    ${USERNAME}
    Input Text    ${INPUT PASSWORD}    ${PASSWORD}
    Click Button    ${LOGIN BUTTON}
    Sleep    5
    # Go To     https://www.facebook.com/?sk=h_chr
    : FOR    ${INDEX}    IN RANGE    1    ${LIKE LIMIT}
    \    Sleep    ${DELAY}
    \    ${XPATH}    Catenate    xpath=(//a[contains(text(),'ถูกใจ')])[${INDEX}    ]
    \    ${IS FOUND}=  Run Keyword And Return Status    Element Should Be Visible    ${XPATH}
    \    Run Keyword If    ${IS FOUND}     Click Element    ${XPATH}   
    

