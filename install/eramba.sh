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
echo "by @syncattacker"

# Update and Updgrade 
apt update && apt upgrade -y

echo "The following packages will be installed net-tools git python3 python3-pip docker.io docker-compose"
sleep 5

# Install necessary libraries required
apt install net-tools git python3 python3-pip docker.io docker-compose -y
git clone https://github.com/eramba/docker
cd docker

# Path to your .env file
envFile=".env"
updateEnv() {
  local envName=$1
  local envValue=$2
  sed -i "s/^${envName}=.*/${envName}=${envValue}/" $envFile
}

# Prompt user for new DB_PASSWORD
read -p "Enter new DB_PASSWORD: " new_db_password
if [ ! -z "$new_db_password" ]; then
  updateEnv "DB_PASSWORD" "$new_db_password"
  echo "DB_PASSWORD updated to $new_db_password."
else
  echo "DB_PASSWORD was not updated."
fi

# Prompt user for new MYSQL_ROOT_PASSWORD
read -p "Enter new MYSQL_ROOT_PASSWORD: " new_mysql_root_password
if [ ! -z "$new_mysql_root_password" ]; then
  updateEnv "MYSQL_ROOT_PASSWORD" "$new_mysql_root_password"
  echo "MYSQL_ROOT_PASSWORD updated to $new_mysql_root_password."
else
  echo "MYSQL_ROOT_PASSWORD was not updated."
fi

echo "Update completed."

echo "Environment Variables Updated Successfully."

echo "Checking Internet Connection."
curl  https://support-v3.eramba.org/ping.html
docker-compose -f docker-compose.simple-install.yml down
docker-compose -f docker-compose.simple-install.yml up -d
docker logs -f eramba
