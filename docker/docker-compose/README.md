#  Docker Compose Lab

This laboratory demonstrates how to deploy multi-container applications using Docker Compose.

The environment includes:

- Redis service
- Click Counter web application
- Container orchestration with Docker Compose
- Port mapping between host and containers

---

#  Project Structure

```bash
docker-compose/
├── docker-compose.yml
└── README.md
```

---

# ️ Technologies Used

- Docker
- Docker Compose
- Redis
- Alpine Linux

---

#  Docker Compose Configuration

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

#  Run the Application

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

#  Access Application

Application URL:

```bash
http://localhost:8085
```

---

#  Concepts Practiced

- Docker Compose
- Multi-container applications
- Container networking
- Port mapping
- Service orchestration

---

#  Course

KodeKloud - Docker for Absolute Beginners

Lab:
- Docker Compose

---

<img width="569" height="404" alt="ContainerDB_Redis" src="https://github.com/user-attachments/assets/2138ed85-2b54-4ab6-b11d-f421486a8279" />


<img width="568" height="398" alt="ContainerClickCounter" src="https://github.com/user-attachments/assets/fa7413db-0d1b-4388-86c9-212bb9c17b14" />

<img width="959" height="473" alt="VerifyClickCounter" src="https://github.com/user-attachments/assets/f75c7792-c58c-461c-bb44-7de7262446f3" />


<img width="572" height="394" alt="CleanUpActions" src="https://github.com/user-attachments/assets/41852401-b05b-4140-9a2c-a0d96a4e495c" />

<img width="485" height="405" alt="YAMLCOMPOSE_DOCKER" src="https://github.com/user-attachments/assets/376a59a4-a238-41a7-9f75-152b2b124f44" />


<img width="491" height="397" alt="CommandsDOCKER_COMPOSE" src="https://github.com/user-attachments/assets/98170ec3-3bd7-4714-84c3-4340a8de44dd" />

<img width="959" height="470" alt="VerifyClickCounterCOMPOSE_DOCKER" src="https://github.com/user-attachments/assets/f57139a0-4858-4722-bde4-97691b7df5a0" />




