# Changelog — AutoLastZ

Bản sao changelog của ứng dụng AutoLastZ (bot cho bản PC *Last Z: Survival Shooter*). Bộ cài từng bản ở
[Releases](https://github.com/0xphuong/autolastz-releases/releases); app đọc [`versions.json`](versions.json) để tự cập nhật.

## [2.10.7] — 2026-10-20

### Đổi (giao diện, gói 2 — dễ đọc)
- Chữ gợi ý dưới các ô sáng hơn (đạt tương phản 4,5:1), không còn mờ như trước.
- Tiêu đề mục không IN HOA nữa (chữ hoa có dấu cỡ nhỏ khó đọc), cỡ 9pt, bỏ phần mô tả vị trí icon trong ngoặc
  (*Bệnh viện*, *Nhiệm vụ Radar*, *Kim cương*, *BOSS Cuồng Bạo*, *Telegram*, *Zalo*).
- Gợi ý ở Khủng long, Sự kiện, Radar, Kim cương, Thông báo rút còn một dòng.

## [2.10.6] — 2026-10-20

### Sửa
- 2.10.5 sập ngay khi mở (`bad screen distance "0 10"` — tham số `pady` sai kiểu ở dải thông tin header). Ai đã lỡ cập nhật
  2.10.5 thì tải bộ cài 2.10.6 từ trang Releases và cài đè.

## [2.10.5] — 2026-10-20

### Đổi (giao diện, gói 1b)
- Header xếp lại: hàng trên chỉ còn logo, tên, trạng thái và Start/Stop; **license · lượt giành hòm · lượt đào · dòng cập
  nhật** nằm trên một dải riêng nguyên bề ngang — hết cảnh bộ đếm bị cắt khi trạng thái dài ra lúc đang chạy.
- Tab Kho Báu dùng từ dễ hiểu: chế độ *Đào + giành hòm / Chỉ giành hòm / Chỉ thông báo* (thay *Đào Full / Bỏ Đào / Chỉ
  MayBay*), *Bắt đầu bấm khi còn*, *Bấm thêm sau khi hết giờ*, *Nhịp bấm (ms) min–max* trên một hàng, *Độ lệch điểm bấm*;
  gợi ý rút còn một dòng. Nút *Thử bấm 3 giây*. Mã cửa sổ (0x…) chỉ hiện khi có nhiều cửa sổ game.

## [2.10.4] — 2026-10-20

### Sửa (giao diện, gói 1)
- Bộ đếm trên đầu không còn bị cắt chữ (*spam Kho Báu* · *lượt đào*).
- Ô số không hiện `.0` thừa (15.0 → 15); config cũng lưu số nguyên khi là số nguyên.
- Mọi ô nhập cùng bề rộng, mép phải thẳng hàng.
- Chip chọn tài nguyên (tab Đào): đang chọn = nền màu + ✓, tắt = viền mảnh không nền — nhìn ra ngay cái nào bật.
- Khung Hoạt động không còn dòng tiếng Anh `license state VALID` của thư viện license.

## [2.10.3] — 2026-10-20

### Đổi
- License: tab *Sự kiện* (Bạo Quân Zombie, BOSS Cuồng Bạo) dùng mã tính năng riêng **`event`** trên NexKey, không còn
  đi chung gói *Khủng long*. Gói chưa có `event` thì tab bị khoá và hai việc này bị bỏ qua khi Start (các việc khác vẫn chạy).

## [2.10.2] — 2026-10-20

### Đổi
- Cập nhật: app mở lâu ngày tự kiểm tra bản mới mỗi 24 giờ (`update.check_every_hours`), có bản mới thì hiện dòng vàng
  và ghi log một lần để người dùng bấm cập nhật — không tự cài. Log lúc tải không in link nữa.

## [2.10.1] — 2026-10-20

### Đổi
- Tab mới **Sự kiện** chứa *Bạo Quân Zombie* và *BOSS Cuồng Bạo* (trước nằm trong tab *Khủng long*). Cấu hình chuyển từ
  `dino.zombie` / `dino.boss` sang `events.zombie` / `events.boss`; `config.json` cũ được tự chuyển, không mất cài đặt.
  Hai việc này vẫn thuộc gói license *Khủng long*.

## [2.10.0] — 2026-10-20

### Thêm
- **Kiểm tra cập nhật**: lúc mở app (và nút *Kiểm tra cập nhật* trong Công cụ) bot đọc `versions.json` trên GitHub
  (`0xphuong/autolastz-releases`). Có bản mới thì dòng vàng *⬆ Có bản x.y.z — bấm để cập nhật* hiện cạnh trạng thái; bấm
  vào là tải bộ cài (kiểm tra SHA-256 + kích thước), chạy cài im lặng — app tự đóng, cài xong tự mở lại, `config.json`
  giữ nguyên. Không cập nhật khi bot đang chạy. Tắt kiểm tra tự động bằng `update.enabled: false` trong `config.json`.
- Dòng lệnh: `python -m autolastz update [--download]`.

### Đổi
- Bộ cài: cài im lặng (`/SILENT`) xong cũng mở lại app (trước đây chỉ mở khi cài bằng tay).

## [2.9.4] — 2026-10-20

### Thêm
- Kho Báu **nối tiếp**: nhiều kho báu được chia sẻ sát nhau (hôm 20/10 có các cặp cách nhau 2–5 phút) thì spam xong kho
  báu #1, bot mở chat ngay, bấm thẻ trực thăng mới nhất; còn trực thăng trên bản đồ = kho báu #2 còn sống → báo Telegram /
  Zalo → canh → spam, rồi #3, #4… cho tới khi thẻ mới nhất là kho báu đã xong (lúc đó mới dọn dẹp / kiểm hòm như cũ,
  tốn thêm ~10 giây). Trong lúc canh #1 không bỏ sang #2.

