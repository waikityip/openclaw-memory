# 3D Project - Garfield Court (嘉輝大廈)

## 項目簡介
從香港地政總署 3D 地圖下載亞皆老街 226-232 號（嘉輝大廈）的 3D 模型，並轉換為 GLB 格式供 Pascal Editor 使用。

## 數據來源
- **來源**：香港地政總署 CSDI 3D 視覺化地圖
- **圖幅**：11-NW-10B（九龍城區域）
- **格式**：GLTF/GLB 2.0
- **下載日期**：2026-03-28

## 檔案

| 檔案名稱 | 大小 | 說明 |
|---------|------|------|
| `garfield_court.glb` | ~9 MB | **疑似嘉輝大廈**（建築物 ID: B373962226201063A0）|

## 使用方法

### Pascal Editor
1. 使用 **Scan Node** 載入 GLB 檔案
2. 設定 `url` 欄位為模型路徑
3. 調整 `position`、`rotation`、`scale` 參數

範例：
```json
{
  "id": "garfield-court",
  "type": "scan",
  "url": "./garfield_court.glb",
  "position": [0, 0, 0],
  "rotation": [0, 0, 0],
  "scale": 1,
  "opacity": 1
}
```

### 模型檢視
- [gltf.report](https://gltf.report/)
- [Three.js Editor](https://threejs.org/editor/)
- [Blender](https://www.blender.org/)

## 注意事項
⚠️ 建築物 ID 係政府編碼，實際地址需人工確認。建議開啟模型比對街景確認。

## 版權
數據來源：香港特別行政區政府地政總署

---
*2026-03-28*
