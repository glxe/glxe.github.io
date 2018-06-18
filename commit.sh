#!/bin/bash


git status

read -p "是否继续。请输入y/n：" go
if [ $go != y ]; then
exit 1;
fi
git add .

read -p "请输入(git commit -m )：" commit
git commit -m " $commit "
git push
echo "go on...";