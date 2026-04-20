*** Settings ***
Documentation    Keywords specific to the Leave module.
Library          SeleniumLibrary
Resource         variables.resource


*** Keywords ***

# ══════════════════════════════════════════════════════════════════════════════
# LEAVE MODULE ACTIONS
# ══════════════════════════════════════════════════════════════════════════════

Navigate To Leave Module
    [Documentation]    Clicks Leave in the left sidebar.
    Click Element                    ${LOC_LEAVE_MENU}
    Wait Until Element Is Visible    ${LOC_LEAVE_LIST_HEADER}

Verify Leave List Is Displayed
    [Documentation]    Confirms the Leave List page loaded successfully.
    Element Should Be Visible    ${LOC_LEAVE_LIST_HEADER}

Click Apply Leave Button
    [Documentation]    Clicks the Apply button to open the leave form.
    Click Element                    ${LOC_APPLY_LEAVE_BUTTON}
    Wait Until Element Is Visible    ${LOC_APPLY_LEAVE_HEADER}

Verify Apply Leave Page Is Displayed
    [Documentation]    Confirms the Apply Leave form loaded successfully.
    Element Should Be Visible    ${LOC_APPLY_LEAVE_HEADER}