#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script Name: $0"
echo "Current directory: $PWD"
echo "User runnning this script: $USER"
echo "Home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 10 & ## '&' amphersand symbol is used take the process to background...
echo "PID of last command in background: $!" 