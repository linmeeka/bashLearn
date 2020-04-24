#!/bin/bash

# 打印前十行
head test
cat test | head

# -n : 前四行
head -n 4 test

#最后十行
tail test

# -n : 最后五行
tail -n 5 test
head -n -5 test

# 监控test的更新
tail -f test