#!/bin/bash

#查看文件详细信息
#第一例：文件权限 ：文件类型|用户权限|用户组权限|其他用户权限 : 读w|写r|执行x/拥有者执行S/粘滞位T
#第二列：所属用户
#第三列：所属用户组
ls -l

# 设置权限
# 三类用户分别设置权限
chmod u=rwx g=rw o=r file_right.sh
# 八进制设置
chmod 764 file_right.sh

#所有用户添加执行权限
chmod a+x file_right.sh

#其他用户减少执行权限
chmod o-x file_right.sh

# -R：递归修改目录.下所有文件权限
chmod 777 . -R