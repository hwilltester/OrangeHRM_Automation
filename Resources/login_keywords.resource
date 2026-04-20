*** Settings ***
Documentation    Keywords specific to the Login page.
Library          SeleniumLibrary
Resource         variables.resource


*** Keywords ***

# ══════════════════════════════════════════════════════════════════════════════
# LOGIN PAGE ACTIONS
# ══════════════════════════════════════════════════════════════════════════════

Enter Username
    [Documentation]    Types the username into the username field.
    [Arguments]        ${username}
    Wait Until Element Is Visible    ${LOC_USERNAME_INPUT}
    Input Text                       ${LOC_USERNAME_INPUT}    ${username}

Enter Password
    [Documentation]    Types the password into the password field.
    [Arguments]        ${password}
    Input Password    ${LOC_PASSWORD_INPUT}    ${password}

Click Login Button
    [Documentation]    Clicks the login submit button.
    Click Button    ${LOC_LOGIN_BUTTON}

Verify Login Error Is Displayed
    [Documentation]    Confirms the error message appears after a failed login.
    Wait Until Element Is Visible    ${LOC_LOGIN_ERROR_MSG}
    Element Should Be Visible        ${LOC_LOGIN_ERROR_MSG}

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