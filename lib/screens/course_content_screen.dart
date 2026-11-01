import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'lecture_video_screen.dart';
import 'quiz_screen.dart';

/// Màn 32 – Nội dung khóa học
class CourseContentScreen extends StatefulWidget {
  const CourseContentScreen({super.key});

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['Tất cả', 'Bài giảng', 'Tài liệu', 'Thảo luận'];

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
                      'Nội dung khóa học',
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

            const SizedBox(height: AppTheme.space12),

            // Filter Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Row(
                children: _filters.asMap().entries.map((entry) {
                  final isSelected = _selectedFilter == entry.key;
                  return Padding(
                    padding: const EdgeInsets.only(right: AppTheme.space8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _selectedFilter = entry.key);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.space16,
                          vertical: AppTheme.space8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: isSelected
                              ? null
                              : Border.all(color: AppColors.border, width: 1),
                        ),
                        child: Text(
                          entry.value,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.textWhite
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: AppTheme.space16),

            // Scrollable Lessons
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress Card
                    Container(
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
                                'Tiến độ học tập',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                '35%',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: const LinearProgressIndicator(
                              value: 0.35,
                              minHeight: 6,
                              backgroundColor: AppColors.border,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Hoàn thành 7/20 bài học',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Chương 1
                    Text(
                      'Chương 1: Hàm số và giới hạn',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Lesson 1.1 Video
                    _buildLessonCard(
                      context,
                      icon: Icons.play_arrow_rounded, // TODO: thay icon Figma
                      iconBg: const Color(0xFFEAF8EF),
                      title: '1.1 Khái niệm hàm số',
                      subtitle: 'Video • 15 phút',
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const LectureVideoScreen(
                              title: '1.1 Khái niệm hàm số',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Lesson 1.2 Video
                    _buildLessonCard(
                      context,
                      icon: Icons.play_arrow_rounded, // TODO: thay icon Figma
                      iconBg: const Color(0xFFEBF2FE),
                      title: '1.2 Giới hạn của hàm số',
                      subtitle: 'Video • 18 phút',
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const LectureVideoScreen(
                              title: '1.2 Giới hạn của hàm số',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Lesson 1.3 Exercise
                    _buildLessonCard(
                      context,
                      icon: Icons.description_outlined, // TODO: thay icon Figma
                      iconBg: const Color(0xFFEAF8EF),
                      title: '1.3 Hàm số liên tục',
                      subtitle: 'Bài tập • 10 câu',
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const QuizScreen(
                              title: '1.3 Hàm số liên tục',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Lesson 1.4 Exercise
                    _buildLessonCard(
                      context,
                      icon: Icons.description_outlined, // TODO: thay icon Figma
                      iconBg: const Color(0xFFEBF2FE),
                      title: '1.4 Bài tập chương 1',
                      subtitle: 'Bài tập • 20 câu',
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const QuizScreen(
                              title: 'Bài tập chương 1',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Collapsible Chapters
                    _buildChapterRow(context, 'Chương 2: Đạo hàm', '0/5'),
                    const SizedBox(height: AppTheme.space12),
                    _buildChapterRow(context, 'Chương 3: Tích phân', '0/6'),
                    const SizedBox(height: AppTheme.space12),
                    _buildChapterRow(context, 'Chương 4: Ứng dụng', '0/4'),

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

  Widget _buildLessonCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.space16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: AppTheme.space16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.space4),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded, // TODO: thay icon Figma
              color: AppColors.primary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterRow(BuildContext context, String title, String progress) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space16,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          Row(
            children: [
              Text(
                progress,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: AppTheme.space4),
              const Icon(
                Icons.chevron_right_rounded, // TODO: thay icon Figma
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
