*** Settings ***
Library   Browser    jsextension=${EXECDIR}/resources/module.js

Test Setup    Start Session
Test Teardown    Close Browser    ALL

*** Test Cases ***
Deve tocar uma musica

    [Tags]    Must Play Music
    ${song_name}    Set Variable    Smells Like Test Script
    
    Mock My Song

    Go To    https://parodify.vercel.app/

    Get Text    css=.logged-user    contains    Fernando Papito

    ${play}    Get play button    ${song_name} 
    ${pause}    Get pause button    ${song_name} 
 
    Click    ${play}

    Wait For Elements State     ${pause}     visible    2
    Wait For Elements State     ${play}     visible     7

    # Sleep    5

*** Keywords ***

Start Session
    New Browser    browser=chromium    headless=True
    New Page    about:blank

#Finish Session
#    Take Screenshot

Get play button
    [Arguments]    ${song_name}

    ${play}    Set Variable    
    ...    xpath=//div[contains(@class, "song")]//h6[text()="${song_name}"]/..//button[contains(@class,"play")]

    RETURN    ${play}

Get pause button
     [Arguments]    ${song_name}

     ${pause}    Set Variable    
    ...    xpath=//div[contains(@class, "song")]//h6[text()="${song_name}"]/..//button[contains(@class,"pause")]

    RETURN    ${pause}