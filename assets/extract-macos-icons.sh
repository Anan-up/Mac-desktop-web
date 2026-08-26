#!/bin/bash
# ============================================================================
#  macOS 原版图标导出脚本
#  在你的 Mac 上运行本脚本，把系统自带 app 的真实图标导出为 PNG，
#  放入 assets/icons/ 后，网页桌面会自动使用「原版」图标（无需改代码）。
#
#  用法：
#    chmod +x extract-macos-icons.sh
#    ./extract-macos-icons.sh
#
#  说明：依赖 macOS 自带命令 sips / cp，无需安装任何东西。
#        导出的 PNG 仅含苹果系统图标，用于个人/学习用途的网页演示。
# ============================================================================
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="$HERE/icons"
mkdir -p "$OUT"

# key -> 系统 .icns / .png 路径（多个候选，命中第一个即导出）
conv() {
  local key="$1"; shift
  local src
  for src in "$@"; do
    if [ -f "$src" ]; then
      if [[ "$src" == *.icns ]]; then
        sips -s format png "$src" --out "$OUT/$key.png" >/dev/null 2>&1 \
          && { echo "✓ $key  <- $src"; return 0; }
      else
        cp "$src" "$OUT/$key.png" 2>/dev/null \
          && { echo "✓ $key  <- $src"; return 0; }
      fi
    fi
  done
  echo "– $key  (未找到对应图标，将使用内置高保真 SVG)"
}

conv finder      /System/Library/CoreServices/Finder.app/Contents/Resources/Finder.icns
conv safari      /Applications/Safari.app/Contents/Resources/Compass.icns \
                 /System/Applications/Safari.app/Contents/Resources/Compass.icns
conv mail        /System/Applications/Mail.app/Contents/Resources/ApplicationIcon.icns \
                 /System/Applications/Mail.app/Contents/Resources/Mail.icns
conv messages    /System/Applications/Messages.app/Contents/Resources/Messages.icns
conv maps        /System/Applications/Maps.app/Contents/Resources/AppIcon.icns
conv photos      /System/Applications/Photos.app/Contents/Resources/AppIcon.icns
conv facetime    /System/Applications/FaceTime.app/Contents/Resources/AppIcon.icns
conv calendar    /System/Applications/Calendar.app/Contents/Resources/AppIcon.icns
conv notes       /System/Applications/Notes.app/Contents/Resources/Notes.icns
conv reminders   /System/Applications/Reminders.app/Contents/Resources/AppIcon.icns
conv music       /System/Applications/Music.app/Contents/Resources/AppIcon.icns
conv appstore    /System/Applications/App\ Store.app/Contents/Resources/AppIcon.icns
conv settings    /System/Applications/System\ Settings.app/Contents/Resources/AppIcon.icns \
                 /System/Applications/System\ Preferences.app/Contents/Resources/Preferences.icns
conv terminal    /System/Applications/Utilities/Terminal.app/Contents/Resources/Terminal.icns
conv calculator  /System/Applications/Calculator.app/Contents/Resources/Calculator.icns
conv textedit    /System/Applications/TextEdit.app/Contents/Resources/TextEdit.icns
conv preview     /System/Applications/Preview.app/Contents/Resources/Preview.icns
conv launchpad   /System/Applications/Launchpad.app/Contents/Resources/AppIcon.icns
conv trash       /System/Library/CoreServices/Dock.app/Contents/Resources/trash.png \
                 /System/Library/CoreServices/Dock.app/Contents/Resources/fullTrash.png

echo ""
echo "完成。把本目录作为网站根目录打开 index.html 即可看到原版图标。"
echo "（缺失的图标会自动回退到内置 SVG，不影响使用。）"
