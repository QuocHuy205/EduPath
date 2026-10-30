import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

enum AppChipType {
  success,
  warning,
  error,
  info,
}

class AppChip extends StatelessWidget {
  final String label;
  final AppChipType type;
  final IconData? icon;

  const AppChip({
    super.key,
    required this.label,
    this.type = AppChipType.success,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;

    switch (type) {
      case AppChipType.success:
        bg = AppColors.primaryLight;
        fg = AppColors.success;
        break;
      case AppChipType.warning:
        bg = AppColors.warningLight;
        fg = AppColors.warning;
        break;
      case AppChipType.error:
        bg = AppColors.errorLight;
        fg = AppColors.error;
        break;
      case AppChipType.info:
        bg = AppColors.infoLight;
        fg = AppColors.info;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space12,
        vertical: AppTheme.space4,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: AppTheme.space4),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}
