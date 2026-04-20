*** Settings ***
Documentation       OrangeHRM Login Test Suite
...
...                 Tests valid login, invalid login, and empty field scenarios.
...                 Covers both positive and negative test cases.

Library             SeleniumLibrary
Resource            ../Resources/keywords.resource
Resource            ../Resources/login_keywords.resource

Suite Setup         Open Browser And Configure
Suite Teardown      Close Browser Session
Test Teardown       Capture Screenshot On Failure


*** Test Cases ***

Valid Login With Correct Credentials
    [Documentation]    Verifies that admin can login successfully
    ...                and lands on the dashboard.
    Go To                       ${BASE_URL}/auth/login
    Perform Login               ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Verify Dashboard Is Displayed

Invalid Login With Wrong Password
    [Documentation]    Verifies that an error message appears
    ...                when wrong password is entered.
    Go To                       ${BASE_URL}/auth/login
    Perform Login               ${ADMIN_USERNAME}    wrongpassword123
    Verify Login Error Is Displayed
    Verify Login Error Message Text    Invalid credentials

Invalid Login With Empty Fields
    [Documentation]    Verifies that an error message appears
    ...                when both fields are left empty.
    Go To                       ${BASE_URL}/auth/login
    Click Login Button
    Verify Login Error Is Displayed