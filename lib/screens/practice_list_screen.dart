import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/image_slot.dart';
import 'practice_setup_screen.dart';
import 'mock_exam_list_screen.dart';

/// Màn 41 – Danh sách bài luyện tập
class PracticeListScreen extends StatefulWidget {
  static const String routeName = '/practice_list';

  const PracticeListScreen({super.key});

  @override
  State<PracticeListScreen> createState() => _PracticeListScreenState();
}

class _PracticeListScreenState extends State<PracticeListScreen> {
  int _selectedTab = 0; // 0: Luyện tập, 1: Thi thử
  int _selectedSubject = 0; // 0: Tất cả, 1: Tin học, 2: Toán

  final List<String> _subjects = ['Tất cả', 'Tin học', 'Toán'];

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
                      'Danh sách bài luyện tập',
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

            // Top Switch: Luyện tập | Thi thử →
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                        decoration: BoxDecoration(
                          color: _selectedTab == 0
                              ? AppColors.primaryLight
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: _selectedTab == 0
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Luyện tập',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _selectedTab == 0
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.space12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _selectedTab = 1);
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: const MockExamListScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: AppTheme.space12),
                        decoration: BoxDecoration(
                          color: _selectedTab == 1
                              ? AppColors.primaryLight
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: _selectedTab == 1
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Thi thử →',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _selectedTab == 1
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    // Goal Banner Card
                    Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppTheme.space8,
                                    vertical: AppTheme.space4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'MỤC TIÊU HÔM NAY',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textWhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space8),
                                Text(
                                  'Luyện tập mỗi ngày - Nắm chắc kiến thức',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space8),
                                Text(
                                  '3 bài tập đang chờ bạn hoàn thành!',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppColors.textWhite.withValues(alpha: 0.85),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppTheme.space12),
                          const ImageSlot(
                            assetPath: 'assets/images/banner_practice_goal.png',
                            width: 80,
                            height: 72,
                            borderRadius: 10,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Chọn môn học
                    Text(
                      'Chọn môn học',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // Filter chips
                    Row(
                      children: _subjects.asMap().entries.map((entry) {
                        final isSelected = _selectedSubject == entry.key;
                        return Padding(
                          padding: const EdgeInsets.only(right: AppTheme.space8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _selectedSubject = entry.key);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.space16,
                                vertical: AppTheme.space8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryLight
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
                                entry.value,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Practice Cards List
                    _buildPracticeCard(
                      context,
                      imagePath: 'assets/images/ic_practice_laptop.png',
                      title: 'Chương 2 – Hệ điều hành',
                      subject: 'Tin học đại cương',
                      meta: '10 câu · 10 phút · Cao nhất: 7/10',
                    ),
                    const SizedBox(height: AppTheme.space12),

                    _buildPracticeCard(
                      context,
                      imagePath: 'assets/images/ic_practice_laptop.png',
                      title: 'Chương 1 – Máy tính',
                      subject: 'Tin học đại cương',
                      meta: '20 câu · 20 phút · Chưa làm',
                    ),
                    const SizedBox(height: AppTheme.space12),

                    _buildPracticeCard(
                      context,
                      imagePath: 'assets/images/ic_practice_math.png',
                      title: 'Ôn tập kiến thức cơ bản',
                      subject: 'Toán cao cấp',
                      meta: '10 câu · 10 phút · Cao nhất: 8/10',
                    ),

                    const SizedBox(height: AppTheme.space32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subject,
    required String meta,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlot(
            assetPath: imagePath,
            width: 64,
            height: 64,
            borderRadius: 12,
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
                const SizedBox(height: AppTheme.space4),
                Text(
                  subject,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppTheme.space4),
                Text(
                  meta,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppTheme.space8),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          AppSlideRoute(
                            page: PracticeSetupScreen(title: title),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textWhite,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Làm bài',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: AppTheme.space4),
                          const Icon(Icons.arrow_forward_rounded, size: 14), // TODO: thay icon Figma
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
