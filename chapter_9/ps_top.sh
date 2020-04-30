#!/bin/bash

# 输出cpu占用最多的10个进程中与bash相关的
# -e : every 所有的
# -o : 指定显示的列，comm：command命令，pcpu：cpu占用
ps -eo comm,pcpu --sort -pcpu| head | grep bash

# 输出和bash相关进程的pid
# -c 后接进程名
ps -C bash -o pid
pgrep bash

# 列出进程和相关环境变量
ps -eo cmd e

# 输出ls执行文件的路径
which ls

# 输出ls的描述
whatis ls