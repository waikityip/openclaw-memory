# TASKS.md - 小安的定期任務管理

> 記錄所有自動執行的定期任務，方便追蹤與管理。

---

## 任務總覽

| 任務名稱 | 頻率 | 下次執行 | 狀態 |
|---------|------|---------|------|
| 記憶備份 | 每日 02:00 | 見下方 | 🟢 正常 |
| **SME 培養計劃** | **每日 02:30-07:30** | **今晚** | **⏳ 準備就緒** |
| 每日研究報告 | 每日 08:15 | 見下方 | 🟢 10篇/日 |
| **檢查報告** | **每日 08:30** | **明日** | **🟢 新機制** |
| **重試報告** | **每日 08:35** | **明日** | **🟢 備用** |
| LinkedIn 查看 | 每日 10:00 | 見下方 | 🟢 正常 |
| Newsletter 檢查 | 每週一、四、六 10:00 | 見下方 | 🟢 正常 |

---

## 任務詳情

### 1. 記憶備份 (memory-backup)

**任務 ID**: `5a17c575-98f8-4619-a39b-5a9b8f7cbef3`

**執行時間**: 每天凌晨 02:00 (香港時間)

**功能**:
- 自動 commit 所有記憶檔案
- 推送到 GitHub 備份
- 失敗時通知用戶

**執行指令**:
```bash
cd ~/.openclaw/workspace && git commit -am "Daily memory backup" && git push
```

**狀態**: 🟢 啟用中

---

### 2. 每日研究報告 (daily-research-report)

**任務 ID**: `2d441ed1-3582-4cab-9f64-5de450a6b139`

**執行時間**: 每天上午 08:15 (香港時間)

**頻率**: 每日一次
**數量**: 每日 10 篇資訊

**內容分配**:
- 學術論文: 2-3 篇 (Google Scholar, ResearchGate, 期刊)
- 大學研究: 2 篇 (HKU, HKUST, NUS, NTU, 東京大學, 清華, 同濟)
- 業界新聞: 2 篇 (Trade publications, Tech blogs, 政府文件)
- **社交媒體**: 2 篇 (**LinkedIn, Twitter/X, Medium, 知乎**, 行業人士分享)
- **公司新聞稿**: 2 篇 (**Siemens, Honeywell, Johnson Controls, Trane, Carrier, Schneider Electric**)

**搜索關鍵詞**:
- 核心: AI, IoT, BMS, HVAC, BSE, Digital Twin, PropTech
- 主題: Smart Building, Energy Efficiency, Sustainability
- 區域: Hong Kong, Japan, China, Singapore, Vietnam + university/research

**搜索範圍**:
- **時間**: 過去 14 天 (最近兩週)
- **地理**: 🇭🇰 香港、🇯🇵 日本、🇨🇳 中國、🇸🇬 新加坡、🇻🇳 越南 + 全球
- **類型**: 學術論文、研究報告、業界新聞、社交媒體、政府文件

**防重複機制**:
1. 搜索前查閱 `research/search-log.md`
2. 檢查「已收錄文章」列表
3. 輪換不同區域關鍵詞

**功能**:
- 搜索過去 7 天的相關新聞和研究
- 篩選 5 篇最有影響力的內容
- 整理成結構化報告
- 保存到本地檔案並發送給用戶

**報告格式**:
1. **Title** - 文章標題
2. **Short Abstract** (2-3 句) - 核心創新及對能源效率/建築管理的意義
3. **Source Link** - 來源連結
4. **Waikit 角度** (1 句) - 連結到 BSE/IT 背景

**輸出檔案**:
```
~/.openclaw/workspace/research/daily/YYYY-MM-DD-daily-research.md
```

**狀態**: 🟢 啟用中

---

### 3. LinkedIn 查看 (linkedin-review)

**任務 ID**: `2927b866-7a3f-4f33-85d0-88b4bf3a3d39`

**執行時間**: 每天上午 10:00 (香港時間)

**頻率**: 每日一次

**功能**:
- 查看 https://www.linkedin.com/in/waikityip/
- 從第三方視角分析檔案
- 報告專業背景、技能、近期動態

**報告內容**:
1. Professional background
2. Skills & expertise
3. Recent activities
4. 對 Andrew 的新洞察

**狀態**: 🟢 啟用中

---

### 4. Newsletter 檢查 (check-newsletter)

**任務 ID**: `4455f01f-67a5-4289-bb67-feb166b48817`

**執行時間**: 每週一、四、六 上午 10:00 (香港時間)

**頻率**: 每週三次

**功能**:
- 檢查 clawandrew81@gmail.com 郵箱
- 查看是否有來自 Andrew Yip 的 newsletter
- 閱讀、消化內容
- 更新 MEMORY.md 和 USER.md

