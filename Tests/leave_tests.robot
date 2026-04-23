*** Settings ***
Documentation       OrangeHRM Leave Module Test Suite
...
...                 Tests navigation to the Leave module and
...                 verifies the Apply Leave form loads correctly.

Library             SeleniumLibrary
Resource            ../Resources/keywords.resource
Resource            ../Resources/leave_keywords.resource

# Use the keywords from keywords.resource for Suite and Test Setup, Teardown session
Suite Setup         Open Browser And Configure
Suite Teardown      Close Browser Session
Test Teardown       Capture Screenshot On Failure


*** Test Cases ***

Verify Leave List Page Is Displayed
    [Documentation]    Logs in and verifies the Leave List
    ...                page loads successfully.
    [Tags]    page_check    positive
    Go To                       ${BASE_URL}/auth/login
    Log In As Admin    # Use keyword from keywords.resource
    Verify Dashboard Is Displayed    # Use keyword from keywords.resource
    Navigate To Leave Module    # Use keyword from leave_keywords.resource
    Verify Leave List Is Displayed    # Use keyword from leave_keywords.resource

Verify Apply Leave Page Is Displayed
    [Documentation]    Logs in, navigates to Leave module,
    ...                and verifies the Apply Leave form loads.
    [Tags]    page_check    positive
    Go To                       ${BASE_URL}/auth/login
    Log In As Admin    # Use keyword from keywords.resource
    Verify Dashboard Is Displayed    # Use keyword from keywords.resource
    Navigate To Leave Module    # Use keyword from leave_keywords.resource
    Click Apply Leave Button    # Use keyword from leave_keywords.resource
    Verify Apply Leave Page Is Displayed    # Use keyword from leave_keywords.resource
