*** Settings ***
Documentation       OrangeHRM Login Test Suite
...
...                 Tests valid login, invalid login, and empty field scenarios.
...                 Covers both positive and negative test cases.

Library             SeleniumLibrary
Resource            ../Resources/keywords.resource
Resource            ../Resources/login_keywords.resource

# Use the keywords from keywords.resource for Suite and Test Setup, Teardown session
Suite Setup         Open Browser And Configure
Suite Teardown      Close Browser Session
Test Teardown       Capture Screenshot On Failure


*** Test Cases ***

Valid Login With Correct Credentials
    [Documentation]    Verifies that admin can login successfully
    ...                and lands on the dashboard.
    [Tags]    Positive    Login    # For sorting and running specific tests
    Go To                       ${BASE_URL}/auth/login
    Perform Login               ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}    # Use keyword from login_keywords.resource
    Verify Dashboard Is Displayed    # Use keyword from keywords.resource

Invalid Login With Wrong Password
    [Documentation]    Verifies that an error message appears
    ...                when wrong password is entered.
    [Tags]    Negative    Login
    Go To                       ${BASE_URL}/auth/login
    Perform Login               ${ADMIN_USERNAME}    wrongpassword123
    Verify Login Error Is Displayed    # Use keyword from login_keywords.resource
    Verify Login Error Message Text    Invalid credentials    # Use keyword from login_keywords.resource

Invalid Login With Empty Fields
    [Documentation]    Verifies that an error message appears
    ...                when both fields are left empty.
    [Tags]    Negative    Login
    Go To                       ${BASE_URL}/auth/login
    Click Login Button    # Use keyword from login_keywords.resource
    Verify Login Error Is Displayed    # Use keyword from login_keywords.resource
