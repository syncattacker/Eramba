# Eramba Installer Script Documentation

This script automates the installation of Eramba using Docker on a Linux system. It installs necessary dependencies, configures environment variables, checks the internet connection, and starts the Eramba Docker containers. The script uses a step-by-step process to ensure that all components are properly set up. Below is a breakdown of the script's actions.

## Features of the Script

### 1. **Root Privilege Check**

- The script first checks if the user has root privileges. If not, it exits with a message requiring root access.
- **Root Privilege Check Command:**
  ```bash
  if [ "$(whoami)" != "root" ]; then
      echo "Root privileges are required. Exiting."
      exit 1
  fi
  ```

### 2. **Installation of Dependencies**

- The script installs essential packages like `figlet`, `net-tools`, `git`, `python3`, `docker.io`, and `docker-compose` using the `apt` package manager.
- **Install Command:**
  ```bash
  apt install figlet net-tools git python3 python3-pip docker.io docker-compose -y
  ```

### 3. **Cloning the Eramba Repository**

- It clones the Eramba Docker repository from GitHub, which contains all the necessary files for setting up the Eramba application.
- **Clone Command:**
  ```bash
  git clone https://github.com/eramba/docker
  cd docker
  ```

### 4. **Updating Environment Variables**

- The script prompts the user for sensitive information such as `DB_PASSWORD` and `MYSQL_ROOT_PASSWORD`. It updates the `.env` file with these new values.
- **Update Command (Function):**
  ```bash
  updateEnv() {
    local envName=$1
    local envValue=$2
    sed -i "s/^${envName}=.*/${envName}=${envValue}/" $envFile
  }
  ```

### 5. **Internet Connection Check**

- Before proceeding with the Docker container setup, the script checks the internet connection by attempting to access a specific Eramba support page.
- **Connection Check Command:**
  ```bash
  curl https://support-v3.eramba.org/ping.html || { echo "Internet connection check failed. Exiting."; exit 1; }
  ```

### 6. **Stopping Existing Docker Containers**

- The script checks if any Docker containers are already running and stops them before proceeding with the new setup.
- **Stop Containers Command:**
  ```bash
  docker-compose -f docker-compose.simple-install.yml down
  ```

### 7. **Starting Eramba Docker Containers**

- The script uses `docker-compose` to start the Eramba containers in detached mode (`-d`), ensuring that the application runs in the background.
- **Start Containers Command:**
  ```bash
  docker-compose -f docker-compose.simple-install.yml up -d
  ```

### 8. **Displaying Logs**

- After starting the containers, the script displays the logs of the Eramba container to confirm that the application is running correctly.
- **Log Display Command:**
  ```bash
  docker logs -f eramba
  ```

### 9. **Completion Message**

- Once all tasks are completed successfully, a message is displayed to notify the user that the installation was successful.
- **Completion Echo:**
  ```bash
  echo "Installation completed successfully."
  ```

## Requirements

- **Operating System**: Ubuntu/Debian-based Linux distributions
- **Root Privileges**: Required to install packages and configure Docker
- **Internet Connection**: Required for downloading packages and verifying connections

## How to Use the Script

1. Ensure you have root access to your machine.
2. Save the script to a file, e.g., `eramba_installer.sh`.
3. Give execute permissions to the script:
   ```bash
   chmod +x eramba_installer.sh
   ```
