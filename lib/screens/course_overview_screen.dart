import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'course_content_screen.dart';

/// Màn 31 – Tổng quan khóa học (trước khi đăng ký)
class CourseOverviewScreen extends StatelessWidget {
  const CourseOverviewScreen({super.key});

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
                      'Tổng quan khóa học',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space12),

                    // Brand Subheader
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Edu',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text: 'Path',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppTheme.space4),
                    Text(
                      'Tìm hiểu trước khi đăng ký học',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: TOÁN CAO CẤP
                    Text(
                      'TOÁN CAO CẤP',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space8),

                    // Course Info Card
                    Container(
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
                            'Toán cao cấp',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Giải tích và đại số tuyến tính cơ bản',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space12),
                          Text(
                            '3 tín chỉ · 12 tuần · 48 bài học',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Giảng viên: Nguyễn Văn A',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: BẠN SẼ NHẬN ĐƯỢC
                    Text(
                      'BẠN SẼ NHẬN ĐƯỢC',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space8),

                    Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        children: [
                          _buildBenefitItem(
                            'Kiến thức nền tảng',
                            'Giới hạn, đạo hàm, tích phân',
                          ),
                          const Divider(color: AppColors.border, height: 24),
                          _buildBenefitItem(
                            'Học liệu đi kèm',
                            'Video, PDF, bài tập có lời giải',
                          ),
                          const Divider(color: AppColors.border, height: 24),
                          _buildBenefitItem(
                            'Luyện tập theo chương',
                            'Theo dõi kết quả và tiến độ',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: LỘ TRÌNH HỌC DỰ KIẾN
                    Text(
                      'LỘ TRÌNH HỌC DỰ KIẾN',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space8),

                    _buildRoadmapCard(
                      context,
                      title: 'Tuần 1–3 · Hàm số và giới hạn',
                      subtitle: '12 bài học · 3 bài kiểm tra',
                      linkText: 'Xem đề cương →',
                    ),
                    const SizedBox(height: AppTheme.space12),
                    _buildRoadmapCard(
                      context,
                      title: 'Tuần 4–8 · Đạo hàm và ứng dụng',
                      subtitle: '20 bài học · 5 bài luyện tập',
                      linkText: 'Xem nội dung →',
                    ),
                    const SizedBox(height: AppTheme.space12),
                    _buildRoadmapCard(
                      context,
                      title: 'Tuần 9–12 · Tích phân và ôn tập',
                      subtitle: '16 bài học · 2 đề thi thử',
                      linkText: 'Xem nội dung →',
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: TRƯỚC KHI ĐĂNG KÝ
                    Text(
                      'TRƯỚC KHI ĐĂNG KÝ',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space8),

                    Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildConditionItem('Điều kiện tham gia', 'Không yêu cầu môn tiên quyết'),
                          const Divider(color: AppColors.border, height: 24),
                          _buildConditionItem('Hình thức', 'Học trực tuyến · Tự chọn lịch'),
                          const Divider(color: AppColors.border, height: 24),
                          _buildConditionItem('Chi phí', 'Miễn phí · Truy cập tài liệu cơ bản'),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space32),
                  ],
                ),
              ),
            ),

            // Bottom CTA
            Container(
              padding: const EdgeInsets.all(AppTheme.space16),
              decoration: const BoxDecoration(
                color: AppColors.cardBackground,
                border: Border(
                  top: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Material(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          AppSlideRoute(page: const CourseContentScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                      child: Center(
                        child: Text(
                          'Đăng ký học miễn phí',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_rounded, // TODO: thay icon Figma
          color: AppColors.primary,
          size: 20,
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
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppTheme.space4),
              Text(
                desc,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoadmapCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String linkText,
  }) {
    return Container(
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
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppTheme.space4),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppTheme.space8),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                AppSlideRoute(page: const CourseContentScreen()),
              );
            },
            child: Text(
              linkText,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConditionItem(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.space4),
        Text(
          desc,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
