# 🤖 OrangeHRM Automation - Robot Framework Portfolio Project

> **Automated UI testing for [OrangeHRM Live](https://opensource-demo.orangehrmlive.com)**
> Built with Robot Framework · SeleniumLibrary · Page Object Model · Data-Driven Testing

---

## 📌 Why I Built This Project

I built this project to demonstrate my skills in Web Automation and Quality Assurance. Using the OrangeHRM open-source application, I designed an automated testing suite that ensures the core business flows—like logging in, managing employees, and applying for leave work perfectly every single time.

It covers 3 modules with 8 test cases total:
- **Login Module** —> valid login, invalid login, empty fields
- **PIM Module** —> add 3 new employees using data-driven testing
- **Leave Module** —> navigate to leave list and apply leave form

Every test follows the **Page Object Model** pattern, keeping the code clean, readable, and easy to maintain.

---

### 📁 Folder Structure

```
OrangeHRM_Automation/
│
├── Tests/
│   ├── employee_tests.robot      # Add employee test cases
│   ├── login_tests.robot         # Login test cases
│   └── leave_tests.robot         # Leave module test cases
│
├── Resources/
│   ├── keywords.resource         # Shared business keywords
│   ├── login_keywords.resource   # Login page keywords
│   ├── leave_keywords.resource   # Leave module keywords
│   └── variables.resource        # All locators and test data as Variable resource
│
├── Results/                      # Reports and screenshots will be shown here
│   └── .gitkeep
│
├── .gitignore
├── requirements.txt
└── README.md
```
---

## ⚙️ My Local Setup Guide

### Step 1 - Check Python is installed
```bash
python --version
```
You need Python 3.10 or higher. Download from [python.org](https://www.python.org/downloads/) if needed.

---

### Step 2 - Clone this project
```bash
git clone https://github.com/hwilltester/OrangeHRM_Automation.git
cd OrangeHRM_Automation
```

---

### Step 3 - Create a virtual environment
```bash
# Create it
python -m venv venv

# Activate on Mac/Linux
source venv/bin/activate

# Activate on Windows
venv\Scripts\activate
```

---

### Step 4 - Install all libraries
```bash
pip install -r requirements.txt
```

---

### Step 5 - Install ChromeDriver
```bash
webdrivermanager chrome
```

---

## ▶️ How I Run My Tests

### Run ALL tests
```bash
robot --outputdir Results Tests/
```

---

### Run each test suite separately

**Login tests only:**
```bash
robot --outputdir Results Tests/login_tests.robot
```

**Employee tests only:**
```bash
robot --outputdir Results Tests/employee_tests.robot
```

**Leave tests only:**
```bash
robot --outputdir Results Tests/leave_tests.robot
```

---

### Run a single test case by name

**Valid login test:**
```bash
robot --outputdir Results --test "Valid Login With Correct Credentials" Tests/login_tests.robot
```

**Invalid login test:**
```bash
robot --outputdir Results --test "Invalid Login With Wrong Password" Tests/login_tests.robot
```

**Add John Doe only:**
```bash
robot --outputdir Results --test "Add Employee John Doe" Tests/employee_tests.robot
```

**Add Jane Smith only:**
```bash
robot --outputdir Results --test "Add Employee Jane Smith" Tests/employee_tests.robot
```

**Add Mike Ross only:**
```bash
robot --outputdir Results --test "Add Employee Mike Ross" Tests/employee_tests.robot
```

**Leave list test:**
```bash
robot --outputdir Results --test "Verify Leave List Page Is Displayed" Tests/leave_tests.robot
```

**Apply leave test:**
```bash
robot --outputdir Results --test "Verify Apply Leave Page Is Displayed" Tests/leave_tests.robot
```

---

### Run in headless mode (no browser window)
```bash
robot --outputdir Results --variable BROWSER:headlesschrome Tests/
```

---

## 📊 Checking My Test Results

After any test run, open the `Results/` folder:

| File | What it shows |
|---|---|
| `report.html` | Pass/fail summary — open this first |
| `log.html` | Detailed step-by-step log |
| `output.xml` | Raw data for CI/CD tools |
| `*.png` | Screenshots captured only on failure |

---

## 🧪 Test Cases Summary

| Suite | Test Case | Type |
|---|---|---|
| login_tests | Valid Login With Correct Credentials | Positive |
| login_tests | Invalid Login With Wrong Password | Negative |
| login_tests | Invalid Login With Empty Fields | Negative |
| employee_tests | Add Employee John Doe | Positive |
| employee_tests | Add Employee Jane Smith | Positive |
| employee_tests | Add Employee Mike Ross | Positive |
| leave_tests | Verify Leave List Page Is Displayed | Positive |
| leave_tests | Verify Apply Leave Page Is Displayed | Positive |

---

## 🧠 Why I Built It This Way (Design Decisions)
This wasn't just about writing code; I wanted to build something that reflects real-world professional standards. Here are the key decisions I made:

### Why Page Object Model?
I chose the Page Object Model (POM) because I wanted to keep my test scripts clean. Instead of hardcoding locators inside my tests, I moved them to `Resources/` separate keyword files. This way, if a button's ID changes, I only have to fix it in one place, and all my tests stay green.

### Why Data-Driven Testing for Employees?
I didn't want to copy-paste the same code for John, Jane, and Mike. I used a Test Template to handle the heavy lifting. It makes the project much easier to scale—if we need to test 50 employees tomorrow, I just add 50 rows of data, not 50 test cases.

### Screenshot Only On Failure
I configured the project to only capture screenshots on failure. I believe this is a better practice because it saves storage space and helps me focus only on the bugs when I'm reviewing the Results folder.

### Separate Keyword Files Per Module / Module-Based Keywords
I split my keywords into separate files (`login_keywords`, `leave_keywords`). In a real job, automation projects grow fast, and this structure ensures that the project remains organized and easy for other team members to understand.

---
### 💡 What I Learned

Building this portfolio helped me master:
How to structure a Robot Framework project from scratch.
Handling dynamic elements in the OrangeHRM UI.
Managing virtual environments and dependencies effectively.

---
## 🛠️ My Chosen Tech Stack

| Tool | Purpose |
|---|---|
| Robot Framework 7 | Test automation framework |
| SeleniumLibrary | Browser control |
| Google Chrome | Browser |
| ChromeDriver | Bridge between Selenium and Chrome |
| Python 3.10+ | Runtime language |

---

## 🙋 Author

**Htuu Will**
[GitHub](https://github.com/hwilltester) · [LinkedIn](https://linkedin.com/in/htuuwill)

---

*Feel free to fork this project and use it as a base for your own automation work.*
