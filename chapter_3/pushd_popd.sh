#!/bin/bash

# 路径入栈
pushd ~/git/
pushd ~/libs/

# 查看栈
dirs

# 切换到某个栈中路径 0 1 2 .. 
pushd +1

# 弹出路径
popd

# 切换到上一个路径
cd -