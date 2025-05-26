#!/bin/bash

##We are discussing the colors in this script
##the syntax for applying the color to font is "\e[0m"
##Here 0 denotes no color
##31--> red ...32 --> Green... 33-->Yellow.. we ned need to change the number accordingly....

echo -e "\e[31m Hello color" 

## "-e" is enabling the color
## "/e[0m" is used to end the color till that line...

echo -e "Hello no color" ##If we doesn't end the color after denoting it will apply entire script..

