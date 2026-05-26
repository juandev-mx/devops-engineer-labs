# 🚀 Jenkins Declarative and Scripted Pipeline

CI/CD automation project developed during the **KodeKloud Jenkins for Beginners** course.

This lab demonstrates the implementation and comparison of both:

- Declarative Pipelines
- Scripted Pipelines

using Jenkins Pipeline as Code practices in a Linux environment.

---

# 📌 Project Overview

The objective of this lab was to understand how Jenkins Pipelines automate software delivery workflows using different pipeline syntaxes.

The project includes:

- Jenkins Declarative Pipeline
- Jenkins Scripted Pipeline
- Jenkins job configuration
- Automated pipeline execution
- CI/CD workflow simulation
- Pipeline orchestration concepts

This lab reinforces real-world Jenkins automation practices commonly used in DevOps environments.

---

# 🛠️ Technologies Used

| Area | Technology |
|------|-------------|
| CI/CD | Jenkins |
| Automation | Jenkins Pipeline |
| Pipeline as Code | Groovy |
| OS | Linux |
| Version Control | Git & GitHub |
| DevOps | CI/CD Workflows |

---

# 📂 Project Structure

```text
jenkins-declarative-scripted-pipeline/
├── declarative-pipeline/
│   └── config.xml
│   └── nextBuildNumber
├── scripted-pipeline/
│   └── config.xml
│   └── nextBuildNumber
└── README.md
```

---

# ⚙️ Pipeline Types Implemented

## 📘 Declarative Pipeline

The Declarative Pipeline provides:

- Structured syntax
- Easier readability
- Simplified CI/CD workflows
- Built-in pipeline stages
- Better maintainability

Example structure:

```groovy
node {
    try {
        stage('Checkout Code') {
            checkout scm
        }

        stage('Install Dependencies') {
            sh 'npm install'
        }

        stage('Run App') {
            // Kill any previous instance of the app
            sh 'pkill -f "node app.js" || true'

            // Start the app using nohup so it doesn't exit when the pipeline finishes
            sh 'nohup node app.js > app.log 2>&1 &'

            sleep 60  // Give it some time to start

            // Verify that it's running
            sh 'curl http://localhost:3002'
        }
    } finally {
        echo 'Cleaning up...'
    }
}
```

---

## 📙 Scripted Pipeline

The Scripted Pipeline offers:

- Advanced flexibility
- Full Groovy scripting capabilities
- Dynamic pipeline logic
- Complex workflow customization

Example structure:

```groovy
node {
    try {
        stage('Checkout Code') {
            checkout scm
        }

        stage('Install Dependencies') {
            sh 'npm install'
        }

        stage('Run App') {
            // Kill any previous instance of the app
            sh 'pkill -f "node app.js" || true'

            // Start the app using nohup so it doesn't exit when the pipeline finishes
            sh 'nohup node app.js > app.log 2>&1 &'

            sleep 60  // Give it some time to start

            // Verify that it's running
            sh 'curl http://localhost:3002'
        }
    } finally {
        echo 'Cleaning up...'
    }
}
```

---

# 🔄 CI/CD Workflow

Both pipelines automate the following workflow:

1. Build process
2. Test execution
3. Deployment simulation
4. Pipeline stage orchestration
5. Jenkins job execution

---

# 🧠 Skills Demonstrated

This project demonstrates skills in:

- Jenkins administration
- Declarative Pipelines
- Scripted Pipelines
- Pipeline as Code
- CI/CD concepts
- Groovy scripting
- Jenkins job orchestration
- Linux environments
- DevOps automation
- Build pipeline management

---

# 🚀 Jenkins Configuration

The lab included:

- Jenkins job creation
- Pipeline execution
- Pipeline syntax configuration
- Stage orchestration
- Jenkins controller interaction
- Pipeline validation

---

# ▶️ Running the Pipelines

## 1️⃣ Open Jenkins

Access Jenkins:

```bash
http://localhost:8080
```

---

## 2️⃣ Execute Declarative Pipeline

Select:

```text
declarative-pipeline
```

Click:

```text
Build Now
```

---

## 3️⃣ Execute Scripted Pipeline

Select:

```text
scripted-pipeline
```

Click:

```text
Build Now
```

---

## 4️⃣ Validate Console Output

