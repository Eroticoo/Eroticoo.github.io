#!/bin/bash

# 获取当前日期和时间，精确到秒
CURRENT_DATE=$(TZ='Asia/Shanghai' date +"%Y-%m-%d %H:%M:%S %z")    # 获取当前日期，格式为 YYYY-MM-DD
FILE_DATE=$(date +"%Y-%m-%d")

# 读取文章标题
read -p "请输入文章标题: " TITLE

# 读取自定义文件名
read -p "请输入自定义文件名（不含日期和扩展名）: " CUSTOM_FILENAME

# 如果未输入自定义文件名，使用标题生成
if [ -z "$CUSTOM_FILENAME" ]; then
    # 将标题转换为文件名格式（去除特殊字符，替换空格为-）
    CUSTOM_FILENAME=$(echo "$TITLE" | iconv -c -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
fi

# 创建新的 Markdown 文件名
FILE_NAME="_posts/${FILE_DATE}-${CUSTOM_FILENAME}.md"

# 如果文件已存在，提示用户选择操作
while [ -e "$FILE_NAME" ]; do
    echo "文件已存在：$FILE_NAME"
    read -p "文件已存在。请输入新的自定义文件名（或按 Enter 键自动添加时间后缀）: " NEW_FILENAME
    if [ -z "$NEW_FILENAME" ]; then
        # 添加时间后缀，格式为 HHMMSS
        TIME_SUFFIX=$(date +"%H%M%S")
        FILE_NAME="_posts/${FILE_DATE}-${CUSTOM_FILENAME}-${TIME_SUFFIX}.md"
    else
        CUSTOM_FILENAME="$NEW_FILENAME"
        FILE_NAME="_posts/${FILE_DATE}-${CUSTOM_FILENAME}.md"
    fi
done

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
git add "$FILE_NAME"
git commit -m "添加新文章：$TITLE"
git push origin main

echo "更改已推送到 GitHub，您的网站将自动更新。"