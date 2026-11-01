import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/image_slot.dart';

/// Màn 33 – Bài giảng video
class LectureVideoScreen extends StatefulWidget {
  final String title;

  const LectureVideoScreen({
    super.key,
    this.title = '1.2 Giới hạn của hàm số',
  });

  @override
  State<LectureVideoScreen> createState() => _LectureVideoScreenState();
}

class _LectureVideoScreenState extends State<LectureVideoScreen> {
  bool _isPlaying = false;
  bool _isLiked = false;
  bool _isSaved = false;

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
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20), // TODO: thay icon Figma
                    color: AppColors.textPrimary,
                  ),
                  Expanded(
                    child: Text(
                      'Bài giảng',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppTheme.space12),

                    // Video Player Area
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        child: Container(
                          height: 200,
                          color: Colors.black,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Background Video Thumbnail ImageSlot
                              const ImageSlot(
                                assetPath: 'assets/images/video_thumbnail_math.png',
                                fit: BoxFit.cover,
                              ),
                              // Semi-transparent overlay
                              Container(
                                color: Colors.black.withValues(alpha: 0.35),
                              ),
                              // Play/Pause button center
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() => _isPlaying = !_isPlaying);
                                  },
                                  child: Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(alpha: 0.6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      _isPlaying
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded, // TODO: thay icon Figma
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                              // Bottom controls
                              Positioned(
                                left: 12,
                                right: 12,
                                bottom: 10,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Progress bar
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: const LinearProgressIndicator(
                                        value: 0.3,
                                        minHeight: 3,
                                        backgroundColor: Colors.white24,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryAccent,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '05:23 / 18:20',
                                          style: GoogleFonts.inter(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white24,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '1x',
                                                style: GoogleFonts.inter(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons.picture_in_picture_alt_rounded, // TODO: thay icon Figma
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons.fullscreen_rounded, // TODO: thay icon Figma
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Actions Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(
                            icon: Icons.thumb_up_alt_outlined, // TODO: thay icon Figma
                            label: '1.2K',
                            onTap: () {},
                          ),
                          _buildActionButton(
                            icon: _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded, // TODO: thay icon Figma
                            label: 'Thích',
                            iconColor: _isLiked ? AppColors.error : AppColors.textSecondary,
                            onTap: () {
                              setState(() => _isLiked = !_isLiked);
                            },
                          ),
                          _buildActionButton(
                            icon: _isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, // TODO: thay icon Figma
                            label: 'Lưu',
                            iconColor: _isSaved ? AppColors.primary : AppColors.textSecondary,
                            onTap: () {
                              setState(() => _isSaved = !_isSaved);
                            },
                          ),
                          _buildActionButton(
                            icon: Icons.download_rounded, // TODO: thay icon Figma
                            label: 'Tải xuống',
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Đang tải bài giảng (giả lập)')),
                              );
                            },
                          ),
                          _buildActionButton(
                            icon: Icons.share_outlined, // TODO: thay icon Figma
                            label: 'Chia sẻ',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: Text(
                        'Trong bài học này, chúng ta sẽ tìm hiểu khái niệm giới hạn của hàm số, các quy tắc tính giới hạn và một số ví dụ minh họa.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Tài liệu đi kèm
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: Text(
                        'Tài liệu đi kèm',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: _buildDocCard(
                        context,
                        title: 'Giới hạn hàm số.pdf',
                        subtitle: 'PDF • 2.4 MB',
                        iconBg: const Color(0xFFFDE8E8),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: _buildDocCard(
                        context,
                        title: 'Bài tập.pdf',
                        subtitle: 'PDF • 2.4 MB',
                        iconBg: const Color(0xFFFEF0D6),
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section: Bài giảng tiếp theo
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: Text(
                        'Bài giảng tiếp theo',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.space16),
                      child: Container(
                        padding: const EdgeInsets.all(AppTheme.space12),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                          border: Border.all(color: AppColors.border, width: 1),
                        ),
                        child: Row(
                          children: [
                            const ImageSlot(
                              assetPath: 'assets/images/thumb_next_lecture.png',
                              width: 72,
                              height: 48,
                              borderRadius: 8,
                            ),
                            const SizedBox(width: AppTheme.space12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1.3 Hàm số liên tục',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: AppTheme.space4),
                                  Text(
                                    'Video • 20 phút',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.primary, width: 1.5),
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded, // TODO: thay icon Figma
                                color: AppColors.primary,
                                size: 22,
                              ),
                            ),
                          ],
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

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor ?? AppColors.textSecondary,
            size: 22,
          ),
          const SizedBox(height: AppTheme.space4),
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

  Widget _buildDocCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Color iconBg,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.description_outlined, // TODO: thay icon Figma
              color: AppColors.primary,
              size: 26,
            ),
          ),
          const SizedBox(width: AppTheme.space16),
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
                const SizedBox(height: AppTheme.space4),
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
          const Icon(
            Icons.chevron_right_rounded, // TODO: thay icon Figma
            color: AppColors.primary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
