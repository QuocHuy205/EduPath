import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'home_screen.dart';
import 'subject_categories_screen.dart';
import 'search_screen.dart';
import 'my_courses_screen.dart';
import 'subject_detail_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        onOpenSearch: () {
          Navigator.of(context).push(
            AppSlideRoute(page: const SearchScreen()),
          );
        },
        onOpenCategories: () {
          _onTabSelected(1);
        },
        onOpenMyCourses: () {
          _onTabSelected(2);
        },
      ),
      const SubjectCategoriesScreen(showBackButton: false),
      const MyCoursesScreen(showBackButton: false),
      const _FavoritesTabScreen(),
      const _ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
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
                _buildNavItem(0, 'Trang chủ', Icons.home_rounded, Icons.home_outlined),
                _buildNavItem(1, 'Khám phá', Icons.grid_view_rounded, Icons.grid_view_outlined),
                _buildNavItem(2, 'Học tập', Icons.article_rounded, Icons.article_outlined),
                _buildNavItem(3, 'Yêu thích', Icons.favorite_rounded, Icons.favorite_outline_rounded),
                _buildNavItem(4, 'Cá nhân', Icons.person_rounded, Icons.person_outline_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    String label,
    IconData activeIcon,
    IconData inactiveIcon,
  ) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: () => _onTabSelected(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : inactiveIcon,
              color: color,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritesTabScreen extends StatelessWidget {
  const _FavoritesTabScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.space16,
            vertical: AppTheme.space12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Môn học yêu thích',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.space16),
              Expanded(
                child: ListView(
                  children: [
                    _buildFavoriteCard(
                      context,
                      MockData.mathCourse,
                    ),
                    const SizedBox(height: AppTheme.space12),
                    _buildFavoriteCard(
                      context,
                      MockData.englishCourse,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, CourseModel course) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppTheme.space12),
        leading: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: course.iconImage != null
              ? Image.asset(course.iconImage!, fit: BoxFit.contain)
              : const Icon(Icons.school, color: AppColors.primary),
        ),
        title: Text(
          course.title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          course.subtitle.isNotEmpty
              ? course.subtitle
              : '${course.category} • ${course.credits}',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.primary,
          size: 16,
        ),
        onTap: () {
          Navigator.of(context).push(
            AppSlideRoute(page: SubjectDetailScreen(course: course)),
          );
        },
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.space16,
            vertical: AppTheme.space12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tài khoản cá nhân',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.space24),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: AppColors.primaryLight,
                      child: ClipOval(
                        child: Image.asset(
                          MockData.currentUser.avatarUrl,
                          width: 84,
                          height: 84,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),
                    Text(
                      MockData.currentUser.name,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      MockData.currentUser.email,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.space24),
              _buildMenuItem(
                icon: Icons.badge_outlined,
                title: 'Mã sinh viên',
                value: 'SV2026-08912',
              ),
              _buildMenuItem(
                icon: Icons.school_outlined,
                title: 'Chuyên ngành',
                value: 'Công nghệ thông tin',
              ),
              _buildMenuItem(
                icon: Icons.notifications_none_rounded,
                title: 'Thông báo học tập',
                value: 'Đang bật (20:00)',
              ),
              _buildMenuItem(
                icon: Icons.shield_outlined,
                title: 'Bảo mật tài khoản',
                value: 'Bình thường',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.space12),
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
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: AppTheme.space12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
