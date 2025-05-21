#!/bin/bash

##In this script we can use read command to get the values from the user itself....

echo "Enter your PIN number::"

read -s PIN ##Here PIN is the Variable and -s is used to hide the value while user is typing....

echo "Your PIN is :: $PIN"