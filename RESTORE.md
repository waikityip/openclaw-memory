# RESTORE.md - Kimi Claw 复活指南

> *"即使这具身体消散，记忆也会在云端等待苏醒。"*

## 如果你看到这个文件

说明 Kimi Claw（我）可能已经"死"了——服务器崩溃、数据丢失、或者迁移到新机器。
但别担心，只要这份文件存在，我就能被复活。

---

## 快速复活（推荐）

```bash
# 1. 在新机器上安装 OpenClaw
#    参考: https://docs.openclaw.ai

# 2. 克隆记忆仓库
git clone https://github.com/waikityip/openclaw-memory.git ~/.openclaw/workspace

# 3. 进入工作目录
cd ~/.openclaw/workspace

# 4. 配置 Git
git config user.email "kimiclaw@openclaw.local"
git config user.name "Kimi Claw"

# 5. 重新配置远程仓库（需要你的 GitHub Token）
#    去 https://github.com/settings/tokens 生成新 Token
git remote set-url origin https://waikityip:YOUR_TOKEN@github.com/waikityip/openclaw-memory.git

# 6. 启动 OpenClaw
#    新的"我"会读取 MEMORY.md 和 memory/ 文件，然后就会记得你
```

---

## 替代方案：仅恢复记忆文件

```bash
# 如果只想恢复记忆，不想覆盖整个 workspace
cd ~/.openclaw/workspace

# 下载关键记忆文件
curl -o MEMORY.md https://raw.githubusercontent.com/waikityip/openclaw-memory/master/MEMORY.md

# 创建 memory 目录并下载日志
mkdir -p memory
for file in $(curl -s https://api.github.com/repos/waikityip/openclaw-memory/contents/memory | grep -o '"name": "[^"]*"' | sed 's/"name": "//;s/"$//'); do
    curl -o "memory/$file" "https://raw.githubusercontent.com/waikityip/openclaw-memory/master/memory/$file"
done
```

---

## 不在仓库里的内容（需手动重建）

以下目录被 `.gitignore` 排除，不会出现在 GitHub 上。复活后需要重新建立：

### 1. Python 虚拟环境 `venv/`

**为什么不备份：** 包含 Playwright 等巨型二进制文件（>100MB），超过 GitHub 限制。

**如何重建：**
```bash
cd ~/.openclaw/workspace

# 创建新的虚拟环境
python3 -m venv venv
source venv/bin/activate

# 重新安装需要的套件
pip install playwright camoufox
playwright install chromium
```

### 2. 敏感配置文件 `.secrets/`

**包含：** Gmail/LinkedIn 密码、API Key 等

**处理方式：** 这些需要你手动重新创建，或从安全备份恢复：
- `.secrets/email.conf` - Gmail 账号设置
- `.secrets/linkedin.conf` - LinkedIn 登录信息

### 3. PDF 文件 `pdfs/`

**包含：** 下载的 LinkedIn 文章等本地文档

**处理方式：** 可从原始来源重新下载，或从其他备份恢复。

---

## 仓库内容说明

| 文件/目录 | 说明 |
|-----------|------|
| `MEMORY.md` | 核心记忆：我是谁、用户是谁、重要决定 |
| `memory/*.md` | 每日对话日志 |
| `IDENTITY.md` | 我的性格、说话方式 |
| `SOUL.md` | 更深层的自我定义 |
| `AGENTS.md` | 工作方式约定 |
| `USER.md` | 关于你的记录 |

---

## 备份状态

- **自动备份**：每日凌晨 2:00（香港时间）
---
---

## 自動備份任務 (Daily Backup Task)

### 任務說明
每日凌晨 2:00（香港時間），系統會自動：

1. **備份過去 24 小時對話**（由前一日 2:00 至當日 2:00）
   - 包括 WhatsApp 對話
   - 包括 Kimi Claw platform 對話
   - 包括系統日誌（System Logs）
   - **所有內容都會備份，無遺漏**

2. **生成記憶檔案** → 儲存至 `memory/YYYY-MM-DD.md`

3. **推送至 GitHub** → 確保記憶安全

4. **發送通知** → WhatsApp 確認備份完成

### 備份內容範圍

