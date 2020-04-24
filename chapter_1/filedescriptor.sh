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

# tee 重定向到文件out.txt，又传给管道（|），通过stdin接受，用于cat -n -n:加行号 tmp*:以*开头的所有文件 tee:默认覆盖，tee -a 追加
cat tmp* | tee out.txt |cat -n

# < stdin操作符
# cmd < file # 从文件中读取数据


