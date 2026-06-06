#  Jenkins Pipeline and Basic Security

Jenkins laboratory project completed during the KodeKloud Jenkins for Beginners course.

This lab focuses on building a Jenkins Pipeline integrated with a Java application while implementing basic Jenkins security concepts such as authentication, authorization, and secure pipeline execution.

---

#  Project Overview

The objective of this laboratory was to:

- Configure Jenkins pipelines
- Build and test a Java application
- Integrate Jenkins with source code repositories
- Execute automated CI/CD workflows
- Understand Jenkins security fundamentals
- Work with Jenkins authentication and authorization
- Secure pipeline execution environments

---

# ️ Technologies Used

| Area | Technology |
|------|-------------|
| CI/CD | Jenkins |
| Language | Java |
| Build Tool | Maven |
| Automation | Jenkins Pipeline |
| Version Control | Git & GitHub |
| OS | Linux |
| Security | Jenkins Authentication & Authorization |

---


# ️ Lab Features

##  Jenkins Pipeline Automation

The Jenkins Pipeline automates the following tasks:

- Source code retrieval
- Dependency installation
- Maven build execution
- Automated test execution
- Pipeline stage orchestration
- Continuous Integration workflow

---

##  Java Application Integration

The project includes a Java application integrated into Jenkins for automated builds and testing.

Pipeline execution validates:

- Java compilation
- Maven packaging
- Test execution
- Build status reporting

---

##  Jenkins Security Concepts

This laboratory also covered basic Jenkins security configuration including:

- Jenkins authentication
- User access management
- Authorization strategies
- Secure pipeline execution
- Jenkins security best practices

---

#  Jenkins Pipeline Workflow

The pipeline performs multiple automated stages such as:

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }

        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
    }
}
```

---

#  Jenkins Job Configuration

The Jenkins job configuration files were exported directly from the Jenkins server:

```text
/var/lib/jenkins/jobs/lab2-java-hello-world
```

This includes:

- Jenkins job configuration
- Build history
- Pipeline metadata
- Execution logs

---

# ️ Jenkins Installation Environment

The lab was executed in a Linux environment using Jenkins with Java and Maven installed.

---

#  Java Installation

Jenkins requires Java to run correctly.

Update repositories and install OpenJDK 21:

```bash
sudo apt update
sudo apt install fontconfig openjdk-21-jre
```

Verify installation:

```bash
java -version
```

Expected output:

```text
openjdk 21.0.8 2025-07-15
OpenJDK Runtime Environment
OpenJDK 64-Bit Server VM
```

---

# ️ Important Jenkins Java Note

On Debian/Ubuntu systems, Java should be installed before Jenkins.

If Jenkins is installed first, the service may fail with:

```text
jenkins: failed to find a valid Java installation
```

Installing Java beforehand ensures Jenkins initializes correctly.

---

#  Jenkins LTS Installation

Add Jenkins repository and install Jenkins Long-Term Support version:

```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
```

```bash
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```

```bash
sudo apt update
sudo apt install jenkins
```

---

# ▶️ Running Jenkins

Start Jenkins service:

```bash
sudo systemctl start jenkins
```

Enable Jenkins on boot:

```bash
sudo systemctl enable jenkins
```

Check service status:

```bash
sudo systemctl status jenkins
```

---

#  Access Jenkins

By default Jenkins runs on:

```text
http://localhost:8080
```

Retrieve the initial administrator password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

#  Skills Demonstrated

This laboratory demonstrates practical skills in:

- Jenkins administration
- CI/CD pipelines
- Declarative Pipeline syntax
- Java build automation
- Maven integration
- Linux administration
- Jenkins security basics
- Authentication and authorization
- Git integration
- Continuous Integration workflows

---

#  Learning Outcome

This lab reinforced practical DevOps concepts related to:

- Secure CI/CD automation
- Jenkins pipeline orchestration
- Build and test automation
- Java application deployment workflows
- Jenkins security configuration
- Enterprise DevOps practices

---

#  Course

KodeKloud - Jenkins for Beginners

Lab:
- Jenkins Pipeline and Basic Security

---
