#!/usr/bin/env bash
# Phát hành AutoLastZ: publish.sh <version> <AutoLastZ-Setup-<version>.exe> [CHANGELOG.md của app]
# 1) GitHub Release v<version> + bộ cài  2) versions.json + CHANGELOG.md  3) commit, push.
set -euo pipefail
VER=${1:?version, vd 2.10.0}
EXE=${2:?đường dẫn AutoLastZ-Setup-<version>.exe}
APP_CHANGELOG=${3:-"$(dirname "$0")/../Last Z Survival Shooter/CHANGELOG.md"}
cd "$(dirname "$0")"
[[ -f "$EXE" ]] || { echo "không thấy $EXE" >&2; exit 1; }
[[ "$(basename "$EXE")" == "AutoLastZ-Setup-$VER.exe" ]] || { echo "tên file phải là AutoLastZ-Setup-$VER.exe" >&2; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "gh chưa đăng nhập (gh auth login)" >&2; exit 1; }

SHA=$(shasum -a 256 "$EXE" | cut -d' ' -f1)
SIZE=$(stat -f%z "$EXE" 2>/dev/null || stat -c%s "$EXE")
DATE=$(date +%F)
REPO=0xphuong/autolastz-releases
URL="https://github.com/$REPO/releases/download/v$VER/AutoLastZ-Setup-$VER.exe"
ANCHOR="$(echo "$VER" | tr -d .)--$DATE"

# Trích phần ghi chú của bản này từ changelog app (từ "## [VER]" tới trước "## [" kế tiếp).
NOTES=$(awk -v v="## [$VER]" 'index($0,v)==1{p=1;next} p&&/^## \[/{exit} p' "$APP_CHANGELOG")
[[ -n "$NOTES" ]] || { echo "không thấy mục [$VER] trong $APP_CHANGELOG" >&2; exit 1; }

echo "== Release v$VER ($SIZE byte, sha256 $SHA)"
if gh release view "v$VER" -R "$REPO" >/dev/null 2>&1; then
  gh release upload "v$VER" "$EXE" -R "$REPO" --clobber
else
  gh release create "v$VER" "$EXE" -R "$REPO" --title "AutoLastZ $VER" --notes "$NOTES"
fi

echo "== versions.json"
python3 - "$VER" "$DATE" "$URL" "$SHA" "$SIZE" "$ANCHOR" <<'PY'
import json, sys
ver, date, url, sha, size, anchor = sys.argv[1:]
p = "versions.json"; d = json.load(open(p, encoding="utf-8"))
a = d["products"]["autolastz"]
a.update(latest=ver, released_at=date, download_url=url, sha256=sha, size=int(size),
         changelog_url=f"https://github.com/0xphuong/autolastz-releases/blob/main/CHANGELOG.md#{anchor}")
json.dump(d, open(p, "w", encoding="utf-8"), ensure_ascii=False, indent=2); open(p, "a").write("\n")
PY

echo "== CHANGELOG.md"
{
  printf '# Changelog — AutoLastZ\n\nBản sao changelog của ứng dụng AutoLastZ (bot cho bản PC *Last Z: Survival Shooter*). Bộ cài từng bản ở\n[Releases](https://github.com/0xphuong/autolastz-releases/releases); app đọc [`versions.json`](versions.json) để tự cập nhật.\n\n'
  awk 'f{print} /^## \[/{if(!f){f=1;print}}' "$APP_CHANGELOG"
} > CHANGELOG.md

git add versions.json CHANGELOG.md
git commit -m "feat: AutoLastZ v$VER" >/dev/null
git push origin main
echo "== Xong: $URL"
