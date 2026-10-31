import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/image_slot.dart';
import 'lecture_video_screen.dart';
import 'quiz_screen.dart';

/// Màn 35 – Kết quả bài kiểm tra
class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

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
                      'Kết quả bài kiểm tra',
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
                    const SizedBox(height: AppTheme.space16),

                    // Illustration / Badge (using ImageSlot without creating fake images)
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: ImageSlot(
                                assetPath: 'assets/images/quiz_result_badge.png',
                                width: 110,
                                height: 110,
                                borderRadius: 55,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Headline
                    Text(
                      'Hoàn thành bài kiểm tra!',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTheme.space8),
                    Text(
                      'Bạn đã trả lời đúng 8/10 câu',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // 3 Stats Cards
                    Row(
                      children: [
                        // Câu đúng
                        Expanded(
                          child: _buildResultStatCard(
                            bg: const Color(0xFFEAF8EF),
                            icon: Icons.check_rounded, // TODO: thay icon Figma
                            iconBg: AppColors.primary,
                            iconColor: AppColors.textWhite,
                            value: '8',
                            valueColor: AppColors.primary,
                            label: 'Câu đúng',
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        // Câu sai
                        Expanded(
                          child: _buildResultStatCard(
                            bg: const Color(0xFFFDE8E8),
                            icon: Icons.close_rounded, // TODO: thay icon Figma
                            iconBg: AppColors.error,
                            iconColor: AppColors.textWhite,
                            value: '2',
                            valueColor: AppColors.error,
                            label: 'Câu sai',
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        // Kết quả
                        Expanded(
                          child: _buildResultStatCard(
                            bg: const Color(0xFFEFF6FF),
                            icon: Icons.emoji_events_rounded, // TODO: thay icon Figma
                            iconBg: AppColors.warning,
                            iconColor: AppColors.textWhite,
                            value: '85%',
                            valueColor: const Color(0xFF0D9488),
                            label: 'Kết quả',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // 2 Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Xem đáp án chi tiết (giả lập)')),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.radiusButton,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Xem đáp án',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
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
                                'Làm lại',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Gợi ý ôn tập
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gợi ý ôn tập',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Suggestion 1
                    _buildSuggestionCard(
                      context,
                      imagePath: 'assets/images/thumb_review_1.png',
                      title: 'Các dạng bài thường gặp',
                      subtitle: 'Video • 12 phút',
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const LectureVideoScreen(
                              title: 'Các dạng bài thường gặp',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Suggestion 2
                    _buildSuggestionCard(
                      context,
                      imagePath: 'assets/images/thumb_review_2.png',
                      title: 'Bài tập nâng cao',
                      subtitle: 'Bài tập • 15 câu',
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const QuizScreen(
                              title: 'Bài tập nâng cao',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultStatCard({
    required Color bg,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String value,
    required Color valueColor,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.space16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      ),
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 16,
            ),
          ),
          const SizedBox(height: AppTheme.space8),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
          const SizedBox(height: AppTheme.space4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.space12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Row(
          children: [
            ImageSlot(
              assetPath: imagePath,
              width: 56,
              height: 56,
              borderRadius: 12,
            ),
            const SizedBox(width: AppTheme.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.space4),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded, // TODO: thay icon Figma
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
