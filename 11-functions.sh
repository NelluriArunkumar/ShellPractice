#!/bin/bash


##Functions are used to reduce the code multiple time...
##We usually define a common code as functions and we can call where ever we required...

USERID=$(id -u) 

if [ $USERID -ne 0 ] ##Here we are checking the root access....
then
    echo "ERROR:: Please run the script with root access..."
    exit 1 ##give other than 0 upto 127 for failures
else
    echo "You are running with root access..."
fi

##Validate function takes input as exit status, what command they tried to installed
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "Intalling $2 is...SUCCESS.."
    else
        echo "Installing $2 is...FAILURE.."
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not intalled...going to install it.."
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed...Nothing to do.."
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not intalled...going to install it.."
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed...Nothing to do.."
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not intalled...going to install it.."
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...Nothing to do.."
fi
