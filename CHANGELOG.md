# Changelog — AutoLastZ

Bản sao changelog của ứng dụng AutoLastZ (bot cho bản PC *Last Z: Survival Shooter*). Bộ cài từng bản ở
[Releases](https://github.com/0xphuong/autolastz-releases/releases); app đọc [`versions.json`](versions.json) để tự cập nhật.

## [2.15.0] — 2026-10-22

### Thêm
- Kho Báu: **biết có cướp được hòm hay không.** Sau khi spam, bot mở chat Liên Minh, bấm thẻ *"… đã được khám phá
  xong!"* mới nhất (bỏ qua thẻ *"thưởng gấp đôi"*) và xem danh sách Chi Tiết: dòng của mình nền xanh (ở vị trí nào cũng
  được) = cướp được. Thẻ bị tin mới đẩy lên thì cuộn chat lên tìm (tối đa 3 lần). Cướp được thì gửi tin *Nhắn chat liên minh* (nếu có nhập) vào chat Liên Minh trong game; kết quả
  ghi vào log và ảnh `khobau_won` / `khobau_lost`, không gửi Telegram / Zalo.
- Tab **Mùa Giải**: thêm **Zombie** (đánh một mình, nút *Công*, ~9 thể lực Lv1) và **Zombie Khổng Lồ** (*Tổ Đội*,
  ~19 thể lực Lv6), mỗi loại có Bật / Cấp / Số lần đánh như khủng long, đánh xen kẽ với khủng long. Thể lực không đủ cho
  một loại thì chỉ dừng loại đó; không đủ cho loại rẻ nhất thì dừng cả tab.

### Đổi
- Ảnh debug (`debug/*.png` khi một bước thất bại, ảnh sau mỗi lần spam) chỉ lưu khi license có tính năng
  **`development`** (cấp cho người test trên portal NexKey); bản cho khách không ghi ảnh màn hình game nữa. Log chữ vẫn
  ghi như cũ. Chạy từ mã nguồn thì luôn lưu.
- Tab *Khủng long* đổi tên thành **Mùa Giải**; tiêu đề mục bỏ chú thích "(ô trái)" / "(ô phải)". Cấu hình và mã license
  giữ nguyên (`dino`).

### Sửa
- **Kho báu xen ngang việc phụ:** đang đào / kim cương / radar / mùa giải / lì xì… mà thấy ghim máy bay thì bỏ dở ngay
  (kiểm tra mỗi 2 s trong lúc làm), dọn màn về bản đồ rồi đi kho báu — trước đây phải chờ việc phụ xong (kim cương ~1
  phút), ghim bị tin chat mới che mất là lỡ kho báu.
- Mùa Giải thiếu thể lực: **nghỉ 10 phút rồi thử lại** (chỉ nghỉ loại đắt nếu còn đủ cho loại rẻ hơn), không dừng hẳn
  tới lần Start sau nữa.
- Vừa Start, các việc phụ không còn dồn liền nhau: lần đầu chạy cách nhau 15 s theo thứ tự ưu tiên.
- Bấm Stop: chỉ báo "Đã dừng" (và cho Start lại) khi vòng bot đã thoát hẳn — trước đây bot còn bấm thêm 2–3 s sau đó,
  Start ngay có thể chạy chồng hai vòng.
- Kho báu của **liên minh khác**: bấm trực thăng thì game báo *"Một kho báu thuộc Liên Minh khác đang được khám phá"*
  (không có Kính lúp / đồng hồ) nhưng bot vẫn báo Telegram rồi thử đào + mở đồng hồ mỗi phút (22/10 15:46). Giờ nhận ra
  popup này, đóng lại (ESC), không báo, và chỉ bỏ qua đúng trực thăng đó (cùng chỗ trên màn) trong 1 phút rồi kiểm tra lại; trực thăng ở
  chỗ khác và kho báu chia sẻ trong chat vẫn được bấm ngay.
- Kho Báu bị bỏ lỡ khi đang đánh Zombie Khổng Lồ (22/10 15:28): bấm thẻ trực thăng trong chat xong, camera còn đang bay
  tới nơi, 3 s sau chưa thấy trực thăng nên bot đi làm việc phụ. Giờ chờ trực thăng hiện tối đa 8 s; chưa thấy thì giữ
  ưu tiên kho báu 90 s — không làm việc phụ nào (Mùa Giải, đào, radar…), cứ 20 s mở chat bấm lại thẻ trực thăng mới nhất.
