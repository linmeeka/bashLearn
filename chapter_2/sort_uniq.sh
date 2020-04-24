#!/bin/bash
# 从文件/stdin中输入，输出到stdout

# 对文件内的内容排序，合并输出
sort file.txt file1.txt >sorted.txt

# uniq: 保留唯一的行（不重复的） ，需要输入的数据是排序过的
sort file.txt file1.txt | uniq

# -u : 只显示唯一的行，没有重复过的
uniq -u sorted.txt

