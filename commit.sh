#!/bin/bash

git status

read -p "whether to continue? Any key to continue, press n key to exit! " go

if [ $go eq n ]; then
exit 1;
fi

git pull
git add .

read -p "Please enter git commit message: " c

if [ " $c " ]; then

git commit -m " $c "
git push
echo go on ...

fi