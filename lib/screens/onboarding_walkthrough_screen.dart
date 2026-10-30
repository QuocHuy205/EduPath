import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'login_screen.dart';

class OnboardingWalkthroughScreen extends StatefulWidget {
  const OnboardingWalkthroughScreen({super.key});

  @override
  State<OnboardingWalkthroughScreen> createState() =>
      _OnboardingWalkthroughScreenState();
}

class _OnboardingWalkthroughScreenState
    extends State<OnboardingWalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title1': 'Học theo lộ trình',
      'title2': 'Dễ dàng, hiệu quả',
      'desc': 'Truy cập bài giảng, video, tài liệu\ncủa các môn đại cương.',
      'image': 'assets/images/onboard_target.png',
      'bottomTitle': '',
      'bottomDesc': '',
    },
    {
      'title1': 'Luyện tập mỗi ngày',
      'title2': 'Tiến bộ rõ rệt',
      'desc': 'Trắc nghiệm và thi thử theo môn học',
      'image': 'assets/images/onboard_laptop.png',
      'bottomTitle': 'Luyện tập trắc nghiệm và thi thử',
      'bottomDesc': 'Theo dõi kết quả để cải thiện mỗi ngày',
    },
    {
      'title1': 'Học đúng hướng',
      'title2': 'Mở rộng tương lai',
      'desc': 'Lộ trình học phù hợp với bạn',
      'image': 'assets/images/onboard_target.png',
      'bottomTitle': 'Truy cập bài giảng, video và tài liệu',
      'bottomDesc': 'Học từng chương theo lộ trình rõ ràng',
    },
  ];

  void _goToLogin() {
    Navigator.of(context).pushReplacement(
      AppSlideRoute(page: const LoginScreen()),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _goToLogin();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Khối trang trí nền (Soft decorative circles)
          Positioned(
            top: -40,
            right: -60,
            child: IgnorePointer(
              child: Container(
                width: 260,
                height: 260,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 240,
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
          Positioned(
            bottom: 120,
            right: -60,
            child: IgnorePointer(
              child: Container(
                width: 220,
                height: 220,
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
                // Thanh trên cùng: Nút "Bỏ qua"
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space24,
                    vertical: AppTheme.space12,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: _goToLogin,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.textPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.space12,
                          vertical: AppTheme.space8,
                        ),
                      ),
                      child: Text(
                        'Bỏ qua',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),

                // Nội dung trượt các trang 02.png, 03.png, 04.png
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final item = _pages[index];
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.space24,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: AppTheme.space8),

                            // Tiêu đề 1 (Xanh lá)
                            Text(
                              item['title1']!,
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppTheme.space8),

                            // Tiêu đề 2 (Đen đậm)
                            Text(
                              item['title2']!,
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppTheme.space12),

                            // Mô tả
                            Text(
                              item['desc']!,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppTheme.space24),

                            // Hình minh họa
                            Image.asset(
                              item['image']!,
                              height: 240,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: AppTheme.space24),

                            // Thông tin thẻ dưới (chỉ có ở màn 03, 04)
                            if (item['bottomTitle']!.isNotEmpty) ...[
                              Text(
                                item['bottomTitle']!,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppTheme.space4),
                              Text(
                                item['bottomDesc']!,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Thanh điều khiển dưới đáy: Chấm chỉ số trang & Nút chuyển tiếp
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.space24,
                    vertical: AppTheme.space24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 52), // Để cân đối căn giữa các chấm

                      // Các chấm chỉ thị trang (Page Indicator Dots)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          _pages.length,
                          (dotIndex) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == dotIndex
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                          ),
                        ),
                      ),

                      // Nút tiếp theo hình vuông bo góc màu xanh
                      InkWell(
                        onTap: _nextPage,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.textWhite,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
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
