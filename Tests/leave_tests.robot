*** Settings ***
Documentation       OrangeHRM Leave Module Test Suite
...
...                 Tests navigation to the Leave module and
...                 verifies the Apply Leave form loads correctly.

Library             SeleniumLibrary
Resource            ../Resources/keywords.resource
Resource            ../Resources/leave_keywords.resource

Suite Setup         Open Browser And Configure
Suite Teardown      Close Browser Session
Test Teardown       Capture Screenshot On Failure


*** Test Cases ***

Verify Leave List Page Is Displayed
    [Documentation]    Logs in and verifies the Leave List
    ...                page loads successfully.
    Go To                       ${BASE_URL}/auth/login
    Log In As Admin
    Verify Dashboard Is Displayed
    Navigate To Leave Module
    Verify Leave List Is Displayed

Verify Apply Leave Page Is Displayed
    [Documentation]    Logs in, navigates to Leave module,
    ...                and verifies the Apply Leave form loads.
    Go To                       ${BASE_URL}/auth/login
    Log In As Admin
    Verify Dashboard Is Displayed
    Navigate To Leave Module
    Click Apply Leave Button
    Verify Apply Leave Page Is Displayed