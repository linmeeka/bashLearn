#!/bin/bash
# cat读取文件到stdout，经过管道|，以stdin到xargs，转为命令参数（单行） xargs默认使用空格作为定界符
cat file1.txt | xargs

# 单行命令行参数转为多行，3个加一个换行符
cat file1.txt | xargs -n 3

# -d 制定定界符为b，xargs的输入是stdin的字符串，两个一换行
echo "ababababa" | xargs -d b -n 2

echo -e "a1\na2\na3\na4\n" >args.txt

# 每个换行是输入./cecho.sh的一次命令，输入一个参数
cat args.txt | xargs -n 1 ./cecho.sh

# 输入三个参数
cat args.txt | xargs -n 3 ./cecho.sh

# 输入所有参数
cat args.txt | xargs ./cecho.sh

# -I指定替换字符串，一次一个，循环xargs的所有输入
cat args.txt | xargs -I {} ./cecho.sh ww {}

# 删除out.txt的文件。 与find结合使用，需要加-print0 和-0， 指定定界符为\0
#find . -type f -name "*out.txt" -print0 | xargs -0 rm -f

