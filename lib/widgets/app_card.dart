import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

enum AppCardVariant {
  standard,
  highlight,
  flat,
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final AppCardVariant variant;
  final double? borderRadius;
  final Color? customBackgroundColor;
  final Border? customBorder;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.variant = AppCardVariant.standard,
    this.borderRadius,
    this.customBackgroundColor,
    this.customBorder,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? AppTheme.radiusCard);

    Color backgroundColor;
    Border? border;

    switch (variant) {
      case AppCardVariant.standard:
        backgroundColor = customBackgroundColor ?? AppColors.cardBackground;
        border = customBorder ?? Border.all(color: AppColors.border, width: 1);
        break;
      case AppCardVariant.highlight:
        backgroundColor = customBackgroundColor ?? AppColors.primaryLight;
        border = customBorder;
        break;
      case AppCardVariant.flat:
        backgroundColor = customBackgroundColor ?? AppColors.cardBackground;
        border = null;
        break;
    }

    final cardContent = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius,
        border: border,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppTheme.space16),
            child: child,
          ),
        ),
      ),
    );

    return cardContent;
  }
}
