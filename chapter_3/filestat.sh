#!/bin/bash

# 打印文件类型
file syslink.sh

#不包括文件名的文件类型信息，只打印类型
file -b syslink.sh

if [ $# -ne 1 ];
then
    echo "usage is $0 base path"
    exit
fi

path=$1
declare -A statarray;

while read line;
do
    # cut，以，为定界符，取第一个字段。即得到文件类型
    ftype=`file -b "$line" | cut -d, -f1`
    let statarray["$ftype"]++;
# 将find的结果输入到white，用read 读
done < <(find $path -type f -print)

for ftype in "${!statarray[@]}";
do
    echo $ftype : ${statarray["$ftype"]}
done

