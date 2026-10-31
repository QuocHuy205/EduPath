import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'practice_explanation_screen.dart';
import 'practice_question_screen.dart';

/// Màn 49 – Xem lại câu sai
class ReviewWrongAnswersScreen extends StatefulWidget {
  const ReviewWrongAnswersScreen({super.key});

  @override
  State<ReviewWrongAnswersScreen> createState() => _ReviewWrongAnswersScreenState();
}

class _ReviewWrongAnswersScreenState extends State<ReviewWrongAnswersScreen> {
  int _selectedFilter = 0; // 0: Chỉ câu sai, 1: Tất cả

  final List<_WrongAnswerItem> _wrongAnswers = [
    _WrongAnswerItem(
      questionNum: 3,
      userAnswer: 'A. RAM',
      correctAnswer: 'B. CPU',
    ),
    _WrongAnswerItem(
      questionNum: 6,
      userAnswer: 'B. Bộ nhớ',
      correctAnswer: 'C. Ổ cứng',
    ),
    _WrongAnswerItem(
      questionNum: 9,
      userAnswer: 'D. Màn hình',
      correctAnswer: 'A. CPU',
    ),
  ];

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
                    child: Center(
                      child: Text(
                        'Xem lại câu sai',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
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

            const SizedBox(height: AppTheme.space12),

            // Filter Tabs: Chỉ câu sai | Tất cả
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                        decoration: BoxDecoration(
                          color: _selectedFilter == 0
                              ? AppColors.primaryLight
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedFilter == 0
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Chỉ câu sai',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _selectedFilter == 0
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.space12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                        decoration: BoxDecoration(
                          color: _selectedFilter == 1
                              ? AppColors.primaryLight
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedFilter == 1
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Tất cả',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _selectedFilter == 1
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.space16),

            // Scrollable List of wrong question cards
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                itemCount: _wrongAnswers.length,
                separatorBuilder: (_, _) => const SizedBox(height: AppTheme.space12),
                itemBuilder: (context, index) {
                  final item = _wrongAnswers[index];
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
                        Text(
                          'Câu ${item.questionNum} · Câu trả lời chưa chính xác',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.space8),
                        Text(
                          'Bạn chọn: ${item.userAnswer}',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.space4),
                        Text(
                          'Đáp án đúng: ${item.correctAnswer}',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.space16),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              AppSlideRoute(
                                page: const PracticeExplanationScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Xem giải thích',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: AppTheme.space4),
                              const Icon(
                                Icons.arrow_forward_rounded, // TODO: thay icon Figma
                                color: AppColors.primary,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom CTA: Luyện lại 3 câu sai
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
                          page: const PracticeQuestionScreen(
                            categoryTag: 'Luyện lại câu sai',
                            totalQuestions: 3,
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
                      'Luyện lại 3 câu sai',
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
}

class _WrongAnswerItem {
  final int questionNum;
  final String userAnswer;
  final String correctAnswer;

  const _WrongAnswerItem({
    required this.questionNum,
    required this.userAnswer,
    required this.correctAnswer,
  });
}
