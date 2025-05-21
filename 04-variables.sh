#!/bin/bash

##In this we are denoting the values as $1 and $2 and passing values to it at the time of executing the script in the command line..
##For example run the script as 'sh 04-variables.sh Modi Musk'....
##If we have space in single values mention it in double quotes....

PERSON1=$1   #There should be no space before and after '='
PERSON2=$2

echo "$PERSON1: Hey $PERSON2, How are you?"
echo "$PERSON2: Hello $PERSON1, I'm Fine. How are you doing?"
echo "$PERSON1: I'm fine too, what's up?"
echo "$PERSON2: Nothing, just going to Mars now, will you come?"
echo "$PERSON1: Sorry, you carry on! I will come once you come back"