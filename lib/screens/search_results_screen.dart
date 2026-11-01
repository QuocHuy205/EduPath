import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'subject_detail_screen.dart';
import 'search_filter_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  final String initialQuery;
  final String? initialCategory;

  const SearchResultsScreen({
    super.key,
    this.initialQuery = 'Toán cao cấp',
    this.initialCategory,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late TextEditingController _searchController;
  int _selectedType = 0; // 0: Tất cả, 1: Khóa học, 2: Tài liệu
  final List<String> _types = ['Tất cả', 'Khóa học', 'Tài liệu'];

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

  void _openFilter() {
    Navigator.of(context).push(
      AppSlideRoute(page: const SearchFilterScreen()),
    );
  }

  void _navigateToDetail(CourseModel course) {
    Navigator.of(context).push(
      AppSlideRoute(page: SubjectDetailScreen(course: course)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = MockData.searchResults;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space16,
                vertical: AppTheme.space12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textPrimary,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                      ),
                      const SizedBox(width: AppTheme.space8),
                      Text(
                        'Kết quả tìm kiếm',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            // Search Bar with clear icon & filter action
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
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
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nhập nội dung tìm kiếm...',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.inputBorder,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                      ),
                    ),
                    if (_searchController.text.isNotEmpty)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: AppColors.textSecondary,
                          size: 18,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: _openFilter,
                      icon: const Icon(
                        Icons.tune_rounded,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppTheme.space12),

            // Results count + Filter Chips Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Row(
                children: [
                  Text(
                    'Tìm thấy 12 kết quả',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: List.generate(_types.length, (index) {
                      final isSelected = _selectedType == index;
                      return Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedType = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.border,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              _types[index],
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected
                                    ? AppColors.textWhite
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.space12),

            // Results list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                  vertical: AppTheme.space8,
                ),
                itemCount: results.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppTheme.space12),
                itemBuilder: (context, index) {
                  final item = results[index];
                  return _buildResultCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(CourseModel item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _navigateToDetail(item),
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.space12),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 44,
                  height: 44,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: item.iconImage != null
                      ? Image.asset(item.iconImage!, fit: BoxFit.contain)
                      : const Icon(
                          Icons.functions_rounded,
                          color: AppColors.primary,
                          size: 22,
                        ),
                ),
                const SizedBox(width: AppTheme.space12),
                // Text details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primary,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
