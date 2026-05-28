# Docker Images

## 📌 Project Overview

This laboratory focuses on creating and managing Docker images using a simple Python Flask application.
The objective of this exercise was to understand how Docker images are built from a `Dockerfile`, how containers are created from images, and how applications can run in isolated environments.

The project was completed as part of hands-on DevOps practice using Docker fundamentals in a Linux environment.

---

## 🚀 Technologies Used

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

---

## 📂 Project Structure

```bash
docker-images/
│
├── Dockerfile
├── app.py
├── requirements.txt
├── README.md
├── Screenshot/
└── templates/
    └── hello.html
```

---

## ⚙️ Dockerfile

The following Dockerfile was used to build the application image:

```dockerfile
FROM python:3.6

RUN pip install flask

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]
```

---

## 🐳 Build Docker Image

To build the Docker image:

```bash
docker build -t webapp-color .
```

---

## ▶️ Run Docker Container

Run the container using:

```bash
docker run -p 8080:8080 webapp-color
```

---

## 🌐 Access the Application

Once the container is running, open the browser and access:

```text
http://localhost:8080
```

---

## 📖 Key Concepts Learned

* Understanding Docker images
* Writing Dockerfiles
* Building custom Docker images
* Running containers from images
* Port mapping with Docker
* Containerized Flask applications
* Basic DevOps container workflow

---

## 🔍 Docker Commands Used

### List Docker Images

```bash
docker images
```

### List Running Containers

```bash
docker ps
```

### List All Containers

```bash
docker ps -a
```

### Stop Container

```bash
docker stop <container_id>
```

### Remove Container

```bash
docker rm <container_id>
```

### Remove Image

```bash
docker rmi webapp-color
```

---

## 🧪 Laboratory Environment

* **Platform:** KodeKloud
* **OS:** Linux
* **Container Runtime:** Docker Engine
* **Application Type:** Python Flask Web Application

---

## 📚 What I Practiced

During this lab, I practiced:

* Creating Docker images from scratch
* Containerizing applications
* Running services inside containers
* Managing Docker containers
* Understanding image layers
* Using Docker CLI commands in Linux environments

---


## 🏆 Outcome

Successfully created and executed a Dockerized Flask application using Docker images and containerization concepts in a Linux environment.

This lab strengthened practical DevOps and containerization skills commonly used in modern CI/CD and cloud-native workflows.

---

## 👨‍💻 Author

**Juan Carlos Reynoso Zuñiga**

* Backend Developer
* DevOps Enthusiast
* Computer Systems Engineer

[GitHub Profile](https://github.com/juandev-mx)

