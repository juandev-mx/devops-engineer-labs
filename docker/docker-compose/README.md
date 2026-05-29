# 🐳 Docker Compose Lab

This laboratory demonstrates how to deploy multi-container applications using Docker Compose.

The environment includes:

- Redis service
- Click Counter web application
- Container orchestration with Docker Compose
- Port mapping between host and containers

---

# 📂 Project Structure

```bash
docker-compose/
├── docker-compose.yml
└── README.md
```

---

# ⚙️ Technologies Used

- Docker
- Docker Compose
- Redis
- Alpine Linux

---

# 📦 Docker Compose Configuration

```yaml
services:
  redis:
    image: redis:alpine

  clickcounter:
    image: kodekloud/click-counter
    ports:
      - 8085:5000

version: '3.8'
```

---

# 🚀 Run the Application

## Start Services

```bash
docker compose up
```

## Run in Detached Mode

```bash
docker compose up -d
```

## Verify Running Containers

```bash
docker ps
```

## Stop Services

```bash
docker compose down
```

---

# 🌐 Access Application

Application URL:

```bash
http://localhost:8085
```

---

# 📚 Concepts Practiced

- Docker Compose
- Multi-container applications
- Container networking
- Port mapping
- Service orchestration

---

# 📚 Course

KodeKloud - Docker for Absolute Beginners

Lab:
- Docker Compose

---
