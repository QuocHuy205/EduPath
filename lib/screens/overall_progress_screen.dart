import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'main_navigation_screen.dart';
import 'subject_progress_screen.dart';

/// Màn 61 – Tiến độ tổng quan
class OverallProgressScreen extends StatelessWidget {
  static const String routeName = '/overall_progress';

  const OverallProgressScreen({super.key});

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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Tiến độ tổng quan',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                  vertical: AppTheme.space12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Overview Banner Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(
                          color: const Color(0xFFC6E7D2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Pill badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD6F0E0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          color: AppColors.primary,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: AppTheme.space4),
                                      Text(
                                        'Tổng quan học tập',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF0D5C3A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space8),
                                Text(
                                  'Nhịp độ học tập ổn định',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space4),
                                Text(
                                  'Bạn đang duy trì hiệu suất tốt trên tất cả các học phần và lộ trình.',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppTheme.space12),

                          // Icon container
                          Container(
                            width: 54,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.bar_chart_rounded, // TODO: thay icon Figma
                                color: AppColors.textWhite,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space32),

                    // Big Monthly Progress Hero
                    Center(
                      child: Column(
                        children: [
                          Text(
                            '65%',
                            style: GoogleFonts.inter(
                              fontSize: 42,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Hoàn thành kế hoạch tháng này',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // 3 Metric Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            value: '8/12',
                            label: 'Môn học',
                            onTap: () {
                              Navigator.of(context).push(
                                AppSlideRoute(
                                  settings: const RouteSettings(
                                    name: SubjectProgressScreen.routeName,
                                  ),
                                  page: const SubjectProgressScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildStatCard(
                            value: '120h',
                            label: 'Giờ học',
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildStatCard(
                            value: '12 ngày',
                            label: 'Liên tục',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Hoạt động gần đây
                    Text(
                      'Hoạt động gần đây',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space16),

                    // Activity Item 1 (white card)
                    _buildActivityCard(
                      context,
                      title: 'Toán cao cấp',
                      subtitle: 'Hoàn thành bài 3 · 2 giờ trước',
                      isHighlighted: false,
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            settings: const RouteSettings(
                              name: SubjectProgressScreen.routeName,
                            ),
                            page: const SubjectProgressScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space12),

                    // Activity Item 2 (highlighted light green card)
                    _buildActivityCard(
                      context,
                      title: 'Tin học đại cương',
                      subtitle: 'Làm bài tập chương 2 · 5 giờ trước',
                      isHighlighted: true,
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            settings: const RouteSettings(
                              name: SubjectProgressScreen.routeName,
                            ),
                            page: const SubjectProgressScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space24),
                  ],
                ),
              ),
            ),

            // Fixed Bottom Navigation Bar (Tab 2 Active)
            _buildBottomNav(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    VoidCallback? onTap,
  }) {
    return Material(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppTheme.space16,
            horizontal: AppTheme.space12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppTheme.space8),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isHighlighted,
    VoidCallback? onTap,
  }) {
    return Material(
      color: isHighlighted ? AppColors.primaryLight : AppColors.cardBackground,
      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppTheme.space16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            border: isHighlighted
                ? Border.all(color: const Color(0xFFC6E7D2), width: 1)
                : Border.all(color: AppColors.border, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
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
