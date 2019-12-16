#!/bin/bash
chmod +x github.sh

read -p " 请输入你的仓库的地址"  url

read -p  "输入待上传的文件的名字"  file
#初始化
git init
#添加自定义文件到暂存区
git add $file
git add .
#提交
git commit -m "first commit"
#绑定远程仓库  就是你之前在github上创建的仓库地址
git remote add origin $url
#推送到远程仓库
git push -u origin master

