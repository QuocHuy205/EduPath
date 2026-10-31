import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import '../widgets/image_slot.dart';
import 'course_detail_screen.dart';

/// Màn 15 – Kết quả tìm kiếm
class SearchResultScreen extends StatefulWidget {
  final String initialQuery;

  const SearchResultScreen({
    super.key,
    this.initialQuery = 'Toán cao cấp',
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController _searchController;
  int _selectedFilter = 0;

  final List<String> _filters = ['Tất cả', 'Bài giảng', 'Tài liệu'];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = MockData.searchResults;

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
                    child: Text(
                      'Kết quả tìm kiếm',
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

            const SizedBox(height: AppTheme.space12),

            // Search field
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
                      size: 22,
                    ),
                    const SizedBox(width: AppTheme.space12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.space12),

            // Result count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Text(
                'Tìm thấy ${results.length * 3} kết quả',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ),

            const SizedBox(height: AppTheme.space12),

            // Filter chips
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

            // Course list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                ),
                itemCount: results.length,
                separatorBuilder: (_, _) => const SizedBox(height: AppTheme.space12),
                itemBuilder: (context, index) {
                  final course = results[index];
                  return _buildCourseCard(context, course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, CourseModel course) {
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
              width: 64,
              height: 64,
              borderRadius: 12,
            ),
            const SizedBox(width: AppTheme.space16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.space4),
                  Text(
                    '${course.category} • ${course.credits}',
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
              color: AppColors.primary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