Review execution logs in:

```text
Console Output
```

to verify successful stage execution.

---

# 📊 Pipeline Comparison

| Feature | Declarative Pipeline | Scripted Pipeline |
|------|----------------------|------------------|
| Syntax | Structured | Flexible |
| Complexity | Easier | Advanced |
| Readability | High | Medium |
| Custom Logic | Limited | Extensive |
| Groovy Usage | Minimal | Full |

---

# 🔐 DevOps Concepts Practiced

This lab reinforced practical concepts such as:

- Pipeline as Code
- Continuous Integration
- Continuous Delivery
- Jenkins automation
- Stage orchestration
- Build workflows
- Deployment workflows
- Automation pipelines

---

# 📈 Learning Outcome

This project provided hands-on experience implementing and comparing both Jenkins Pipeline approaches used in modern DevOps environments.

The lab reinforced how CI/CD systems automate application workflows while improving deployment consistency, scalability, and operational efficiency.

---

# 📚 Course

**KodeKloud — Jenkins for Beginners**

Lab:
**Jenkins Declarative and Scripted Pipeline**

<img width="959" height="472" alt="Create_Pipeline" src="https://github.com/user-attachments/assets/eb34b35b-3fb3-4b88-b21d-d556a6b461aa" />

<img width="959" height="468" alt="Definition_Pipeline" src="https://github.com/user-attachments/assets/ee9db6e0-ec91-46a4-9aa1-b5376e4eef47" />


<img width="261" height="325" alt="CreateAndUp_File" src="https://github.com/user-attachments/assets/9040d6bd-0399-44bf-96f1-01766075f8f0" />


<img width="959" height="470" alt="Configuration_Pipeline" src="https://github.com/user-attachments/assets/0e6017b3-5e4c-4da1-9724-ca6424b15292" />


<img width="959" height="472" alt="Configuration_Pipeline2" src="https://github.com/user-attachments/assets/327f7e42-9ab4-4810-b901-c4f9d4b51c43" />

<img width="959" height="473" alt="Scripted_Declarative" src="https://github.com/user-attachments/assets/63252b4e-8119-414b-9376-6723ed0e74ef" />

<img width="959" height="471" alt="Success_DeclarativePipeline" src="https://github.com/user-attachments/assets/a310e4b6-74fc-4ac7-a47b-e51651c69233" />


<img width="959" height="470" alt="Command_NodeJS" src="https://github.com/user-attachments/assets/4cd7cf53-15b3-43bf-9ac3-f5809a88663b" />

<img width="959" height="467" alt="Running_NodeJS" src="https://github.com/user-attachments/assets/1dfd0b86-ec78-4a3e-91f9-111cd7c5dd3e" />

<img width="959" height="469" alt="Checks_Completed" src="https://github.com/user-attachments/assets/7df0df2a-3cb1-41f6-a934-387f57cd003d" />

<img width="959" height="467" alt="Create_Pipeline2" src="https://github.com/user-attachments/assets/a121a7ce-ae06-478d-aa23-e8b1241babc7" />


<img width="959" height="470" alt="Configuration_Pipeline3" src="https://github.com/user-attachments/assets/c8ae00fe-a546-491a-977c-b49639260396" />

<img width="959" height="472" alt="Configuration_Pipeline4" src="https://github.com/user-attachments/assets/f5f0b158-9458-402e-a377-87c6c1efc251" />

<img width="568" height="401" alt="CreateAndUp_File2" src="https://github.com/user-attachments/assets/bacc5902-790a-4ced-8e17-3518aa989439" />

<img width="959" height="467" alt="CreateScripted_PipelineGit" src="https://github.com/user-attachments/assets/2199233b-708c-487c-9cd9-36c38a7aa3a3" />


<img width="959" height="469" alt="Scripted_Pipeline" src="https://github.com/user-attachments/assets/5efdab9b-6f42-46c7-ac22-b226123a4a69" />

<img width="959" height="472" alt="Success_ScriptedPipeline" src="https://github.com/user-attachments/assets/24f03f6e-42ce-463a-a22b-211263072e08" />

<img width="376" height="426" alt="Checks_Completed2" src="https://github.com/user-attachments/assets/97b3a01e-60f8-453e-b26c-e80ff576f6e6" />












```
