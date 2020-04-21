#!/bin/bash

# ls : 列出目录下所有文件
# 通过管道|，所有文件名作为cat的输入，通过stdin传给cat
# cat -n：将输入加行号输出
# > cat的输出重定向到out.txt
ls |  cat -n > out.txt

#子shell，读取管道输出（到变量）
cmd_out=$(ls |  cat -n)
#echo $cmd_out

# 或： 反引用，子shell同效果
cmd_out=`ls |  cat -n`

# 子shell
pwd
(cd /bin; ls); #子shell，独立进程，与当前shell无关
pwd
