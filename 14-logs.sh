#!/bin/bash


##Functions are used to reduce the code multiple time...
##We usually define a common code as functions and we can call where ever we required...

USERID=$(id -u) 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs" ##Here we are creating the shellscript logs directory
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) ##Here we are getting the file name with '$0' and removing the .sh extension 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"  ##Here we are denoting the logs file name to LOG_FILE Variable..like 14-logs.log

mkdir -p $LOGS_FOLDER ##Here we are creating the directory.. -p is used to create directory if not exists...if it exists it will skip...
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

##Above we are print the script start time and redirecting it to LOG_FILE
##tee command is uded to redirect the output to a file and display same on the screen at the time of execution....

if [ $USERID -ne 0 ] ##Here we are checking the root access....
then
    echo -e "$R Error please run the script with root access... $N" | tee -a $LOG_FILE
    exit 1 ##give other than 0 upto 127 for failures
else

    echo "You are running with root access..." | tee -a $LOG_FILE
fi

##Validate function takes input as exit status, what command they tried to installed
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE

##Here we are using '&' symbol.. because it was not required to display on screen at the time of exectution....
##and '>>' is used to append the ouput to the log file....

if [ $? -ne 0 ]
then
    echo "MySQL is not intalled...going to install it.." | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e " $Y MySQL is already installed...Nothing to do.. $N " | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not intalled...going to install it.." | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "Nothing to do python... $Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not intalled...going to install it.." | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "Nothing to do nginx... $Y already installed $N" | tee -a $LOG_FILE
fi
