import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'exam_detail_screen.dart';

/// Màn 51 – Danh sách đề thi thử
class MockExamListScreen extends StatefulWidget {
  const MockExamListScreen({super.key});

  @override
  State<MockExamListScreen> createState() => _MockExamListScreenState();
}

class _MockExamListScreenState extends State<MockExamListScreen> {
  int _selectedFilter = 0; // 0: Tất cả, 1: Môn đại cương, 2: Đã làm

  final List<String> _filters = ['Tất cả', 'Môn đại cương', 'Đã làm'];

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
                      'Danh sách đề thi thử',
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

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppTheme.radiusInput),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded, // TODO: thay icon Figma
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.space12),
                    Expanded(
                      child: Text(
                        'Tìm kiếm môn học...',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.inputBorder,
                        ),
                      ),
                    ),
                  ],
                ),
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
                              : const Color(0xFFEAF8EF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          entry.value,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
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

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section: Danh mục môn học
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Danh mục môn học',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '4 môn khả dụng',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // 2x2 Grid of Subject Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildSubjectCard(
                            context,
                            icon: Icons.calculate_outlined, // TODO: thay icon Figma
                            iconBg: const Color(0xFFFEF0D6),
                            iconColor: const Color(0xFFB45309),
                            title: 'Toán cao\ncấp',
                            subtitle: '10 đề thi\nthử',
                            onTap: () {
                              Navigator.of(context).push(
                                AppSlideRoute(
                                  settings: const RouteSettings(name: ExamDetailScreen.routeName),
                                  page: const ExamDetailScreen(
                                    subjectTitle: 'Toán cao cấp',
                                    examTitle: 'Đề thi giữa kỳ 2026',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildSubjectCard(
                            context,
                            icon: Icons.laptop_chromebook_rounded, // TODO: thay icon Figma
                            iconBg: const Color(0xFFE0E7FF),
                            iconColor: const Color(0xFF4338CA),
                            title: 'Tin học đại\ncương',
                            subtitle: '8 đề thi thử\n',
                            onTap: () {
                              Navigator.of(context).push(
                                AppSlideRoute(
                                  settings: const RouteSettings(name: ExamDetailScreen.routeName),
                                  page: const ExamDetailScreen(
                                    subjectTitle: 'Tin học đại cương',
                                    examTitle: 'Đề thi giữa kỳ 2026',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildSubjectCard(
                            context,
                            icon: Icons.menu_book_rounded, // TODO: thay icon Figma
                            iconBg: const Color(0xFFFEF0D6),
                            iconColor: const Color(0xFFB45309),
                            title: 'Triết học\nMác - Lênin',
                            subtitle: '6 đề thi thử\n',
                            onTap: () {
                              Navigator.of(context).push(
                                AppSlideRoute(
                                  settings: const RouteSettings(name: ExamDetailScreen.routeName),
                                  page: const ExamDetailScreen(
                                    subjectTitle: 'Triết học Mác - Lênin',
                                    examTitle: 'Đề thi giữa kỳ 2026',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildSubjectCard(
                            context,
                            icon: Icons.balance_rounded, // TODO: thay icon Figma
                            iconBg: const Color(0xFFFDE8E8),
                            iconColor: const Color(0xFFDC2626),
                            title: 'Pháp luật đại\ncương',
                            subtitle: '5 đề thi thử\n',
                            onTap: () {
                              Navigator.of(context).push(
                                AppSlideRoute(
                                  settings: const RouteSettings(name: ExamDetailScreen.routeName),
                                  page: const ExamDetailScreen(
                                    subjectTitle: 'Pháp luật đại cương',
                                    examTitle: 'Đề thi giữa kỳ 2026',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Bottom Banner Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFEAF8EF), Color(0xFFD1F2DD)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.space8,
                              vertical: AppTheme.space4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.local_fire_department_rounded, // TODO: thay icon Figma
                                  color: AppColors.primary,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Bộ đề 2026',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Luyện đề - Đánh giá năng lực',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Chọn môn để bắt đầu',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
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
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: AppTheme.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: AppTheme.space4),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
