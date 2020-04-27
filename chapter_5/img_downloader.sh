#!/bin/bash

# 输入三个参数
if [ $# -ne 3 ] ;
then
    echo "Usage: $0 URL -d DIRECTORY "
    exit -1
fi

# 对于每一个参数
for i in {1..4}
do
    # in： 和...)的...是否符合。 *是default
    case $1 in
    # shift ，将当前读的参数向前移一个，shift后原$2变成$1
    # 必须有两个;; 
    -d) shift; dir=$1; shift ;;
    # $1是“”的话就是原url，否则url是$1
    *) url=${url:-$1}; shift ;;
    esac
done

mkdir -p $dir;
baseurl=$(echo url | egrep -o "https?://[a-z.]+")

echo Downloading $url

curl -s $url | \
egrep -o "<img src=[^>]*>" | \
#  将图片url输入到临时文件
sed 's/<img src=\/\/\([^>]*\).*/\1/g' > /tmp/$$.list

# 让url完整
sed -i "s|^/|$baseurl/|" /tmp/$$.list

cd $dir;

while read filename;
do
    echo Downloading $filename
    curl -s -O "$filename" --silent
    # 从临时文件读入要下载的url到while
done < /tmp/$$.list

