#!/bin/bash

# egrep:使用正则表达式
# \b[[:alpha:]]+\b：单词。 alpha：字母。 \b单词边界
# -o：匹配的单行输出
egrep -o "\b[[:alpha:]]+\b" tmp2 | \
awk '{ count[$0]++ }
END{ print("word","count");
for(ind in count)
{
    print(ind,count[ind]);
}
}
'