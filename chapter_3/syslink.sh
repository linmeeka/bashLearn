#!/bin/bash
# 符号链接：指向其他文件的指针，类似快捷方式

# 建立一个指向file_right.sh的符号链接syslink
# ln -s ./file_right.sh syslink

# 查看符号链接的详情
ls -l syslink

# 打印出当前目录下所有符号链接。 ls -l 列出所有文件详细信息，管道输入给grep，提取开头(^)为l的输出（详细信息，ls -l中符合条件的那些行）
ls -l | grep "^l"

# 使用find，打印符号链接的名字
find . -type l

# 输出该符号链接的指向
readlink syslink