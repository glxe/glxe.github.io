#!/bin/bash


#如果是mac


git status

read -p "Press ctrl-c exit. Any key to continue! "

git pull
git add .

read -p "Please enter git commit message: " c

if [ " $c " ]; then

git commit -m " $c "
git push
echo go on ...

fi

#git push -u origin master -f