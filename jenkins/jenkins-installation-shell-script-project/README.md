# ️ Jenkins Installation and Shell Script Project

Automation and CI/CD laboratory project developed during the **KodeKloud – Jenkins for Beginners** course.

This project demonstrates the installation and configuration of Jenkins on Linux, along with the creation of a basic automation job using shell scripting.

---

#  Course Information



| Category | Details |
| :--- | :--- |
| **Platform** | KodeKloud |
| **Course** | Jenkins for Beginners |
| **Module** | Jenkins Setup and Interface |
| **Lab** | Jenkins Installation and Shell Script Project |
| **Focus Areas** | Jenkins, CI/CD, Automation, Shell Scripting, Linux |

---

#  Project Overview

The objective of this lab was to:

- Install and configure Jenkins on a Linux server
- Configure Java dependencies required by Jenkins
- Create and execute Jenkins Freestyle Jobs
- Automate shell script execution
- Understand Jenkins architecture and workflows
- Practice CI/CD fundamentals in a real Linux environment

This project simulates a real-world DevOps workflow where Jenkins is used to automate operational and development tasks.

---

# ️ Technologies Used



| Area | Technology |
| :--- | :--- |
| **CI/CD** | Jenkins |
| **Operating System** | Ubuntu Linux |
| **Programming** | Bash / Shell Script |
| **Version Control** | Git & GitHub |
| **Runtime** | OpenJDK 21 |
| **Automation** | Jenkins Freestyle Jobs |

---

# ️ Jenkins Installation

##  Installation of Java

Jenkins requires Java to run, yet not all Linux distributions include Java by default. Additionally, not all Java versions are compatible with Jenkins.

This project uses **OpenJDK 21**.

**Update repositories:**
```bash
sudo apt update
```

**Install OpenJDK 21:**
```bash
sudo apt install fontconfig openjdk-21-jre
```

**Verify Java installation:**
```bash
java -version
```

*Expected output:*
```text
openjdk 21.0.8 2025-07-15
OpenJDK Runtime Environment (build 21.0.8+9-Debian-1)
OpenJDK 64-Bit Server VM (build 21.0.8+9-Debian-1, mixed mode, sharing)
```

> ️ **Note:** On Debian/Ubuntu systems, Java should be installed before Jenkins to avoid service startup issues such as: `jenkins: failed to find a valid Java installation`. Installing Java first ensures Jenkins starts correctly.

##  Jenkins LTS Installation

This project uses the Jenkins Long-Term Support (LTS) version.

**Add Jenkins repository key:**
```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
```

**Add Jenkins repository:**
```bash
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```

**Update repositories and install Jenkins:**
```bash
sudo apt update
sudo apt install jenkins
```

## ▶️ Starting Jenkins

**Start Jenkins service:**
```bash
sudo systemctl start jenkins
```

**Enable Jenkins on boot:**
```bash
sudo systemctl enable jenkins
```

**Check Jenkins status:**
```bash
sudo systemctl status jenkins
```

##  Access Jenkins

