#!/bin/bash

# Define variables
LOG_FILE="/var/log/mysql-health-check.log"
DB_HOST="mysql-container"  # MySQL container name
DB_USER="root"
DB_PASSWORD="India@123!@#"
DB_NAME="userdb"

# Perform health check
RESULT=$(mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e "USE $DB_NAME;" 2>&1)

# Check if the health check was successful
if [[ $? -eq 0 ]]; then
    echo "$(date): MySQL database is healthy" >> $LOG_FILE
else
    echo "$(date): MySQL database health check failed. Error: $RESULT" >> $LOG_FILE
fi