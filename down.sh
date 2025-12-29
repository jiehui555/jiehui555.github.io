#!/bin/bash

# # 输入文件（例如 content.md 或 content.yaml）
# INPUT_FILE="$1"
# # 下载目录（可选，默认当前目录）
# DOWNLOAD_DIR="${2:-.}"

# mkdir -p "$DOWNLOAD_DIR"
# cd "$DOWNLOAD_DIR"

# # 提取所有 img src URL
# grep -o 'src="[^"]*"' "$INPUT_FILE" | sed 's/src="//; s/"$//' > urls.txt

# # 下载 curl
# while IFS= read -r url; do
#     filename=$(basename "$url").png
#     curl -sL -o "$filename" "$url"
# done < urls.txt

# # 可选：清理临时文件
# rm urls.txt

# echo "下载完成！图片保存在 $DOWNLOAD_DIR"




echo "本文用于测试将 issue 内容转换成 markdown 文件，并自动下载图片。
  
  <img width="533" height="307" alt="Image" src="https://github.com/user-attachments/assets/6442af99-d363-4005-a0dd-e14f17992e3e" />
  
  <img width="583" height="372" alt="Image" src="https://github.com/user-attachments/assets/ad013523-ee56-4dd8-9fa0-a50003ec2f50" />
  
" | grep -o 'https://github\.com/user-attachments/assets/[a-f0-9-]\{36\}' | while read url; do
    echo "开始下载: $url"
    filename="$(basename "$url").png"
    curl -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" -o "$filename" "$url"
done