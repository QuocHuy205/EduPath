import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import '../widgets/image_slot.dart';
import 'course_detail_screen.dart';
import 'overall_progress_screen.dart';
import 'learning_goals_screen.dart';
import 'monthly_schedule_screen.dart';

/// Màn 17 – Môn học của tôi
class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Đang học (3)', 'Đã hoàn thành', 'Đã lưu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                      color: AppColors.textPrimary,
                    ),
                    Expanded(
                      child: Text(
                        'Môn học của tôi',
                        style: AppTheme.h2,
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

              const SizedBox(height: AppTheme.space16),

              // Tab row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Row(
                  children: _tabs.asMap().entries.map((entry) {
                    final isSelected = _selectedTab == entry.key;
                    return Padding(
                      padding: const EdgeInsets.only(right: AppTheme.space8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedTab = entry.key);
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

              // Course cards
              ...MockData.myCoursesInProgress.map((course) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space16,
                    vertical: AppTheme.space8,
                  ),
                  child: _buildCourseProgressCard(context, course),
                );
              }),

              const SizedBox(height: AppTheme.space16),

              // Study plan card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Container(
                  padding: const EdgeInsets.all(AppTheme.space16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lên kế hoạch học tập',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: AppTheme.space4),
                            Text(
                              'Tạo thời khóa biểu để học hiệu quả hơn',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: AppTheme.space12),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  AppSlideRoute(
                                    settings: const RouteSettings(
                                      name: LearningGoalsScreen.routeName,
                                    ),
                                    page: const LearningGoalsScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppTheme.space16,
                                  vertical: AppTheme.space8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Tạo kế hoạch',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppTheme.space12),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AppSlideRoute(
                              settings: const RouteSettings(
                                name: MonthlyScheduleScreen.routeName,
                              ),
                              page: const MonthlyScheduleScreen(),
                            ),
                          );
                        },
                        child: const ImageSlot(
                          assetPath: 'assets/images/study_plan.png',
                          width: 100,
                          height: 100,
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.space24),

              // Progress overview
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Text('Tổng quan tiến độ', style: AppTheme.h3),
              ),
              const SizedBox(height: AppTheme.space12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Material(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                    onTap: () {
                      Navigator.of(context).push(
                        AppSlideRoute(
                          settings: const RouteSettings(
                            name: OverallProgressScreen.routeName,
                          ),
                          page: const OverallProgressScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 môn đang học',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tiến độ trung bình',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                '45%',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
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
                              value: 0.45,
                              minHeight: 8,
                              backgroundColor: AppColors.border,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.space32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseProgressCard(BuildContext context, CourseModel course) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          AppSlideRoute(page: CourseDetailScreen(course: course)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(AppTheme.space16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Row(
          children: [
            ImageSlot(
              assetPath: course.iconImage ?? 'assets/images/cat_math.png',
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
                    course.title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.space8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: course.progress,
                            minHeight: 6,
                            backgroundColor: AppColors.border,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppTheme.space8),
                      Text(
                        '${(course.progress * 100).toInt()}%',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppTheme.space12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space12,
                vertical: AppTheme.space8,
              ),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary, width: 1),
              ),
              child: Text(
                'Tiếp tục học',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
