import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/image_slot.dart';
import 'exam_result_screen.dart';

/// Màn 55 – Nộp bài thi
class SubmitExamScreen extends StatelessWidget {
  final String subjectTitle;
  final String examTitle;
  final int answeredCount;
  final int unansweredCount;
  final String remainingTime;

  const SubmitExamScreen({
    super.key,
    this.subjectTitle = 'Toán cao cấp',
    this.examTitle = 'Toán cao cấp - Khóa K46',
    this.answeredCount = 48,
    this.unansweredCount = 2,
    this.remainingTime = '00:25:28',
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
                      'Nộp bài',
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
                  children: [
                    const SizedBox(height: AppTheme.space12),

                    // Illustration & Summary Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      ),
                      child: Column(
                        children: [
                          const Center(
                            child: ImageSlot(
                              assetPath: 'assets/images/banner_student.png',
                              width: 130,
                              height: 130,
                              borderRadius: 16,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space12),
                          Text(
                            'Bạn đã hoàn thành bài thi!',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Hãy kiểm tra lại thống kê làm bài cẩn thận trước khi gửi bài chấm điểm tự động nhé.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppTheme.space16),

                          // Timer pill
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.space16,
                              vertical: AppTheme.space8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.alarm_rounded, // TODO: thay icon Figma
                                      color: AppColors.primary,
                                      size: 18,
                                    ),
                                    const SizedBox(width: AppTheme.space8),
                                    Text(
                                      'Thời gian còn lại:',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  remainingTime,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // 2 Stats Cards (Đã trả lời / Chưa làm)
                    Row(
                      children: [
                        // Đã trả lời
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(AppTheme.space16),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check_rounded, // TODO: thay icon Figma
                                    color: AppColors.textWhite,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: AppTheme.space12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ĐÃ TRẢ LỜI',
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: AppTheme.space4),
                                      Row(
                                        children: [
                                          Text(
                                            '$answeredCount câu',
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '96%',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),

                        // Chưa làm
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(AppTheme.space16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF3B82F6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.radio_button_unchecked_rounded, // TODO: thay icon Figma
                                      color: AppColors.textWhite,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppTheme.space12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CHƯA LÀM',
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: AppTheme.space4),
                                      Row(
                                        children: [
                                          Text(
                                            '0$unansweredCount câu',
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '4%',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF3B82F6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Card: Lưu ý quan trọng
                    Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(
                          color: const Color(0xFFFECACA),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.warning_amber_rounded, // TODO: thay icon Figma
                            color: Color(0xFFDC2626),
                            size: 20,
                          ),
                          const SizedBox(width: AppTheme.space12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lưu ý quan trọng',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF991B1B),
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space4),
                                Text(
                                  'Sau khi nộp bài, hệ thống sẽ tự động khóa và tính điểm ngay lập tức. Bạn không thể thay đổi đáp án.',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                    height: 1.4,
                                  ),
                                ),
                              ],
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

            // Bottom 2 Buttons
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
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            AppSlideRoute(
                              page: ExamResultScreen(
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
                          'Xác nhận nộp bài',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryLight,
                          foregroundColor: AppColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.radiusButton,
                            ),
                          ),
                        ),
                        child: Text(
                          'Quay lại làm bài',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
