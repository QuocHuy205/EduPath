import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'search_screen.dart';
import 'search_results_screen.dart';

class SubjectCategoriesScreen extends StatefulWidget {
  final bool showBackButton;

  const SubjectCategoriesScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  State<SubjectCategoriesScreen> createState() =>
      _SubjectCategoriesScreenState();
}

class _SubjectCategoriesScreenState extends State<SubjectCategoriesScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['Tất cả', 'Đại cương', 'Ngoại ngữ'];

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
              // Thanh tiêu đề trên cùng (App Bar)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (widget.showBackButton) ...[
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
                      ],
                      Text(
                        'Danh mục môn học',
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
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space16),

              // Ô tìm kiếm môn học
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    AppSlideRoute(page: const SearchScreen()),
                  );
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
                      Expanded(
                        child: Text(
                          'Tìm kiếm danh mục...',
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

              const SizedBox(height: AppTheme.space16),

              // Hàng nút lọc (Filter chips)
              Row(
                children: List.generate(_filters.length, (index) {
                  final isSelected = _selectedFilter == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: AppTheme.space8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedFilter = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          _filters[index],
                          style: GoogleFonts.inter(
                            fontSize: 13,
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

              const SizedBox(height: AppTheme.space16),

              // Lưới 2 cột các danh mục môn học (Category Grid)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppTheme.space12,
                  mainAxisSpacing: AppTheme.space12,
                  childAspectRatio: 1.15,
                ),
                itemCount: MockData.categories.length,
                itemBuilder: (context, index) {
                  final cat = MockData.categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: cat.backgroundColor,
                      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      border: Border.all(color: AppColors.border, width: 0.5),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // Điều hướng sang màn hình Kết quả tìm kiếm theo danh mục
                          Navigator.of(context).push(
                            AppSlideRoute(
                              page: SearchResultsScreen(
                                initialQuery: cat.title,
                                initialCategory: cat.title,
                              ),
                            ),
                          );
                        },
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusCard),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              cat.iconImage,
                              height: 52,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: AppTheme.space8),
                            Text(
                              cat.title,
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: AppTheme.space4),
                            Text(
                              '${cat.courseCount} môn',
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
                },
              ),

              const SizedBox(height: AppTheme.space24),
            ],
          ),
        ),
      ),
    );
  }
}