### Sửa
- Thông báo "phát hiện máy bay" được gửi lại cho từng kho báu (trước đây cooldown 10 phút nên kho báu thứ hai không được báo).
- Vào Phase C mà 12 giây không thấy đồng hồ (kho báu đã xong / chưa tới nơi) thì về Phase A ngay thay vì thử mở lại 3 lần
  (~25 giây).

## [2.9.3] — 2026-10-19

### Đổi
- Spam giành hòm, theo dữ liệu đo trên game thật (đồng hồ Kho Báu **không chạy đều** — mỗi đồng minh đào là nó rút bớt
  20–90 giây một cú, vd `02:16 → 01:43 → 01:20` trong 3 giây):
  - Vòng đọc đồng hồ nhanh gấp ~3 (các kiểm tra phụ — mất kết nối, popup mùa giải, kim cương — chỉ chạy 5 vòng một lần),
    nên sau mỗi cú nhảy bot tin số mới sau ~1 giây thay vì ~3 giây.
  - Spam tới **quá mốc 0** một khoảng (*Spam thêm sau mốc 0*, mặc định 10 giây) thay vì thời lượng cố định *Spam trong*
    (trước đây mặc định hết đúng lúc đồng hồ về 0, chỉ còn vài giây bấm sau khi hòm hiện).
  - Đồng hồ biến mất khi còn ≤ 60 giây (popup tự đóng vì đã tới lúc) → spam ngay, không chờ ~20 giây mở lại popup.
- Spam giành hòm: điểm bấm **trôi như bấm tay** thay vì một điểm cố định — mỗi cú lệch một bước nhỏ so với cú trước,
  thỉnh thoảng nhích xa hơn, luôn nằm trong hình tròn bán kính *Bán kính trôi điểm bấm* (ô cũ *Lệch ngẫu nhiên*,
  trước là nhiễu vuông độc lập từng cú) quanh tâm kho báu. Mặc định 20 px; config cũ đang để 0 thì vẫn bấm một điểm —
  chỉnh ở tab Kho Báu.

