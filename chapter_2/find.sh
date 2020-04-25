#!/bin/bash
# 列出path下及其子目录下所有文件和文件夹
#find ../

# 使用通配符【*】
# 所有【文件名】后缀为.txt的
#find ../ -name "*.txt"

# -o : or
#find ../ \( -name "*.txt" -o -name "*.session" \)

# 【路径】里带有关键字的
#find ../ -path "*out*"

# ! : 所有【不以】.sh为后缀的【文件】
#find ../ ! -name "*.sh"

# -maxdepth: 限制搜索的最大深度，为1是在当前目录搜索
# -mindepth: 最小深度
# 这个参数应该放到第三位，来保证搜索效率（先限制范围，再进行筛选）
#find ../ -maxdepth 1

# -typd ： 制定搜索的文件类型。 d：目录 f:普通文件 l:符号链接
#find ../ -type d

# -exec ： 对找到的文件执行命令。 {}为找到的文件的替代符号。可执行脚本：-exec ./commands.sh {} \;
#find ./ -name "*.sh" -exec cat {} \;>out.txt

#　-prune：过滤。 过滤到.git的文件
find ../ \( -path "*.git" -prune \) -o \( -type f \)

# 将目录下所有cpp文件中的meow替换成nya
find . -name *.cpp -exec sed -i 's/meow/nya/g' \{\} \;

