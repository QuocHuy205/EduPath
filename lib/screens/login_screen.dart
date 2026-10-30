import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/widgets.dart';
import 'register_screen.dart';
import 'main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    Navigator.of(context).pushReplacement(
      AppSlideRoute(page: const MainNavigationScreen()),
    );
  }

  void _goToRegister() {
    Navigator.of(context).push(
      AppSlideRoute(page: const RegisterScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Khối tròn trang trí góc trên bên phải
          Positioned(
            top: -60,
            right: -60,
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

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space24,
                vertical: AppTheme.space16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppTheme.space16),

                  // Logo EduPath
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 72,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Tiêu đề chào mừng
                  Text(
                    'Chào mừng trở lại!',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.space8),

                  Text(
                    'Đăng nhập để tiếp tục hành trình học tập',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Thẻ điểm nhấn thông điệp (Highlight Card)
                  AppCard(
                    variant: AppCardVariant.highlight,
                    padding: const EdgeInsets.all(AppTheme.space16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Học đúng lộ trình',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.space4),
                        Text(
                          'Ôn đúng trọng tâm',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppTheme.space4),
                        Text(
                          'Theo dõi tiến độ mỗi ngày',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Ô nhập Email
                  AppTextField(
                    label: 'Email',
                    hintText: 'Nhập địa chỉ email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Ô nhập Mật khẩu
                  AppTextField(
                    label: 'Mật khẩu',
                    hintText: 'Nhập mật khẩu',
                    controller: _passwordController,
                    isPassword: true,
                  ),

                  const SizedBox(height: AppTheme.space12),

                  // Quên mật khẩu link
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Quên mật khẩu?',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Nút Đăng nhập
                  AppButton(
                    text: 'Đăng nhập',
                    height: 52,
                    borderRadius: 12,
                    onPressed: _login,
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Hoặc đăng nhập bằng
                  Text(
                    'Hoặc đăng nhập bằng',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Các nút đăng nhập mạng xã hội
                  Row(
                    children: [
                      Expanded(
                        child: _SocialButton(
                          iconPath: 'assets/images/ic_facebook.png',
                          onTap: _login,
                        ),
                      ),
                      const SizedBox(width: AppTheme.space12),
                      Expanded(
                        child: _SocialButton(
                          iconPath: 'assets/images/ic_google.png',
                          onTap: _login,
                        ),
                      ),
                      const SizedBox(width: AppTheme.space12),
                      Expanded(
                        child: _SocialButton(
                          iconPath: 'assets/images/ic_apple.png',
                          onTap: _login,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Liên kết chuyển sang Đăng ký
                  Center(
                    child: GestureDetector(
                      onTap: _goToRegister,
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                          children: [
                            const TextSpan(text: 'Chưa có tài khoản? '),
                            TextSpan(
                              text: 'Đăng ký',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppTheme.space16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const _SocialButton({
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