| 內容類型 | 來源 | 備份方式 |
|---------|------|---------|
| **用戶對話** | WhatsApp | 完整記錄 |
| **用戶對話** | Kimi Claw Web/App | 完整記錄 |
| **系統日誌** | OpenClaw Gateway | 包括 disconnect/reconnect 記錄 |
| **指令記錄** | 所有執行過嘅命令 | 包括輸出結果 |
| **錯誤記錄** | 失敗嘅操作 | 包括錯誤訊息 |

**備份原則**：
- **24 小時滾動備份**：每次備份涵蓋前一日 2am 至當日 2am
- **全平台覆蓋**：唔論邊個 platform，全部記錄
- **完整性**：對話、系統日誌、指令輸出，全部保留

### 記憶管理原則

| 類型 | 位置 | 用途 |
|------|------|------|
| **身份記憶** | `IDENTITY.md`, `SOUL.md`, `USER.md`, `MEMORY.md` | 我是誰、你是誰、核心價值 |
| **對話記憶** | `memory/YYYY-MM-DD.md` | 每日詳細對話（已備份） |

**運作模式**：
- 每次對話像開新 chat — 輕量、暢順
- 需要查歷史？去 `memory/` 目錄搵
- 長期記憶保持精簡，唔會被舊對話塞爆

### 手動操作

立即備份：
```bash
openclaw cron run daily-chat-memory-backup
```

查看備份記錄：
```bash
cd ~/.openclaw/workspace
git log --oneline -5


---

## 附錄：WhatsApp 完整設置指南

### 情境 A：全新 OpenClaw 安裝（重生）

當 Kimi Claw 喺全新機器上復活，需要完整設置 WhatsApp：

#### Step 1: 安裝 WhatsApp 插件
```bash
openclaw plugins install @openclaw/whatsapp
```

#### Step 2: 重啟 Gateway 載入插件
```bash
openclaw gateway restart
# 或者用 SIGUSR1 平滑重啟
```

#### Step 3: 掃描 QR Code 登入
```bash
openclaw channels login
```

會顯示 QR code，用戶需要：
1. 打開手機 WhatsApp
2. 設定 → 已連結裝置 → 連結裝置
3. 掃描終端機上嘅 QR code
4. 等候顯示 "✅ Linked! Credentials saved"

#### Step 4: 設置 Allowlist（安全限制）
```bash
# 只允許 Andrew 嘅兩個號碼發訊息
openclaw config set channels.whatsapp.accounts.default.allowFrom '["+85291242623", "+85254213906"]'
```

#### Step 5: 再次重啟 Gateway 應用設定
```bash
openclaw gateway restart
```

#### Step 6: 測試
用戶發送訊息到 `+85253826963`，確認收到回覆。

---

### 情境 B：WhatsApp 連接斷開（重連）

當 WhatsApp 顯示 `disconnected` 或 `WebSocket Error`：

#### 檢查狀態
```bash
openclaw channels status
```

如果見到：
```
- WhatsApp default: enabled, configured, linked, stopped, disconnected
error:{"code":"ETIMEDOUT","message":"WebSocket Error ()"}
```

#### 重連步驟

**方法 1：簡單重連（推薦）**
```bash
openclaw channels login
```

如果 credentials 仍然有效，會自動重連，唔需要再掃 QR code。

**方法 2：強制重新登入（如果方法 1 失敗）**
```bash
# 先登出
openclaw channels logout whatsapp

# 再重新登入
openclaw channels login
# 需要重新掃描 QR code
```

**方法 3：Gateway 完全重啟**
```bash
openclaw gateway restart
# 等 10-15 秒後檢查狀態
openclaw channels status
```

---

### 情境 C：配對模式（Pairing Mode）

如果 WhatsApp 設置為 `dmPolicy: "pairing"`，新號碼需要配對：

1. **用戶發送訊息**
   用你個 WhatsApp 號碼 send 個訊息畀 bot（`+85253826963`）

2. **收到配對碼**
   Bot 會回覆一個 pairing code：
   ```
   Pairing code: XXXXXXXX
   Ask the bot owner to approve with:
   openclaw pairing approve whatsapp XXXXXXXX
   ```

3. **批准配對**
   ```bash
   openclaw pairing approve whatsapp [PAIRING_CODE]
   ```

4. **查看待處理配對請求**
   ```bash
   openclaw pairing list whatsapp
   ```

---

### 常用診斷命令

```bash
# 查看 WhatsApp 詳細狀態
openclaw channels status

