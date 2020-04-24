#!/bin/bash

echo "hello" > test
cp test test1
cp test test2
echo "next" > other

# 列出当前目录下文件的详细信息，按大小排序
# awk对列出的文件进行行列比较，找出重复文件
# BEGIN{}中：
# getline读取ls输出的第一行无用信息“total 20”
# 再读取一行，为第一个文件信息，取其第八列和第五列，为文件名和大小
# 下一个{}中：
# 会自动读取余下的文本行，得到其他文件的文件名和大小
# 比较大小，若一样，计算md5sum校验和
# 比较校验和
# 一样的输出到dupliate_filtes
# sort -u对dupliate_filtes重复输出的文件去重（test1和test，test2和test）
ls -lS --time-style=long-iso | awk 'BEGIN{
    getline; getline;
    name1=$8; size=$5
}
{
    name2=$8;
    if (size==$5)
    {
        "md5sum "name1 | getline; csum1=$1;
        "md5sum "name2 | getline; csum2=$1;
        if( csum1==csum2 )
        {
            print name1; print name2;
        }
    };
    size=$5;
    name1=name2;
}' | sort -u > duplicate_files

# 从dupliate_filtes读取重复文件，计算校验和，重复文件样本存在duplicate_sample
cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{ print "^"$2"$" }' | sort -u > duplicate_sample

echo removing...
# 取duplicate_sample和dupliate_filtes差集，删除。 tee：将输入来stdin，重定向到/dev/stderr，打印，传给rm删除
comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr |xargs rm
echo removed