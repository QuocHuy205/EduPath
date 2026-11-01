import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Màn 74 – Tạo kế hoạch học
class CreateScheduleScreen extends StatefulWidget {
  static const String routeName = '/create_schedule';

  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  final TextEditingController _planNameController =
      TextEditingController(text: 'Ôn Chương 4 – Bảng tính');
  final TextEditingController _goalController =
      TextEditingController(text: 'Nắm vững hàm Excel và luyện 10 câu hỏi');

  String _selectedSubject = 'Tin học đại cương';
  final List<String> _subjects = [
    'Tin học đại cương',
    'Toán cao cấp',
    'Triết học Mác - Lênin',
    'Pháp luật đại cương',
  ];

  DateTime _selectedDate = DateTime(2026, 10, 28);
  TimeOfDay _startTime = const TimeOfDay(hour: 19, minute: 30);
  TimeOfDay _endTime = const TimeOfDay(hour: 20, minute: 15);

  int _repeatFrequency = 2; // 0: Không, 1: Hàng ngày, 2: Hàng tuần
  final Set<int> _selectedDays = {2}; // 0: T2, 1: T3, 2: T4, ...
  final List<String> _daysOfWeek = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  String _reminderTime = '15 phút';
  final List<String> _reminderOptions = ['5 phút', '15 phút', '30 phút', '1 giờ'];

  @override
  void dispose() {
    _planNameController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.textWhite,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _pickStartTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  void _pickEndTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateString =
        '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}';
    final startTimeString =
        '${_startTime.hour.toString().padLeft(2, '0')}:${_startTime.minute.toString().padLeft(2, '0')}';
    final endTimeString =
        '${_endTime.hour.toString().padLeft(2, '0')}:${_endTime.minute.toString().padLeft(2, '0')}';

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
                      'Tạo kế hoạch học',
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
                    // Top Tip Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppTheme.space16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        border: Border.all(color: const Color(0xFFC6E7D2), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.auto_awesome, // TODO: thay icon Figma
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: AppTheme.space8),
                              Text(
                                'Lên kế hoạch học hiệu quả',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF0D5C3A),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Thiết lập thời gian, mục tiêu và lời nhắc cho buổi học.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 01: THÔNG TIN KẾ HOẠCH
                    Text(
                      '01. THÔNG TIN KẾ HOẠCH',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),
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
                          _buildInputLabel('Tên kế hoạch *'),
                          const SizedBox(height: AppTheme.space8),
                          _buildTextInput(_planNameController),
                          const SizedBox(height: AppTheme.space16),

                          _buildInputLabel('Môn học *'),
                          const SizedBox(height: AppTheme.space8),
                          _buildDropdown(
                            value: _selectedSubject,
                            items: _subjects,
                            onChanged: (val) {
                              if (val != null) {
                                setState(() {
                                  _selectedSubject = val;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: AppTheme.space16),

                          _buildInputLabel('Mục tiêu buổi học'),
                          const SizedBox(height: AppTheme.space8),
                          _buildTextInput(_goalController),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 02: THỜI GIAN HỌC
                    Text(
                      '02. THỜI GIAN HỌC',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),
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
                          _buildInputLabel('Ngày học *'),
                          const SizedBox(height: AppTheme.space8),
                          InkWell(
                            onTap: _pickDate,
                            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.space16,
                                vertical: AppTheme.space12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                                border: Border.all(color: AppColors.border, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dateString,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_month_outlined,
                                    size: 18,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: AppTheme.space16),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildInputLabel('Giờ bắt đầu *'),
                                    const SizedBox(height: AppTheme.space8),
                                    InkWell(
                                      onTap: _pickStartTime,
                                      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppTheme.space16,
                                          vertical: AppTheme.space12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                                          border: Border.all(color: AppColors.border, width: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              startTimeString,
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.access_time_rounded,
                                              size: 18,
                                              color: AppColors.textSecondary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: AppTheme.space12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildInputLabel('Giờ kết thúc *'),
                                    const SizedBox(height: AppTheme.space8),
                                    InkWell(
                                      onTap: _pickEndTime,
                                      borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppTheme.space16,
                                          vertical: AppTheme.space12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                                          border: Border.all(color: AppColors.border, width: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              endTimeString,
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.access_time_rounded,
                                              size: 18,
                                              color: AppColors.textSecondary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space16),

                          // Duration badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.access_time_rounded,
                                  size: 15,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: AppTheme.space4),
                                Text(
                                  'Thời lượng: 45 phút',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),

                    // Section 03: LỊCH LẶP & NHẮC NHỞ
                    Text(
                      '03. LỊCH LẶP & NHẮC NHỞ',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.space12),
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
                          _buildInputLabel('Tần suất lặp lại'),
                          const SizedBox(height: AppTheme.space8),
                          Row(
                            children: [
                              _buildFrequencyOption(0, 'Không'),
                              const SizedBox(width: AppTheme.space8),
                              _buildFrequencyOption(1, 'Hàng ngày'),
                              const SizedBox(width: AppTheme.space8),
                              _buildFrequencyOption(2, '✓ Hàng tuần'),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space16),

                          _buildInputLabel('Lặp vào thứ'),
                          const SizedBox(height: AppTheme.space8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(_daysOfWeek.length, (index) {
                              final isSelected = _selectedDays.contains(index);
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      _selectedDays.remove(index);
                                    } else {
                                      _selectedDays.add(index);
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.primaryLight,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _daysOfWeek[index],
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? AppColors.textWhite
                                            : AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: AppTheme.space16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildInputLabel('Nhắc trước buổi học'),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _reminderTime,
                                  borderRadius: BorderRadius.circular(8),
                                  icon: const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    color: AppColors.primary,
                                  ),
                                  items: _reminderOptions.map((opt) {
                                    return DropdownMenuItem(
                                      value: opt,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryLight,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          opt,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    if (val != null) {
                                      setState(() {
                                        _reminderTime = val;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space16),

                    // EduBot Suggestion Banner
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
                          Row(
                            children: [
                              const Icon(
                                Icons.auto_awesome, // TODO: thay icon Figma
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: AppTheme.space8),
                              Text(
                                'Gợi ý từ EduBot',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF0D5C3A),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.space4),
                          Text(
                            'Chia nhỏ nội dung, dành 10 phút cuối để ôn tập.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppTheme.space24),
                  ],
                ),
              ),
            ),

            // Bottom Buttons: Lưu kế hoạch học + Hủy
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
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đã lưu kế hoạch học thành công!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.check_rounded, size: 20),
                        label: Text(
                          'Lưu kế hoạch học',
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
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Hủy',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextInput(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: AppTheme.space12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.space16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down_rounded, color: AppColors.textSecondary),
          items: items.map((it) {
            return DropdownMenuItem(
              value: it,
              child: Text(
                it,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildFrequencyOption(int index, String label) {
    final isSelected = _repeatFrequency == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _repeatFrequency = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusButton),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.textWhite : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
