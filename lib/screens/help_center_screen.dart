import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import 'contact_support_screen.dart';

/// Màn 91 – Trung tâm trợ giúp
class HelpCenterScreen extends StatefulWidget {
  static const String routeName = '/help_center';

  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final TextEditingController _searchController = TextEditingController();

  // FAQ expand state
  final List<bool> _expanded = [false, false, false];

  final List<_FaqItem> _faqs = const [
    _FaqItem(
      question: 'Làm thế nào để luyện tập và thi thử?',
      answer:
          'Mở tab "Luyện tập", chọn môn học và bấm "Bắt đầu làm bài" để kiểm tra kiến thức có chấm điểm ngay.',
    ),
    _FaqItem(
      question: 'Cách đổi mật khẩu hoặc lấy lại tài khoản?',
      answer:
          'Chọn "Quên mật khẩu" tại màn hình đăng nhập hoặc vào mục Tài khoản > Bảo mật > Đổi mật khẩu.',
    ),
    _FaqItem(
      question: 'Tôi có thể tải tài liệu về học offline không?',
      answer:
          'Có thể, tại mục Tài liệu từng bài học, bấm icon tải xuống để lưu trữ trực tiếp trên thiết bị.',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                      'Trung tâm trợ giúp',
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

            // ── Scrollable body ──────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space16),

                    // Search bar
                    Text(
                      'Tìm trong trợ giúp',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space8),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppTheme.radiusInput),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: GoogleFonts.inter(fontSize: 14, color: AppColors.textPrimary),
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm môn học...',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.inputBorder,
                          ),
                          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.inputBorder, size: 20),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.space16,
                            vertical: AppTheme.space12,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // 2×2 Category grid
                    Row(
                      children: [
                        Expanded(
                          child: _buildCategoryCard(
                            icon: Icons.person_outline_rounded,
                            label: 'Tài khoản',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildCategoryCard(
                            icon: Icons.menu_book_outlined,
                            label: 'Học bài',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildCategoryCard(
                            icon: Icons.assignment_outlined,
                            label: 'Luyện tập & thi',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: AppTheme.space12),
                        Expanded(
                          child: _buildCategoryCard(
                            icon: Icons.settings_outlined,
                            label: 'Cài đặt',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // FAQ Section
                    Text(
                      'Câu hỏi nổi bật',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    // FAQ items
                    ...List.generate(_faqs.length, (i) {
                      final faq = _faqs[i];
                      return _buildFaqCard(
                        question: faq.question,
                        answer: faq.answer,
                        isExpanded: _expanded[i],
                        onTap: () {
                          setState(() => _expanded[i] = !_expanded[i]);
                        },
                      );
                    }),

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
                    onPressed: () {
                      Navigator.of(context).push(
                        AppSlideRoute(
                          settings: const RouteSettings(
                            name: ContactSupportScreen.routeName,
                          ),
                          page: const ContactSupportScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusButton),
                      ),
                    ),
                    child: Text(
                      'Liên hệ hỗ trợ',
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

      // ── Bottom Navigation Bar ────────────────────────────────
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Học tập tab active
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 10),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore_rounded),
            label: 'Khám phá',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book_rounded),
            label: 'Học tập',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Cá nhân',
          ),
        ],
        onTap: (index) {
          // Navigate back to MainNavigationScreen with selected tab
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppTheme.space24,
            horizontal: AppTheme.space16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primary, size: 28),
              const SizedBox(height: AppTheme.space8),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqCard({
    required String question,
    required String answer,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.space12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.space16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTheme.space8),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.arrow_forward_ios_rounded,
                      color: AppColors.textSecondary,
                      size: isExpanded ? 20 : 14,
                    ),
                  ],
                ),
                if (!isExpanded) ...[
                  const SizedBox(height: AppTheme.space4),
                  Text(
                    answer,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (isExpanded) ...[
                  const SizedBox(height: AppTheme.space8),
                  Text(
                    answer,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FaqItem {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});
}
