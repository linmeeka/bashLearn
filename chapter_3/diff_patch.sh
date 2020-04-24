#!/bin/bash

# 输出文件的差异：行号，添加删除修改，输出other相比于test，添加和修改的情况
diff test other

# 一体化输出，便于比较
diff -u test other

# 差异重定向至修补文件
diff -u test other > version.patch

#使用修补文件修补，变得和other一样
patch -p1 test < version.patch