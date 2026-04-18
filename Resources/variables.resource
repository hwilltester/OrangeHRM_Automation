*** Settings ***
Documentation    Global variables, test data, and element locators.
...              All locators are defined here to make updates easy.


*** Variables ***

# ── URL ────────────────────────────────────────────────────────────────────────
${BASE_URL}           https://opensource-demo.orangehrmlive.com/web/index.php

# ── Credentials ────────────────────────────────────────────────────────────────
${ADMIN_USERNAME}     Admin
${ADMIN_PASSWORD}     admin123

# ── Browser Settings ───────────────────────────────────────────────────────────
${BROWSER}            chrome
${IMPLICIT_WAIT}      10s
${PAGE_LOAD_TIMEOUT}  30s

# ── Login Page Locators ────────────────────────────────────────────────────────
${LOC_USERNAME_INPUT}        name:username
${LOC_PASSWORD_INPUT}        name:password
${LOC_LOGIN_BUTTON}          css:button[type='submit']
${LOC_DASHBOARD_HEADER}      xpath://h6[text()='Dashboard']

# ── Navigation Locators ────────────────────────────────────────────────────────
${LOC_PIM_MENU}              xpath://span[text()='PIM']
${LOC_ADD_EMPLOYEE_MENU}     xpath://a[text()='Add Employee']

# ── Add Employee Form Locators ─────────────────────────────────────────────────
${LOC_FIRST_NAME_INPUT}      name:firstName
${LOC_LAST_NAME_INPUT}       name:lastName
${LOC_SAVE_BUTTON}           css:button[type='submit']

# ── Success Verification Locators ──────────────────────────────────────────────
${LOC_PERSONAL_DETAILS_HDR}  xpath://h6[text()='Personal Details']

# ── Test Data: Employees ───────────────────────────────────────────────────────
@{EMPLOYEE_DATA}
...    John,Doe
...    Jane,Smith
...    Mike,Ross