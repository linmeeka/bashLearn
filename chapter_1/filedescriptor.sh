#!/bin/bash
# > 输出到文件 清空 tmp.txt原内容
echo "THis is a sample text 3" > tmp.txt
# >> 追加，不清空
#echo "THis is a sample text 2" >> tmp.txt
# cat 查看文件内容
cat tmp.txt

# 错误命令
#ls +
# 打印错误命令的退出状态
#echo $?

#ls + > out.txt
# 2> 错误信息重定向到文件 2:错误信息stderr，1：输出stdout，0：输入stdin
# ls + 2> out.txt

# tee 重定向到文件out.txt，又传给管道（|），通过stdin接受，用于cat -n
cat tmp* | tee out.txt |cat -n