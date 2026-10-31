import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'quiz_screen.dart';

/// Màn 26 – Bài tập của tôi
class MyAssignmentsScreen extends StatefulWidget {
  const MyAssignmentsScreen({super.key});

  @override
  State<MyAssignmentsScreen> createState() => _MyAssignmentsScreenState();
}

class _MyAssignmentsScreenState extends State<MyAssignmentsScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Tất cả', 'Đang làm', 'Đã nộp', 'Quá hạn'];

  @override
  Widget build(BuildContext context) {
    final assignments = MockData.myAssignments;
    final dangLam = assignments.where((a) => a.status == 'dang_lam').length;
    final daNop = assignments.where((a) => a.status == 'da_nop').length;
    final chuaLam = assignments.where((a) => a.status == 'chua_lam').length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
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
                    child: Center(
                      child: Text(
                        'Bài tập của tôi',
                        style: AppTheme.h2,
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

            // Filter tabs
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
                          horizontal: AppTheme.space12,
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

            // Summary card
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
                    Text(
                      'Tổng quan bài tập',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space4),
                    Row(
                      children: [
                        Text(
                          '${assignments.length} bài tập',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Text(
                          '$dangLam đang làm  •  $daNop đã nộp  •  $chuaLam chưa làm',
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
            ),

            const SizedBox(height: AppTheme.space16),

            // Assignment list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                ),
                itemCount: assignments.length,
                separatorBuilder: (_, _) => const SizedBox(height: AppTheme.space16),
                itemBuilder: (context, index) {
                  return _buildAssignmentCard(context, assignments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentCard(BuildContext context, AssignmentModel assignment) {
    // Status label and color
    String statusLabel;
    Color statusBg;
    Color statusFg;
    switch (assignment.status) {
      case 'da_nop':
        statusLabel = 'Đã nộp';
        statusBg = AppColors.primary;
        statusFg = AppColors.textWhite;
        break;
      case 'chua_lam':
        statusLabel = 'Chưa làm';
        statusBg = AppColors.border;
        statusFg = AppColors.textPrimary;
        break;
      default:
        statusLabel = 'Đang làm';
        statusBg = AppColors.border;
        statusFg = AppColors.textPrimary;
    }

    // Icon bg color based on file type
    Color iconBgColor;
    IconData iconData;
    switch (assignment.status) {
      case 'da_nop':
        iconBgColor = AppColors.primaryLight;
        iconData = Icons.spellcheck_rounded; // TODO: thay icon Figma
        break;
      case 'chua_lam':
        iconBgColor = AppColors.primaryLight;
        iconData = Icons.bar_chart_rounded; // TODO: thay icon Figma
        break;
      default:
        iconBgColor = assignment.iconBgColor;
        iconData = assignment.icon;
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          AppSlideRoute(
            page: QuizScreen(title: assignment.title),
          ),
        );
      },
      child: Container(
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
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    iconData,
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
                        assignment.title,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.space4),
                      Text(
                        '${assignment.courseName} • Hạn: ${assignment.deadline}',
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
                  color: AppColors.textSecondary,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space12,
                vertical: AppTheme.space4,
              ),
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                statusLabel,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: statusFg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
