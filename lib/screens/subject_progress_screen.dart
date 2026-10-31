import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'main_navigation_screen.dart';
import 'course_detail_screen.dart';

/// Màn 62 – Tiến độ theo môn
class SubjectProgressScreen extends StatefulWidget {
  static const String routeName = '/subject_progress';

  const SubjectProgressScreen({super.key});

  @override
  State<SubjectProgressScreen> createState() => _SubjectProgressScreenState();
}

class _SubjectProgressScreenState extends State<SubjectProgressScreen> {
  int _selectedTab = 0; // 0: Đang học, 1: Đã hoàn thành

  final List<Map<String, dynamic>> _inProgressSubjects = [
    {
      'title': 'Toán cao cấp',
      'progress': 0.75,
      'percentageText': '75%',
    },
    {
      'title': 'Tin học đại cương',
      'progress': 0.60,
      'percentageText': '60%',
    },
    {
      'title': 'Triết học Mác – Lênin',
      'progress': 0.40,
      'percentageText': '40%',
    },
    {
      'title': 'Pháp luật đại cương',
      'progress': 0.20,
      'percentageText': '20%',
    },
    {
      'title': 'Kinh tế chính trị',
      'progress': 0.02, // Minimal sliver
      'percentageText': '0%',
    },
  ];

  final List<Map<String, dynamic>> _completedSubjects = [
    {
      'title': 'Nhập môn lập trình',
      'progress': 1.0,
      'percentageText': '100%',
    },
    {
      'title': 'Kỹ năng giao tiếp',
      'progress': 1.0,
      'percentageText': '100%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final list = _selectedTab == 0 ? _inProgressSubjects : _completedSubjects;

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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Tiến độ theo môn',
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

            // Segmented Tabs: [Đang học] [Đã hoàn thành]
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space16,
                vertical: AppTheme.space12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton(
                      label: 'Đang học',
                      isSelected: _selectedTab == 0,
                      onTap: () {
                        setState(() {
                          _selectedTab = 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: AppTheme.space12),
                  Expanded(
                    child: _buildTabButton(
                      label: 'Đã hoàn thành',
                      isSelected: _selectedTab == 1,
                      onTap: () {
                        setState(() {
                          _selectedTab = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // List of Subject Cards
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                  vertical: AppTheme.space8,
                ),
                itemCount: list.length,
                separatorBuilder: (_, _) => const SizedBox(height: AppTheme.space12),
                itemBuilder: (context, index) {
                  final item = list[index];
                  return _buildSubjectProgressCard(
                    title: item['title'] as String,
                    progress: item['progress'] as double,
                    percentageText: item['percentageText'] as String,
                    onTap: () {
                      final course = MockData.searchResults.firstWhere(
                        (c) => c.title == (item['title'] as String),
                        orElse: () => MockData.searchResults[0],
                      );
                      Navigator.of(context).push(
                        AppSlideRoute(
                          page: CourseDetailScreen(course: course),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Fixed Bottom Navigation Bar (Tab 2 Active)
            _buildBottomNav(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primary : AppColors.primaryLight,
          foregroundColor: isSelected ? AppColors.textWhite : AppColors.textSecondary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusButton),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectProgressCard({
    required String title,
    required double progress,
    required String percentageText,
    VoidCallback? onTap,
  }) {
    return Material(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppTheme.space16),
          decoration: BoxDecoration(
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
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    percentageText,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.space12),

              // Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFE2E8F0),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                index: 0,
                label: 'Trang chủ',
                icon: Icons.home_outlined,
                isActive: false,
              ),
              _buildNavItem(
                context,
                index: 1,
                label: 'Khám phá',
                icon: Icons.search_rounded,
                isActive: false,
              ),
              _buildNavItem(
                context,
                index: 2,
                label: 'Học tập',
                icon: Icons.article_rounded,
                isActive: true,
              ),
              _buildNavItem(
                context,
                index: 3,
                label: 'Yêu thích',
                icon: Icons.favorite_outline_rounded,
                isActive: false,
              ),
              _buildNavItem(
                context,
                index: 4,
                label: 'Cá nhân',
                icon: Icons.person_outline_rounded,
                isActive: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required String label,
    required IconData icon,
    required bool isActive,
  }) {
    final color = isActive ? AppColors.primary : AppColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MainNavigationScreen(initialIndex: index),
              transitionDuration: Duration.zero,
            ),
            (route) => false,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
