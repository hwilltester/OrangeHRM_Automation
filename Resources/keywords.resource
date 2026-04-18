*** Settings ***
Documentation    Reusable business-level keywords following the Page Object Model.
...              Each keyword group represents one page or user action.
Library          SeleniumLibrary
Resource         variables.resource


*** Keywords ***

# ══════════════════════════════════════════════════════════════════════════════
# BROWSER SETUP & TEARDOWN
# ══════════════════════════════════════════════════════════════════════════════

Open Browser And Configure
    [Documentation]    Opens the browser and applies global settings.
    Open Browser       ${BASE_URL}/auth/login    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Page Load Timeout    ${PAGE_LOAD_TIMEOUT}

Close Browser Session
    [Documentation]    Closes all open browser windows.
    Close All Browsers

Capture Screenshot On Failure
    [Documentation]    Takes a screenshot only when a test has failed.
    ...                Saves the file to the Results/ folder.
    Run Keyword If Test Failed
    ...    Capture Page Screenshot
    ...    ${EXECDIR}/Results/${TEST_NAME}_FAILED.png


# ══════════════════════════════════════════════════════════════════════════════
# LOGIN PAGE
# ══════════════════════════════════════════════════════════════════════════════

Log In As Admin
    [Documentation]    Performs a full login using the admin credentials.
    Wait Until Element Is Visible    ${LOC_USERNAME_INPUT}
    Input Text                       ${LOC_USERNAME_INPUT}    ${ADMIN_USERNAME}
    Input Password                   ${LOC_PASSWORD_INPUT}    ${ADMIN_PASSWORD}
    Click Button                     ${LOC_LOGIN_BUTTON}

Verify Dashboard Is Displayed
    [Documentation]    Confirms the user landed on the dashboard after login.
    Wait Until Element Is Visible    ${LOC_DASHBOARD_HEADER}
    Element Should Be Visible        ${LOC_DASHBOARD_HEADER}