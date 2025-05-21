#!/bin/bash

##In this script we see the array data type.. 
##We can mention the multiple values in single varible with space as a separator known as array..
##We usually mention all values in double quotes inside the braces..
##In array data type the indexing start at 0... 
##So the first value is point to 0 and second value is pointing to 1 and so on....


MOVIES=("Court" "HIT3" "PUSHPA2" "THANDEL")


echo "First Movie: ${MOVIES[0]}"
echo "Third Movie: ${MOVIES[2]}"


echo "All Movies: ${MOVIES[@]}" ##When we need to print all values of the array we usually use @ symbol...

##Here $varible == ${variable} both are equal only 
