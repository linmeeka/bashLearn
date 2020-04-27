#!/bin/bash

key=""
url=""

if [ $# -ne 2 ];
then
    echo -e "Usage : $0 WORD NUMBER"
    exit -1;
fi

curl --silent url | \
# 找出标签内的内容
grep -o \<dt\>.*\</dt\> | \
# 删除标签。 /*：前面有或无/的标签（前标签或后标签）
sed 's$</*[a-z]*>$$g' | \
# -n ： 输出第$2行
# nl：输出行号
head -n $2 | nl
