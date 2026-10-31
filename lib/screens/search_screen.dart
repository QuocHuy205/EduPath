import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'search_filter_screen.dart';
import 'search_results_screen.dart';
import 'subject_detail_screen.dart';
import 'main_navigation_screen.dart';

class SearchScreen extends StatefulWidget {
  final bool showBackButton;

  const SearchScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = List.from(MockData.recentSearches);

  void _openFilter() {
    Navigator.of(context).push(
      AppSlideRoute(page: const SearchFilterScreen()),
    );
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    if (!_recentSearches.contains(query.trim())) {
      setState(() {
        _recentSearches.insert(0, query.trim());
      });
    }
    Navigator.of(context).push(
      AppSlideRoute(page: SearchResultsScreen(initialQuery: query.trim())),
    );
  }

  void _clearRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              // Thanh tiêu đề trên cùng
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
                        'Tìm kiếm',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _openFilter,
                        icon: const Icon(
                          Icons.tune_rounded,
                          color: AppColors.textPrimary,
                          size: 22,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 34,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space16),

              // Ô nhập tìm kiếm với nút bộ lọc
              Container(
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
                      child: TextField(
                        controller: _searchController,
                        onSubmitted: _performSearch,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm môn học, bài giảng...',
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
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: _openFilter,
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.space24),

              // Phần "Tìm kiếm gần đây"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tìm kiếm gần đây',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: _clearRecentSearches,
                    child: Text(
                      'Xóa tất cả',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space12),

              // Danh sách thẻ tìm kiếm gần đây
              Wrap(
                spacing: AppTheme.space8,
                runSpacing: AppTheme.space8,
                children: _recentSearches.map((tag) {
                  return InkWell(
                    onTap: () {
                      _searchController.text = tag;
                      _performSearch(tag);
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.space16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.border,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: AppTheme.space24),

              // Phần "Đề xuất cho bạn"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Đề xuất cho bạn',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Đã cập nhật danh sách đề xuất mới nhất',
                            style: GoogleFonts.inter(fontSize: 13, color: AppColors.textWhite),
                          ),
                          backgroundColor: AppColors.primary,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text(
                      'Làm mới',
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

              // Danh sách thẻ đề xuất
              ...MockData.searchRecommendations.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: AppTheme.space12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: SubjectDetailScreen(course: item),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.space12),
                        child: Row(
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: item.iconImage != null
                                  ? Image.asset(
                                      item.iconImage!,
                                      fit: BoxFit.contain,
                                    )
                                  : const Icon(
                                      Icons.school,
                                      color: AppColors.primary,
                                      size: 24,
                                    ),
                            ),
                            const SizedBox(width: AppTheme.space12),
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
                                    item.subtitle.isNotEmpty
                                        ? item.subtitle
                                        : '${item.category} • ${item.credits}',
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
              }),

              const SizedBox(height: AppTheme.space24),
            ],
          ),
        ),
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
                _buildSearchNavItem(
                  context,
                  label: 'Trang chủ',
                  icon: Icons.home_outlined,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MainNavigationScreen(initialIndex: 0),
                        transitionDuration: Duration.zero,
                      ),
                      (route) => false,
                    );
                  },
                ),
                _buildSearchNavItem(
                  context,
                  label: 'Khám phá',
                  icon: Icons.grid_view_outlined,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MainNavigationScreen(initialIndex: 1),
                        transitionDuration: Duration.zero,
                      ),
                      (route) => false,
                    );
                  },
                ),
                _buildSearchNavItem(
                  context,
                  label: 'Học tập',
                  icon: Icons.article_outlined,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MainNavigationScreen(initialIndex: 2),
                        transitionDuration: Duration.zero,
                      ),
                      (route) => false,
                    );
                  },
                ),
                _buildSearchNavItem(
                  context,
                  label: 'Yêu thích',
                  icon: Icons.favorite_outline_rounded,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MainNavigationScreen(initialIndex: 3),
                        transitionDuration: Duration.zero,
                      ),
                      (route) => false,
                    );
                  },
                ),
                _buildSearchNavItem(
                  context,
                  label: 'Cá nhân',
                  icon: Icons.person_outline_rounded,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MainNavigationScreen(initialIndex: 4),
                        transitionDuration: Duration.zero,
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchNavItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
