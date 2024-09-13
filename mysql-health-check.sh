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

#Set permissions to make the script executable
$ chmod +x /path/to/mysql-health-check.sh

# Create a Log File Directory: Ensure the log directory exists, and if not, create it
$ sudo mkdir -p /var/log/
$ sudo touch /var/log/mysql-health-check.log
$ sudo chmod 666 /var/log/mysql-health-check.log

#Create a Cron Job
#Open the crontab configuration by running
$ crontab -e

# https://crontab.guru/
#Add the following line to schedule the health check script to run every 10 minutes
$ */10 * * * * /path/to/mysql-health-check.sh

#Verify the Cron Job
#After setting up the cron job, you can check if it's scheduled correctly by running
$ crontab -l

#Check the Logs
#Once the cron job is running, you can check the log file to see the results of the health checks:
$ cat /var/log/mysql-health-check.log

#Each time the cron job runs, the result of the MySQL health check will be logged in this file