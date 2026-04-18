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

# ══════════════════════════════════════════════════════════════════════════════
# NAVIGATION
# ══════════════════════════════════════════════════════════════════════════════

Navigate To Add Employee Page
    [Documentation]    Clicks PIM in the sidebar, then Add Employee.
    Click Element                    ${LOC_PIM_MENU}
    Wait Until Element Is Visible    ${LOC_ADD_EMPLOYEE_MENU}
    Click Element                    ${LOC_ADD_EMPLOYEE_MENU}


# ══════════════════════════════════════════════════════════════════════════════
# ADD EMPLOYEE PAGE
# ══════════════════════════════════════════════════════════════════════════════

Fill In Employee Details
    [Documentation]    Enters the employee's first and last name into the form.
    [Arguments]        ${first_name}    ${last_name}
    Wait Until Element Is Visible    ${LOC_FIRST_NAME_INPUT}
    Clear Element Text               ${LOC_FIRST_NAME_INPUT}
    Input Text                       ${LOC_FIRST_NAME_INPUT}    ${first_name}
    Input Text                       ${LOC_LAST_NAME_INPUT}     ${last_name}

Save Employee Record
    [Documentation]    Clicks the Save button to submit the form.
    Click Button    ${LOC_SAVE_BUTTON}

Verify Employee Was Created
    [Documentation]    Checks that the Personal Details page appears,
    ...                which confirms the employee was saved successfully.
    Wait Until Element Is Visible    ${LOC_PERSONAL_DETAILS_HDR}    timeout=15s
    Element Should Be Visible        ${LOC_PERSONAL_DETAILS_HDR}


# ══════════════════════════════════════════════════════════════════════════════
# HIGH-LEVEL BUSINESS KEYWORD
# ══════════════════════════════════════════════════════════════════════════════

Add New Employee And Verify
    [Documentation]    End-to-end keyword: navigates to the Add Employee page,
    ...                fills in the form, saves it, and confirms success.
    [Arguments]        ${first_name}    ${last_name}
    Navigate To Add Employee Page
    Fill In Employee Details     ${first_name}    ${last_name}
    Save Employee Record
    Verify Employee Was Created