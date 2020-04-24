#!/bin/bash
echo -e "1\n2\n3\n" > a.txt
echo -e "3\n4\n5\n" > b.txt

sort a.txt -o a.txt
sort b.txt -o b.txt

# 输出第一例：a中独有项，第二列:b中独有，第三列:ab共有
comm a.txt b.txt

# 删除某列 -1 -2 -3
comm a.txt b.txt -3

# 合并两列首换行符。 sed：通过管道获取comm输出，s：替换^\t为空（//），^:行首标记，行首的换行符
comm a.txt b.txt -3 | sed 's/^\t//'