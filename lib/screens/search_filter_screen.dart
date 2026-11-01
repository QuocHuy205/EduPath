import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  // Loại nội dung: 0: Tất cả, 1: Môn học, 2: Bài học
  int _contentType = 0;
  final List<String> _contentTypes = ['Tất cả', 'Môn học', 'Bài học'];

  // Danh mục checkboxes
  final Map<String, bool> _categories = {
    'Môn đại cương': true,
    'Ngoại ngữ': false,
    'Kỹ năng': false,
    'Tài liệu': false,
  };

  // Sắp xếp theo: 0: Tất cả, 1: Mới nhất, 2: Phổ biến
  int _sortBy = 0;
  final List<String> _sortOptions = ['Tất cả', 'Mới nhất', 'Phổ biến'];

  // Trình độ: 0: Tất cả, 1: Cơ bản, 2: Nâng cao
  int _level = 0;
  final List<String> _levels = ['Tất cả', 'Cơ bản', 'Nâng cao'];

  void _resetFilter() {
    setState(() {
      _contentType = 0;
      _sortBy = 0;
      _level = 0;
      _categories.updateAll((key, value) => key == 'Môn đại cương');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Khối trang trí nền mềm
          Positioned(
            top: 220,
            right: -80,
            child: IgnorePointer(
              child: Container(
                width: 240,
                height: 240,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: -80,
            child: IgnorePointer(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space24,
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
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: AppColors.textPrimary,
                                    size: 20,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                                const SizedBox(width: AppTheme.space12),
                                Text(
                                  'Bộ lọc tìm kiếm',
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

                        const SizedBox(height: AppTheme.space24),

                        // Phần 1: Loại nội dung + Đặt lại
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Loại nội dung',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            GestureDetector(
                              onTap: _resetFilter,
                              child: Text(
                                'Đặt lại',
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

                        // Pills loại nội dung
                        _buildPills(
                          options: _contentTypes,
                          selectedIndex: _contentType,
                          onSelected: (idx) {
                            setState(() {
                              _contentType = idx;
                            });
                          },
                        ),

                        const SizedBox(height: AppTheme.space24),

                        // Phần 2: Danh mục (Hộp chọn)
                        Text(
                          'Danh mục',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        const SizedBox(height: AppTheme.space12),

                        ..._categories.keys.map((catName) {
                          final isChecked = _categories[catName]!;
                          return Container(
                            margin: const EdgeInsets.only(bottom: AppTheme.space8),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius:
                                  BorderRadius.circular(AppTheme.radiusInput),
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _categories[catName] = !isChecked;
                                  });
                                },
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radiusInput),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppTheme.space16,
                                    vertical: AppTheme.space12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        catName,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      Icon(
                                        isChecked
                                            ? Icons.check_box_rounded
                                            : Icons.check_box_outline_blank_rounded,
                                        color: isChecked
                                            ? AppColors.textSecondary
                                            : AppColors.primary,
                                        size: 22,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),

                        const SizedBox(height: AppTheme.space24),

                        // Phần 3: Sắp xếp theo
                        Text(
                          'Sắp xếp theo',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        const SizedBox(height: AppTheme.space12),

                        _buildPills(
                          options: _sortOptions,
                          selectedIndex: _sortBy,
                          onSelected: (idx) {
                            setState(() {
                              _sortBy = idx;
                            });
                          },
                        ),

                        const SizedBox(height: AppTheme.space24),

                        // Phần 4: Trình độ
                        Text(
                          'Trình độ',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        const SizedBox(height: AppTheme.space12),

                        _buildPills(
                          options: _levels,
                          selectedIndex: _level,
                          onSelected: (idx) {
                            setState(() {
                              _level = idx;
                            });
                          },
                        ),

                        const SizedBox(height: AppTheme.space24),
                      ],
                    ),
                  ),
                ),

                // Nút cố định ở dưới "Áp dụng bộ lọc"
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space24,
                    vertical: AppTheme.space16,
                  ),
                  child: AppButton(
                    text: 'Áp dụng bộ lọc',
                    height: 52,
                    borderRadius: 12,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPills({
    required List<String> options,
    required int selectedIndex,
    required ValueChanged<int> onSelected,
  }) {
    return Row(
      children: List.generate(options.length, (index) {
        final isSelected = selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.only(right: AppTheme.space8),
          child: InkWell(
            onTap: () => onSelected(index),
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
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: 1,
                ),
              ),
              child: Text(
                options[index],
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? AppColors.textWhite
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
