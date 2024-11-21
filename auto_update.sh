#!/bin/bash

# 获取当前日期和时间，精确到秒
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S %z")
# 格式化文件名日期部分
FILE_DATE=$(date +"%Y-%m-%d")

# 读取文章标题
read -p "请输入文章标题: " TITLE

# 将标题转换为文件名格式（去除特殊字符，替换空格为-）
FILE_TITLE=$(echo "$TITLE" | iconv -c -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

# 创建新的 Markdown 文件
FILE_NAME="_posts/${FILE_DATE}-${FILE_TITLE}.md"

# 检查文件是否已存在
if [ -e "$FILE_NAME" ]; then
    echo "文件已存在：$FILE_NAME"
    exit 1
fi

# 创建文件并添加 Front Matter
echo "---" > "$FILE_NAME"
echo "layout: default" >> "$FILE_NAME"
echo "title: \"$TITLE\"" >> "$FILE_NAME"
echo "date: $CURRENT_DATE" >> "$FILE_NAME"
echo "---" >> "$FILE_NAME"
echo "" >> "$FILE_NAME"
echo "# $TITLE" >> "$FILE_NAME"
echo "" >> "$FILE_NAME"
echo "这里是您的新文章内容。" >> "$FILE_NAME"

echo "新文章已创建：$FILE_NAME"

# 提交并推送到 GitHub
git add .
git commit -m "添加新文章：$TITLE"
git push origin main

echo "更改已推送到 GitHub，您的网站将自动更新。"