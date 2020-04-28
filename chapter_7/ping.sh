#!/bin/bash

for ip in 192.168.0.{0..255};
do
    # -c 2 :限制每个ping两个echo。
    # &>：将stdout和stderr都重定向
    # () 将括号内程序作为子shell，& 将其放入后台执行，能够让ping并行
    (
    ping $ip -c 2 &> /dev/null;
    if [ $? -eq 0 ];
    then
        echo $ip is alive;
    else
        echo $ip is died qaq;
    fi
    )&
done
