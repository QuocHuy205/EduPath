import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'main_navigation_screen.dart';
import 'schedule_detail_screen.dart';

/// Màn 71 – Lịch tháng
class MonthlyScheduleScreen extends StatefulWidget {
  static const String routeName = '/monthly_schedule';

  const MonthlyScheduleScreen({super.key});

  @override
  State<MonthlyScheduleScreen> createState() => _MonthlyScheduleScreenState();
}

class _MonthlyScheduleScreenState extends State<MonthlyScheduleScreen> {
  int _selectedFilter = 0; // 0: Tất cả (26), 1: Ca học (18), 2: Lịch thi (4)
  int _selectedDay = 20;

  // Calendar dates representation: [day, inMonth, dotType (0: none, 1: green, 2: red, 3: blue)]
  final List<List<dynamic>> _daysData = [
    // Row 1
    [28, false, 0], [29, false, 0], [30, false, 0], [31, false, 0], [1, true, 1], [2, true, 1], [3, true, 0],
    // Row 2
    [4, true, 3], [5, true, 1], [6, true, 1], [7, true, 1], [8, true, 3], [9, true, 1], [10, true, 0],
    // Row 3
    [11, true, 1], [12, true, 0], [13, true, 2], [14, true, 1], [15, true, 0], [16, true, 1], [17, true, 0],
    // Row 4
    [18, true, 2], [19, true, 3], [20, true, 1], [21, true, 1], [22, true, 2], [23, true, 0], [24, true, 0],
    // Row 5
    [25, true, 1], [26, true, 1], [27, true, 3], [28, true, 1], [29, true, 1], [30, true, 1], [1, false, 0],
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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Lịch tháng',
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
                    // Month Calendar Card
                    _buildCalendarCard(),

                    const SizedBox(height: AppTheme.space16),

                    // Filter Chips Row
                    Row(
                      children: [
                        _buildFilterChip(0, 'Tất cả (26)', AppColors.primary),
                        const SizedBox(width: AppTheme.space8),
                        _buildFilterChip(1, 'Ca học trên lớp (18)', AppColors.cardBackground),
                        const SizedBox(width: AppTheme.space8),
                        _buildFilterChip(2, 'Lịch thi (4)', const Color(0xFFFEE2E2)),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Upcoming Exam Countdown Banner
                    _buildUpcomingExamBanner(),

                    const SizedBox(height: AppTheme.space24),

                    // Date Header & Events count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded, // TODO: thay icon Figma
                              size: 18,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: AppTheme.space8),
                            Text(
                              'Thứ 4, ngày 20 tháng 11',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '4 sự kiện',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space12),

                    // Event 1: Giải tích 1
                    _buildEventCard(
                      timeTag: '06:45 – 09:10 · Tín chỉ SIS',
                      title: 'Giải tích 1 (Toán cao cấp A1)',
                      location: 'Phòng B204 · PGS.TS Nguyễn Văn Hùng',
                      accentColor: const Color(0xFF1E3A8A),
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            settings: const RouteSettings(
                              name: ScheduleDetailScreen.routeName,
                            ),
                            page: const ScheduleDetailScreen(
                              subjectTitle: 'Toán cao cấp',
                              planTitle: 'Giải tích 1 (Toán cao cấp A1)',
                              timeString: '06:45 – 09:10 · 145 phút',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: AppTheme.space12),

                    // Event 2: Tin học đại cương
                    _buildEventCard(
                      timeTag: '09:25 – 11:50 · Bài tập nhóm',
                      title: 'Tin học đại cương – Bảng tính Excel',
                      location: 'Phòng máy C3 · ThS. Lê Hoàng',
                      accentColor: AppColors.primary,
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            settings: const RouteSettings(
                              name: ScheduleDetailScreen.routeName,
                            ),
                            page: const ScheduleDetailScreen(),
                          ),
                        );
                      },
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

  Widget _buildCalendarCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        children: [
          // Month navigation & tag pills
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.chevron_left_rounded,
                    size: 22,
                    color: AppColors.textPrimary,
                  ),
                  const SizedBox(width: AppTheme.space4),
                  Text(
                    'Tháng 11, 2024',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: AppTheme.space4),
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 22,
                    color: AppColors.textPrimary,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Hôm nay',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.space4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'HK 2024-1',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: AppTheme.space16),

          // Day of week labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDOW('T2'),
              _buildDOW('T3'),
              _buildDOW('T4'),
              _buildDOW('T5'),
              _buildDOW('T6'),
              _buildDOW('T7'),
              _buildDOW('CN', isSunday: true),
            ],
          ),

          const SizedBox(height: AppTheme.space12),

          // Grid of dates
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _daysData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final day = _daysData[index][0] as int;
              final inMonth = _daysData[index][1] as bool;
              final dotType = _daysData[index][2] as int;
              final isSelected = inMonth && day == _selectedDay;

              return InkWell(
                onTap: inMonth
                    ? () {
                        setState(() {
                          _selectedDay = day;
                        });
                      }
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$day',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected
                                ? AppColors.textWhite
                                : (inMonth
                                    ? (index % 7 == 6
                                        ? const Color(0xFFDC2626)
                                        : AppColors.textPrimary)
                                    : AppColors.textSecondary.withValues(alpha: 0.4)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    if (dotType > 0 && !isSelected)
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: dotType == 1
                              ? AppColors.primary
                              : (dotType == 2
                                  ? const Color(0xFFDC2626)
                                  : const Color(0xFF2563EB)),
                          shape: BoxShape.circle,
                        ),
                      )
                    else
                      const SizedBox(height: 4),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: AppTheme.space16),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: AppTheme.space12),

          // Legend
          Row(
            children: [
              Expanded(
                child: _buildLegendItem(
                  color: const Color(0xFF1E3A8A),
                  label: 'Học tín chỉ trên lớp',
                ),
              ),
              Expanded(
                child: _buildLegendItem(
                  color: const Color(0xFFDC2626),
                  label: 'Lịch thi chính thức',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.space8),
          Row(
            children: [
              Expanded(
                child: _buildLegendItem(
                  color: const Color(0xFFD97706),
                  label: 'Thi thử EduPath',
                ),
              ),
              Expanded(
                child: _buildLegendItem(
                  color: const Color(0xFF2563EB),
                  label: 'Deadline BTL / Bài tập',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDOW(String label, {bool isSunday = false}) {
    return SizedBox(
      width: 28,
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSunday ? const Color(0xFFDC2626) : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(int index, String label, Color customBg) {
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
            color: isSelected
                ? AppColors.primary
                : (index == 2 ? const Color(0xFFFEF2F2) : AppColors.cardBackground),
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
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? AppColors.textWhite
                    : (index == 2 ? const Color(0xFFDC2626) : AppColors.textPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingExamBanner() {
    return Container(
      width: double.infinity,
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
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.school_rounded, // TODO: thay icon Figma
                    color: Color(0xFFDC2626),
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
                      'Kỳ thi giữa kỳ đợt 2',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '18/11 – 28/11 · Còn 5 môn thi trọng điểm',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Sắp diễn ra',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFDC2626),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.space16),

          // Two progress tracks
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chuyên cần tháng',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          '92%',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.92,
                        minHeight: 6,
                        backgroundColor: Color(0xFFE2E8F0),
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppTheme.space16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Đề thi thử hoàn thành',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          '14/18',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 14 / 18,
                        minHeight: 6,
                        backgroundColor: Color(0xFFE2E8F0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E3A8A)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String timeTag,
    required String title,
    required String location,
    required Color accentColor,
    VoidCallback? onTap,
  }) {
    return Material(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                // Left thick accent stripe
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    color: accentColor,
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
                        Text(
                          timeTag,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: accentColor,
                          ),
                        ),
                        const SizedBox(height: AppTheme.space4),
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
                          location,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
