*** Settings ***
Documentation       OrangeHRM Employee Management Test Suite
...
...                 Tests the end-to-end flow of logging in and adding
...                 new employees via the PIM module.

Library             SeleniumLibrary
Resource            ../Resources/keywords.resource

Suite Setup         Open Browser And Configure
Suite Teardown      Close Browser Session
Test Teardown       Capture Screenshot On Failure

Test Template       Login And Add Employee


*** Test Cases ***    FIRST_NAME    LAST_NAME

Add Employee John Doe      John    Doe


*** Keywords ***

Login And Add Employee
    [Documentation]    Template keyword: logs in, adds an employee, and verifies.
    [Arguments]        ${first_name}    ${last_name}
    Go To                     ${BASE_URL}/auth/login
    Log In As Admin
    Verify Dashboard Is Displayed
    Add New Employee And Verify    ${first_name}    ${last_name}