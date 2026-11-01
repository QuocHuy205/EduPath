import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'subject_categories_screen.dart';
import 'search_screen.dart';
import 'my_documents_screen.dart';
import 'my_assignments_screen.dart';
import 'practice_list_screen.dart';
import 'notification_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onOpenSearch;
  final VoidCallback? onOpenCategories;

  const HomeScreen({
    super.key,
    this.onOpenSearch,
    this.onOpenCategories,
  });

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
              // Thanh tiêu đề trên cùng (Header)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Xin chào, ${MockData.currentUser.name} ! ',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const Text('👋', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: AppTheme.space4),
                      Text(
                        'Hôm nay bạn muốn học gì?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            AppSlideRoute(
                              settings: const RouteSettings(
                                name: NotificationListScreen.routeName,
                              ),
                              page: const NotificationListScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.notifications_none_rounded, // TODO: thay icon Figma
                          color: AppColors.textPrimary,
                          size: 24,
                        ),
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 38,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space16),

              // Thanh tìm kiếm (Search bar)
              GestureDetector(
                onTap: () {
                  if (onOpenSearch != null) {
                    onOpenSearch!();
                  } else {
                    Navigator.of(context).push(
                      AppSlideRoute(page: const SearchScreen()),
                    );
                  }
                },
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(AppTheme.radiusInput),
                    border: Border.all(color: AppColors.inputBorder, width: 1),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                      const SizedBox(width: AppTheme.space12),
                      Text(
                        'Tìm kiếm môn học, bài giảng...',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.inputBorder,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.space16),

              // Banner chính "Học mỗi ngày" (Banner Card)
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Học mỗi ngày',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Tiến gần ước mơ',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space16),
                          Material(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                              onTap: () {
                                if (onOpenCategories != null) {
                                  onOpenCategories!();
                                } else {
                                  Navigator.of(context).push(
                                    AppSlideRoute(
                                      page:
                                          const SubjectCategoriesScreen(),
                                    ),
                                  );
                                }
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Khám phá ngay',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textWhite,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.textWhite,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: 0,
                      top: 4,
                      child: Image.asset(
                        'assets/images/banner_student.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.space24),

              // Mục "Truy cập nhanh" (Quick access section)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Truy cập nhanh',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onOpenCategories != null) {
                        onOpenCategories!();
                      } else {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const SubjectCategoriesScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Xem tất cả ›',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space12),

              // 4 ô tính năng truy cập nhanh
              Row(
                children: [
                  Expanded(
                    child: _QuickAccessCard(
                      label: 'Danh mục',
                      icon: Icons.grid_view_rounded,
                      bgColor: const Color(0xFFEAF8EF),
                      iconColor: AppColors.primary,
                      onTap: () {
                        if (onOpenCategories != null) {
                          onOpenCategories!();
                        } else {
                          Navigator.of(context).push(
                            AppSlideRoute(
                              page: const SubjectCategoriesScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: AppTheme.space12),
                  Expanded(
                    child: _QuickAccessCard(
                      label: 'Luyện tập',
                      icon: Icons.check_box_outline_blank_rounded,
                      bgColor: const Color(0xFFEBF2FE),
                      iconColor: AppColors.info,
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            settings: const RouteSettings(name: PracticeListScreen.routeName),
                            page: const PracticeListScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: AppTheme.space12),
                  Expanded(
                    child: _QuickAccessCard(
                      label: 'Kiểm tra',
                      icon: Icons.check_box_rounded,
                      bgColor: const Color(0xFFEAF8EF),
                      iconColor: AppColors.success,
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const MyAssignmentsScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: AppTheme.space12),
                  Expanded(
                    child: _QuickAccessCard(
                      label: 'Tài liệu',
                      icon: Icons.article_outlined,
                      bgColor: const Color(0xFFFEF7EB),
                      iconColor: AppColors.warning,
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const MyDocumentsScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space24),

              // Mục "Môn học gợi ý cho bạn"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Môn học gợi ý cho bạn',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Xem tất cả ›',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space12),

              // Danh sách thẻ môn học ngang
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: MockData.suggestedCourses.map((course) {
                    return Container(
                      width: 156,
                      margin: const EdgeInsets.only(right: AppTheme.space12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ảnh minh họa môn học
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              course.coverImage!,
                              width: 156,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          // Tiêu đề môn học
                          Text(
                            course.title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppTheme.space4),
                          // Tiến độ học tập
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: AppColors.textSecondary,
                              ),
                              children: [
                                const TextSpan(text: 'Tiến độ học tập '),
                                TextSpan(
                                  text: '${(course.progress * 100).toInt()}%',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          // Thanh tiến độ ngang
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: course.progress,
                              minHeight: 5,
                              backgroundColor: AppColors.border,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: AppTheme.space24),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 26),
              const SizedBox(height: AppTheme.space8),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
