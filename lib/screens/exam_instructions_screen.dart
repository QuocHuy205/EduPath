import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/image_slot.dart';
import 'exam_room_screen.dart';

/// Màn 53 – Hướng dẫn làm bài
class ExamInstructionsScreen extends StatelessWidget {
  final String subjectTitle;
  final String examTitle;

  const ExamInstructionsScreen({
    super.key,
    this.subjectTitle = 'Toán cao cấp',
    this.examTitle = 'Toán cao cấp - Khóa K46',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(
                left: AppTheme.space4,
                right: AppTheme.space16,
                top: AppTheme.space8,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Hướng dẫn làm bài',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space12),

                    // Top Illustration
                    const Center(
                      child: ImageSlot(
                        assetPath: 'assets/images/banner_exam_instruction.png',
                        width: double.infinity,
                        height: 190,
                        borderRadius: 16,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Section: Thông số phòng thi chuẩn hóa
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline_rounded, // TODO: thay icon Figma
                          color: AppColors.primary,
                          size: 18,
                        ),
                        const SizedBox(width: AppTheme.space8),
                        Text(
                          'Thông số phòng thi chuẩn hóa',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // 4 Parameter Cards (2x2)
                    Row(
                      children: [
                        Expanded(
                          child: _buildParameterCard(
                            label: 'THỜI GIAN',
                            value: '60 phút',
                            desc: 'Đếm ngược liên tục, không tạm dừng',
                            icon: Icons.access_time_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildParameterCard(
                            label: 'SỐ LƯỢNG',
                            value: '50 câu',
                            desc: 'Trắc nghiệm 4 lựa chọn (A, B, C, D)',
                            icon: Icons.format_list_bulleted_rounded,
                            iconBg: const Color(0xFFE0E7FF),
                            iconColor: const Color(0xFF4338CA),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildParameterCard(
                            label: 'TÍNH ĐIỂM',
                            value: '+0.2 đ',
                            desc: 'Mỗi câu đúng, không trừ điểm câu sai',
                            icon: Icons.star_outline_rounded,
                            iconBg: const Color(0xFFFEF3C7),
                            iconColor: const Color(0xFFD97706),
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildParameterCard(
                            label: 'NỘP BÀI',
                            value: '≥ 30 phút',
                            desc: 'Được nộp bài sớm sau nửa thời gian',
                            icon: Icons.check_circle_outline_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Card: Lưu ý & Quy chế giám sát
                    Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF8EB),
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(
                          color: const Color(0xFFFDE68A),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.warning_amber_rounded, // TODO: thay icon Figma
                                color: Color(0xFFB45309),
                                size: 18,
                              ),
                              const SizedBox(width: AppTheme.space8),
                              Text(
                                'Lưu ý & Quy chế giám sát',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF92400E),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            '• Đảm bảo kết nối Internet liên tục; hệ thống tự động lưu đáp án sau mỗi lần chọn.\n'
                            '• Không chuyển tab hoặc thoát ứng dụng quá 3 lần; bài thi sẽ tự động khóa nộp.\n'
                            '• Khi hết 60 phút, hệ thống tự động đóng quyền làm bài và ghi nhận điểm.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textPrimary,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space32),
                  ],
                ),
              ),
            ),

            // Bottom CTA
            Container(
              padding: const EdgeInsets.all(AppTheme.space16),
              decoration: const BoxDecoration(
                color: AppColors.cardBackground,
                border: Border(
                  top: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        AppSlideRoute(
                          page: ExamRoomScreen(
                            subjectTitle: subjectTitle,
                            examTitle: examTitle,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusButton,
                        ),
                      ),
                    ),
                    child: Text(
                      'Tôi đã hiểu · Bắt đầu',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParameterCard({
    required String label,
    required String value,
    required String desc,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 16),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.space8),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.space4),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