After installation, Jenkins becomes available on:
[http://localhost:8080](http://localhost:8080)

**Retrieve the administrator password:**
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

#  Project Structure

```text
jenkins-installation-shell-script-project/
├── Generate-ASCII-art/
│   ├── config.xml
│   ├── nextBuildNumber
│   └── builds/
└── README.md
```

---

#  Jenkins Freestyle Job

## ️ Generate ASCII Art Job

A Jenkins Freestyle Project was created to automate shell script execution.

### Features
- Executes shell commands automatically
- Demonstrates Jenkins job configuration
- Simulates build automation workflow
- Generates terminal-based ASCII output

###  Example Shell Script
```bash
#!/bin/bash

echo "==========================="
echo " Jenkins Automation Lab"
echo "==========================="
echo " Build executed successfully!"
```

---

#  CI/CD Concepts Practiced

This lab helped reinforce:
- Continuous Integration concepts
- Jenkins job execution
- Build automation
- Linux server administration
- Shell scripting workflows
- Jenkins controller architecture
- Automation pipelines fundamentals

---

#  Skills Demonstrated

This project demonstrates practical experience with:
- Jenkins Installation
- Linux Administration
- Shell Scripting
- CI/CD Fundamentals
- Automation Workflows
- DevOps Practices
- Service Management
- Build Automation

---

#  Testing

The Jenkins service and automation job were validated using:
```bash
systemctl status jenkins
```
and verified through manual build execution on the Jenkins dashboard.

---

#  Learning Outcome

Through this project, I gained hands-on experience installing Jenkins, configuring Java environments, creating automation jobs, and understanding foundational CI/CD workflows used in DevOps environments.

---

#  Repository

```bash
git clone https://github.com/juandev-mx/devops-engineer-labs.git
```

---

# ‍ Author

**Juan Carlos Reynoso Zúñiga**
*Software Engineer | Backend & DevOps Enthusiast*

---

#  Course Reference

- **Platform:** KodeKloud
- **Course:** Jenkins for Beginners



<img width="499" height="43" alt="Password_Unlock" src="https://github.com/user-attachments/assets/c95a88cc-f16d-448d-a664-cfed24ec489f" />


<img width="959" height="474" alt="Unlock_Jenkins" src="https://github.com/user-attachments/assets/30ddc8bb-f79d-44fb-9402-8bfee7fea1cd" />

<img width="229" height="119" alt="Details_Create_User" src="https://github.com/user-attachments/assets/9146d5de-a59b-4f95-a25b-3f9984676f0c" />




<img width="959" height="473" alt="Create_First_User" src="https://github.com/user-attachments/assets/6dc5029d-a84a-4063-b5a3-1aaf749c98cc" />


<img width="358" height="371" alt="Check_Completed" src="https://github.com/user-attachments/assets/48288c43-0174-4652-87c4-ceb73d2d399e" />



<img width="959" height="470" alt="Put it_password_Jenkins" src="https://github.com/user-attachments/assets/117f1563-7f4f-450d-8e61-39c6bbc1066d" />


<img width="959" height="473" alt="Plugins_Install" src="https://github.com/user-attachments/assets/ae23bcb0-8c3e-4a6c-9296-416b8009b936" />

<img width="959" height="473" alt="Starting_Plugins" src="https://github.com/user-attachments/assets/9d61d1fa-44b6-4077-ae11-444f5bd236e0" />

<img width="959" height="475" alt="Jenkins_Ready" src="https://github.com/user-attachments/assets/cd937f78-2203-4249-b959-b56c453bd392" />

<img width="359" height="323" alt="Question_4" src="https://github.com/user-attachments/assets/8478437f-0d1a-4143-850d-b78b20e52cfc" />


<img width="353" height="371" alt="Instructions_task" src="https://github.com/user-attachments/assets/53ef320f-4502-46c5-9091-7d30ea84bd27" />

<img width="547" height="355" alt="Command_Jenkins_NOPASSWD" src="https://github.com/user-attachments/assets/2537695e-9d2f-41f9-9a43-ca8416982369" />



<img width="959" height="473" alt="User_Interface" src="https://github.com/user-attachments/assets/5a95d418-4570-48bf-8f59-cc701d08452f" />

<img width="959" height="475" alt="Create_Task" src="https://github.com/user-attachments/assets/611ffbec-a349-4040-a877-d0de6818adf8" />


<img width="959" height="475" alt="Choose_Option_ShellScript" src="https://github.com/user-attachments/assets/eea70ce3-9723-4ab1-9c42-6b6ce2a0a1c4" />


<img width="959" height="470" alt="Put it_LineCommand_ShellScript" src="https://github.com/user-attachments/assets/2b5c4ef2-6ab8-4df0-af16-3f7615c6d48f" />

<img width="959" height="473" alt="Execution_ShellScript_Succesfully" src="https://github.com/user-attachments/assets/0edf1e79-ba24-4597-9e93-2f6c658c108d" />