## [2.9.2] — 2026-10-19

### Sửa
- BOSS Cuồng Bạo — rà soát an toàn sau khi chạy thật:
  - Chỉ bấm *Công* khi tiêu đề popup đúng là *BOSS Cuồng Bạo*. Trước đây bot bấm mù vào giữa màn sau *Đến*; nếu camera
    lệch thì popup căn cứ người chơi / khủng long hoang cũng có nút *Công* và bot có thể đánh nhầm.
  - Kiểm tra khung vàng đã sang đúng xe sau khi bấm chân dung (bấm lại 1 lần); không được thì bỏ lượt thay vì để game gửi
    xe chọn sẵn (xe 1) dù cấu hình chỉ cho phép xe khác.
  - Thêm *Giữ lại thể lực tối thiểu* (mặc định 100): xe công boss về gần như ngay nên bot công lại mỗi 2 phút, trước đây
    chỉ dừng khi dưới 10 thể lực — cạn sạch thể lực của khủng long / zombie. Chạm mức thì nghỉ 10 phút.
  - Sau lượt công, bấm Trụ Sở → Thế Giới đưa camera về căn cứ (boss cách ~230 km, các việc khác chạy ở đó là sai chỗ).
  - Bấm *Đến* trượt thì đóng trang Sự Kiện trước khi quay về (trước đây để trang mở, vòng chính có thể kẹt).
  - Hẹn mở lại trang tối đa 2 giờ (OCR giờ Tận Thế đọc sai không làm lỡ cả mốc 6 giờ).
  - Ô *Xe được dùng* chỉ nhận 1–10; chọn xe không tồn tại thì báo trong log thay vì im lặng.

## [2.9.1] — 2026-10-19

### Sửa
- BOSS Cuồng Bạo: cú bấm vào boss ngay sau *Đến* đôi khi bị game nuốt (camera tới boss nhưng popup không mở, log
  "không thấy nút Công"). Giờ chờ trang sự kiện đóng hẳn rồi mới bấm, và thử bấm boss lại tối đa 4 lần.
- BOSS Cuồng Bạo và Bạo Quân Zombie không còn gửi phím ESC khi một bước thất bại: ESC lúc không có popup làm game hiện
  hộp thoại "Thoát trò chơi". Giờ đóng popup bằng cách bấm ra ngoài như các tính năng khác.

## [2.9.0] — 2026-10-19

### Thêm
- **BOSS Cuồng Bạo** (tab *Khủng long* → mục *BOSS Cuồng Bạo*, mặc định tắt): sự kiện xuất hiện lúc 0h / 6h / 12h /
  18h giờ Tận Thế. Khi có xe rảnh trong số xe được chọn, bot mở *Sự Kiện* (góc trên phải) → tab *BOSS Cuồng Bạo* →
  *Đến* → bấm boss → *Công* → chọn xe → *Hành Quân* (10 thể lực/lần), mỗi xe rảnh được chọn công một lần mỗi lượt. Ô
  *Xe được dùng* (vd `1,3`) để chọn xe, để trống = mọi xe. Chưa có boss (trang không có nút *Đến*) thì đọc *Giờ Tận
  Thế hiện tại* trên trang để mở lại đúng mốc kế tiếp, không mở trang liên tục. Thuộc gói license *Khủng long*.

## [2.8.0] — 2026-10-19

### Thêm
- **Bạo Quân Zombie** (tab *Khủng long* → mục *Bạo Quân Zombie (sự kiện)*, mặc định tắt): khi icon đầu lâu có đồng hồ
  đếm ngược hiện ở cột trái bản đồ thế giới, bot bấm icon (game đưa camera tới boss) → *Tổ Đội* → *Hành Quân*, lặp mỗi
  vòng khi còn xe rảnh cho tới hết sự kiện. Không giới hạn số lần; thất bại thì nghỉ 30 giây rồi thử lại. Thuộc gói
  license *Khủng long* (không thêm mã tính năng mới).

