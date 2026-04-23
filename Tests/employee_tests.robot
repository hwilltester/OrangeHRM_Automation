*** Settings ***
Documentation       OrangeHRM Employee Management Test Suite with data driven test
...
...                 Tests the end-to-end flow of logging in and adding
...                 new employees via the PIM module.

Library             SeleniumLibrary
Resource            ../Resources/keywords.resource

# Use the keywords from keywords.resource for Suite and Test Setup, Teardown session

Suite Setup         Open Browser And Configure
Suite Teardown      Close Browser Session
Test Teardown       Capture Screenshot On Failure

# Use this specific sequence of steps for every test listed below
Test Template       Login And Add Employee


*** Test Cases ***    
#   Test Case Name     first_name    last_name
Add Employee John Doe      John    Doe
Add Employee Jane Smith    Jane    Smith
Add Employee Mike Ross     Mike    Ross


*** Keywords ***

# This is the "Recipe" or "Template" used by the tests above
Login And Add Employee
    [Documentation]    Template keyword: logs in, adds an employee, and verifies.
    [Arguments]        ${first_name}    ${last_name}
    Go To                     ${BASE_URL}/auth/login
    Log In As Admin    # Use keyword from keywords.resource
    Verify Dashboard Is Displayed    # Use keyword from keywords.resource
    Add New Employee And Verify    ${first_name}    ${last_name}    # Use keyword from keywords.resource
