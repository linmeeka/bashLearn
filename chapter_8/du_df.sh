#!/bin/bash

# du : disk usage 查看文件、目录占用的磁盘空间
du tmp.txt

# -a : 遍历目录
# -k ：以kb为单位
# -n : 按数字排列
# -k 1: 以第一例为键值
# -r : 降序
# head -n 4 : 输出前四行
du -ak ../chapter_1 | sort -nrk 1 | head -n 4

# 同上，不包括目录
find ../chapter_1 -type f -exec du -k {} \; | sort -nrk 1 | head -n 4

# df : disk free 磁盘可用信息
df