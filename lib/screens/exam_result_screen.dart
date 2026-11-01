import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'exam_detail_screen.dart';

/// Màn 56 – Kết quả bài thi thử
class ExamResultScreen extends StatelessWidget {
  final String subjectTitle;
  final String examTitle;
  final double score;
  final int correctCount;
  final int incorrectCount;
  final int skippedCount;
  final String duration;

  const ExamResultScreen({
    super.key,
    this.subjectTitle = 'Toán cao cấp',
    this.examTitle = 'Toán cao cấp - Khóa K46',
    this.score = 8.5,
    this.correctCount = 42,
    this.incorrectCount = 6,
    this.skippedCount = 2,
    this.duration = '52:18',
  });

  void _returnToExamDetail(BuildContext context) {
    final nav = Navigator.of(context);
    bool hasExamDetail = false;
    nav.popUntil((route) {
      if (route.settings.name == ExamDetailScreen.routeName) {
        hasExamDetail = true;
        return true;
      }
      if (route.settings.name == '/dev_menu' || route.isFirst) {
        return true;
      }
      return false;
    });
    if (!hasExamDetail) {
      nav.push(
        AppSlideRoute(
          settings: const RouteSettings(name: ExamDetailScreen.routeName),
          page: ExamDetailScreen(
            subjectTitle: subjectTitle,
            examTitle: examTitle,
          ),
        ),
      );
    }
  }

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
                    onPressed: () => _returnToExamDetail(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Kết quả bài thi',
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
                    const SizedBox(height: AppTheme.space16),

                    // Score Banner Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left: Score
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$score / 10',
                              style: GoogleFonts.inter(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: AppTheme.space4),
                            Container(
                              width: 80,
                              height: 3,
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),

                        // Right: Trophy Badge
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFFDE68A),
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEF3C7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.emoji_events_rounded, // TODO: thay icon Figma
                                color: Color(0xFFD97706),
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Headline & Exam Title
                    Text(
                      'Tuyệt vời! Bạn đã làm rất tốt.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space4),
                    Text(
                      'Đề thi: $examTitle',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // 4 Stats Cards (2x2 grid)
                    Row(
                      children: [
                        // Số câu đúng
                        Expanded(
                          child: _buildMetricCard(
                            title: 'Số câu đúng',
                            value: '$correctCount',
                            extra: '+8.4 đ',
                            subtitle: '84.0% câu trả lời',
                            borderColor: AppColors.primary,
                            icon: Icons.check_circle_outline_rounded,
                            iconColor: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),

                        // Số câu sai
                        Expanded(
                          child: _buildMetricCard(
                            title: 'Số câu sai',
                            value: '0$incorrectCount',
                            extra: 'câu',
                            subtitle: 'Cần chú ý ôn lại',
                            borderColor: AppColors.error,
                            icon: Icons.cancel_outlined,
                            iconColor: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Row(
                      children: [
                        // Bỏ qua
                        Expanded(
                          child: _buildMetricCard(
                            title: 'Bỏ qua',
                            value: '0$skippedCount',
                            extra: 'câu',
                            subtitle: 'Chưa chọn đáp án',
                            borderColor: AppColors.border,
                            icon: Icons.remove_circle_outline_rounded,
                            iconColor: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),

                        // Thời gian làm
                        Expanded(
                          child: _buildMetricCard(
                            title: 'Thời gian làm',
                            value: duration,
                            extra: '/ 60p',
                            subtitle: 'Nộp sớm 7 phút',
                            borderColor: const Color(0xFF3B82F6),
                            icon: Icons.access_time_rounded,
                            iconColor: const Color(0xFF3B82F6),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Card: Thời gian hoàn thành
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thời gian hoàn thành',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            '00:52:18',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space12),

                    // Card: Xếp hạng
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xếp hạng',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Top 15% bài thi',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
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

            // Bottom Buttons
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Xem phân tích chi tiết bài thi (giả lập)')),
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
                          'Phân tích chi tiết',
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
                        onPressed: () => _returnToExamDetail(context),
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
                          'Làm lại đề này',
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

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String extra,
    required String subtitle,
    required Color borderColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border(
          left: BorderSide(color: borderColor, width: 3),
          top: const BorderSide(color: AppColors.border, width: 1),
          right: const BorderSide(color: AppColors.border, width: 1),
          bottom: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              Icon(icon, color: iconColor, size: 16),
            ],
          ),
          const SizedBox(height: AppTheme.space8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                extra,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: borderColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.space4),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
