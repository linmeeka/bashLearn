#!/bin/bash

# IFS默认为空格，换行符，制表符

data="a,b,c,d"
oldIFS=$IFS
IFS=,
for item in $data
do
    echo $item
done

IFS=$oldIFS


line="root:x:0:0:root:/root:/bin/bash"
oldIFS=$IFS
IFS=":"
count=0
for item in $line # 使用IFS分割line的每一项，用于循环
do
    [ $count -eq 0 ]&& user=$item
    [ $count -eq 6 ]&& shell=$item
    let count++
done
IFS=$oldIFS
echo $user\'s shell is $shell