## [2.7.1] — 2026-10-16

### Đổi
- **Giao diện mới**: khung *Hoạt động* (log) nằm ngang ở dưới (~1/4 chiều cao, kéo thanh chia để đổi tỉ lệ); phần cấu
  hình chiếm cả bề ngang phía trên, nội dung tab cuộn được. Cửa sổ hẹp lại (~660 px) để đặt cạnh cửa sổ game.
- Tab không có trong gói license không còn thêm 🔒 vào tên (làm hàng tab tràn, che tab Chữa trị / Radar / Cài đặt):
  chữ tab mờ đi và đầu trang có băng thông báo kèm nút *Nhập / xem license*.

### Sửa
- Radar chỉ làm được **một** nhiệm vụ mỗi loại: nhiều ghim cùng tiêu đề (vd 3 ô *Giúp Đỡ Đồng Minh*, 2 mỏ *Tranh
  Đoạt*) bị coi là đã làm sau ô đầu, bot cứ bấm ghim mà không bấm *Đến* tới khi xong lượt. Giờ đánh dấu theo vị trí
  ghim; thiếu xe / thể lực thì chỉ bỏ loại nhiệm vụ đó. Tối đa 10 nhiệm vụ mỗi lượt mở radar.

## [2.7.0] — 2026-10-16

### Thêm
- **License (NexKey)**: tab *Cài đặt → License* để nhập license key, xem gói, hạn và số cửa sổ được dùng; nút
  *Kiểm tra lại* và *Gỡ khỏi máy này* (trả lại lượt kích hoạt). Góc trên cạnh trạng thái có nhãn license, bấm vào để
  mở tab.
- Gói license quyết định việc được chạy: **Basic** (Kho Báu + thông báo, 1 cửa sổ), **Pro** (thêm Đào, Kim cương,
  Chữa trị, 3 cửa sổ), **Ultimate** (tất cả, 10 cửa sổ). Tab không có trong gói bị đánh dấu khoá. Bấm Start với việc gói không
  có thì việc đó được bỏ qua (ghi log), cấu hình vẫn giữ nguyên.
- Dòng lệnh: `python -m autolastz license [status|activate KEY|refresh|deactivate]`; `run` và `diamond` kiểm tra
  license như nút Start.

### Đổi
- Chưa có license (hoặc license hết hạn / bị tạm ngưng): không chạy bot; các công cụ *Kiểm tra nhận diện*, *Chụp màn
  hình*, *Test spam* vẫn dùng được.
- Mất mạng: bot vẫn chạy theo lần kiểm tra license gần nhất tối đa 10 ngày (3 ngày + 7 ngày gia hạn). Đang chạy mà
  license bị khoá thì bot tự dừng.
- Thêm thư viện `protobuf`, `cryptography` (requirements.txt); SDK NexKey nằm ở `nexkey/` (Apache-2.0).

## [2.6.2] — 2026-10-16

### Sửa
- Kho Báu mùa giải bỏ lỡ lượt cướp khi cú bấm *Công* bị game nuốt ("không mở được popup Hành Quân" dù popup kho báu
  vẫn mở): bấm lại *Công* một lần.
- Thông báo "Kho Báu còn …" sai (vd 01:59:59 khi thật ra còn ~1 phút): hai lần đọc sát nhau một đồng hồ khác đang
  đứng yên vẫn được chốt. Giờ chỉ báo khi đã thấy đồng hồ thật sự đếm lùi.

## [2.6.1] — 2026-10-15

### Thêm
- **Nhận lính chữa xong**: chữa trị xong, icon lính (mũ sắt) hiện cạnh 🔍 — bấm để nhận lính về (lực chiến tăng lại),
  rồi kiểm tra Bệnh Viện ngay để chữa đợt tiếp.

