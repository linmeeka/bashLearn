#!/bin/bash

# 打印网络接口列表
# tr -s:压缩字符
# cut -c-10 : 输出每行前十个字符
#ifconfig | cut -c-10 | tr -d ' ' | tr -s '\n'

# 提取名为wlp3s0的网络接口的ip地址
# 这行的格式为inet addr:192.168.2.1 。....
# 第一个grep找到IP地址的部分，地址是数字+.，因此找到不是' '的，到空格停止，即[^ ]*
# 第二个grep找到具体ip地址，由数字和.构成
#ifconfig wlp3s0 | egrep -o "inet addr:[^ ]*" | grep -o "[0-9.]*"

# 查看当前的名字服务器（DNS解析用
cat /etc/resolv.conf

#查看路由表
route