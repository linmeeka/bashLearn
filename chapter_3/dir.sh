#!/bin/bash

# 列出当前文件夹的目录信息
dir

ls -d *

# -F:每行末尾有文件类型
ls -F | grep "/$"

ls -l | grep "^d"

find . -maxdepth 1 -type d