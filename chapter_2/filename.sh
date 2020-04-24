#!/bin/bash

file="file.jpg"
# % ： 提取文件名  删除位于%右侧的字符，*为通配符，方从右向左，非贪婪
name=${file%.*}
echo $name

# # ：提取扩展名，方向从左向右，非贪婪
ex=${file#*.}
echo $ex