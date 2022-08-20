#!/bin/bash
# 批量创建用户
read -p '请输入创建的用户名称：' name
read -p '请输入创建用户的数量：' number
for (( i=1;i<=$number;i++ ))
do
# 需要查看系统是否存在用户
cat /etc/passwd | grep "${name}$i" 1>/dev/null
exist=`echo $?`
if [ $exist -eq 1 ]
then
# 创建用户
echo -e "\n"
useradd ${name}$i 2>/dev/null && echo "创建用户${name}$i成功!"
# 需要生成随机密码（MD5值），MD5其实是一个算法来的，可以用来加密密码等7.4、数据库里查询学生成绩
password=`head -2 /dev/urandom | md5sum | cut -c 1-8`
# 给新用户设置密码并把用户名跟密码放在文本中
echo $password | passwd --stdin ${name}$i 1>/dev/null && echo -e "用户名：${name}$i\n 
密码：$password" >>/home/shell/newuser_password.txt
echo -e "\n"
else
echo -e "\n"
echo "${name}$i已经存在了，无需再创建！"
echo -e "\n"
fi
done
