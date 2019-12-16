#!/bin/bash
chmod +x github.sh

read -p " 请输入你的仓库的地址"  url
read -p "请输入你要跟踪的一些文件，(因为文件过大会上传失败，因此需要跟踪一大部分文件之后，才不会上传失败，比如跟踪所有py文件  "*.py")"  houzhui
echo "你要跟踪的文件有" $houzhui
read -p  "输入待上传的文件的名字"  file
#初始化
git init
#添加自定义文件到暂存区

#一些大文件上传设置缓存区为500mb
git config http.postBuffer 524288000remote add origin $url

#这里是安装处理大文件的工具
git lfs install
#跟踪之前需要跟踪的文件，这样上传的就少了
git lfs track $houzhui 

#后面就是正常的操作了
#添加文件 
git add $file

#提交
git commit -m "第一次提交，有点紧张"
#绑定远程仓库  就是你之前在github上创建的仓库地址
git remote add orgin $url


#解决用户密码一直要输入  
git config --global credential.helper store

#推送到远程仓库
git push -u origin master

