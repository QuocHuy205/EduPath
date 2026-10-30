import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../widgets/widgets.dart';
import 'main_navigation_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreeTerms = true;

  void _register() {
    Navigator.of(context).pushAndRemoveUntil(
      AppSlideRoute(page: const MainNavigationScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Khối tròn trang trí
          Positioned(
            top: 40,
            left: -60,
            child: IgnorePointer(
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.space24,
                vertical: AppTheme.space12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Nút quay lại góc trên trái
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),

                  const SizedBox(height: AppTheme.space8),

                  // Logo EduPath
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 64,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Tiêu đề
                  Text(
                    'Tạo tài khoản',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.space8),

                  Text(
                    'Tham gia EduPath để bắt đầu\nhành trình học tập của bạn',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Họ và tên
                  AppTextField(
                    label: 'Họ và tên',
                    hintText: 'Nhập họ và tên',
                    controller: _nameController,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Email sinh viên
                  AppTextField(
                    label: 'Email sinh viên',
                    hintText: 'Ví dụ: nguyenvana@stu.edu.vn',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Mật khẩu
                  AppTextField(
                    label: 'Mật khẩu',
                    hintText: 'Nhập mật khẩu',
                    controller: _passwordController,
                    isPassword: true,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Xác nhận mật khẩu
                  AppTextField(
                    label: 'Xác nhận mật khẩu',
                    hintText: 'Nhập lại mật khẩu',
                    controller: _confirmPasswordController,
                    isPassword: true,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Checkbox Điều khoản
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _agreeTerms,
                          onChanged: (val) {
                            setState(() {
                              _agreeTerms = val ?? false;
                            });
                          },
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppTheme.space8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                            children: const [
                              TextSpan(text: 'Tôi đồng ý với '),
                              TextSpan(
                                text: 'Điều khoản sử dụng\n',
                                style: TextStyle(color: AppColors.primary),
                              ),
                              TextSpan(text: 'và '),
                              TextSpan(
                                text: 'Chính sách bảo mật của EduPath',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Nút Đăng ký
                  AppButton(
                    text: 'Đăng ký',
                    height: 52,
                    borderRadius: 12,
                    onPressed: _agreeTerms ? _register : null,
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Hoặc đăng ký bằng
                  Text(
                    'Hoặc đăng ký bằng',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppTheme.space16),

                  // Các nút mạng xã hội
                  Row(
                    children: [
                      Expanded(
                        child: _SocialButton(
                          iconPath: 'assets/images/ic_facebook.png',
                          onTap: _register,
                        ),
                      ),
                      const SizedBox(width: AppTheme.space12),
                      Expanded(
                        child: _SocialButton(
                          iconPath: 'assets/images/ic_google.png',
                          onTap: _register,
                        ),
                      ),
                      const SizedBox(width: AppTheme.space12),
                      Expanded(
                        child: _SocialButton(
                          iconPath: 'assets/images/ic_apple.png',
                          onTap: _register,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.space24),

                  // Dòng chuyển sang Đăng nhập
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                          children: [
                            const TextSpan(text: 'Đã có tài khoản? '),
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
