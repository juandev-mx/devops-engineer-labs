# 📦 Docker Registry

This lab demonstrates the fundamentals of Docker Registry usage, image tagging, pushing images to a registry, and working with local/private Docker registries.

---

# 📌 Lab Overview

In this lab, Docker Registry concepts were explored by working with Docker images, tagging images, and interacting with registries.

The lab also covered how Docker stores and retrieves container images from registries such as Docker Hub and private/local registries.

---

# 🛠 Technologies Used

* Docker
* Docker Registry
* Docker Images
* Docker Hub
* Local Docker Registry

---

# 📂 Project Structure

```bash id="hgsrm4"
docker/docker-registry/
├── images.txt
├── containers.txt
├── networks.txt
├── volumes.txt
├── screenshot/
└── README.md
```

---

# 🐳 Docker Images

List all Docker images:

```bash id="m70mfe"
docker images
```

Example:

```bash id="t43q9p"
REPOSITORY             TAG       IMAGE ID       CREATED       SIZE
localhost:5000/nginx   latest    7aaca76c508f   6 days ago    161MB
registry               2         26b2eb03618e   2 years ago   25.4MB
```

---

# 🏷 Tagging Docker Images

Tagging an image for a local registry:

```bash id="jww9bz"
docker tag nginx:latest localhost:5000/nginx
```

This creates a new image reference pointing to the local Docker registry.

---

# 🚀 Running a Local Docker Registry

Run a local registry container:

```bash id="o0j9lw"
docker run -d -p 5000:5000 --name registry registry:2
```

Verify running containers:

```bash id="ww6x7x"
docker ps
```

---

# 📤 Push Image to Local Registry

Push the tagged image:

```bash id="oqyffx"
docker push localhost:5000/nginx
```

This uploads the image layers into the local Docker Registry.

---

# 📥 Pull Image from Registry

Pull image from local registry:

```bash id="8v53ll"
docker pull localhost:5000/nginx
```

---

# 🌐 Docker Registry Concepts Learned

* Docker Registry fundamentals
* Docker Hub usage
* Local/private Docker Registry
* Docker image tagging
* Pushing Docker images
* Pulling Docker images
* Container image management

---

# 📁 Saved Lab Evidence

The following files were generated during the lab:

| File             | Description                   |
| ---------------- | ----------------------------- |
| `images.txt`     | Docker images used in the lab |
| `containers.txt` | Docker containers information |
| `networks.txt`   | Docker network configuration  |
| `volumes.txt`    | Docker volumes information    |

---

# 🔍 Useful Docker Commands

## List images

```bash id="5gm0eo"
docker images
```

## List containers

```bash id="4ly1jl"
docker ps -a
```

## List networks

```bash id="tzmbpk"
docker network ls
```

## List volumes

```bash id="a7j45w"
docker volume ls
```

---

# 📚 Course

KodeKloud - Docker for Absolute Beginners

Lab:

* Docker Registry

---

# 👨‍💻 Author

Juan Carlos Reynoso Zuñiga


