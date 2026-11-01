import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'my_assignments_screen.dart';
import 'overall_progress_screen.dart';
import 'schedule_detail_screen.dart';
import 'monthly_schedule_screen.dart';

/// Màn 21 – Trung tâm học tập
class LearningCenterScreen extends StatelessWidget {
  final bool showBackButton;

  const LearningCenterScreen({
    super.key,
    this.showBackButton = true,
  });

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
                    if (showBackButton)
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                        color: AppColors.textPrimary,
                      )
                    else
                      const SizedBox(width: AppTheme.space12),
                    Expanded(
                      child: Text(
                        'Trung tâm học tập',
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

              const SizedBox(height: AppTheme.space16),

              // EduPath banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppTheme.space16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Edu',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: 'Path',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppTheme.space4),
                      Text(
                        'Không gian học tập dành riêng cho bạn',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.space16),

              // TỔNG QUAN HỌC TẬP
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Text(
                  'TỔNG QUAN HỌC TẬP',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.space8),

              // Stats row
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
                      child: Row(
                        children: [
                          Expanded(child: _buildStatColumn('3 môn', 'Đang theo học')),
                          Expanded(child: _buildStatColumn('68%', 'Tiến độ tuần')),
                          Expanded(child: _buildStatColumn('12 ngày', 'Chuỗi học liên tục')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.space24),

              // TIẾP TỤC HỌC
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Text(
                  'TIẾP TỤC HỌC',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.space12),

              _buildContinueLearningCard(
                context,
                title: 'Toán cao cấp',
                subtitle: 'Chương 3 · Đạo hàm · Đã học 65%',
                actionText: 'Tiếp tục học  →',
              ),
              const SizedBox(height: AppTheme.space12),
              _buildContinueLearningCard(
                context,
                title: 'Tin học đại cương',
                subtitle: 'Chương 4 · Bảng tính · Đã học 40%',
                actionText: 'Mở bài học  →',
              ),

              const SizedBox(height: AppTheme.space24),

              // CÔNG VIỆC ƯU TIÊN
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CÔNG VIỆC ƯU TIÊN',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
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
                      child: Text(
                        'Xem lịch tháng ›',
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
              const SizedBox(height: AppTheme.space12),

              _buildPriorityTaskCard(
                context,
                time: '19:30',
                title: 'Ôn bài 4.1',
                subtitle: 'Tin học đại cương · 20 phút',
                actionText: 'Xem lịch học  →',
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
              const SizedBox(height: AppTheme.space12),
              _buildPriorityTaskCard(
                context,
                time: '21:00',
                title: 'Luyện 10 câu',
                subtitle: 'Giải tích 1 · Hạn 22:00',
                actionText: 'Vào làm bài  →',
                onTap: () {
                  Navigator.of(context).push(
                    AppSlideRoute(page: const MyAssignmentsScreen()),
                  );
                },
              ),

              const SizedBox(height: AppTheme.space32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: AppTheme.space4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContinueLearningCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String actionText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.space16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          border: const Border(
            left: BorderSide(color: AppColors.primary, width: 3),
          ),
        ),
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
            const SizedBox(height: AppTheme.space8),
            GestureDetector(
              onTap: () {
                // TODO: Chuyển sang màn bài học
              },
              child: Text(
                actionText,
                style: GoogleFonts.inter(
                  fontSize: 13,
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

  Widget _buildPriorityTaskCard(
    BuildContext context, {
    required String time,
    required String title,
    required String subtitle,
    String? actionText,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppTheme.space16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            border: const Border(
              left: BorderSide(color: AppColors.primary, width: 3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$time · $title',
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
              if (actionText != null) ...[
                const SizedBox(height: AppTheme.space8),
                GestureDetector(
                  onTap: onTap ?? () {
                    // TODO: Xem lịch học
                  },
                  child: Text(
                    actionText,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
