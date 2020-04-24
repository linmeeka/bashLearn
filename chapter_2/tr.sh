#!/bin/bash

# 以stdin为输入

# tr 【a】【b】：【a】转换到【b】,【a】为【集合】。 大写转小写
echo "ABDCDS" | tr 'A-Z' 'a-z'

# -d:删除指定字符集的字符
echo "ABCDE" | tr -d 'AC'

# -c:补集  删除不在指定字符集中的字符(包括换行符等)
echo "ABCDE" | tr -d -c 'AC'

# -s 压缩指定字符集中的字符
echo "AAABDD" | tr -s 'AD'