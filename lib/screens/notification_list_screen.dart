import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'main_navigation_screen.dart';
import 'my_assignments_screen.dart';
import 'course_content_screen.dart';
import 'course_overview_screen.dart';
import 'practice_question_screen.dart';

/// Màn 77 – Danh sách thông báo
class NotificationListScreen extends StatefulWidget {
  static const String routeName = '/notification_list';

  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  int _selectedFilter = 0; // 0: Tất cả (6), 1: Chưa đọc (3), 2: Học vụ
  bool _markedAllAsRead = false;

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
                      'Danh sách thông báo',
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
                    // Top Overview Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusCard,
                        ),
                        border: Border.all(
                          color: const Color(0xFFC6E7D2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons
                                    .notifications_none_rounded, // TODO: thay icon Figma
                                size: 20,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: AppTheme.space8),
                              Expanded(
                                child: Text(
                                  'Bạn có 3 thông báo quan trọng hôm nay',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF0D5C3A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Ưu tiên đầu việc học tập và lịch thi',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppTheme.space8),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _markedAllAsRead = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Đã đánh dấu tất cả thông báo là đã đọc!',
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  _markedAllAsRead
                                      ? 'Đã đọc tất cả ✓'
                                      : 'Đánh dấu tất cả đã đọc ✓',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Filter Tabs: [Tất cả (6)] [Chưa đọc (3)] [Học vụ]
                    Row(
                      children: [
                        _buildFilterTab(0, 'Tất cả (6)'),
                        const SizedBox(width: AppTheme.space8),
                        _buildFilterTab(1, 'Chưa đọc (3)'),
                        const SizedBox(width: AppTheme.space8),
                        _buildFilterTab(2, 'Học vụ'),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: ● Hôm nay
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.textPrimary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space8),
                        Text(
                          'Hôm nay',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Card 1: Hạn nộp bài tập lớn Giải tích 1 (Urgent / Red)
                    _buildNotificationCard(
                      stripeColor: const Color(0xFFDC2626),
                      icon: Icons.access_time_rounded,
                      iconBg: const Color(0xFFFEE2E2),
                      iconColor: const Color(0xFFDC2626),
                      title: 'Hạn nộp bài tập lớn Giải tích 1',
                      subtitle1: 'Cấp độ: Cảnh báo · Hạn 17:00 hôm nay',
                      subtitle2: 'Cổng nộp bài sẽ đóng sau 4 giờ nữa.',
                      primaryActionText: 'Nộp bài ngay',
                      onPrimaryAction: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const MyAssignmentsScreen()),
                        );
                      },
                      secondaryActionText: 'Xem đề bài',
                      onSecondaryAction: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const CourseContentScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Card 2: Trợ lý AI: Đến giờ ôn 20 Flashcard (Blue / AI)
                    _buildNotificationCard(
                      stripeColor: const Color(0xFF2563EB),
                      icon: Icons.smart_toy_outlined,
                      iconBg: const Color(0xFFDBEAFE),
                      iconColor: const Color(0xFF2563EB),
                      title: 'Trợ lý AI: Đến giờ ôn 20 Flashcard',
                      subtitle1: 'Duy trì chuỗi streak 14 ngày của bạn.',
                      subtitle2: 'Ôn tập ngắn giúp ghi nhớ kiến thức.',
                      primaryActionText: 'Ôn tập ngay',
                      onPrimaryAction: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const PracticeQuestionScreen()),
                        );
                      },
                      secondaryActionText: 'Xem lộ trình',
                      onSecondaryAction: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const CourseOverviewScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Card 3: Thông báo đổi giảng đường (Teal)
                    _buildNotificationCard(
                      stripeColor: const Color(0xFF0D9488),
                      icon: Icons.menu_book_rounded,
                      iconBg: const Color(0xFFCCFBF1),
                      iconColor: const Color(0xFF0F766E),
                      title: 'Thông báo đổi giảng đường',
                      subtitle1: 'Vật lý đại cương 1 · Thứ 3, 9:00',
                      subtitle2: 'Chuyển từ phòng A102 sang giảng đường B204.',
                    ),

                    const SizedBox(height: AppTheme.space24),
                  ],
                ),
              ),
            ),

            // Fixed Bottom Navigation Bar
            _buildBottomNav(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(int index, String label) {
    final isSelected = _selectedFilter == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedFilter = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusButton),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.textWhite : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required Color stripeColor,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle1,
    required String subtitle2,
    String? primaryActionText,
    VoidCallback? onPrimaryAction,
    String? secondaryActionText,
    VoidCallback? onSecondaryAction,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left colored stripe
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: stripeColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.radiusCard),
                  bottomLeft: Radius.circular(AppTheme.radiusCard),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: iconBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              icon, // TODO: thay icon Figma
                              color: iconColor,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
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
                              const SizedBox(height: 2),
                              Text(
                                subtitle1,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space8),
                    Text(
                      subtitle2,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    if (primaryActionText != null) ...[
                      const SizedBox(height: AppTheme.space16),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: onPrimaryAction,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.textWhite,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  primaryActionText,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (secondaryActionText != null) ...[
                            const SizedBox(width: AppTheme.space8),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: onSecondaryAction,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryLight,
                                    foregroundColor: AppColors.textPrimary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    secondaryActionText,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
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
            Icon(icon, color: color, size: 22),
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