- Nguyên nhân gốc của báo nhầm *"kho báu kế tiếp"*: hình trực thăng trên thẻ *"đã được khám phá xong"* trong chat khớp
  mẫu trực thăng bản đồ (0.90), nên bot tưởng kho báu đã xong vẫn còn sống và bấm vào thẻ. Giờ trực thăng chỉ được tính
  khi không đứng trong màn chat.
- Nhắn chat có thể vào nhầm kênh: mẫu tab *Liên Minh* / *Trò chuyện* là giao diện tiếng Anh cũ ("Alliance" / "Chat")
  nên không bao giờ khớp, bot gõ vào tab đang mở sẵn (có thể là *Thế Giới*). Giờ bấm tab theo vị trí rồi kiểm tra đúng
  *Liên Minh → Trò chuyện* đang được chọn mới gõ; không chắc thì không gửi (lưu ảnh `chat_tab`).
- *Gửi thử* báo "đã gửi" nhưng không có gì được gửi: chữ chưa vào ô nhập (ô vẫn "Nhấn để nhập văn bản"). Giờ bot chỉ
  bấm thanh chat khi chat chưa mở, bấm ô nhập rồi gõ, kiểm tra nút gửi (máy bay giấy) đã hiện mới bấm gửi, và chỉ ghi
  "đã gửi" khi nút đó biến mất; thử lại một lần nếu chưa gõ được.
- Tiếng Việt có dấu bị thành "?" ("Chúc mừng ạ" → "Chúc m?ng ?"): gõ bằng ký tự Unicode thay vì mã ANSI.

## [2.14.0] — 2026-10-21

### Thêm
- **Lì xì Liên Minh** (tab *Sự kiện*, mã license `event`): thấy ghim bao lì xì đỏ ở góc dưới-phải bản đồ → mở chat →
  bấm icon lì xì đầu khung chat (có số chưa nhận) → *Lịch sử Lì Xì* → *Nhận* từng thẻ → *Nhận* trên bao lì xì → *Xác nhận*
  (KC cộng thẳng vào tài khoản) → *Quay lại*. Danh sách tự đóng sau mỗi lần nhận nên bot mở lại icon cho cái kế tiếp.
  Ghim bị tin chat mới hơn che mất nên ngoài ghim còn mở chat kiểm tra định kỳ (*Mở chat kiểm tra mỗi*, mặc định 900 s,
  0 = chỉ khi thấy ghim).

## [2.13.2] — 2026-10-21

### Sửa
- Kho Báu: sau khi giành hòm, bot mở chat bấm thẻ trực thăng mới nhất để xem có kho báu kế tiếp — nhưng trực thăng của
  kho báu vừa xong còn hiện trên bản đồ vài phút nên bị coi là kho báu mới và báo nhầm *"Phát hiện máy bay (kho báu kế
  tiếp)"* (21/10 16:38), rồi Phase A lại bấm trực thăng cũ nhiều lần. Giờ sau spam, thông báo "phát hiện máy bay" chỉ gửi
  khi Phase C đọc được đồng hồ (kho báu mới thật), và trong `after_spam_ignore_sec` (120 s) Phase A bỏ qua trực thăng /
  thẻ chat cũ.

## [2.13.1] — 2026-10-21

### Sửa
- Kim cương: nhận ra bản đồ chiến lược cả khi bảng chú giải góc trái bị ẩn (thêm mẫu nút *Mô tả* dưới minimap) —
  21/10 15:19–15:33 bot zoom được nhưng tưởng thất bại, mỗi phút mất 15 s rồi bỏ.
- Kim cương: toạ độ căn cứ đọc sai (OCR trả X=42 Y=50) làm mọi mỏ bị coi là quá xa — giờ kiểm tra hợp lý khi đọc và
  tự phát hiện sai khi khoảng cách theo toạ độ lệch > 80 km so với ước tính pixel, đọc lại lượt sau.
- Kẹt ở màn lạ (vd radar còn mở sau Stop/Start): sau khi bấm ra ngoài thử *Quay lại* / *Đóng* ngay, không đợi lượt sau
  (trước mất ~3 phút mới thoát).

## [2.13.0] — 2026-10-21

### Thêm
- Kho Báu → mục *Khi cướp được*: ô **Nhắn chat liên minh** (nội dung nhập sẵn) + nút **Gửi thử** (mở chat → Liên Minh →
  gõ → Enter → quay lại; lưu ảnh `chat_typed` / `chat_sent` trong `debug/` để đối chiếu). Điều kiện "cướp được" chưa
  có cách nhận biết nên tin chỉ gửi khi bước này được bổ sung (đang chờ dấu hiệu từ người dùng).

## [2.12.4] — 2026-10-21

