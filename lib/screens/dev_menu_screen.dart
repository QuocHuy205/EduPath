import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_route.dart';
import '../data/mock_data.dart';
import 'onboarding_screen.dart';
import 'onboarding_walkthrough_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'main_navigation_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'search_filter_screen.dart';
import 'subject_categories_screen.dart';
import 'search_result_screen.dart';
import 'course_detail_screen.dart';
import 'my_courses_screen.dart';
import 'favorites_screen.dart';
import 'learning_center_screen.dart';
import 'my_assignments_screen.dart';
import 'my_documents_screen.dart';
import 'course_overview_screen.dart';
import 'course_content_screen.dart';
import 'lecture_video_screen.dart';
import 'quiz_screen.dart';
import 'quiz_result_screen.dart';
import 'practice_list_screen.dart';
import 'practice_setup_screen.dart';
import 'practice_question_screen.dart';
import 'practice_feedback_screen.dart';
import 'practice_explanation_screen.dart';
import 'practice_result_screen.dart';
import 'review_wrong_answers_screen.dart';
import 'mock_exam_list_screen.dart';
import 'exam_detail_screen.dart';
import 'exam_instructions_screen.dart';
import 'exam_room_screen.dart';
import 'submit_exam_screen.dart';
import 'exam_result_screen.dart';
import 'overall_progress_screen.dart';
import 'subject_progress_screen.dart';
import 'learning_goals_screen.dart';
import 'create_goal_screen.dart';
import 'monthly_schedule_screen.dart';
import 'schedule_detail_screen.dart';
import 'create_schedule_screen.dart';
import 'notification_list_screen.dart';
import 'student_profile_screen.dart';
import 'edit_profile_screen.dart';
import 'account_settings_screen.dart';
import 'change_password_screen.dart';
import 'logout_confirmation_screen.dart';
import 'help_center_screen.dart';
import 'contact_support_screen.dart';

