#  Docker Storage

This lab focuses on Docker storage concepts, including Docker Volumes, persistent storage, and data management inside containers using MySQL and Alpine containers.

---

#  Lab Objectives

* Understand Docker storage concepts
* Create and inspect Docker volumes
* Run containers using persistent storage
* Persist MySQL database data
* Explore Docker container filesystem behavior

---

#  Project Structure

```bash
docker-storage/
│
├── README.md
└── .gitkeep
```

---

#  Docker Volumes

List all Docker volumes:

```bash
docker volume ls
```

Example output:

```bash
DRIVER    VOLUME NAME
local     beddae12bf3c85d11fd490cb8bba60317105b75e549a053c0682b6edc85285f5
```

---

#  Run MySQL Container with Persistent Storage

Run a MySQL container:

```bash
docker run -d \
--name mysql-db \
-e MYSQL_ROOT_PASSWORD=password \
-v mysql-data:/var/lib/mysql \
mysql
```

Explanation:

| Option           | Description                    |
| ---------------- | ------------------------------ |
| `-d`             | Run container in detached mode |
| `--name`         | Assign container name          |
| `-e`             | Set environment variable       |
| `-v`             | Attach Docker volume           |
| `mysql-data`     | Docker volume name             |
| `/var/lib/mysql` | MySQL data directory           |

---

#  Verify Running Containers

```bash
docker ps
```

Example:

```bash
CONTAINER ID   IMAGE     COMMAND                  STATUS       NAMES
bb006ca4a447   mysql     "docker-entrypoint.s…"   Up 9 min     mysql-db
```

---

#  Docker Storage Concepts

## Container Layer

Containers store temporary writable data inside a thin writable layer.

This data is removed when the container is deleted.

---

## Volumes

Docker volumes provide persistent storage independent from the container lifecycle.

Benefits:

* Persistent data
* Better performance
* Easier backups
* Shared storage between containers

---

#  Alpine Containers

The lab also used lightweight Alpine Linux containers.

Example:

```bash
docker run -it alpine /bin/sh
```

Exited containers:

```bash
docker ps -a
```

Example:

```bash
CONTAINER ID   IMAGE     COMMAND      STATUS
92c4b06b3195   alpine    "/bin/sh"    Exited (0)
```

---

#  Inspect Docker Volumes

Inspect a volume:

```bash
docker volume inspect mysql-data
```

This shows:

* Mountpoint
* Driver
* Metadata
* Storage location

---

# ️ Useful Commands

## List Volumes

```bash
docker volume ls
```

## Remove Volume

```bash
docker volume rm mysql-data
```

## Remove Unused Volumes

```bash
docker volume prune
```

## Stop Container

```bash
docker stop mysql-db
```

## Remove Container

```bash
docker rm mysql-db
```

---

#  Concepts Learned

* Docker persistent storage
* Docker volumes
* Volume mounting
* MySQL data persistence
* Container filesystem behavior
* Docker storage management

---

#  Technologies Used

* Docker
* MySQL
* Alpine Linux

---

#  Course

KodeKloud - Docker for Absolute Beginners

Lab:

* Docker Storage

---

# ‍ Author

Juan Carlos Reynoso Zúñiga

---

<img width="571" height="408" alt="ContainerMYSQL" src="https://github.com/user-attachments/assets/1d207adf-d00f-4db3-b9e0-b9f159b2ebeb" />

<img width="569" height="403" alt="GetData_sh" src="https://github.com/user-attachments/assets/472143a9-c290-4961-8bf1-5cb7ca6c06af" />

<img width="568" height="392" alt="VolumeContainer" src="https://github.com/user-attachments/assets/0b4b1a0a-fa24-4cc9-bf6b-dcee13c6c82a" />



<img width="571" height="399" alt="DataStored" src="https://github.com/user-attachments/assets/a2427c26-ce1f-4f6b-8d7b-db5d9302c39e" />

<img width="566" height="400" alt="DataStored_SHOW" src="https://github.com/user-attachments/assets/07b208d8-f88b-42e7-aea3-63b20df2705e" />


<img width="571" height="394" alt="ReWrite_DATA" src="https://github.com/user-attachments/assets/2f698a39-55aa-4900-ac70-ec6e29c70313" />







