import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Màn 85 – Đổi mật khẩu
class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = '/change_password';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController(text: 'password123');
  final TextEditingController _newPasswordController =
      TextEditingController(text: 'EduPath2026');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: 'EduPath2026');

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  bool _logoutOtherDevices = true;
  bool _sendConfirmationEmail = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Đổi mật khẩu',
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

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                  vertical: AppTheme.space12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Security Status Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.shield_outlined,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppTheme.space12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trạng thái bảo mật EduPath',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Mật khẩu đã cập nhật 45 ngày trước',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Đã đồng bộ',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space12),
                          Text(
                            'Bảo vệ tài khoản và dữ liệu học tập của bạn. Nên thay đổi định kỳ và không chia sẻ mật khẩu.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 1: Mật khẩu hiện tại
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
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
                                'Mật khẩu hiện tại *',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Chức năng khôi phục mật khẩu')),
                                  );
                                },
                                child: Text(
                                  'Quên mật khẩu?',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space8),
                          _buildPasswordField(
                            controller: _currentPasswordController,
                            obscure: _obscureCurrent,
                            onToggle: () => setState(() => _obscureCurrent = !_obscureCurrent),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Dùng mật khẩu đang đăng nhập',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 2: Mật khẩu mới
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
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
                                'Mật khẩu mới *',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Khuyến dùng ≥ 10 ký tự',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space8),
                          _buildPasswordField(
                            controller: _newPasswordController,
                            obscure: _obscureNew,
                            onToggle: () => setState(() => _obscureNew = !_obscureNew),
                          ),
                          const SizedBox(height: AppTheme.space16),

                          // Strength Meter
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Độ mạnh mật khẩu',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: AppTheme.space4),
                                  Text(
                                    'Khá',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space8),

                          // 4 Bars
                          Row(
                            children: [
                              Expanded(child: _buildStrengthBar(isActive: true)),
                              const SizedBox(width: AppTheme.space4),
                              Expanded(child: _buildStrengthBar(isActive: true)),
                              const SizedBox(width: AppTheme.space4),
                              Expanded(child: _buildStrengthBar(isActive: true)),
                              const SizedBox(width: AppTheme.space4),
                              Expanded(child: _buildStrengthBar(isActive: false)),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space16),

                          Text(
                            'TIÊU CHUẨN KIỂM TRA',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          _buildCriteriaItem('Tối thiểu 8 ký tự', isMet: true),
                          const SizedBox(height: AppTheme.space4),
                          _buildCriteriaItem('Có ít nhất 1 chữ in hoa và chữ thường', isMet: true),
                          const SizedBox(height: AppTheme.space4),
                          _buildCriteriaItem('Có ít nhất 1 chữ số', isMet: true),
                          const SizedBox(height: AppTheme.space4),
                          _buildCriteriaItem(
                            'Cần ít nhất 1 ký tự đặc biệt (!, @, #, \$, ...)',
                            isMet: false,
                            isWarning: true,
                          ),
                          const SizedBox(height: AppTheme.space4),
                          _buildCriteriaItem('Không trùng với mật khẩu của 3 lần đổi gần nhất', isMet: true),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 3: Xác nhận mật khẩu mới
                    Container(
                      width: double.infinity,
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
                            'Xác nhận mật khẩu mới *',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          _buildPasswordField(
                            controller: _confirmPasswordController,
                            obscure: _obscureConfirm,
                            onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Row(
                            children: [
                              const Icon(Icons.check_rounded, color: AppColors.primary, size: 16),
                              const SizedBox(width: AppTheme.space4),
                              Text(
                                'Mật khẩu khớp chính xác',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 4: Tùy chọn phiên & Xác thực
                    Container(
                      width: double.infinity,
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
                            'Tùy chọn phiên & Xác thực',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space16),

                          InkWell(
                            onTap: () => setState(() => _logoutOtherDevices = !_logoutOtherDevices),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  _logoutOtherDevices
                                      ? Icons.check_box_rounded
                                      : Icons.check_box_outline_blank_rounded,
                                  color: _logoutOtherDevices ? AppColors.primary : AppColors.textSecondary,
                                  size: 20,
                                ),
                                const SizedBox(width: AppTheme.space8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Đăng xuất khỏi tất cả các thiết bị khác',
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Khuyến dùng nếu nghi ngờ rò rỉ mật khẩu.',
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
                          const Divider(height: 1, color: AppColors.border),
                          const SizedBox(height: AppTheme.space16),

                          InkWell(
                            onTap: () => setState(() => _sendConfirmationEmail = !_sendConfirmationEmail),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  _sendConfirmationEmail
                                      ? Icons.check_box_rounded
                                      : Icons.check_box_outline_blank_rounded,
                                  color: _sendConfirmationEmail ? AppColors.primary : AppColors.textSecondary,
                                  size: 20,
                                ),
                                const SizedBox(width: AppTheme.space8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gửi thư xác nhận thay đổi bảo mật',
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Thông báo qua email sinh viên sau khi cập nhật.',
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
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Bottom Buttons: Cập nhật mật khẩu mới + Hủy bỏ
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Đã cập nhật mật khẩu mới thành công!')),
                          );
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.check_rounded, size: 20),
                        label: Text(
                          'Cập nhật mật khẩu mới',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textWhite,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textWhite,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space8),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.border, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                          ),
                        ),
                        child: Text(
                          'Hủy bỏ và quay lại cài đặt',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Footer
                    Center(
                      child: Text(
                        '© EduPath · Hỗ trợ bảo mật tài khoản',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.lock_outline_rounded, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: AppTheme.space8),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrengthBar({required bool isActive}) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildCriteriaItem(String text, {required bool isMet, bool isWarning = false}) {
    final color = isMet
        ? AppColors.primary
        : (isWarning ? const Color(0xFFD97706) : AppColors.textSecondary);
    final icon = isMet
        ? Icons.check_circle_outline_rounded
        : (isWarning ? Icons.warning_amber_rounded : Icons.radio_button_unchecked_rounded);

    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: AppTheme.space8),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: color,
            fontWeight: isMet ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