/// Dev Menu – để kiểm tra từng màn riêng
class DevMenuScreen extends StatelessWidget {
  const DevMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_DevMenuItem>[
      _DevMenuItem('01 – Onboarding', () => const OnboardingScreen()),
      _DevMenuItem('02 – Walkthrough', () => const OnboardingWalkthroughScreen()),
      _DevMenuItem('03 – Đăng nhập', () => const LoginScreen()),
      _DevMenuItem('04 – Đăng ký', () => const RegisterScreen()),
      _DevMenuItem('05 – Main Navigation', () => const MainNavigationScreen()),
      _DevMenuItem('11 – Trang chủ (Home)', () => const HomeScreen()),
      _DevMenuItem('12 – Tìm kiếm', () => const SearchScreen()),
      _DevMenuItem('13 – Lọc tìm kiếm', () => const SearchFilterScreen()),
      _DevMenuItem('14 – Danh mục môn học', () => const SubjectCategoriesScreen()),
      _DevMenuItem('15 – Kết quả tìm kiếm', () => const SearchResultScreen()),
      _DevMenuItem('16 – Chi tiết môn học', () => CourseDetailScreen(course: MockData.searchResults[0])),
      _DevMenuItem('17 – Môn học của tôi', () => const MyCoursesScreen()),
      _DevMenuItem('19 – Nội dung yêu thích', () => const FavoritesScreen()),
      _DevMenuItem('21 – Trung tâm học tập', () => const LearningCenterScreen()),
      _DevMenuItem('26 – Bài tập của tôi', () => const MyAssignmentsScreen()),
      _DevMenuItem('27 – Tài liệu của tôi', () => const MyDocumentsScreen()),
      _DevMenuItem('31 – Tổng quan khóa học', () => const CourseOverviewScreen()),
      _DevMenuItem('32 – Nội dung khóa học', () => const CourseContentScreen()),
      _DevMenuItem('33 – Bài giảng video', () => const LectureVideoScreen()),
      _DevMenuItem('34 – Bài tập chương 1 (Quiz)', () => const QuizScreen()),
      _DevMenuItem('35 – Kết quả bài kiểm tra', () => const QuizResultScreen()),
      _DevMenuItem(
        '41 – Danh sách bài luyện tập',
        () => const PracticeListScreen(),
        routeName: PracticeListScreen.routeName,
      ),
      _DevMenuItem('44 – Thiết lập luyện tập', () => const PracticeSetupScreen()),
      _DevMenuItem('45 – Màn hình câu hỏi (Luyện tập)', () => const PracticeQuestionScreen()),
      _DevMenuItem('46 – Phản hồi sau khi chọn đáp án', () => const PracticeFeedbackScreen()),
      _DevMenuItem('47 – Giải thích đáp án', () => const PracticeExplanationScreen()),
      _DevMenuItem('48 – Kết quả luyện tập', () => const PracticeResultScreen()),
      _DevMenuItem('49 – Xem lại câu sai', () => const ReviewWrongAnswersScreen()),
      _DevMenuItem('51 – Danh sách đề thi thử', () => const MockExamListScreen()),
      _DevMenuItem(
        '52 – Chi tiết đề thi',
        () => const ExamDetailScreen(),
        routeName: ExamDetailScreen.routeName,
      ),
      _DevMenuItem('53 – Hướng dẫn làm bài', () => const ExamInstructionsScreen()),
      _DevMenuItem('54 – Phòng thi', () => const ExamRoomScreen()),
      _DevMenuItem('55 – Nộp bài thi', () => const SubmitExamScreen()),
      _DevMenuItem('56 – Kết quả bài thi thử', () => const ExamResultScreen()),
      _DevMenuItem(
        '61 – Tiến độ tổng quan',
        () => const OverallProgressScreen(),
        routeName: OverallProgressScreen.routeName,
      ),
      _DevMenuItem(
        '62 – Tiến độ theo môn',
        () => const SubjectProgressScreen(),
        routeName: SubjectProgressScreen.routeName,
      ),
      _DevMenuItem(
        '65 – Mục tiêu học tập',
        () => const LearningGoalsScreen(),
        routeName: LearningGoalsScreen.routeName,
      ),
      _DevMenuItem(
        '66 – Tạo mục tiêu',
        () => const CreateGoalScreen(),
        routeName: CreateGoalScreen.routeName,
      ),
      _DevMenuItem(
        '71 – Lịch tháng',
        () => const MonthlyScheduleScreen(),
        routeName: MonthlyScheduleScreen.routeName,
      ),
      _DevMenuItem(
        '73 – Chi tiết lịch học',
        () => const ScheduleDetailScreen(),
        routeName: ScheduleDetailScreen.routeName,
      ),
      _DevMenuItem(
        '74 – Tạo kế hoạch học',
        () => const CreateScheduleScreen(),
        routeName: CreateScheduleScreen.routeName,
      ),
      _DevMenuItem(
        '77 – Danh sách thông báo',
        () => const NotificationListScreen(),
        routeName: NotificationListScreen.routeName,
      ),
      _DevMenuItem(
        '81 – Hồ sơ cá nhân',
        () => const StudentProfileScreen(),
        routeName: StudentProfileScreen.routeName,
      ),
      _DevMenuItem(
        '82 – Chỉnh sửa hồ sơ',
        () => const EditProfileScreen(),
        routeName: EditProfileScreen.routeName,
      ),
      _DevMenuItem(
        '84 – Cài đặt tài khoản',
        () => const AccountSettingsScreen(),
        routeName: AccountSettingsScreen.routeName,
      ),
      _DevMenuItem(
        '85 – Đổi mật khẩu',
        () => const ChangePasswordScreen(),
        routeName: ChangePasswordScreen.routeName,
      ),
      _DevMenuItem(
        '90 – Đăng xuất tài khoản',
        () => const LogoutConfirmationScreen(),
        routeName: LogoutConfirmationScreen.routeName,
      ),
      _DevMenuItem(
        '91 – Trung tâm trợ giúp',
        () => const HelpCenterScreen(),
        routeName: HelpCenterScreen.routeName,
      ),
      _DevMenuItem(
        '93 – Liên hệ hỗ trợ',
        () => const ContactSupportScreen(),
        routeName: ContactSupportScreen.routeName,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'EduPath – Dev Menu',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppTheme.space16),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppTheme.space8),
        itemBuilder: (context, index) {
          final item = items[index];
          return Material(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppTheme.radiusCard),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              onTap: () {
                Navigator.of(context).push(
                  AppSlideRoute(
                    page: item.builder(),
                    settings: item.routeName != null
                        ? RouteSettings(name: item.routeName)
                        : null,
                  ),
                );
              },
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
                  children: [
                    const Icon(
                      Icons.phone_android_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.space12),
                    Expanded(
                      child: Text(
                        item.label,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.textSecondary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DevMenuItem {
  final String label;
  final Widget Function() builder;
  final String? routeName;

  _DevMenuItem(this.label, this.builder, {this.routeName});
}
