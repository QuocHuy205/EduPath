import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import '../widgets/image_slot.dart';
import 'course_overview_screen.dart';

/// Màn 16 – Chi tiết môn học (trước đăng ký)
class CourseDetailScreen extends StatefulWidget {
  final CourseModel course;

  const CourseDetailScreen({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Giới thiệu', 'Nội dung', 'Tài liệu'];

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
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Chi tiết môn học',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    'EduPath',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space16),

                    // Course header card
                    Container(
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Row(
                        children: [
                          ImageSlot(
                            assetPath: widget.course.iconImage ?? 'assets/images/cat_math.png',
                            width: 64,
                            height: 64,
                            borderRadius: 14,
                          ),
                          const SizedBox(width: AppTheme.space16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TOÁN ĐẠI CƯƠNG',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space4),
                                Text(
                                  widget.course.title,
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space4),
                                Text(
                                  'Giải tích & Đại số tuyến tính',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.space8),
                                Text(
                                  '3 tín chỉ  •  48 bài học  •  8.2K học viên',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Tabs
                    Row(
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

                    const SizedBox(height: AppTheme.space24),

                    // Tab content
                    _buildIntroTab(),

                    const SizedBox(height: AppTheme.space24),

                    _buildChaptersSection(),

                    const SizedBox(height: AppTheme.space24),

                    _buildDocumentsSection(),

                    const SizedBox(height: AppTheme.space24),
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
                          AppSlideRoute(
                            page: const CourseOverviewScreen(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                      child: Center(
                        child: Text(
                          'Bắt đầu học',
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

  Widget _buildIntroTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Giới thiệu môn học', style: AppTheme.h3),
        const SizedBox(height: AppTheme.space12),
        Text(
          'Trang bị kiến thức nền tảng về giới hạn, đạo hàm, tích phân '
          'và đại số tuyến tính; hỗ trợ học tập các ngành kỹ thuật, kinh '
          'tế và công nghệ.',
          style: AppTheme.body,
        ),
        const SizedBox(height: AppTheme.space16),

        // Stats grid
        Container(
          padding: const EdgeInsets.all(AppTheme.space16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildStatItem('45 giờ', 'Thời lượng')),
                  Container(width: 1, height: 40, color: AppColors.border),
                  Expanded(child: _buildStatItem('48 bài', 'Bài học')),
                ],
              ),
              const Divider(color: AppColors.border, height: 24),
              Row(
                children: [
                  Expanded(child: _buildStatItem('8 bài', 'Kiểm tra')),
                  Container(width: 1, height: 40, color: AppColors.border),
                  Expanded(child: _buildStatItem('20', 'Tài liệu')),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppTheme.space24),

        // "Bạn sẽ học được gì?"
        Text('Bạn sẽ học được gì?', style: AppTheme.h3),
        const SizedBox(height: AppTheme.space12),
        Container(
          padding: const EdgeInsets.all(AppTheme.space16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Column(
            children: [
              _buildLearningOutcome('Nắm vững các kiến thức giải tích cơ bản'),
              const SizedBox(height: AppTheme.space12),
              _buildLearningOutcome('Giải bài toán ma trận và hệ phương trình'),
              const SizedBox(height: AppTheme.space12),
              _buildLearningOutcome('Luyện tập theo dạng đề thi đại học'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
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
        ),
      ],
    );
  }

  Widget _buildLearningOutcome(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_rounded, // TODO: thay icon Figma
          color: AppColors.primary,
          size: 20,
        ),
        const SizedBox(width: AppTheme.space8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChaptersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nội dung chương trình', style: AppTheme.h3),
        const SizedBox(height: AppTheme.space12),
        ...MockData.courseChapters.map((chapter) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppTheme.space12),
            padding: const EdgeInsets.all(AppTheme.space16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${chapter.number < 10 ? '0' : ''}${chapter.number}',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.space16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapter.title,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.space4),
                      Text(
                        '${chapter.lessonCount} bài học',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDocumentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tài liệu & ôn thi', style: AppTheme.h3),
        const SizedBox(height: AppTheme.space12),
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
              Text(
                '20 tài liệu học tập và 8 bài kiểm tra',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppTheme.space4),
              Text(
                'Có bài tập thực hành và câu hỏi trắc nghiệm',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
