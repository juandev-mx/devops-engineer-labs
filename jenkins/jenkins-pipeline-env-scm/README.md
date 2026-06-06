#  Jenkins Pipeline with ENV using SCM

Automation pipeline project developed during the **KodeKloud - Jenkins for Beginners** course.

This lab demonstrates how to integrate Jenkins Pipelines, Source Code Management (SCM), and Environment Variables (ENV) using a real Jenkinsfile stored in a Git repository.

---

#  Project Overview

The objective of this lab was to create and execute a Jenkins Pipeline that:

- Pulls source code directly from a Git repository
- Uses a Jenkinsfile stored in SCM
- Defines and manages environment variables
- Automates build stages
- Validates pipeline execution
- Demonstrates CI/CD workflow fundamentals

This project simulates a real-world DevOps workflow commonly used in modern software engineering environments.

---

# ️ Technologies Used




| Area | Technology |
| :--- | :--- |
| **CI/CD** | Jenkins |
| **SCM** | Git & GitHub |
| **Automation** | Jenkins Pipeline |
| **Language** | Groovy (Jenkinsfile) |
| **OS** | Linux |
| **Environment Variables** | Jenkins ENV |
| **Version Control** | Git |

---

#  Project Structure

```text
jenkins-pipeline-env-scm/
├── .gitkeep
├── Jenkinsfile
├── README.md
├── app.py
├── requirements.txt
├── test_app.py
├── python-pipeline/
      ├── config.xml
```

---

# ️ Jenkins Pipeline Workflow

The pipeline was configured to:
- Connect Jenkins with a Git repository
- Pull the `Jenkinsfile` automatically from SCM
- Define environment variables
- Execute pipeline stages
- Validate build execution
- Display logs and pipeline results

##  Jenkinsfile Example

```groovy
pipeline {
    agent any

    environment {
        APP_ENV = "production"
        APP_NAME = "python-app"
    }

    stages {
        stage('Build') {
            steps {
                echo "Building ${APP_NAME}"
            }
        }

        stage('Test') {
            steps {
                echo "Running tests in ${APP_ENV}"
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying application"
            }
        }
    }
}
```

---

#  Pipeline Features

###  Source Code Management (SCM)
- Jenkins connected directly to Git repository
- Automatic Jenkinsfile retrieval
- Version-controlled pipeline configuration

###  Environment Variables (ENV)
The pipeline uses environment variables for:
- Application configuration
- Environment selection
- Reusable pipeline settings
- Dynamic stage execution

###  Automated Pipeline Execution
The Jenkins Pipeline automatically executes:
- Build stage
- Test stage
- Deployment stage

This reflects a simplified CI/CD workflow.

---

#  Skills Demonstrated

This project demonstrates skills in:

- Jenkins Pipelines
- Declarative Pipeline syntax
- SCM integration
- Git workflows
- Environment variable management
- Linux environments
- CI/CD automation
- Pipeline orchestration
- DevOps fundamentals

---

# ️ Jenkins Configuration

The lab included:
- Jenkins Pipeline Job creation
- SCM repository integration
- `Jenkinsfile` execution from Git
- Environment variable configuration
- Console output validation

---

# ▶️ Running the Pipeline

### 1️⃣ Open Jenkins Dashboard
Access Jenkins from the browser:
[http://localhost:8080](http://localhost:8080)

### 2️⃣ Create Pipeline Job
- Click **New Item**
- Choose **Pipeline**
- Under *Pipeline* section, select **Pipeline script from SCM**
- Configure SCM (Git) and add your repository URL

### 3️⃣ Execute Pipeline
- Click **Build Now**

### 4️⃣ Validate Console Output
- Check **Console Output** to validate successful execution of all stages.

---

#  Pipeline Stages Summary




| Stage | Description |
| :--- | :--- |
| **Build** | Application build process |
| **Test** | Test execution |
| **Deploy** | Deployment simulation |

---

#  CI/CD Concepts Practiced

This lab reinforced practical concepts such as:
- Pipeline as Code
- Continuous Integration
- Jenkins automation
- SCM integration
- Environment configuration
- Build orchestration
- Deployment workflow simulation

---

#  Learning Outcome

This lab provided hands-on experience with real Jenkins Pipeline workflows used in enterprise DevOps environments. 

The project reinforced how modern CI/CD systems automate builds, testing, and deployment processes directly from version-controlled repositories.

---

#  Course Information

- **Platform:** KodeKloud
- **Course:** Jenkins for Beginners
- **Lab:** Jenkins Pipeline with ENV using SCM


<img width="959" height="468" alt="Create_Pipeline" src="https://github.com/user-attachments/assets/d6ae45f7-08fb-4b61-b8e4-78cb801832d8" />

<img width="958" height="473" alt="Configuration_Parametrers" src="https://github.com/user-attachments/assets/5d730ac5-f7d8-478b-a693-41561b995b17" />

<img width="959" height="473" alt="ConfigureAndUp_repository" src="https://github.com/user-attachments/assets/94f8744b-d316-4b43-85da-26088752b5f1" />

<img width="957" height="474" alt="Configure_Pipeline" src="https://github.com/user-attachments/assets/dbf4870c-3010-4844-beff-0f8042c4729e" />

<img width="959" height="477" alt="Configure_Pipeline2" src="https://github.com/user-attachments/assets/95674290-b435-4ef7-b48e-c2c746f71b48" />

<img width="959" height="474" alt="Success_Pipeline" src="https://github.com/user-attachments/assets/664f5812-701d-4628-b023-70d2b0881920" />

<img width="959" height="473" alt="OutputConsole_Pipeline" src="https://github.com/user-attachments/assets/58ac6f71-d21f-472d-a16b-01025676387d" />




