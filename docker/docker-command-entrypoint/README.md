# Docker Command & Entrypoint Lab

## 📌 Overview

This laboratory focuses on understanding how Docker containers execute commands using the `CMD` and `ENTRYPOINT` instructions inside Dockerfiles.

The lab includes inspection of Docker images and execution behavior during container startup using different Docker images such as:

* Ubuntu
* MySQL
* WordPress
* Python Flask Application

---

# 📂 Project Structure

```bash
docker-command-entrypoint/
│
├── Dockerfile
├── README.md
└── app.py
└── app.sh
```

---

# 🐳 Dockerfile Used

```dockerfile
FROM python:2.6-alpine

RUN pip install flask

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENV APP_COLOR=red
ENV VERSION=v3

CMD ["python", "app.py"]
```

---

# ⚙️ Concepts Practiced

## CMD

The `CMD` instruction provides default commands to run when a container starts.

Example:

```dockerfile
CMD ["python", "app.py"]
```

This executes:

```bash
python app.py
```

when the container starts.

---

## ENTRYPOINT

The `ENTRYPOINT` instruction defines the main executable for a container.

It allows containers to behave like executable programs.

Example:

```dockerfile
ENTRYPOINT ["sleep"]
```

Combined with:

```dockerfile
CMD ["1000"]
```

Final execution becomes:

```bash
sleep 1000
```

---

# 🔍 Laboratory Tasks

## Inspect Docker Images

The following commands were used to inspect Docker image configurations:

### Inspect MySQL ENTRYPOINT

```bash
docker inspect mysql
```

### Inspect WordPress CMD

```bash
docker inspect wordpress
```

### Inspect Ubuntu Startup Command

```bash
docker inspect ubuntu
```

---

# 🚀 Run Ubuntu Container with Sleep Command

Run Ubuntu container in detached mode:

```bash
docker run -d ubuntu sleep 1000
```

Verify running containers:

```bash
docker ps
```

---

# 📖 Key Learnings

* Difference between `CMD` and `ENTRYPOINT`
* How Docker containers execute startup commands
* How to override container startup behavior
* Docker image inspection using `docker inspect`
* Running containers in detached mode

---

# 🛠️ Technologies Used

* Docker
* Linux
* Python
* Flask

---

# 📚 Commands Used During the Lab

```bash
docker images

docker ps -a

docker inspect mysql

docker inspect wordpress

docker inspect ubuntu

docker run -d ubuntu sleep 1000
```

---

# ✅ Result

Successfully analyzed Docker image startup behavior and practiced container execution using `CMD` and `ENTRYPOINT` instructions.

---

# 📚 Course

KodeKloud - Docker for Absolute Beginners

Lab:
- Docker Command & Entrypoint

---

# 👨‍💻 Author

Juan Carlos Reynoso Zuñiga

---


<img width="572" height="397" alt="CMD" src="https://github.com/user-attachments/assets/a524006e-96e2-4fa8-aa99-d799a957dce8" />

<img width="572" height="406" alt="DockerFileWordpress" src="https://github.com/user-attachments/assets/883457fa-6cca-431c-86c6-39d8a80f0484" />

<img width="572" height="399" alt="DockerFileWordpress2" src="https://github.com/user-attachments/assets/8fa5e9bc-534a-4fd7-b2a3-ca96e6021a07" />


<img width="569" height="403" alt="bash" src="https://github.com/user-attachments/assets/f68feb83-ed65-4db0-9721-2941cf82d252" />

<img width="568" height="398" alt="EntryPoint" src="https://github.com/user-attachments/assets/c81f220b-a992-4e2d-a808-43d872f99cce" />

<img width="569" height="395" alt="sleep1000_Seconds" src="https://github.com/user-attachments/assets/cc95a8d7-988f-4f6c-9a8e-c52ddb989bab" />



