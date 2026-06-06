#  E-Commerce Automation Project - Shell Scripting

Automation project developed during the **KodeKloud - Shell Scripts for Beginners** course.

This project focuses on automating the deployment and management of a sample e-commerce application using **Bash scripting** in Linux environments.  
The lab simulates real-world DevOps and system administration tasks including web server configuration, database provisioning, environment variable management, service administration, and automation workflows.

---

#  Project Objectives

The primary objective of this project is to automate common operational tasks required during the deployment of a Linux-based e-commerce application.

The project includes:

- Automated package installation
- Firewall configuration
- Database deployment and configuration
- Apache web server setup
- Environment variable management
- Linux service administration
- Application deployment automation
- Basic infrastructure provisioning
- Troubleshooting and validation tasks

---

## Project Structure

```text
ecommerce-automation-project/
│
├── asests/
├── css/
├── forts/
├── img/
├── js/
├── scss/
├── vendors/
├── index.php
├── README.md
```

---

# ️ Technologies Used


| Area | Technology |
|------|-------------|
| Operating System | Linux (CentOS) |
| Scripting | Bash |
| Web Server | Apache HTTP Server |
| Database | MariaDB |
| Backend | PHP |
| Firewall Management | Firewalld |
| Automation | Shell Scripts |
| Version Control | Git & GitHub |

---

# ️ Deployment Workflow

##  Firewall Configuration

The project configures the Linux firewall using Firewalld to allow HTTP and database communication.

### Tasks Performed
- Install Firewalld
- Start and enable firewall service
- Open HTTP port (80)
- Open MariaDB port (3306)
- Reload firewall rules

**Example:**
```bash
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload
```

## ️ Database Deployment and Configuration

MariaDB is used as the backend database for storing product inventory information.

### Tasks Performed
- Install MariaDB server
- Create application database
- Create database user
- Grant privileges
- Load inventory data automatically

### Database Schema
```sql
CREATE TABLE products (
    id mediumint(8) unsigned NOT NULL auto_increment,
    Name varchar(255) default NULL,
    Price varchar(255) default NULL,
    ImageUrl varchar(255) default NULL,
    PRIMARY KEY (id)
) AUTO_INCREMENT=1;
```

### Sample Data
```sql
INSERT INTO products (Name,Price,ImageUrl)
VALUES
("Laptop","100","c-1.png"),
("Drone","200","c-2.png"),
("VR","300","c-3.png");
```

##  Web Server Configuration

The application uses Apache HTTP Server with PHP support.

### Tasks Performed
- Install Apache and PHP dependencies
- Configure Apache startup services
- Configure PHP as default entry point
- Clone application source code
- Configure environment variables

### Installed Packages
```bash
sudo yum install -y httpd php php-mysqlnd
```

### Apache Configuration
```bash
sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf
```

##  Environment Variable Management

Sensitive database credentials are managed through a `.env` file.

**Example:**
```env
DB_HOST=localhost
DB_USER=ecomuser
DB_PASSWORD=ecompassword
DB_NAME=ecomdb
```

The PHP application dynamically loads environment variables during runtime.

##  Application Deployment

The project automates the deployment of a sample e-commerce application hosted on GitHub.

### Repository Deployment
```bash
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
```

### Deployment Includes
- Web application setup
- Database connectivity
- Service initialization
- Application validation

---

#  Features Implemented

### ️ Infrastructure Automation
- Automated package installation
- Service initialization
- Firewall configuration

### ️ Database Automation
- Automated database creation
- User provisioning
- SQL script execution

###  Web Deployment
- Apache server setup
- PHP configuration
- Application cloning

###  Environment Configuration
- Secure credential management
- Dynamic environment loading

###  Validation and Testing
- HTTP endpoint testing
- Service verification
- Deployment troubleshooting

**Example validation command:**
```bash
curl http://localhost
```

---

#  Skills Demonstrated

This project demonstrates practical skills in:

- Linux system administration
- Bash scripting
- Apache web server configuration
- MariaDB administration
- Firewall configuration
- Environment variable management
- Shell automation
- DevOps fundamentals
- Infrastructure provisioning
- Deployment troubleshooting
- Service management with `systemctl`
- Git and GitHub workflows

---

# ️ Troubleshooting Challenges

During the lab several operational issues were resolved, including:

- Linux file permission issues
- `.env` file write permissions
- Service startup validation
- Firewall communication problems
- Git synchronization conflicts
- Database connection troubleshooting

**Example issue resolved:**
```text
-bash: /var/www/html/.env: Permission denied
```

**Solution:**
```bash
sudo tee /var/www/html/.env <<EOF
```

---

# ▶️ Running the Project

### 1️⃣ Install Dependencies
```bash
sudo yum install -y firewalld mariadb-server httpd php php-mysqlnd git
```

### 2️⃣ Start Services
```bash
sudo systemctl start firewalld
sudo systemctl start mariadb
sudo systemctl start httpd
```

### 3️⃣ Configure Database
```bash
sudo mysql < db-load-script.sql
```

### 4️⃣ Deploy Application
```bash
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
```

### 5️⃣ Test Application
```bash
curl http://localhost
```

---

#  Learning Outcome

This project provided hands-on experience with real-world Linux administration and DevOps automation workflows.

The lab reinforced concepts such as:

- Infrastructure setup
- Linux troubleshooting
- Service orchestration
- Deployment automation
- Bash scripting practices
- Environment configuration
- Backend service integration

The project also improved practical understanding of how web applications are deployed and managed in Linux server environments.

---

#  Course Information

- **Platform:** KodeKloud
- **Course:** Shell Scripts for Beginners
- **Learning Path:** DevOps Engineer Learning Path
```