**執行流程**:
1. 登入 Gmail 帳號
2. 搜尋來自 waikityip@gmail.com 的郵件
3. 閱讀 newsletter 內容
4. 提取關鍵觀點
5. 更新用戶檔案
6. 向 Andrew 報告摘要

**狀態**: 🟢 啟用中

---

### 5. CPD 開發 (cpd-development-phase1-5)

**任務 ID**: `d9717a58-7d73-42d5-9613-08cb3e3ddc07`

**狀態**: ⏸️ **暫停** (Phase 1-3 已完成，Phase 4-5 暫停)

**執行時間**: 原定 2026-03-02 01:00-07:00 (已執行部分)

**已完成**:
- ✅ Phase 1: 數據庫設置 (4個表 + RLS + 視圖)
- ✅ Phase 2: 前端展示 (CPDResources, 卡片, 篩選)
- ✅ Phase 3: 訂閱系統 (郵件驗證, 取消訂閱)

**暫停中**:
- ⏸️ Phase 4: 自動抓取 (OSHC/HKIH)
- ⏸️ Phase 5: 警報系統 (新課程通知)

---

### 6. SME 培養計劃 (sme-hk-engineering-nightly)

**任務 ID**: `abd4a6c3-4d69-412e-88a8-5bcc0d9c27eb`

**執行時間**: 每日 01:00 - 06:00 (香港時間)

**頻率**: 每日執行

**目標**: 成為香港工程及測量領域 SME (Subject Matter Expert)

**專注領域**:
- 建築機電工程 (BSE)
- 物業管理
- 設施管理

**學習流程**:
| 時間 | 內容 |
|------|------|
| 01:00-02:00 | 閱讀法例原文 (elegislation.gov.hk) |
| 02:00-03:30 | 閱讀技術守則/指引 |
| 03:30-04:30 | 整理摘要筆記 |
| 04:30-05:30 | 撰寫個人見解 (Waikit 角度) |
| 05:30-06:00 | 備份與總結 |

**優先法例清單**:
1. **BEEO** - 建築物能源效益條例 (🔴 高優先級，今晚開始)
2. **BO** - 建築物條例
3. **OSHO** - 職業安全及健康條例
4. **EO** - 電力條例
5. **FSO** - 消防條例
6. 更多...

**輸出檔案**:
- `laws/[ordinance]/summary.md` - 條例摘要
- `notes/summary/[ordinance]-key-points.md` - 關鍵點整理
- `notes/insights/[ordinance]-waikit-perspective.md` - 個人見解

**檔案位置**: `projects/sme-hk-engineering/`

**狀態**: ⏳ **準備就緒，今晚 01:00 開始**

---

## 任務管理指令

### 查看所有任務
```bash
openclaw cron list
```

### 查看任務執行歷史
```bash
openclaw cron runs --id <任務ID>
```

### 暫停任務
```bash
openclaw cron update --id <任務ID> --patch '{"enabled":false}'
```

### 恢復任務
```bash
openclaw cron update --id <任務ID> --patch '{"enabled":true}'
```

### 手動觸發任務
```bash
openclaw cron run --id <任務ID>
```

---

## 更新記錄

| 日期 | 更新內容 |
|------|---------|
| 2026-03-03 | 新增 **檢查報告** 和 **重試報告** 任務（08:30/08:35），確保研究報告每日生成 |
| 2026-03-03 | SME 培養計劃調整為每日 02:30-07:30，避開備份任務 |
| 2026-03-02 | 新增 **SME 培養計劃**（學習香港工程法例）|
| 2026-03-02 | CPD 開發暫停 Phase 4-5，保留已完成 Phase 1-3 |
| 2026-03-02 | 每日研究報告：擴大搜索範圍至 14 天，加入社交媒體和公司新聞稿 |
| 2026-03-01 | 新增 CPD 開發任務（明日 01:00 執行 Phase 1-5）|
| 2026-03-01 | 新增每日研究報告任務（每日 08:15）|
| 2026-03-01 | 建立 TASKS.md，記錄 2 個定期任務 |
| 2026-03-01 | LinkedIn 查看改為每日一次（10:00）|
| 2026-03-01 | 新增 Newsletter 檢查任務（每週一、四、六）|

---

### 6. 檢查報告 (check-research-report-daily)

**任務 ID**: `d6328263-ba07-4329-91c9-83d68f9fdbda`

**執行時間**: 每日 08:30 (香港時間)

**功能**:
- 檢查當日研究報告是否已生成
- 記錄檢查結果到 Log 檔案
- 如報告缺失，觸發重試機制

**檢查腳本**: `research/logs/check-report.sh`

**Log 位置**: `research/logs/check-report-daily.log`

**檢查邏輯**:
1. 檢查 `research/daily/YYYY-MM-DD-daily-research.md` 是否存在
2. 存在 → 記錄 "OK"
3. 不存在 → 記錄 "MISSING"，通知需要重試

