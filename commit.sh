#!/bin/bash

git status

read -p "press ctrl-c exit. Any key to continue! "

git pull
git add .

read -p "Please enter git commit message: " c

if [ " $c " ]; then

git commit -m " $c "
git push
echo go on ...

fi