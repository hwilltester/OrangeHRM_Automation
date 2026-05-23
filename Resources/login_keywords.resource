*** Settings ***
Documentation    Keywords specific to the Login page.
Library          SeleniumLibrary
Resource         variables.resource


*** Keywords ***

# ══════════════════════════════════════════════════════════════════════════════
# LOGIN PAGE ACTIONS
# ══════════════════════════════════════════════════════════════════════════════

Enter Username
    [Arguments]    ${username}
    Wait Until Page Contains Element    ${LOC_USERNAME_INPUT}    ${IMPLICIT_WAIT}
    Input Text    ${LOC_USERNAME_INPUT}    ${username}

Enter Password
    [Documentation]    Types the password into the password field.
    [Arguments]        ${password}
    Input Password    ${LOC_PASSWORD_INPUT}    ${password}

Click Login Button
    Wait Until Page Contains Element    ${LOC_LOGIN_BUTTON}    ${IMPLICIT_WAIT}
    Click Element    ${LOC_LOGIN_BUTTON}

Verify Login Error Is Displayed
    [Documentation]    Verifies error shown — alert banner or Required validation.
    ${alert_visible}=    Run Keyword And Return Status
    ...    Page Should Contain Element
    ...    xpath://p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    ${required_visible}=    Run Keyword And Return Status
    ...    Page Should Contain    Required
    Should Be True    ${alert_visible} or ${required_visible}
    ...    No login error message found

Verify Login Error Message Text
    [Documentation]    Checks the exact error message text is correct.
    [Arguments]        ${expected_message}
    Element Text Should Be    ${LOC_LOGIN_ERROR_MSG}    ${expected_message}

Perform Login
    [Documentation]    Full login action with any username and password.
    [Arguments]        ${username}    ${password}
    Enter Username      ${username}
    Enter Password      ${password}
    Click Login Button