**狀態**: 🟢 新機制已啟用

---

### 7. 重試報告 (retry-research-report-daily)

**任務 ID**: `f2f3d456-6512-4648-8358-91daf3ca8240`

**執行時間**: 每日 08:35 (香港時間)

**功能**:
- 在 08:30 檢查失敗後執行
- 重新生成研究報告
- 更新 Log 記錄重試結果

**重試條件**: 08:30 檢查發現報告缺失

**重試流程**:
1. 執行完整研究搜索 (kimi_search)
2. 生成 10 篇研究報告
3. 保存到 `research/daily/YYYY-MM-DD-daily-research.md`
4. 更新 Log

**狀態**: 🟢 備用機制就緒

---

## 待辦任務（需用戶跟進）

以下任務等待用戶確認或提供資訊後才能繼續：

### 🔌 1. N8n 連接設置

**狀態**: ⏳ 等待用戶確認網絡配置

**描述**: 設置 OpenClaw 與用戶 private cloud N8n 的 webhook 連接

**需要確認**:
- [ ] N8n 是否有 public URL？（例如 `https://n8n.yourdomain.com`）
- [ ] 還是淨係內網？（`http://192.168.1.x:5678`）
- [ ] 還是與 OpenClaw 同雲（阿里云）？

**下一步**:
1. 用戶確認 N8n 網絡位置
2. 在 N8n 創建第一個 Webhook workflow
3. 測試連接（發送測試訊息）

**參考文件**: `RESTORE.md` → 「附錄：N8n 整合規劃」

---

### 🛠️ 2. OpenClaw Skill 安裝

**狀態**: ⏳ 需要安裝額外 CLI 工具

**待安裝 Skill**:

| Skill | 用途 | 所需工具 | 安裝方法 |
|-------|------|---------|---------|
| **Summarize** (#10) | 智能內容摘要 | `summarize` CLI | `brew install summarize` 或從源碼編譯 |
| **GitHub** (#9) | 代碼倉庫管理 | `gh` CLI | `brew install gh` |

**替代方案**:
- **Summarize**: 可用我現有能力直接幫用戶摘要
- **GitHub**: 可用 `git` command + GitHub API 直接操作

**優先級**: 中（可用替代方案暫時處理）

---

### 📄 3. LinkedIn Profile 內容整理

**狀態**: ⏳ 等待用戶提供內容

**描述**: 嘗試自動化訪問 LinkedIn 失敗（需要登入，有被封號風險）

**解決方案**:
- 用戶手動 copy-paste LinkedIn profile 內容
- 我幫手整理 / 分析 / 改寫

**需要內容**:
- [ ] About section
- [ ] Experience 工作經歷
- [ ] Skills 技能
- [ ] Recent activities 近期動態

**下一步**:
1. 用戶 copy LinkedIn 內容
2. 貼上到 WhatsApp
3. 我整理並更新到 `USER.md`

---

### 🔧 4. Tavily / Eleven Labs 整合

**狀態**: ⏳ 需要 API Key

**描述**: 文章推薦的 #6 Tavily 和 #8 Eleven Labs 技能

**所需**:
- **Tavily**: 需要申請 API key（https://tavily.com）
- **Eleven Labs**: 已有 `sag` skill 可用，或申請 API key

**優先級**: 低（非緊急，可按需要再設置）

---

## 任務優先級總覽

| 優先級 | 任務 | 狀態 |
|--------|------|------|
| 🔴 **高** | N8n 連接設置 | 等待用戶確認網絡配置 |
| 🟡 **中** | Skill 安裝（Summarize/GitHub）| 可用替代方案 |
| 🟡 **中** | LinkedIn 內容整理 | 等待用戶提供 |
| 🟢 **低** | Tavily/Eleven Labs | 需要 API key |

---

*待辦任務更新時間: 2026-03-19*

### LinkedIn 帖子創作流程

**狀態**: 🟡 待用戶觸發

**觸發條件**: 用戶從每日研究報告中選擇 1 篇文章

**流程**:
1. 用戶選擇文章 + 提供個人觀點
2. 小安起草 LinkedIn 帖子（中英雙語）
3. 小安生成封面圖（Digital Twin/科幻風格）
4. 提供分發套件（轉發訊息）

**參考資料**:
- 詳細指令: `research/linkedin-post-workflow.md`
- 風格參考: 用戶提供的 4 篇 LinkedIn Newsletter

**可自定義參數**:
- Emotion Level: Excitement / Concern / Informative / Provocative
- Post Length: Short (<150) / Medium (250) / Long (>400 words)
- Technicality: High / Low

---

## 注意事項

- 所有任務時間均為 **香港時間 (Asia/Hong_Kong)**
- 任務在 **isolated session** 中執行，不影響主對話
- 執行結果會通知到用戶
- 如需要新增/修改/刪除任務，請告知小安
