# 🤖 OrangeHRM Automation — Robot Framework Portfolio Project

> **Automated UI testing for [OrangeHRM Live](https://opensource-demo.orangehrmlive.com)**
> Built with Robot Framework · SeleniumLibrary · Page Object Model · Data-Driven Testing

---

## 📌 Project Overview

This project automates UI testing for OrangeHRM — a popular open-source HR application.

It covers 3 modules with 8 test cases total:
- **Login Module** — valid login, invalid login, empty fields
- **PIM Module** — add 3 new employees using data-driven testing
- **Leave Module** — navigate to leave list and apply leave form

Every test follows the **Page Object Model** pattern, keeping the code clean, readable, and easy to maintain.

---

## 📁 Folder Structure

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
│   └── variables.resource        # All locators and test data
│
├── Results/                      # Reports and screenshots go here
│   └── .gitkeep
│
├── .gitignore
├── requirements.txt
└── README.md

---

## ⚙️ Setup Instructions

### Step 1 — Check Python is installed
```bash
python --version
```
You need Python 3.10 or higher. Download from [python.org](https://www.python.org/downloads/) if needed.

---

### Step 2 — Clone this project
```bash
git clone https://github.com/hwilltester/OrangeHRM_Automation.git
cd OrangeHRM_Automation
```

---

### Step 3 — Create a virtual environment
```bash
# Create it
python -m venv venv

# Activate on Mac/Linux
source venv/bin/activate

# Activate on Windows
venv\Scripts\activate
```

---

### Step 4 — Install all libraries
```bash
pip install -r requirements.txt
```

---

### Step 5 — Install ChromeDriver
```bash
webdrivermanager chrome
```

---

## ▶️ How To Run The Tests

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

## 📊 Viewing The Reports

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

## 🧠 Design Decisions

### Page Object Model
All page actions live in `Resources/` keyword files — not inside the test files. If a locator changes, you fix it in one place and all tests stay working.

### Data-Driven Testing
The employee tests use a Test Template with a data table. One keyword handles all 3 employees automatically — no copy-pasting code.

### Screenshot Only On Failure
Screenshots are taken only when a test fails. This saves disk space and gives you exactly the evidence needed to debug.

### Separate Keyword Files Per Module
Each module has its own keyword file (`login_keywords`, `leave_keywords`). This makes the project easy to scale — adding a new module means adding a new file, not editing existing ones.

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Robot Framework 7 | Test automation framework |
| SeleniumLibrary | Browser control |
| Google Chrome | Browser |
| ChromeDriver | Bridge between Selenium and Chrome |
| Python 3.10+ | Runtime language |

---

## 💼 Why This Project Matters For a Portfolio

| What it shows | Why it matters |
|---|---|
| Page Object Model | Industry-standard design pattern |
| Data-Driven Testing | Scales without copy-pasting code |
| Multiple test suites | Real project organisation |
| Positive and negative tests | Professional test thinking |
| Conditional screenshot on failure | Smart teardown logic |
| Clean folder structure | Easy for any team to understand |

---

## 🙋 Author

**Your Name**
[GitHub](https://github.com/hwilltester) · [LinkedIn](https://linkedin.com/in/YOUR_PROFILE)

---

*Feel free to fork this project and use it as a base for your own automation work.*