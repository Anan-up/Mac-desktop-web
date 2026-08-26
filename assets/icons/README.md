# 原版 macOS 图标（真实位图接入）

网页桌面默认机制：**优先加载 `assets/icons/<key>.png` 真实图标，加载失败自动回退到内置高保真 SVG**。无需改代码。

## 当前接入状态（来自你上传的 Icons.zip / Icons1–4）

真实图标已用你提供的 elrumo 重绘集（`.icns`）转成 512px PNG 接入，**除废纸篓外已全部用真实图标**：

| 真实图标 |  | 真实图标 |  |
|---|---|---|---|
| `finder.png` 访达 | | `music.png` 音乐 | |
| `safari.png` Safari | | `appstore.png` App Store | |
| `mail.png` 邮件 | | `settings.png` 系统设置 | |
| `messages.png` 信息 | | `terminal.png` 终端 | |
| `maps.png` 地图 | | `calculator.png` 计算器 | |
| `photos.png` 照片 | | `textedit.png` 文本编辑 | |
| `facetime.png` FaceTime | | `preview.png` 预览 | |
| `calendar.png` 日历 | | `launchpad.png` 启动台 | |
| `notes.png` 备忘录 | | | |
| `reminders.png` 提醒事项 | | | |

## 暂时回退到内置 SVG 的 1 个（待补）

> `trash.png`（废纸篓）
> 你提供的 5 个 zip（含重传的 Icons1）里**均没有任何废纸篓相关图标**，目前自动回退到内置高保真 SVG，视觉无碍。
> 补齐方式（推荐第一种，得到字面 100% 原版）：
> 1. **在本机 Mac 上运行 `assets/extract-macos-icons.sh`**，从系统 `.icns` 导出 `trash.png`（Apple 专有原版二进制）；
> 2. 或把含有废纸篓图标的分卷（elrumo 集里叫 `Trash.icns`）传给我，我转成 PNG 接入。

## 文件名对照（导出/补图时保持同名）

| 文件名 | 对应 App | 文件名 | 对应 App |
|--------|----------|--------|----------|
| `finder.png` | 访达 | `music.png` | 音乐 |
| `safari.png` | Safari | `appstore.png` | App Store |
| `mail.png` | 邮件 | `settings.png` | 系统设置 |
| `messages.png` | 信息 | `terminal.png` | 终端 |
| `maps.png` | 地图 | `calculator.png` | 计算器 |
| `photos.png` | 照片 | `textedit.png` | 文本编辑 |
| `facetime.png` | FaceTime | `preview.png` | 预览 |
| `calendar.png` | 日历 | `launchpad.png` | 启动台 |
| `notes.png` | 备忘录 | `trash.png` | 废纸篓 *(回退 SVG)* |
| `reminders.png` | 提醒事项 | | |

> 同理，若想用**真实 macOS 壁纸**，把图片命名为 `assets/wallpaper.jpg` 放进来，桌面会自动替换默认渐变壁纸。

## 说明
导入的图标取自 elrumo 社区重绘集（视觉与原版高度一致），适用于个人/学习用途的网页演示。如需字面意义的 Apple 系统专有图标，请在已装 macOS 的本机用 `extract-macos-icons.sh` 导出。