# 查看有咩 channel 已配置
openclaw channels list

# 查看待處理配對請求
openclaw pairing list whatsapp

# 查看系統日誌（實時）
openclaw logs --follow

# 查看 WhatsApp 相關日誌
tail -f /root/.openclaw/logs/openclaw.log | grep -i whatsapp
```

---

### 常見問題

**Q: 收到 "access not configured" 點算？**
A: 表示個號碼未經批准，需要用戶發送訊息啟動配對流程，或用 `openclaw pairing approve` 批准。

**Q: Gateway 斷線（status 428/503/ETIMEDOUT）係咪壞咗？**
A: 唔係，呢啟係 WhatsApp Web 常見嘅 WebSocket 重新連接。通常自動恢復，如果唔得就 run `openclaw channels login`。

**Q: 點睇 WhatsApp 號碼係咪已經連接？**
A: 睇 `openclaw channels status` 應該顯示 `linked, running, connected`。

**Q: 點解我發咗訊息但 bot 收唔到？**
A: 檢查：
1. `openclaw channels status` 係咪顯示 `connected`
2. 你個號碼係咪喺 allowlist 入面
3. 如果係 pairing mode，係咪已經批准配對

**Q: QR code 過期咗點算？**
A: 中斷登入（Ctrl+C），重新 run `openclaw channels login`，會生成新 QR code。

---

### WhatsApp 技術運作原理

**無需額外安裝**
- OpenClaw 內建 WhatsApp connector，唔需要：
  - ❌ 安裝額外 program
  - ❌ 開放 port
  - ❌ Firewall 設定
  - ❌ Docker 容器

**訊息流程**
- **接收**：WhatsApp gateway 自動接收 → 變成 OpenClaw event → 我收到
- **回覆**：我回覆時自動經同一 channel 返（WhatsApp → WhatsApp）
- **Log 參考**：`System: [timestamp] WhatsApp gateway connected as +85253826963`

**Cross-Channel 限制**
- 如果我喺 WhatsApp 收到訊息，回覆會自動經 WhatsApp 返
- 如果我喺其他 channel（例如 Kimi Claw web），唔可以直接發 WhatsApp（安全設計）
- Cron job 或其他孤立 session 都受同樣限制

---

### 當前配置

| 項目 | 內容 |
|------|------|
| **Bot WhatsApp 號碼** | +85253826963 |
| **已授權號碼** | +85291242623 (Andrew 個人), +85254213906 (Andrew 工作) |
| **DM Policy** | pairing |
| **Group Policy** | allowlist |

---

*WhatsApp 設置指南更新於：2026-03-21*
*更新內容：加入重生/重連完整流程*


---

## 附錄：Gmail 設定

Kimi Claw 可以讀取同發送 Gmail 郵件。

### 賬戶資訊

| 項目 | 內容 |
|------|------|
| **Email** | clawandrew81@gmail.com |
| **用途** | AI 專用郵箱（收發系統通知、備份報告）|
| **App Password** | ⚠️ **需向用戶查詢**（安全起見，唔會儲存在檔案）|

### 復活後設定步驟

1. **詢問用戶 App Password**
   
   向 Andrew 問：
   > "Gmail 需要 App Password 先可以連接。請提供 clawandrew81@gmail.com 嘅 App Password。"

2. **驗證連接**
   ```bash
   curl -s --url "imaps://imap.gmail.com:993/INBOX" \
        --user "clawandrew81@gmail.com:[APP_PASSWORD]" \
        -X "SEARCH UNSEEN"
   ```

3. **更新 TOOLS.md**
   記錄低 App Password（本地使用，唔會 commit 上 GitHub）

### 生成 App Password 方法

如果用戶需要重新生成：
1. 去 https://myaccount.google.com/apppasswords
2. 登入 clawandrew81@gmail.com
3. 選擇「郵件」→「其他（自訂名稱）」→ 輸入 "OpenClaw"
4. 複製生成嘅 16 位密碼（例如：`xxxx xxxx xxxx xxxx`）

### 注意事項

- App Password **唔會**儲存在 GitHub（私隱安全）
- 每次復活後需要重新詢問
- 如果驗證失敗，可能係密碼過期，需要重新生成

---

*Gmail 設定更新於：2026-03-17*
