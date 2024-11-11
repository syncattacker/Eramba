# Eramba Installer Script

This script automates the installation and configuration of **Eramba**, a Governance, Risk, and Compliance (GRC) platform. It ensures that the required dependencies are installed, environment variables are updated, and the necessary Docker containers are set up. The script includes robust error handling to ensure smooth execution, and it will stop if any errors are encountered.

## Prerequisites

- **Root privileges**: The script requires root privileges to install necessary packages and configure system settings.
- **Internet connection**: The script verifies that an active internet connection is available to download necessary packages and clone repositories.
- **Docker**: Docker and Docker Compose are required for running Eramba in containers.

## Features

- Checks if the script is run as root and exits if not.
- Installs required system packages (e.g., `figlet`, `net-tools`, `git`, `docker`, `docker-compose`).
- Prompts the user for necessary environment variables (e.g., `DB_PASSWORD`, `MYSQL_ROOT_PASSWORD`).
- Updates the `.env` file with user-provided values.
- Verifies internet connectivity by making a request to Eramba’s support server.
- Uses Docker Compose to stop any currently running Eramba containers and start new ones.
- Provides clear error handling and stops the script execution with a descriptive error message if any failures occur during the process.

## Installation Instructions

1. Clone or download the script to your server:

   ```bash
   git clone https://github.com/yourusername/eramba-installer.git
   cd eramba-installer
   chmod +x eramba_installer.sh
   sudo ./eramba_installer.sh
   ```
