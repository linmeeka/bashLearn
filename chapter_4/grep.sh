#!/bin/bash

echo -e "meow\nmeow\nmeow\nmeow\nmeoww\nmeow2\nmeow1\nnmeow1 lala\nnmeow1 sdd\n" > tmp
cp tmp tmp1

# 搜索包含特定文本的行
grep "meow" tmp

# 多个文件搜索
# --color:标记匹配单词
grep "meow1" tmp tmp1 --color=auto

# 使用正则表达式
grep -E "[a-z]+1$" tmp tmp1

# 统计匹配到的次数
# -o ： 只输出匹配到的文本
# wc -l：统计行数
# -b: 打印匹配的起始字符列号
grep -b -o "meow" | wc -l

# . : 当前目录下
# -r :　递归搜索
# -n：打印匹配的行号
# -i： 忽略大小写
grep "meow" . -r -n -i

# 在所有c cpp文件中搜索
grep "meow" . -r --include *.{c,cpp}

# 排除readme文件搜索
grep "meow" . -r --exclude "README"