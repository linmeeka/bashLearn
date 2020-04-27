#!/bin/bash

# 登录指定url，获取邮件信息并显示

usrname=""
password=""
gmailurl=""
# 显示的未读邮件数量
$show_count=5

# 输出
echo
# 通过用户名和密码登录邮箱，下载HTML内容到stdout
curl -u $usrname:$password --silent $gmailurl | \
# 删除换行符
tr -d '\n' | \
# 将</entry>替换为换行符，确保一个邮件信息占一行
sed 's:</entry>:\n:g' | \
# \1 : .*<title>\(.*\)<\/title,邮件标题
# \2 ：.*<author><name>\([^<]*\)<\/name>，发件人信息
# \3 : <email>\([^<]*\).*，邮件地址
# 1 2 3 个匹配指\(\)
# -n p : 逐行操作
sed -n 's/.*<title>\(.*\)<\/title.*<author><name>\([^<]*\)<\/name><email>\([^<]*\).*/Frome: \2 [\3] \nSubject: \1\n/p' |\
# 显示指定行数
head -n $(( $show_count * 3 ))