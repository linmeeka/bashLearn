#!/bin/bash

# 总监视时长
secs=36
# 步长
unit=6
# 迭代次数
step=$(( $secs / $unit ))

echo watching cpu usage ... ;

for (( i=0;i<step;i++ ))
do
    # 输出所有进场的cpu使用率 
    # 去除头部 -n +2 ：从第二行到最后
    ps -eocomm,pcpu | tail -n +2 >> /tmp/cpu_usage.log
    sleep $unit
done

echo
echo CPU eaters :

cat /tmp/cpu_usage.log | \
awk '
{ process[$1]+=$2; }
END{
    for(i in process) 
    {
        printf("%-20s %s\n",i,process[i]);
    }
}
' | sort -nrk 2 | head -n 5

rm /tmp/cpu_usage.log
