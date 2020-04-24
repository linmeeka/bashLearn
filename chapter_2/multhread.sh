#!/bin/bash
# 进程ID词典数组
PIDARRAY=()
for file in FILE1.iso FILE2.iso
do
    # &：命令后台执行，继续执行当前脚本
    md5sum $file &
    #$!：获取最近的进程ID
    PIDARRAY+=("$!")
done
# 等待所有进程结束，@，数组中所有项
wait ${PIDARRAY[@]}
