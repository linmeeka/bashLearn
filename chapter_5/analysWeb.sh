#!/bin/bash

url=""

# lynx : 下载网页文本（不含html标签） -nolist：不加编号
lynx -dump -nolist $url | \
# -o: 只输出匹配到的文本（以Rank-开头的行）
grep -o "Rank-.*" | \
# \1 \2是两个括号\(\)中匹配到的
sed -e 's/ *Rank-\([0-9]*\) *\(.*\)/\1\t\2' | \
# -n : 按数字排序
# -k1 : 按第一列排序
sort -nk 1 > data.txt