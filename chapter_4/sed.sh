#!/bin/bash

# 's/a/b/' 将a替换为b
# 打印结果，不修改源文件
# 只替换每行第一个符合的
sed 's/meow/nya/' tmp

# -i：保存修改后的结果
sed -i 's/meow/nya/' tmp

# g:替换所有
sed 's/meow/nya/g' tmp1

# ‘/a/d’ : 移除行
# 包含a的行都会移除
# ^$:正则表达式，空白行
sed '/^$/d' tmp1
sed '/do/d' tmp1

# 给匹配到的单词加括号
# \w\+：正则表达式，匹配单词 w：字母 + 一个或多个
# & ： 代表匹配到的结果
echo this is an example | sed 's/\w\+/[&]/g'

# 交换两个匹配到的单词的顺序
# \([a-z]\+\)：正则表达式，单词
# \([a-z]\+\) \([a-z]\+\) ：单词“ ”单词
# \2 \1：匹配到的第二个和第一个
echo nya meow | sed 's/\([a-z]\+\) \([a-z]\+\)/\2 \1/'

text=meow

# ""可以引用变量
# 可以多个匹配模式
echo nya meow | sed "s/$text/nya/" | sed "s/n/N/" | sed -e 's/y/Y/' -e 's/a/A/' | sed 's/A/B/;s/N/C/'

# 移除注释/* */
# 使用定界符：代替原定界符\（这样注释中的/不用转义成\/了）
# *转移为\*
# 匹配模式，注释符号为：/\*    \*/
# 匹配模式，中间注释部分为.*，无限次匹配任意字符
# 后接两个::，为原sed的两个定界符，中间无内容，表示不替换，直接删除（替换为空）
# g：此行的所有匹配
echo "ww /*aaa aaa8*/ wwwee" | sed 's:/\*.*\*/::g'

# 删除包含meow的句子
# 替换为空，即删除
# [^.]*：^. 除.外的字符，任意次
# 空格+任意不含.的文本+meow+任意不含.的文本+.
sed 's/ [^.]*meow[^.]*\.//g'

# 将目录下所有cpp文件中的meow替换成nya
# find找到的文件名以\0为定界符输出，通过xargs，逐一以参数的方式传入sed命令
find . -name *.cpp -print0 | xargs -I{} -0 sed -i 's/meow/nya/g' {}