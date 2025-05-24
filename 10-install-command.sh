#!/bin/bash

##First we are checking the present user id
##id -u is used to get the user id, if it is equal to zero then we are running the script with root access...
##If user id is otherthan 0 is non root user....
USERID=$(id -u) 

if [ $USERID -ne 0 ] ##Here we are checking the root access....
then
    echo "ERROR:: Please run the script with root access..."
    exit 1 ##give other than 0 upto 127 for failures
else
    echo "You are running with root access..."
fi

dnf list installed mysql ##This command is used to check the mysql is installed or not....

##Check already installed or not. If installed $? is 0, then no need to install
##If not installed $? is not 0. expression id true, then we install mysql

if [ $? -ne 0 ] ## '$?' is special variable to check the exit status of the last command 
then
    echo "MySQL is not installed....Going to installing it..."
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing MySQL is....SUCCESS"
    else
        echo "Installing MySQL is....FAILURE"
        exit 1
    fi
else
    echo "MySQL is already installed....Nothing to do..."
fi