### Sửa
- Kim cương: bấm nhầm icon trắng không phải mỏ (vd nhà người chơi) rồi **lăn chuột thêm làm game văng ra bản đồ lãnh
  thổ** (21/10 09:02 và 09:07). Giờ: bỏ icon sát mép màn (bị HUD che), không bấm lại icon đã thử trong lượt, bấm xong mà
  vẫn ở bản đồ chiến lược thì **không lăn chuột**, không zoom được thì về căn cứ thay vì bỏ game ở zoom xa; đóng bảng 🔍
  chắc chắn trước khi lăn; lưu ảnh `diamond_popup` / `diamond_zoom` / `diamond_lost` để chỉnh mẫu nhận diện.

## [2.12.3] — 2026-10-21

### Sửa
- Bot kẹt 15 phút ở popup *Hành Quân* sau khi gửi xe đào Kim cương (21/10 06:37): cú bấm *Hành Quân* không ăn nhưng bot
  vẫn báo "đã gửi đội" và không ai đóng popup (nó không có nút X), HUD bị che nên không việc nào chạy. Giờ Đào và Kim
  cương **chờ popup đóng** mới tính là đã gửi; không đóng thì bấm ra ngoài, bỏ qua lượt, lưu ảnh `gather_march` /
  `diamond_march`. Vòng lặp chính thấy popup xuất quân còn mở thì bấm ra ngoài; làm mới góc nhìn mà vẫn không thấy
  Trụ Sở / Thế Giới thì bấm ra ngoài và lưu ảnh `stuck_view_*.png` (tối đa 10 phút/lần).
- Đào chỉ chạy khi thấy nút 🔍 (bản đồ thế giới thường) — trước gate bằng nút Trụ Sở, nút này có cả ở bản đồ chiến lược
  nên bot đọc nhầm số xe ở đó ("không đọc được số xe — thử 1 lượt").

## [2.12.2] — 2026-10-21

### Sửa
- Kho Báu: ảnh mẫu nút *Kính lúp* có dính dòng chữ "Thám Dò" bên dưới nên điểm bấm lệch xuống dưới nút — đã cắt bỏ, bấm
  đúng tâm nút.

## [2.12.1] — 2026-10-21

### Sửa
- Kho Báu: sau khi đội đi đào, bấm đúng tâm trực thăng chỉ mở popup đội (marker đội đè lên) nên không ra đồng hồ —
  giờ thử thêm 3 điểm khác trên thân máy bay, đóng popup lạ giữa các lần; không được thì lưu ảnh `khobau_noclock_*.png`.
- Kho Báu (Đào + giành hòm): game không còn hỏi *Xác nhận* sau *Hành Quân* — không log nhầm "bỏ qua bước đào" nữa.
- Mở chat (kho báu kế tiếp, kiểm tra hòm): bấm đúng thanh chat (y≈915) — trước bấm hụt phía trên nên "không mở được chat".

## [2.12.0] — 2026-10-20

### Đổi
- Tính năng ngoài gói license **vẫn hiện nhưng khoá**: mọi công tắc, ô nhập, chip, nút chọn chế độ trong mục đó chuyển
  xám và không bấm được (trước chỉ mờ tên tab, bên trong vẫn chỉnh được dù không chạy). Khoá theo đúng mã tính năng:
  thiếu `diamond` thì chỉ khoá mục Kim cương, thiếu `season` chỉ khoá Kho Báu mùa giải…
- Dòng *Sẽ chạy* và chấm tab chỉ tính việc gói cho phép, trùng với những gì Start thực sự chạy.
- Đổi license lúc đang mở app (nhập key, *Kiểm tra lại*, đổi gói trên portal) → khoá/mở lại ngay.

## [2.11.0] — 2026-10-20

### Thêm (giao diện, gói 3)
- Dòng **Sẽ chạy: …** ngay dưới hàng tab và **chấm màu trên tên tab** có việc đang bật — nhìn ra bot sẽ làm gì khi Start
  mà không phải bấm qua từng tab; đổi ngay khi gạt công tắc, chưa cần lưu.
- Bộ đếm đủ các việc trên dải thông tin: Giành hòm · Đào · Tổ đội (khủng long, zombie) · Boss · Radar.
- Có bản mới: **băng vàng** nguyên bề ngang dưới dải thông tin với nút *Cập nhật* (thay dòng chữ nhỏ dễ tràn).

### Đổi
- *Cửa sổ game* gọn thành một hàng (tên mục, công tắc từng cửa sổ, nút ⟳) — trả chỗ cho nội dung tab.
- Tab *Sự kiện* có màu cam riêng (trước trùng vàng với Kho Báu).

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
