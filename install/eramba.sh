#!/bin/bash

echo "Starting Installation . . ."

# Check for root privilege for installations

if [ "$(whoami)" == "root" ]; then
    echo "Root privileges are required."
else
    echo "You are good to go."
fi

# Figlet for ASCII art.
apt install figlet -y

# Clear the terminal.
clear

# Driver main code.
figlet "Eramba Installer"

# Update and Updgrade 
apt update && apt upgrade -y

echo "The following packages will be installed net-tools git python3 python3-pip docker.io docker-compose"
sleep 2

# Install necessary libraries required
apt install net-tools git python3 python3-pip docker.io docker-compose -y
git clone https://github.com/eramba/docker
cd docker

# Modify the environment files.

envFile=".env"
updateTheEnv() {
    local envName=$1
    local envValue=$2
    sed -i "s/^${envName}=.*/${envValue}=${newEnvValue}/" $envFile
}

read -p "Enter new DB_PASSWORD : " new_db_password
if [ ! -z "$new_db_password" ]; then
    updateTheEnv "DB_PASSWORD" "$new_db_password"
    echo "New Password Set."
else
    echo "New Password Set Failed."
fi

read -p "Enter new MYSQL_ROOT_PASSWORD: " new_mysql_root_password
if [ ! -z "$new_mysql_root_password" ]; then
  update_env_var "MYSQL_ROOT_PASSWORD" "$new_mysql_root_password"
  echo "New Password Set."
else
  echo "New Password Set Failed."
fi

echo "Environment Variables Updated Successfully."

echo "Checking Internet Connection."
curl  https://support-v3.eramba.org/ping.html
docker compose -f docker-compose.simple-install.yml down
docker compose -f docker-compose.simple-install.yml up -d
docker logs -f eramba