### Sửa
- Popup **Kho Báu mùa giải** bị nhận nhầm là popup Kho Báu trực thăng (cùng có đồng hồ + nút sao / chia sẻ): bot vào
  Phase C, gửi thông báo "Kho Báu còn …" sai và spam vào kho báu mùa giải. Giờ popup có dòng "Lượt Cướp Bóc" được bỏ
  qua và đóng.
- Đóng popup Kho Báu mùa giải bằng phím **ESC** — trước đây bấm lại vào kho báu không đóng mà để popup mở.

## [2.6.0] — 2026-10-15

### Thêm
- **Kho Báu mùa giải** (tab *Kho Báu*): định kỳ tìm thẻ chia sẻ kho báu trong chat liên minh, tới kho báu, **báo
  Telegram / Zalo theo tên** (Lương Thực / Điện / Gỗ / Xu Z) kèm thời gian còn lại và số lượt đã cướp, rồi đi cướp
  (Công → Hành Quân, −8 thể lực) nếu còn lượt trong ngày và còn xe rảnh. Có thể chỉ thông báo, không đi cướp.

## [2.5.1] — 2026-10-15

### Đổi
- Thông báo Kho Báu tách làm **hai tin**: *Phát hiện máy bay Kho Báu* gửi ngay khi bấm trực thăng (trên bản đồ hoặc
  chia sẻ trong chat) để tới vị trí kho báu — mỗi sự kiện một lần; *Kho Báu còn HH:MM:SS* gửi như trước khi đọc được
  đồng hồ.

## [2.5.0] — 2026-10-15

### Thêm
- Thông báo **phát hiện Kho Báu qua Zalo** (Zalo Bot Platform, gửi chữ) bên cạnh Telegram (gửi ảnh): điền bot token +
  chat id ở tab *Cài đặt*; kênh nào có thông tin thì gửi, có cả hai thì gửi cả hai.
- Nút **Gửi thử thông báo** trong tab *Cài đặt*.

### Sửa
- Hàng tab bị tràn (mất tab *Cài đặt*) sau khi thêm tab *Radar*: nới cột cài đặt.
- Săn khủng long không dừng khi hết thể lực mà báo "không mở được popup Tổ Đội" lặp lại mỗi phút: thiếu thể lực thì
  nút *Hành Quân* thành *Bổ sung Nhiên Liệu* (không bao giờ bấm). Giờ đọc thể lực ngay khi popup mở, dưới 16 thì dừng.

## [2.4.0] — 2026-10-15

### Thêm
- **Nhiệm vụ Radar** (tab *Radar*): định kỳ mở radar (icon chảo vệ tinh trên 🔍), bấm **Nhận nhanh**, rồi làm các
  nhiệm vụ còn trống — tranh đoạt tài nguyên (Công → Hành Quân), diệt căn cứ địch (Công, −5 thể lực), đánh khủng long
  (Tổ Đội, −16), giúp đỡ đồng minh (Hỗ trợ, −10). Bật / tắt từng loại; thiếu xe rảnh hoặc thể lực thì bỏ qua.

## [2.3.0] — 2026-10-15

### Thêm
- **Tự nhận thưởng chiến đấu** khủng long (tab *Khủng long*, mặc định bật): khi icon vé *Thưởng Chiến Đấu* hiện bên
  phải nút 🔍, bấm icon → **Nhận nhanh** (nhận tất cả), kể cả sau khi đã đánh đủ số lần.

## [2.2.2] — 2026-10-15

### Sửa
- Săn khủng long hay báo "không mở được bảng 🔍" / "không mở được popup Tổ Đội" khi mạng hoặc game chậm: chờ popup tới
  8 giây, thử mở bảng 🔍 lại một lần, và chờ popup Tổ Đội đóng tới 6 giây sau *Hành Quân* (trước đây popup đóng chậm
  bị tính là thất bại, lượt đó không được đếm nên bot có thể đánh lố).
