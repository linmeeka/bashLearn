#!/bin/bash

count=1;
# 当前目录下，后缀为png或jpg的文件
for img in `find . -maxdepth 1 -iname '*.txt' -o -iname '*.jpg' -type f`
do
    # 该图片后缀
    new=image-$count.${img##*.}
    echo "rename $img to $new"
    mv "$img" "$new"
    let count++
done

# 替换空格为_
find . -type f -name "*.txt" -exec rename 's/ /_/g' {} \;