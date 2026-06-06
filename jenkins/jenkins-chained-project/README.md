#  Jenkins Chained Project - CI/CD Automation Lab

CI/CD automation laboratory developed during the **KodeKloud - Jenkins for Beginners** course.

This project demonstrates how to create and configure **chained Jenkins jobs** to automate sequential build and testing workflows using Jenkins Freestyle Projects and Shell Scripts.

---

#  Course Information




| Category | Details |
| :--- | :--- |
| **Platform** | KodeKloud |
| **Course** | Jenkins for Beginners |
| **Module** | Jenkins Setup and Interface |
| **Lab** | Jenkins Chained Project |
| **Focus Areas** | Jenkins, CI/CD, Job Chaining, Automation, Linux |

---

#  Project Overview

The purpose of this laboratory was to understand how Jenkins jobs can trigger other jobs automatically as part of a CI/CD workflow.

The project simulates a simplified software delivery pipeline where:
1. A build job executes first
2. A second testing job runs automatically after the first job completes successfully

This workflow represents the foundational concepts behind real-world Continuous Integration systems used in DevOps environments.

---

#  Objectives

The main objectives of this lab were:
- Install and configure Jenkins jobs
- Create Freestyle Projects
- Automate shell script execution
- Configure chained Jenkins jobs
- Understand job dependencies
- Simulate CI/CD workflows
- Practice Jenkins automation fundamentals

---

# ️ Technologies Used




| Area | Technology |
| :--- | :--- |
| **CI/CD** | Jenkins |
| **Operating System** | Linux |
| **Automation** | Shell Scripting |
| **Programming** | Bash |
| **Version Control** | Git & GitHub |
| **Jenkins Type** | Freestyle Projects |

---

#  Project Structure

```text
jenkins-chained-project/
├── ascii-build-job/
│   ├── builds/
│   ├── config.xml
│   └── nextBuildNumber
│
├── ascii-test-job/
│   ├── builds/
│   ├── config.xml
│   └── nextBuildNumber
│
└── README.md
```

---

# ️ Jenkins Chained Workflow

## ️ Build Job — `ascii-build-job`

The first Jenkins job is responsible for:
- Executing shell commands
- Simulating an application build
- Generating ASCII output
- Triggering the next Jenkins job automatically

### Example Build Script
```bash
#!/bin/bash

echo "================================="
echo " Starting ASCII Build Process"
echo "================================="

echo "Build completed successfully!"
```

##  Test Job — `ascii-test-job`

The second Jenkins job runs automatically after the build job succeeds.

### Responsibilities:
- Simulate testing phase
- Validate previous build execution
- Demonstrate chained CI/CD execution

### Example Test Script
```bash
#!/bin/bash

echo "================================="
echo " Running Automated Tests"
echo "================================="

echo "All tests passed successfully!"
```

---

#  Jenkins Job Chaining

The project uses Jenkins Freestyle Project configuration to create a chained execution flow.

### Workflow:
```text
ascii-build-job
        ↓
ascii-test-job
```

When the build job finishes successfully, Jenkins automatically triggers the test job.

This demonstrates:
- Continuous Integration concepts
- Automated workflows
- Sequential job orchestration
- Basic pipeline architecture

---

#  Running the Jobs

### 1️⃣ Start Jenkins
```bash
sudo systemctl start jenkins
```

### 2️⃣ Access Jenkins Dashboard
[http://localhost:8080](http://localhost:8080)

### 3️⃣ Execute Build Job
From the Jenkins dashboard:
- Open `ascii-build-job`
- Click **Build Now**
- Jenkins will automatically trigger `ascii-test-job` upon success

---

#  Skills Demonstrated

This project demonstrates practical experience with:
- Jenkins Administration
- Jenkins Freestyle Projects
- CI/CD Fundamentals
- Automation Workflows
- Job Chaining
- Linux Automation
- Shell Scripting
- Build Orchestration
- Continuous Integration Concepts

---

#  Testing and Validation

The workflow was validated by:
- Running chained Jenkins jobs
- Verifying automatic job execution
- Checking Jenkins build history
- Reviewing Jenkins console output logs

*Example Output:*
```text
Build completed successfully!
All tests passed successfully!
```

---

#  Learning Outcome

Through this project, I gained hands-on experience configuring Jenkins automation workflows and understanding how CI/CD systems coordinate multiple jobs in real DevOps environments.

This lab reinforced foundational concepts such as:
- Job orchestration
- Build automation
- Automated testing workflows
- Jenkins job dependencies
- Continuous Integration pipelines

---

#  Jenkins Configuration Files

The repository includes real Jenkins job configuration files exported directly from the Jenkins server under:
`/var/lib/jenkins/jobs/`

This provides practical exposure to Jenkins internal job structure and configuration management.

---

#  Repository

```bash
git clone https://github.com/juandev-mx/devops-engineer-labs.git
```

---

#  Course Reference

- **Platform:** KodeKloud
- **Course:** Jenkins for Beginners


<img width="959" height="472" alt="Login_Jenkins" src="https://github.com/user-attachments/assets/73a33081-2bb9-48cb-9e1b-c155760605f1" />

<img width="959" height="473" alt="Create_tasks_Jenkins" src="https://github.com/user-attachments/assets/68ff89f5-a3c9-4c48-85b9-f2345dbd0fb5" />

<img width="959" height="474" alt="ShellScript_asciibuildjob" src="https://github.com/user-attachments/assets/7a0d77a7-2021-4e79-bf34-4c8941f4cf7c" />

<img width="959" height="470" alt="Create_tasks_Jenkins2" src="https://github.com/user-attachments/assets/c1c94cd4-e58f-466e-9dcf-44c93324fee1" />

<img width="959" height="477" alt="Chaned_Projects" src="https://github.com/user-attachments/assets/25ddb8a4-248f-4929-98de-09f823bee116" />

<img width="959" height="467" alt="Install_Plugin" src="https://github.com/user-attachments/assets/15eb7fb0-6ee7-429c-957b-89d990ab538d" />

<img width="959" height="476" alt="Execution_Chaned_Projects" src="https://github.com/user-attachments/assets/aec8e9d9-76ee-438b-9838-3c69e24fcb42" />

<img width="959" height="439" alt="advicejson_succesfully" src="https://github.com/user-attachments/assets/fb1eb04b-39e0-47e6-baa5-43bacfbe8e4b" />

<img width="959" height="469" alt="Workspace_Jenkins" src="https://github.com/user-attachments/assets/2ca15efd-ed1c-4b96-ab3b-434efe357899" />










