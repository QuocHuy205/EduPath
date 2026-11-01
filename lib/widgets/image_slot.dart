import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../theme/app_colors.dart';

/// Widget hiển thị ảnh từ asset. Nếu file ảnh chưa tồn tại thì hiện
/// khung xám nhạt bo góc, có icon ảnh ở giữa và dòng chữ nhỏ ghi
/// đường dẫn cần thêm — KHÔNG báo lỗi đỏ.
class ImageSlot extends StatefulWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;

  const ImageSlot({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.fit = BoxFit.cover,
  });

  @override
  State<ImageSlot> createState() => _ImageSlotState();
}

class _ImageSlotState extends State<ImageSlot> {
  bool _assetExists = false;
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    _checkAsset();
  }

  @override
  void didUpdateWidget(covariant ImageSlot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _checked = false;
      _checkAsset();
    }
  }

  Future<void> _checkAsset() async {
    try {
      await rootBundle.load(widget.assetPath);
      if (mounted) setState(() { _assetExists = true; _checked = true; });
    } catch (_) {
      if (mounted) setState(() { _assetExists = false; _checked = true; });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_checked) {
      return _buildPlaceholder();
    }

    if (_assetExists) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Image.asset(
          widget.assetPath,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        ),
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.border.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined, // TODO: thay bằng icon Figma
            color: AppColors.textSecondary.withValues(alpha: 0.6),
            size: (widget.height ?? 48) * 0.35 < 16 ? 16 : (widget.height ?? 48) * 0.35,
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.assetPath,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                color: AppColors.textSecondary.withValues(alpha: 0.6),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
