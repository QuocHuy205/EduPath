import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'my_courses_screen.dart';

class SubjectDetailScreen extends StatefulWidget {
  final CourseModel course;

  const SubjectDetailScreen({
    super.key,
    this.course = MockData.mathCourse,
  });

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  int _selectedTab = 0; // 0: Nội dung, 1: Tài liệu, 2: Đánh giá
  bool _isBookmarked = false;

  void _onStartLearning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Đã tham gia môn học "${widget.course.title}" thành công!',
          style: GoogleFonts.inter(fontSize: 14, color: AppColors.textWhite),
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusButton),
        ),
        action: SnackBarAction(
          label: 'Xem môn học',
          textColor: AppColors.textWhite,
          onPressed: () {
            Navigator.of(context).push(
              AppSlideRoute(page: const MyCoursesScreen(showBackButton: true)),
            );
          },
        ),
      ),
    );

    // Điều hướng sang màn hình Môn học của tôi
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        Navigator.of(context).push(
          AppSlideRoute(page: const MyCoursesScreen(showBackButton: true)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;

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
                        'Chi tiết môn học',
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
                        onPressed: () {
                          setState(() {
                            _isBookmarked = !_isBookmarked;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _isBookmarked
                                    ? 'Đã lưu môn học vào danh sách yêu thích'
                                    : 'Đã hủy lưu môn học',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: AppColors.textWhite,
                                ),
                              ),
                              backgroundColor: AppColors.primary,
                              duration: const Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          _isBookmarked
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_border_rounded,
                          color: _isBookmarked
                              ? AppColors.primary
                              : AppColors.textPrimary,
                          size: 24,
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
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                  vertical: AppTheme.space8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Course Overview Card
                    _buildCourseOverviewCard(course),

                    const SizedBox(height: AppTheme.space16),

                    // Segmented Tabs: [Nội dung], [Tài liệu], [Đánh giá]
                    _buildSegmentedTabs(),

                    const SizedBox(height: AppTheme.space16),

                    if (_selectedTab == 0) ...[
                      // Tab: Nội dung
                      _buildContentTab(course),
                    ] else if (_selectedTab == 1) ...[
                      // Tab: Tài liệu
                      _buildDocumentsTab(course),
                    ] else ...[
                      // Tab: Đánh giá
                      _buildReviewsTab(course),
                    ],

                    const SizedBox(height: AppTheme.space24),
                  ],
                ),
              ),
            ),

            // Fixed Bottom Bar with Sole Primary Button #118646
            _buildBottomActionBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseOverviewCard(CourseModel course) {
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
          // Course Icon Box
          Container(
            width: 58,
            height: 58,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: course.iconImage != null
                ? Image.asset(course.iconImage!, fit: BoxFit.contain)
                : const Icon(Icons.school_rounded, color: AppColors.primary, size: 30),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge
                if (course.badgeText != null && course.badgeText!.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: AppTheme.space4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      course.badgeText!,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                // Title
                Text(
                  course.title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 2),

                // Subtitle
                Text(
                  course.subtitle.isNotEmpty
                      ? course.subtitle
                      : '${course.category} • ${course.credits}',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: AppTheme.space8),

                // Metadata Row
                Row(
                  children: [
                    const Icon(Icons.star_rounded, size: 16, color: Color(0xFFF59E0B)),
                    const SizedBox(width: 4),
                    Text(
                      '${course.rating}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text('•', style: TextStyle(color: AppColors.textSecondary, fontSize: 10)),
                    const SizedBox(width: 6),
                    Text(
                      course.duration,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text('•', style: TextStyle(color: AppColors.textSecondary, fontSize: 10)),
                    const SizedBox(width: 6),
                    Text(
                      course.studentsCount,
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
        ],
      ),
    );
  }

  Widget _buildSegmentedTabs() {
    final tabs = ['Nội dung', 'Tài liệu', 'Đánh giá'];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF5F0),
        borderRadius: BorderRadius.circular(AppTheme.radiusButton),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tabs[index],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? AppColors.textWhite : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildContentTab(CourseModel course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Giới thiệu môn học
        Text(
          'Giới thiệu môn học',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.space8),
        Text(
          course.description.isNotEmpty
              ? course.description
              : 'Môn học cung cấp kiến thức nền tảng và phương pháp giải quyết vấn đề thực tế.',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),

        const SizedBox(height: AppTheme.space16),

        // 2. Stats Grid (4 hộp thông số)
        Row(
          children: [
            Expanded(
              child: _buildStatBox(course.duration, 'Thời lượng'),
            ),
            const SizedBox(width: AppTheme.space12),
            Expanded(
              child: _buildStatBox('${course.lessonsCount} bài', 'Bài học'),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.space12),
        Row(
          children: [
            Expanded(
              child: _buildStatBox('${course.testsCount} bài', 'Bài test'),
            ),
            const SizedBox(width: AppTheme.space12),
            Expanded(
              child: _buildStatBox('${course.documentsCount}', 'Tài liệu'),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.space24),

        // 3. Bạn sẽ học được gì?
        Text(
          'Bạn sẽ học được gì?',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.space12),
        ...course.learningOutcomes.map((outcome) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.space8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.success,
                  size: 18,
                ),
                const SizedBox(width: AppTheme.space8),
                Expanded(
                  child: Text(
                    outcome,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppTheme.space24),

        // 4. Nội dung chương trình
        Text(
          'Nội dung chương trình',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.space12),
        ...course.chapters.map((chapter) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppTheme.space12),
            padding: const EdgeInsets.all(AppTheme.space12),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    chapter.number,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapter.title,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${chapter.lessonCount} bài học',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.play_circle_outline_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppTheme.space16),

        // 5. Tài liệu & Ôn thi
        Text(
          'Tài liệu & Ôn thi',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.space12),
        Container(
          padding: const EdgeInsets.all(AppTheme.space12),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF7EB),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.description_outlined,
                  color: AppColors.warning,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.examPrepTitle,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      course.examPrepSubtitle,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.file_download_outlined,
                color: AppColors.primary,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentsTab(CourseModel course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Tài liệu học tập (${course.documentsCount} tài liệu)',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppTheme.space12),
        _buildDocumentItem(
          'Giáo trình ${course.title} (Bản chuẩn 2026)',
          'PDF • 14.5 MB',
          Icons.picture_as_pdf_rounded,
        ),
        _buildDocumentItem(
          'Tổng hợp công thức & sơ đồ tư duy',
          'PDF • 4.2 MB',
          Icons.picture_as_pdf_rounded,
        ),
        _buildDocumentItem(
          'Đề cương ôn tập & giải chi tiết 5 kỳ gần nhất',
          'ZIP • 28.0 MB',
          Icons.folder_zip_rounded,
        ),
        _buildDocumentItem(
          'Bộ slide bài giảng trọn gói giảng viên',
          'PPTX • 45.1 MB',
          Icons.slideshow_rounded,
        ),
      ],
    );
  }

  Widget _buildDocumentItem(String title, String meta, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.space12),
      padding: const EdgeInsets.all(AppTheme.space12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  meta,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.download_rounded,
            color: AppColors.primary,
            size: 22,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab(CourseModel course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Đánh giá từ học viên',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star_rounded, size: 18, color: Color(0xFFF59E0B)),
                const SizedBox(width: 4),
                Text(
                  '${course.rating} / 5.0',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppTheme.space12),
        _buildReviewCard(
          'Nguyễn Văn An',
          '4.9',
          'Bài giảng rất dễ hiểu, thầy giải bài chi tiết. Mình thi giữa kỳ đạt 9.5 điểm nhờ tài liệu ôn tập của EduPath!',
          '2 ngày trước',
        ),
        _buildReviewCard(
          'Trần Thị Mai',
          '5.0',
          'Lộ trình rõ ràng, bài tập ma trận và tích phân có video chữa từng bước. Rất đáng học!',
          '1 tuần trước',
        ),
      ],
    );
  }

  Widget _buildReviewCard(String author, String rating, String comment, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.space12),
      padding: const EdgeInsets.all(AppTheme.space12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                author,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded, size: 14, color: Color(0xFFF59E0B)),
                  const SizedBox(width: 2),
                  Text(
                    rating,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            comment,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 10,
              color: AppColors.inputBorder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space12,
        vertical: AppTheme.space12,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space12,
      ),
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: _onStartLearning,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // Nút chính #118646 duy nhất theo quy tắc
              foregroundColor: AppColors.textWhite,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusButton),
              ),
            ),
            child: Text(
              'Bắt đầu học',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
