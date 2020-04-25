#!/bin/bash

# 三个语句块：BEGIN，pattern，END
# 1.执行BEGIN（可无）
# 2.从stdin或file中读取每一行，对每一行进行pattern匹配（无pattern则默认匹配），执行pattern语句块（无则print）
# 3.执行END（可无）
echo -e "nya1\nnya2" | awk 'BEGIN{ print "start" } { print } END{ print "end" }'

# 从文件中读取行
# NR：行号，在END里输出总行数（因为在pattern{}中不断更新NR的值）
# NF：当前行字段数，print NF为最后一个字段内容
# “”：用于字符串拼接
# ，：输出中为空格
# $0:当前行
# $1：第一个字段 ...
# BEGIN中可声明变量。语句块中不同语句用分号；分割
# getline：读取一行
awk 'BEGIN{ sum=1; getline; print $0 } { print "Line no:"NR," NO of fields:"NF," $0="$0," $1="$1; sum++ } END{ print "total lines: "NR; print sum }' tmp2

# 打印特定列
ls -l | awk '{ print "name: "$9,"size: "$5 }'

#打印第四行至第六行
awk 'NR==4,NR==6' tmp2

# /.*4/, /lala/匹配两个模式，打印符合这两个模式之间的行的文本（符合这个模式的行会被选中）
awk '/.*4/, /lala/' tmp2