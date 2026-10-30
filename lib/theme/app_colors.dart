import 'package:flutter/material.dart';

/// Bảng màu giao diện theo Design System EduPath (13 màu chính thức)
class AppColors {
  AppColors._();

  // 1. Màu chính (#118646): Nút chính, tab đang chọn, liên kết, icon nhấn
  static const Color primary = Color(0xFF118646);

  // 2. Xanh nhấn tươi (#22C55E): Thanh tiến độ, huy hiệu, minh họa
  static const Color primaryAccent = Color(0xFF22C55E);

  // 3. Xanh nhạt (#EAF8EF): Nền thẻ nổi bật, ghi nhớ, minh họa
  static const Color primaryLight = Color(0xFFEAF8EF);

  // 4. Nền ứng dụng (#F6FBF7): Nền toàn màn hình
  static const Color background = Color(0xFFF6FBF7);

  // 5. Nền thẻ (#FFFFFF): Thẻ, biểu mẫu, hộp thoại
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  // 6. Chữ chính (#14261C): Tiêu đề, nội dung
  static const Color textPrimary = Color(0xFF14261C);

  // 7. Chữ phụ (#5B6B62): Mô tả, thông tin phụ
  static const Color textSecondary = Color(0xFF5B6B62);

  // 8. Viền trang trí (#D9E5DD): Đường phân cách, viền thẻ
  static const Color border = Color(0xFFD9E5DD);

  // 9. Viền ô nhập liệu (#7C8C82): Viền ô nhập, hộp chọn, radio
  static const Color inputBorder = Color(0xFF7C8C82);

  // 10. Thành công (#15803D): Đáp án đúng, hoàn thành
  static const Color success = Color(0xFF15803D);

  // 11. Cảnh báo (#B45309): Sắp đến hạn, đồng hồ dưới 5 phút
  static const Color warning = Color(0xFFB45309);

  // 12. Lỗi (#D92D20): Lỗi nhập liệu, đáp án sai, thao tác xóa
  static const Color error = Color(0xFFD92D20);

  // 13. Thông tin (#2563EB): Thông báo, số liệu tham khảo
  static const Color info = Color(0xFF2563EB);

  // Bổ trợ theo quy tắc áp dụng màu và linh kiện mẫu:
  // - "Không dùng chữ trắng trên #22C55E; dùng #0B2A17 theo tài liệu"
  static const Color textOnAccent = Color(0xFF0B2A17);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Nền nhạt cho cảnh báo, lỗi và thông tin (chips, notification banner)
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color infoLight = Color(0xFFEFF6FF);
}
