#!/bin/bash
# 从文件、stdin中读取数据，拼接并到stdout，cat不会修改文件
#echo 'tmp1' > file1.txt
cat file1.txt file.txt
cat -s file1.txt # 压缩空白行 保留一个
cat -T file1.txt # 显示制表符
cat -n file1.txt # 显示行号