# AutoLastZ Releases

Manifest phiên bản + changelog công khai của **AutoLastZ** (bot cho bản PC *Last Z: Survival Shooter*). App đọc repo này
lúc mở để báo *Có bản mới* và tự tải / cài bộ cài; bộ cài là asset của GitHub Release tương ứng.

## Có gì ở đây

| File | Mục đích |
|---|---|
| [`versions.json`](versions.json) | Máy đọc: bản mới nhất, bản tối thiểu còn hỗ trợ, link tải, SHA-256, kích thước, link changelog. App tải file này qua `https://raw.githubusercontent.com/0xphuong/autolastz-releases/main/versions.json`. |
| [`CHANGELOG.md`](CHANGELOG.md) | Bản sao changelog của ứng dụng (Keep a Changelog, tiếng Việt). |
| [Releases](https://github.com/0xphuong/autolastz-releases/releases) | Bộ cài `AutoLastZ-Setup-<version>.exe` (Inno Setup, cài cho từng người dùng, không cần quyền admin). |
| [`publish.sh`](publish.sh) | Script phát hành: tạo GitHub Release kèm bộ cài, rồi cập nhật `versions.json` + `CHANGELOG.md`. |

## Tải và cài

Tải bộ cài mới nhất ở trang [Releases](https://github.com/0xphuong/autolastz-releases/releases/latest), chạy
`AutoLastZ-Setup-<version>.exe`. Cài đè lên bản cũ được; `config.json` của bạn được giữ nguyên.

Đang dùng AutoLastZ ≥ 2.10.0: app tự báo bản mới ở dòng vàng cạnh trạng thái — bấm vào là tải và cài (app tự đóng rồi
mở lại). Hoặc bấm *Kiểm tra cập nhật* trong phần Công cụ. Dòng lệnh: `AutoLastZ.exe update --download`.

## `versions.json`

```json
{
  "schema_version": 1,
  "products": {
    "autolastz": {
      "latest": "2.10.0",
      "minimum": "2.7.0",
      "released_at": "2026-10-20",
      "download_url": "https://github.com/0xphuong/autolastz-releases/releases/download/v2.10.0/AutoLastZ-Setup-2.10.0.exe",
      "sha256": "…",
      "size": 61132592,
      "changelog_url": "https://github.com/0xphuong/autolastz-releases/blob/main/CHANGELOG.md#2100--2026-10-20"
    }
  }
}
```

- `latest` > bản đang dùng → app báo có bản mới. `minimum` > bản đang dùng → báo thêm "bản đang dùng không còn được hỗ trợ".
- App chỉ chạy bộ cài khi `sha256` và `size` khớp file tải về.

## Phát hành bản mới (người bảo trì)

Trên máy đã đăng nhập `gh` bằng tài khoản `0xphuong`, sau khi `build\build.ps1` của repo ứng dụng tạo xong
`dist\AutoLastZ-Setup-<version>.exe`:

```bash
./publish.sh 2.10.0 /path/to/AutoLastZ-Setup-2.10.0.exe
```

Script tạo Release `v2.10.0` kèm bộ cài **trước**, rồi mới ghi `versions.json` / `CHANGELOG.md` và push — app không bao
giờ thấy link tải trước khi file tồn tại.
