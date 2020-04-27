#!/bin/bash

# 从指定URL下载文件
wget URL

# 将下载数据写入文件new_file。否则默认是到stdout，进度信息到stderr
curl URL -O new_file