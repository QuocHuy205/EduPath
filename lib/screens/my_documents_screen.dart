import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';

/// Màn 27 – Tài liệu của tôi
class MyDocumentsScreen extends StatefulWidget {
  const MyDocumentsScreen({super.key});

  @override
  State<MyDocumentsScreen> createState() => _MyDocumentsScreenState();
}

class _MyDocumentsScreenState extends State<MyDocumentsScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Tất cả', 'Bài giảng', 'Tài liệu', 'Bài tập'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Center(
                      child: Text(
                        'Tài liệu của tôi',
                        style: AppTheme.h2,
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

            const SizedBox(height: AppTheme.space16),

            // Filter tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
              child: Row(
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
                          horizontal: AppTheme.space12,
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
                            fontWeight: FontWeight.w500,
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
            ),

            const SizedBox(height: AppTheme.space16),

            // Document list + bottom sections
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Document items
                    ...MockData.myDocuments.map((doc) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppTheme.space12),
                        child: _buildDocumentRow(context, doc),
                      );
                    }),

                    const SizedBox(height: AppTheme.space24),

                    // Library summary
                    Text('Thư viện học tập', style: AppTheme.h3),
                    const SizedBox(height: AppTheme.space12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${MockData.myDocuments.length} tài liệu đã lưu',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'PDF, bài giảng và đề cương của các môn học',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppTheme.space8),
                          Text(
                            'Sắp xếp theo môn học  •  Cập nhật gần đây',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Suggested documents
                    Text('Tài liệu nên xem tiếp', style: AppTheme.h3),
                    const SizedBox(height: AppTheme.space12),
                    _buildSuggestedDocRow(
                      'Đề thi thử Toán cao cấp',
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

  Widget _buildDocumentRow(BuildContext context, DocumentModel doc) {
    // Icon color by type
    IconData fileIcon;
    switch (doc.fileType) {
      case 'pptx':
        fileIcon = Icons.slideshow_rounded; // TODO: thay icon Figma
        break;
      default:
        fileIcon = Icons.description_rounded; // TODO: thay icon Figma
    }

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: doc.iconColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            fileIcon,
            color: AppColors.textWhite,
            size: 24,
          ),
        ),
        const SizedBox(width: AppTheme.space12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doc.fileName,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppTheme.space4),
              Text(
                '${doc.courseName} • ${doc.fileSize}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Tải tài liệu (giả lập)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tải ${doc.fileName} (giả lập)')),
            );
          },
          icon: const Icon(
            Icons.download_rounded, // TODO: thay icon Figma
            color: AppColors.primary,
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Menu tùy chọn
          },
          icon: const Icon(
            Icons.more_vert_rounded, // TODO: thay icon Figma
            color: AppColors.textSecondary,
            size: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestedDocRow(String title) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.border.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.quiz_outlined, // TODO: thay icon Figma
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
          const SizedBox(width: AppTheme.space12),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
