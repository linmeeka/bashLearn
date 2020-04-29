#!/bin/bash

# 输出执行命令所用时间
# time输出的信息在stderr中，使用2>重定向到文件
/usr/bin/time ./du_df.sh >command.log 2> time.log