#!/bin/bash
# -t 时序数据导入stderr 2> stderr输入timing.log -a 命令导入output.session
# 可以录制不光是命令，包括键盘的输入，方向键 光标等等
# 保存的文件可以在其他终端使用
script -t 2> timing.log -a output.session
echo '1'
echo '2'
exit
scriptreplay timing.log output.session