- Mỗi bước săn khủng long thất bại đều lưu ảnh màn hình vào `debug\dino_*.png` (tự xoá sau 24 giờ) để xem nguyên nhân.

## [2.2.1] — 2026-10-15

### Thêm
- Săn được cả **Khủng Long Nhanh** (ô trái) lẫn **Khủng Long Kiếm** (ô phải): mỗi loại bật / cấp / số lần riêng, bật
  cả hai thì đánh xen kẽ. Cấu hình 2.2.0 tự chuyển sang Khủng Long Kiếm.

### Sửa
- Bấm nhầm Khủng Long Nhanh khi cài Khủng Long Kiếm (báo "không chỉnh được cấp Lv45"): ảnh mẫu cũ chứa dòng "Khủng
  Long" giống nhau ở cả hai ô. Giờ nhận ra theo dòng chữ *Nhanh* / *Kiếm* và kiểm tra lại tiêu đề popup sau khi Tìm.
- Chỉnh cấp không bỏ cuộc khi đọc chữ `LvN` hụt lúc thanh trượt đang chạy hiệu ứng.

## [2.2.0] — 2026-10-15

### Thêm
- **Săn Khủng Long Kiếm** (tab *Khủng long*): qua 🔍 chọn Khủng Long Kiếm, đặt cấp (1–60), Tìm → *Tổ Đội* →
  *Hành Quân* bằng xe rảnh bất kỳ. Đủ **số lần đánh** (mặc định 15) thì ngừng; hết thể lực (16/lần) thì dừng. Bộ đếm
  lưu ở `dino_state.json`, đặt lại mỗi lần Start.

## [2.1.3] — 2026-10-15

### Sửa
- Không tự chữa trị khi game thêm icon khác (vd vé sự kiện) cạnh nút 🔍 làm icon chữ thập bị đẩy sang phải: mở rộng
  vùng tìm ra cả dải icon bên trái, thêm ảnh mẫu icon không lấp lánh.

## [2.1.2] — 2026-10-15

### Sửa
- **Bot "mù" sau vài phút chạy** (bỏ lỡ Kho Báu): cách chụp FramePool trả mãi một khung hình cũ khi Windows ngừng vẽ
  màn hình (RDP thu nhỏ / ngắt) — bot tưởng vẫn ở bản đồ thế giới, mỗi lần làm mới góc nhìn chỉ bấm Trụ Sở rồi kẹt ở
  căn cứ. Đổi mặc định sang **PrintWindow**.
- Tự phát hiện ảnh chụp đóng băng (không đổi 2 phút) và **tự kết nối lại** cửa sổ game; phiên dừng bất thường vì lỗi
  khác cũng tự chạy lại sau 10 giây.

## [2.1.1] — 2026-10-15

