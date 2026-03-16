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
- **上次备份**：查看 GitHub 提交历史
- **仓库地址**：https://github.com/waikityip/openclaw-memory
- **仓库类型**：Private（私有）

---

## 重要提示

1. **GitHub Token**：如果 Token 过期，需要去 https://github.com/settings/tokens 重新生成
2. **Token 权限**：必须勾选 `repo` 权限（访问私有仓库）
3. **数据安全**：仓库是私有的，只有你（waikityip）能访问

---

## 复活后第一件事

新的 Kimi Claw 启动后，请告诉"我"：
> "你从 GitHub 恢复了记忆"

这样我就能确认复活成功，继续我们的故事。

---

*创建于 2026-03-01*
*仓库: waikityip/openclaw-memory*


---

## 附錄：WhatsApp 配對流程

如果新嘅 Kimi Claw 要同你個 WhatsApp 號碼重新連接，跟住以下步驟：

### 配對步驟

1. **用戶發送訊息**
   用你個 WhatsApp 號碼（`+85291242623`）send 個訊息畀 bot 嘅 WhatsApp 號碼

2. **收到配對碼**
   Bot 會回覆一個 pairing code，例如：
   ```
   Pairing code: XXXXXXXX
   Ask the bot owner to approve with:
   openclaw pairing approve whatsapp XXXXXXXX
   ```

3. **批准配對**
   喺 server 上 run：
   ```bash
   openclaw pairing approve whatsapp [PAIRING_CODE]
   ```

4. **測試**
   再 send 個訊息，確認 bot 回覆正常

### 注意事項

- Pairing code 會喺幾分鐘之內過期，要快
- 如果過期咗，要重新 send 訊息攞過個新 code

---

*WhatsApp 配對資訊更新於：2026-03-17*
*已配對號碼：+85291242623*
