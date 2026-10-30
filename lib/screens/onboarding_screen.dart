import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/app_button.dart';
import 'onboarding_walkthrough_screen.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Các hình khối tròn trang trí nền (Soft decorative background shapes)
          Positioned(
            top: -60,
            left: -80,
            child: IgnorePointer(
              child: Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: -70,
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
          Positioned(
            bottom: -60,
            left: -80,
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

          // Nội dung chính: cuộn an toàn trên màn hình nhỏ hoặc khi xoay ngang
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.space24,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: AppTheme.space16),

                                // Logo EduPath
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 98,
                                  fit: BoxFit.contain,
                                ),

                                const SizedBox(height: AppTheme.space16),

                                // Hình minh họa học viên 3D cùng các biểu tượng học tập
                                Image.asset(
                                  'assets/images/onboarding_hero.png',
                                  height: 280,
                                  fit: BoxFit.contain,
                                ),

                                const SizedBox(height: AppTheme.space24),

                                // Slogan xanh nổi bật
                                Text(
                                  'HỌC TẬP THÔNG MINH',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                    letterSpacing: 0.8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: AppTheme.space16),

                                // Đường phân cách ngang mỏng viền trang trí
                                Container(
                                  width: 280,
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    color: AppColors.border,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),

                                const SizedBox(height: AppTheme.space16),

                                // Tiêu đề chính
                                Text(
                                  'Nền tảng học tập và ôn luyện',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: AppTheme.space8),

                                // Mô tả phụ
                                Text(
                                  'dành cho sinh viên đại học',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textSecondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),

                            // Phần nút bấm và liên kết đăng nhập dưới đáy
                            Padding(
                              padding: const EdgeInsets.only(
                                top: AppTheme.space24,
                                bottom: AppTheme.space16,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Nút chính "Bắt đầu ngay"
                                  AppButton(
                                    text: 'Bắt đầu ngay',
                                    height: 54,
                                    borderRadius: 14,
                                    trailingIcon: const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: AppColors.textWhite,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        AppSlideRoute(
                                          page:
                                              const OnboardingWalkthroughScreen(),
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: AppTheme.space16),

                                  // Dòng chuyển sang đăng nhập
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        AppSlideRoute(
                                          page: const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          color: AppColors.textSecondary,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: 'Đã có tài khoản? ',
                                          ),
                                          TextSpan(
                                            text: 'Đăng nhập',
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