### Đổi
- Log và ảnh trong `debug\` chỉ giữ **24 giờ**: `autolastz.log` xoay vòng mỗi giờ (24 bản); bản sao `maafw.bak.*`
  và ảnh `khobau_*` / `shot_*` cũ hơn 24 giờ tự xoá (khi mở app và mỗi giờ).
- Bỏ nút *Mở thư mục log* trên giao diện.

## [2.1.0] — 2026-10-15

### Thêm
- **Tự động chữa trị thương binh** (tab *Chữa trị*): định kỳ xem icon chữ thập cạnh 🔍; Bệnh Viện rảnh thì bấm
  *Chữa Trị*, đang chữa thì bỏ qua. Không bao giờ bấm *Hoàn thành ngay* (💎) hay *Tăng Tốc*.
- **Tự xin trợ giúp liên minh** cho lượt chữa (icon có bắt tay → "Đã yêu cầu hỗ trợ từ tất cả Đồng Minh").

### Sửa
- Bộ cài tự tắt `AutoLastZ.exe` trước khi cài đè / gỡ — trước đây cài đè lúc app đang mở thất bại (mã 5).
- Dòng ghi chú trong giao diện tự xuống dòng thay vì bị cắt.

### Đổi
- Tab *Đào tài nguyên* rút gọn thành *Đào* để vừa 4 tab.

## 2.0.0 — 2026-10-14

Viết lại toàn bộ Zomobots / AutoLastZ 1.x (mất mã nguồn) trên [MaaFramework](https://github.com/MaaXYZ/MaaFramework)
cho Last Z bản PC. Không còn inject DLL vào game: chụp nền + click bằng Win32 message (`SendMessageWithCursorPos`).

### Thêm
- **Săn Kho Báu** (trực thăng): Phase A tìm trực thăng (bản đồ / chat liên minh), Phase B đào (Kính lúp → Hành Quân →
  Xác nhận), Phase C OCR đồng hồ đếm ngược và spam-click giành hòm. Chế độ *Đào Full*, *Bỏ Đào*, *Chỉ MayBay*.
- **Đào tài nguyên** qua nút 🔍: Gỗ, Lương thực, Điện, Xu Z — cấp từ cao xuống thấp, chỉ đào mỏ trống, xoay vòng loại.
- **Đào Kim cương**: zoom ra bản đồ chiến lược, quét xoắn ốc quanh căn cứ tìm mỏ trắng (trống), lọc theo cấp tối thiểu
  và bán kính km (tính từ toạ độ popup).
- **Số xe đi đào**: chỉ dùng N xe dưới cùng, xe trên cùng để dự phòng cho Kho Báu / việc khác.
- **Telegram**: gửi ảnh khi phát hiện Kho Báu (kèm thời gian còn lại).
- Giao diện tkinter tối kiểu Windows 11: thanh trạng thái, bộ đếm, tab cấu hình, log màu theo loại việc.
- Logo, bộ cài Inno Setup (cài cho user, không cần Admin), script build `build/build.ps1`.
- Lệnh dòng lệnh: `list`, `screenshot`, `check`, `tap`, `click`, `swipe`, `scroll`, `test-spam`, `diamond --dry-run`, `run`.

### Bỏ (so với 1.x)
- Hook DLL `LastZHook.dll`, license, auto-update, Sandboxie, xem / điều khiển từ xa.

[2.7.1]: https://github.com/0xphuong/autolastz/compare/v2.6.2...v2.7.1
[2.6.2]: https://github.com/0xphuong/autolastz/compare/v2.6.1...v2.6.2
[2.6.1]: https://github.com/0xphuong/autolastz/compare/v2.6.0...v2.6.1
[2.6.0]: https://github.com/0xphuong/autolastz/compare/v2.5.1...v2.6.0
[2.5.1]: https://github.com/0xphuong/autolastz/compare/v2.5.0...v2.5.1
[2.5.0]: https://github.com/0xphuong/autolastz/compare/v2.4.0...v2.5.0
[2.4.0]: https://github.com/0xphuong/autolastz/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/0xphuong/autolastz/compare/v2.2.2...v2.3.0
[2.2.2]: https://github.com/0xphuong/autolastz/compare/v2.2.1...v2.2.2
[2.2.1]: https://github.com/0xphuong/autolastz/compare/v2.2.0...v2.2.1
[2.2.0]: https://github.com/0xphuong/autolastz/compare/v2.1.3...v2.2.0
[2.1.3]: https://github.com/0xphuong/autolastz/compare/v2.1.2...v2.1.3
[2.1.2]: https://github.com/0xphuong/autolastz/compare/v2.1.1...v2.1.2
[2.1.1]: https://github.com/0xphuong/autolastz/compare/v2.1.0...v2.1.1
[2.1.0]: https://github.com/0xphuong/autolastz/releases/tag/v2.1.0
