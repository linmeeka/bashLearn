#!/bin/bash

word=$1
# grep的单词以^作为输入开头，$作为输入结尾，中间是输入，在后面的词典里查找这个词  -q：不输出
grep "^$1$" /usr/share/dict/british-english -q
if [ $? -eq 0 ];
then
    echo "is a word"
else
    echo "not a word"
fi

# sapell:有单词，不输出。 "$word"作为参数输入
output=`echo \"$word\" | aspell list`
if [ -z $output ];
then 
    echo "is a word"
else
    echo "not a word"
fi

# 在文件中查找单词，查找关键词以^(...) 起头
grep "^tmp" ./image-1.txt