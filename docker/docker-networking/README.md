# 🐳 Docker Networking

This lab demonstrates the fundamentals of Docker Networking using custom bridge networks, container communication, and multi-container connectivity.

---

# 📌 Lab Overview

In this lab, Docker networking concepts were explored by creating and inspecting Docker networks, connecting containers, and verifying communication between application and database services.

The lab used a custom bridge network to allow communication between a MySQL database container and a web application container.

---

# 🛠 Technologies Used

* Docker
* Docker Networking
* Bridge Networks
* MySQL 5.7
* KodeKloud Simple Web Application

---

# 📂 Project Structure

```bash
docker/docker-networking/
├── containers.txt
├── images.txt
├── networks.txt
├── network-inspect.json
├── screenshot
└── README.md
```

---

# 🌐 Docker Networks

The following Docker networks were available during the lab:

```bash
docker network ls
```

Example:

```bash
NETWORK ID     NAME               DRIVER    SCOPE
d87865b13e74   bridge             bridge    local
c9ae16eb7e15   host               host      local
b90d714f40ac   none               null      local
67381143f40b   wp-mysql-network   bridge    local
```

---

# 🐳 Containers Used

## MySQL Database Container

```bash
docker run -d \
--name mysql-db \
--network wp-mysql-network \
-e MYSQL_ROOT_PASSWORD=password \
mysql:5.7
```

## Web Application Container

```bash
docker run -d \
--name webapp \
--network wp-mysql-network \
-p 38080:8080 \
-e DB_HOST=mysql-db \
kodekloud/simple-webapp-mysql
```

---

# 🔍 Network Inspection

The custom bridge network was inspected using:

```bash
docker network inspect wp-mysql-network
```

This verified:

* Connected containers
* Assigned IP addresses
* Network driver configuration
* Communication between services

---

# 📦 Docker Images Used

The following images were used during the lab:

* mysql:5.7
* kodekloud/simple-webapp-mysql
* alpine

---

# 🚀 Concepts Learned

* Docker default networks
* Bridge networking
* Host networking
* None networking
* Container-to-container communication
* Custom Docker bridge networks
* Network inspection and troubleshooting

---

# 📁 Saved Lab Evidence

The following files were generated as part of the lab documentation:

| File                   | Description                                  |
| ---------------------- | -------------------------------------------- |
| `containers.txt`       | List of Docker containers                    |
| `images.txt`           | List of Docker images                        |
| `networks.txt`         | List of Docker networks                      |
| `network-inspect.json` | Detailed inspection of custom Docker network |

---

# 📚 Course

KodeKloud - Docker for Absolute Beginners

Lab:

* Docker Networking

---

# 👨‍💻 Author

Juan Carlos Reynoso Zuñiga






