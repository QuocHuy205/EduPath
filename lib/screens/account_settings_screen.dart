import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'change_password_screen.dart';
import 'logout_confirmation_screen.dart';

/// Màn 84 – Cài đặt tài khoản
class AccountSettingsScreen extends StatefulWidget {
  static const String routeName = '/account_settings';

  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool _biometricLogin = true;
  bool _remindClassAndExam = true;
  bool _remindDeadline = true;
  bool _newsletterAcademic = false;
  bool _privacyLeaderboard = true;

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
                      'Cài đặt tài khoản',
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
                    // Section 1: Đăng nhập & Bảo mật
                    _buildSectionHeader(Icons.shield_outlined, 'Đăng nhập & Bảo mật'),
                    const SizedBox(height: AppTheme.space12),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        children: [
                          _buildSettingRow(
                            icon: Icons.key_outlined,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Đổi mật khẩu',
                            subtitle: 'Cập nhật lần cuối 45 ngày trước',
                            trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
                            onTap: () {
                              Navigator.of(context).push(
                                AppSlideRoute(
                                  settings: const RouteSettings(
                                    name: ChangePasswordScreen.routeName,
                                  ),
                                  page: const ChangePasswordScreen(),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.phone_android_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Xác thực 2 yếu tố (2FA)',
                            subtitle: 'Mã OTP SMS/Email cho thiết bị lạ',
                            trailing: _buildBadge('Đã bật'),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.fingerprint_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Đăng nhập sinh trắc học',
                            subtitle: 'Sử dụng Face ID hoặc Vân tay',
                            trailing: Switch(
                              value: _biometricLogin,
                              onChanged: (v) => setState(() => _biometricLogin = v),
                              activeTrackColor: AppColors.primary,
                              activeThumbColor: AppColors.textWhite,
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          Padding(
                            padding: const EdgeInsets.all(AppTheme.space16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'THIẾT BỊ HOẠT ĐỘNG (2)',
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textSecondary,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Đã đăng xuất các thiết bị khác')),
                                        );
                                      },
                                      child: Text(
                                        'Đăng xuất',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFDC2626),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppTheme.space8),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8FAF8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.phone_iphone_rounded, size: 18, color: AppColors.primary),
                                      const SizedBox(width: AppTheme.space8),
                                      Text(
                                        'iPhone 15 Pro · Thiết bị hiện tại',
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
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

                    // Section 2: Liên kết trường & Học vụ
                    _buildSectionHeader(Icons.account_balance_outlined, 'Liên kết trường & Học vụ'),
                    const SizedBox(height: AppTheme.space12),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        children: [
                          _buildSettingRow(
                            icon: Icons.school_outlined,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Cổng đào tạo SIS',
                            subtitle: 'Tài khoản sinh viên đã liên kết',
                            trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.file_download_outlined,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Microsoft Office 365',
                            subtitle: 'Đã kết nối OneDrive lưu bài giảng',
                            trailing: _buildBadge('Đã bật'),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.mail_outline_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Google Workspace',
                            subtitle: 'Tài khoản email học tập',
                            trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 3: Thông báo & Nhắc học
                    _buildSectionHeader(Icons.notifications_none_rounded, 'Thông báo & Nhắc học'),
                    const SizedBox(height: AppTheme.space12),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        children: [
                          _buildSettingRow(
                            icon: Icons.notifications_none_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Lịch học & Lịch thi tín chỉ',
                            subtitle: 'Thông báo khi có thay đổi phòng thi',
                            trailing: Switch(
                              value: _remindClassAndExam,
                              onChanged: (v) => setState(() => _remindClassAndExam = v),
                              activeTrackColor: AppColors.primary,
                              activeThumbColor: AppColors.textWhite,
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.notifications_none_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Cảnh báo deadline & Quiz',
                            subtitle: 'Nhắc trước 6 tiếng và 1 tiếng',
                            trailing: Switch(
                              value: _remindDeadline,
                              onChanged: (v) => setState(() => _remindDeadline = v),
                              activeTrackColor: AppColors.primary,
                              activeThumbColor: AppColors.textWhite,
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.notifications_none_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Bản tin học thuật & Đề thi tuần',
                            subtitle: 'Gợi ý bài tập bổ trợ định kỳ',
                            trailing: Switch(
                              value: _newsletterAcademic,
                              onChanged: (v) => setState(() => _newsletterAcademic = v),
                              activeTrackColor: AppColors.primary,
                              activeThumbColor: AppColors.textWhite,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 4: Quyền riêng tư & Dữ liệu
                    _buildSectionHeader(Icons.lock_outline_rounded, 'Quyền riêng tư & Dữ liệu'),
                    const SizedBox(height: AppTheme.space12),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        children: [
                          _buildSettingRow(
                            icon: Icons.lock_outline_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Riêng tư trên Bảng xếp hạng',
                            subtitle: 'Ẩn họ tên thật, chỉ hiện MSSV',
                            trailing: Switch(
                              value: _privacyLeaderboard,
                              onChanged: (v) => setState(() => _privacyLeaderboard = v),
                              activeTrackColor: AppColors.primary,
                              activeThumbColor: AppColors.textWhite,
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.file_download_outlined,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Tải dữ liệu học tập cá nhân',
                            subtitle: 'Xuất PDF kết quả luyện đề',
                            trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
                          ),
                          const Divider(height: 1, color: AppColors.border),
                          _buildSettingRow(
                            icon: Icons.delete_outline_rounded,
                            iconBg: const Color(0xFFEAF8EF),
                            iconColor: AppColors.primary,
                            title: 'Bộ nhớ đệm tài liệu',
                            subtitle: 'Đang chiếm 142 MB đề thi offline',
                            trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space32),

                    // Bottom Buttons: Đăng xuất tài khoản + Xóa tài khoản
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: const Color(0xFFFCA5A5), width: 1),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                          onTap: () {
                            Navigator.of(context).push(
                              AppSlideRoute(
                                settings: const RouteSettings(
                                  name: LogoutConfirmationScreen.routeName,
                                ),
                                page: const LogoutConfirmationScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Đăng xuất tài khoản',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFDC2626),
                                ),
                              ),
                              const SizedBox(width: AppTheme.space8),
                              const Icon(
                                Icons.logout_rounded,
                                color: Color(0xFFDC2626),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space12),

                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Xác nhận xóa tài khoản'),
                                content: const Text('Bạn có chắc chắn muốn xóa vĩnh viễn tài khoản EduPath không? Hành động này không thể hoàn tác.'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Hủy')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Yêu cầu xóa tài khoản đã được ghi nhận.')),
                                      );
                                    },
                                    child: const Text('Xác nhận xóa', style: TextStyle(color: Color(0xFFDC2626))),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.delete_outline_rounded,
                                color: Color(0xFFDC2626),
                                size: 18,
                              ),
                              const SizedBox(width: AppTheme.space8),
                              Text(
                                'Xóa tài khoản',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFDC2626),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: AppTheme.space8),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingRow({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.space16),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: 20),
              ),
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
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
