import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'practice_question_screen.dart';

/// Màn 44 – Thiết lập luyện tập
class PracticeSetupScreen extends StatefulWidget {
  final String title;

  const PracticeSetupScreen({
    super.key,
    this.title = 'Chương 2 – Hệ điều hành',
  });

  @override
  State<PracticeSetupScreen> createState() => _PracticeSetupScreenState();
}

class _PracticeSetupScreenState extends State<PracticeSetupScreen> {
  int _questionCountIndex = 0; // 0: 10 câu, 1: 20 câu, 2: 30 câu
  int _difficultyIndex = 2; // 0: Tất cả, 1: Dễ, 2: Trung bình, 3: Khó

  bool _showAnswerImmediately = true;
  bool _shuffleQuestions = true;
  bool _timeLimit = false;

  final List<String> _questionCounts = ['10 câu', '20 câu', '30 câu'];
  final List<String> _difficulties = ['Tất cả', 'Dễ', 'Trung bình', 'Khó'];

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
                      'Thiết lập luyện tập',
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

            // Scrollable Settings
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space16),

                    // Section 1: Số lượng câu hỏi
                    Text(
                      'Số lượng câu hỏi',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Row(
                      children: _questionCounts.asMap().entries.map((entry) {
                        final isSelected = _questionCountIndex == entry.key;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: entry.key < _questionCounts.length - 1
                                  ? AppTheme.space8
                                  : 0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() => _questionCountIndex = entry.key);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppTheme.space12,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primaryLight
                                      : AppColors.cardBackground,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.border,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    entry.value,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? AppColors.primary
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 2: Độ khó
                    Text(
                      'Độ khó',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Row(
                      children: _difficulties.asMap().entries.map((entry) {
                        final isSelected = _difficultyIndex == entry.key;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: entry.key < _difficulties.length - 1
                                  ? AppTheme.space8
                                  : 0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() => _difficultyIndex = entry.key);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppTheme.space12,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primaryLight
                                      : AppColors.cardBackground,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.border,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    entry.value,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? AppColors.primary
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 3: Tùy chọn luyện tập
                    Text(
                      'Tùy chọn luyện tập',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    _buildSwitchCard(
                      title: 'Xem đáp án ngay sau mỗi câu',
                      value: _showAnswerImmediately,
                      onChanged: (val) => setState(() => _showAnswerImmediately = val),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    _buildSwitchCard(
                      title: 'Xáo trộn câu hỏi',
                      value: _shuffleQuestions,
                      onChanged: (val) => setState(() => _shuffleQuestions = val),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    _buildSwitchCard(
                      title: 'Giới hạn thời gian',
                      value: _timeLimit,
                      onChanged: (val) => setState(() => _timeLimit = val),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 4: Tóm tắt
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
                            'Tóm tắt',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            '${_questionCounts[_questionCountIndex]} · ${_timeLimit ? "Có giới hạn thời gian" : "Không giới hạn thời gian"}',
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
                          page: PracticeQuestionScreen(
                            categoryTag: 'Kiến thức máy tính',
                            totalQuestions: 10,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                      ),
                    ),
                    child: Text(
                      'Bắt đầu làm bài',
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

  Widget _buildSwitchCard({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space12,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.textWhite,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: AppColors.cardBackground,
            inactiveTrackColor: AppColors.border,
          ),
        ],
      ),
    );
  }
}
