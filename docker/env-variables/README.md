# Docker Environment Variables

## 📌 Description

This lab demonstrates how to use environment variables in Docker containers to configure applications dynamically at runtime.

The exercise includes:

- Running containers with environment variables
- Configuring application behavior using `-e`
- Using MySQL environment variables
- Inspecting container configuration
- Managing Docker containers

---

# 🛠 Technologies Used

- Docker
- Linux
- Docker Hub Images
- MySQL
- KodeKloud Labs

---

# 📂 Project Structure

```bash
env-variables/
│
├── Dockerfile
├── app.py
├── requirements.txt
├── README.md
└── templates/
    └── hello.html
```

---

# 🚀 Running the Containers

## Run Simple Web Application

```bash
docker run -d -p 8080:8080 kodekloud/simple-webapp
```

---

## Run Application with Environment Variable

```bash
docker run -d \
-p 8080:8080 \
-e APP_COLOR=blue \
kodekloud/simple-webapp
```

This environment variable changes the application's background color.

---

## Run MySQL Container

```bash
docker run -d \
--name mysql-db \
-e MYSQL_ROOT_PASSWORD=admin \
mysql
```

---

# 🔍 Inspect Environment Variables

```bash
docker inspect mysql-db
```

This command displays container configuration details including environment variables.

---

# 📋 Docker Management Commands

## List Running Containers

```bash
docker ps
```

## List Docker Images

```bash
docker images
```

---

# 📚 Concepts Learned

- Docker environment variables
- Container runtime configuration
- Docker container management
- MySQL container initialization
- Docker inspection commands

---

# ✅ Lab Result

Successfully configured Docker containers using environment variables and verified container settings through Docker inspection commands.

---

# 📚 Course

KodeKloud - Docker for Absolute Beginners

Lab:
- Docker Environment Variables

---

# 👨‍💻 Author

Juan Carlos Reynoso Zuñiga

* Backend Developer
* DevOps Enthusiast
* Computer Systems Engineer

<img width="570" height="398" alt="RunningContainer_SetVariable" src="https://github.com/user-attachments/assets/090d8848-256c-41aa-87f8-b0e5f1f19283" />


<img width="569" height="407" alt="DeployDatabase" src="https://github.com/user-attachments/assets/54899da0-f20b-4d5c-a2fb-1980f7597f58" />


<img width="566" height="397" alt="APP_COLOR_Value" src="https://github.com/user-attachments/assets/776c40e8-db29-4565-943f-5eb571db1490" />


<img width="956" height="473" alt="AplicaccionRunning_APP_COLOR" src="https://github.com/user-attachments/assets/0207e79a-d17f-4e36-87ae-8903329854a9" />

