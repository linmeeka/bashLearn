#!/bin/bash
#获取当前时间
start=$(date +%s)
echo "ticotico"


# time<time_take.sh> 执行脚本用时

# 设置延时
echo -n Count; # -n 不换行输出
tput sc #存储光标位置

count=0;
while true;
    do
        if [ $count -lt 10 ];
        then
            let count++;
            sleep 1; #1s延时
            tput rc #恢复光标位置到sc存储的位置
            tput ed # 清楚光标到行尾内容（之前输出的秒数
            echo -n $count;
        else break;
        fi
    done

#获取当前时间
end=$(date +%s)
#时间间隔
time=$((end-start))
echo $time