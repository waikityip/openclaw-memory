#!/bin/bash
# 輕量每日記憶備份腳本

DATE=$(date +%Y-%m-%d)
MEMORY_FILE="/root/.openclaw/workspace/memory/${DATE}.md"
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)

# 檢查今日記憶檔案是否已存在
if [ -f "$MEMORY_FILE" ]; then
    echo "記憶檔案已存在: $MEMORY_FILE"
    STATUS="已存在，跳過"
else
    # 創建簡短日記
    cat > "$MEMORY_FILE" << EOF
# ${DATE} 日誌

## 概要
- **日期**: ${DATE}
- **時間**: 02:00 AM (Asia/Hong_Kong)
- **類型**: 自動日誌

## 今日記錄
待補充（如有重要事件請手動更新）

---
*創建時間: $(date '+%Y-%m-%d %H:%M:%S')*
EOF
    
    # Git 操作
    cd /root/.openclaw/workspace
    git add "$MEMORY_FILE"
    git commit -m "Daily log: ${DATE}"
    git push origin master
    
    if [ $? -eq 0 ]; then
        STATUS="✅ 成功創建並推送"
    else
        STATUS="❌ 推送失敗"
    fi
fi

# 發送 WhatsApp 通知
MESSAGE="📋 每日記憶備份 (${DATE})
狀態: ${STATUS}
檔案: memory/${DATE}.md

如有重要事件，請手動補充內容。"

echo "$MESSAGE"
