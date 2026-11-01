import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Màn 93 – Liên hệ hỗ trợ (Contact Support Form)
class ContactSupportScreen extends StatefulWidget {
  static const String routeName = '/contact_support';

  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  String _selectedIssueType = 'Lỗi ứng dụng';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(
    text: 'minhanh@gmail.com',
  );

  final List<String> _issueTypes = [
    'Lỗi ứng dụng',
    'Vấn đề tài khoản',
    'Câu hỏi về học bài',
    'Luyện tập & thi',
    'Thanh toán & Đăng ký',
    'Khác',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tiêu đề yêu cầu')),
      );
      return;
    }
    if (desc.length < 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mô tả phải có ít nhất 20 ký tự')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: AppTheme.space12),
            Text(
              'Đã gửi thành công!',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        content: Text(
          'Yêu cầu hỗ trợ của bạn đã được ghi nhận. Chúng tôi sẽ phản hồi qua email trong vòng 24 giờ.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: Text(
              'Đóng',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────
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
                      'Liên hệ hỗ trợ',
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

            // ── Scrollable form ──────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space16),

                    // ─ Loại vấn đề ─
                    _buildLabel('Loại vấn đề'),
                    const SizedBox(height: AppTheme.space8),
                    _buildDropdown(),

                    const SizedBox(height: AppTheme.space16),

                    // ─ Tiêu đề ─
                    _buildLabel('Tiêu đề'),
                    const SizedBox(height: AppTheme.space8),
                    _buildTextField(
                      controller: _titleController,
                      hintText: 'Không thể mở bài học',
                      maxLines: 1,
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // ─ Mô tả ─
                    _buildLabel('Mô tả (tối thiểu 20 ký tự)'),
                    const SizedBox(height: AppTheme.space8),
                    _buildTextField(
                      controller: _descController,
                      hintText: 'Mô tả chi tiết vấn đề gặp phải...',
                      maxLines: 5,
                      minLines: 4,
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // ─ Ảnh chụp màn hình (placeholder) ─
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ảnh chụp màn hình',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            '+ Đính kèm tối đa 3 ảnh',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space12),
                          // Empty slots row
                          Row(
                            children: List.generate(3, (i) {
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: i < 2 ? AppTheme.space8 : 0),
                                  height: 72,
                                  decoration: BoxDecoration(
                                    color: AppColors.cardBackground,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: AppColors.inputBorder,
                                    size: 24,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // ─ Email phản hồi ─
                    _buildLabel('Email phản hồi'),
                    const SizedBox(height: AppTheme.space8),
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'email@example.com',
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // ─ Tip card ─
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.space16,
                        vertical: AppTheme.space12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Mẹo mô tả sự cố',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Ghi rõ màn hình và bước gây ra lỗi',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space32),
                  ],
                ),
              ),
            ),

            // ── Bottom CTA ───────────────────────────────────────
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
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                      ),
                    ),
                    child: Text(
                      'Gửi yêu cầu',
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
          ],
        ),
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    int? minLines,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusInput),
        border: Border.all(color: AppColors.inputBorder, width: 1),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.inputBorder,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.space16,
            vertical: AppTheme.space12,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space4,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusInput),
        border: Border.all(color: AppColors.inputBorder, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedIssueType,
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
          onChanged: (value) {
            if (value != null) setState(() => _selectedIssueType = value);
          },
          items: _issueTypes
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(type),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
