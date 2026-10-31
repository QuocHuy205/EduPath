import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'review_wrong_answers_screen.dart';
import 'practice_question_screen.dart';
import 'practice_list_screen.dart';

/// Màn 48 – Kết quả luyện tập
class PracticeResultScreen extends StatelessWidget {
  final int correctCount;
  final int totalCount;
  final String duration;

  const PracticeResultScreen({
    super.key,
    this.correctCount = 7,
    this.totalCount = 10,
    this.duration = '6:40',
  });

  @override
  Widget build(BuildContext context) {
    final incorrectCount = totalCount - correctCount;
    final percentage = ((correctCount / totalCount) * 100).toInt();

    // 10 answers status: true for correct, false for incorrect
    final List<bool> answersStatus = [
      true,  // 1 ✓
      true,  // 2 ✓
      false, // 3 ×
      true,  // 4 ✓
      true,  // 5 ✓
      false, // 6 ×
      true,  // 7 ✓
      true,  // 8 ✓
      false, // 9 ×
      true,  // 10 ✓
    ];

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
                      'Kết quả luyện tập',
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

                    // Headline
                    Text(
                      'Bạn đã hoàn thành bài luyện tập!',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Big Circular Result
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$correctCount/$totalCount',
                              style: GoogleFonts.inter(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: AppTheme.space4),
                            Text(
                              '$percentage% đúng',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // 3 Stats Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildSmallStatCard(
                            label: 'Đúng $correctCount',
                            textColor: AppColors.success,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildSmallStatCard(
                            label: 'Sai $incorrectCount',
                            textColor: AppColors.error,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildSmallStatCard(
                            label: duration,
                            textColor: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Card: Gợi ý ôn tập
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
                            'Gợi ý ôn tập',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Cần ôn thêm: Quản lý tệp',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Kết quả từng câu
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kết quả từng câu',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // 10 Question Badges Grid (2 rows of 5)
                    Wrap(
                      spacing: AppTheme.space8,
                      runSpacing: AppTheme.space8,
                      children: List.generate(answersStatus.length, (index) {
                        final isCorrect = answersStatus[index];
                        final questionNum = index + 1;

                        return Container(
                          width: 60,
                          height: 48,
                          decoration: BoxDecoration(
                            color: isCorrect
                                ? AppColors.primaryLight
                                : const Color(0xFFFDE8E8),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isCorrect
                                  ? AppColors.primary
                                  : AppColors.error,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$questionNum',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isCorrect
                                        ? AppColors.primary
                                        : AppColors.error,
                                  ),
                                ),
                                const SizedBox(width: AppTheme.space4),
                                Text(
                                  isCorrect ? '✓' : '×',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isCorrect
                                        ? AppColors.primary
                                        : AppColors.error,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Button: Xem câu sai
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            AppSlideRoute(
                              page: const ReviewWrongAnswersScreen(),
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
                          'Xem câu sai',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Bottom links: Luyện tập lại | Về danh sách
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              AppSlideRoute(
                                page: const PracticeQuestionScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Luyện tập lại',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bool hasPracticeList = false;
                            Navigator.of(context).popUntil((route) {
                              if (route.settings.name == PracticeListScreen.routeName) {
                                hasPracticeList = true;
                                return true;
                              }
                              return route.isFirst;
                            });
                            if (!hasPracticeList) {
                              Navigator.of(context).pushReplacement(
                                AppSlideRoute(
                                  settings: const RouteSettings(name: PracticeListScreen.routeName),
                                  page: const PracticeListScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Về danh sách',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildSmallStatCard({
    required String label,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.space16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
