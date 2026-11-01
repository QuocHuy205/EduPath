# Luồng điều hướng – EduPath Prototype

> Tự suy ra từ tên nút, tiêu đề, thanh điều hướng dưới và nội dung các màn.
> Chỗ đánh dấu **(SUY ĐOÁN)** cần bạn xác nhận.

## Bottom Navigation (MainNavigationScreen)

| Tab | Index | Màn đích                          |
|-----|-------|-----------------------------------|
| Trang chủ  | 0 | HomeScreen                       |
| Khám phá   | 1 | SubjectCategoriesScreen          |
| Học tập    | 2 | LearningCenterScreen (màn 21)    |
| Yêu thích  | 3 | FavoritesScreen (màn 19)         |
| Cá nhân    | 4 | _ProfileScreen (nội bộ)          |

## Luồng chi tiết

| Màn nguồn | Phần tử bấm | Màn đích | Kiểu chuyển |
|---|---|---|---|
| OnboardingScreen | Nút "Bắt đầu" | OnboardingWalkthroughScreen | push |
| OnboardingWalkthroughScreen | Nút "Tiếp theo" (slide cuối) | LoginScreen | push |
| LoginScreen | Link "Đăng ký" | RegisterScreen | push |
| RegisterScreen | Link "Đăng nhập" | LoginScreen | pop |
| LoginScreen | Nút "Đăng nhập" | MainNavigationScreen | pushAndRemoveUntil |
| RegisterScreen | Nút "Đăng ký" | MainNavigationScreen | pushAndRemoveUntil **(SUY ĐOÁN)** |
| HomeScreen | Thanh tìm kiếm | SearchScreen | push |
| HomeScreen | Nút "Khám phá ngay" / "Danh mục" | Đổi tab index 1 | đổi tab |
| HomeScreen | Quick-access "Tài liệu" | MyDocumentsScreen (màn 27) | push |
| HomeScreen | Quick-access "Luyện tập" | PracticeListScreen (màn 41) | push |
| HomeScreen | Quick-access "Kiểm tra" | MyAssignmentsScreen (màn 26) | push **(SUY ĐOÁN)** |
| HomeScreen | "Xem tất cả" Môn gợi ý | TODO – chưa có màn đích **(SUY ĐOÁN)** | – |
| SearchScreen | Gõ tag tìm kiếm gần đây | SearchResultScreen (màn 15) | push |
| SearchScreen | Nút bộ lọc | SearchFilterScreen | push |
| SearchScreen | Nút "Trang chủ" bottom | MainNavigationScreen(index 0) | pushAndRemoveUntil |
| SearchScreen | Nút "Khám phá" bottom | MainNavigationScreen(index 1) | pushAndRemoveUntil |
| SearchResultScreen | Nút quay lại | pop | pop |
| SearchResultScreen | Bấm thẻ khóa học | CourseDetailScreen (màn 16) | push |
| CourseDetailScreen | Nút quay lại | pop | pop |
| CourseDetailScreen | Nút "Bắt đầu học" | CourseOverviewScreen (màn 31) | push **(SUY ĐOÁN)** |
| SubjectCategoriesScreen | Bấm thẻ danh mục | SearchResultScreen **(SUY ĐOÁN)** | push |
| MyCoursesScreen (màn 17) | Nút quay lại | pop | pop |
| MyCoursesScreen | Bấm thẻ khóa học / "Tiếp tục học" | CourseDetailScreen (màn 16) | push |
| MyCoursesScreen | Nút "Tạo kế hoạch" | TODO – chưa có màn đích | – |
| FavoritesScreen (màn 19) | Bấm thẻ khóa học | CourseDetailScreen (màn 16) | push |
| LearningCenterScreen (màn 21) | "Tiếp tục học →" | CourseContentScreen (màn 32) | push **(SUY ĐOÁN)** |
| LearningCenterScreen | "Xem lịch học →" | TODO – màn lịch học **(SUY ĐOÁN)** | – |
| LearningCenterScreen (màn 21) | Thẻ "21:00 · Luyện 10 câu" / "Vào làm bài →" | MyAssignmentsScreen (màn 26) | push **(SUY ĐOÁN)** |
| MyAssignmentsScreen (màn 26) | Nút quay lại | pop | pop |
| MyAssignmentsScreen | Bấm thẻ bài tập | QuizScreen (màn 34) | push **(SUY ĐOÁN)** |
| MyDocumentsScreen (màn 27) | Nút quay lại | pop | pop |
| MyDocumentsScreen | Nút tải | SnackBar giả lập | – |
| _ProfileScreen | "Tiến độ học tập" | MyCoursesScreen (màn 17) **(SUY ĐOÁN)** | push |
| _ProfileScreen | Các mục khác | TODO – chưa có màn đích | – |
| CourseOverviewScreen (màn 31) | Nút quay lại | pop | pop |
| CourseOverviewScreen (màn 31) | Nút "Đăng ký học miễn phí" / "Xem đề cương →" | CourseContentScreen (màn 32) | push |
| CourseContentScreen (màn 32) | Nút quay lại | pop | pop |
| CourseContentScreen (màn 32) | Thẻ bài học video (1.1, 1.2) | LectureVideoScreen (màn 33) | push |
| CourseContentScreen (màn 32) | Thẻ bài tập (1.3, 1.4) | QuizScreen (màn 34) | push |
| LectureVideoScreen (màn 33) | Nút quay lại | pop | pop |
| LectureVideoScreen (màn 33) | Bấm "Tải xuống" | SnackBar giả lập | – |
| QuizScreen (màn 34) | Nút quay lại / "Câu trước" | pop / giảm câu | pop |
| QuizScreen (màn 34) | Nút "Câu tiếp theo" | QuizResultScreen (màn 35) | push |
| QuizResultScreen (màn 35) | Nút quay lại | pop | pop |
| QuizResultScreen (màn 35) | Nút "Làm lại" | QuizScreen (màn 34) | pop |
| QuizResultScreen (màn 35) | Nút "Xem đáp án" | SnackBar giả lập | – |
| QuizResultScreen (màn 35) | Gợi ý ôn tập: "Các dạng bài thường gặp" | LectureVideoScreen (màn 33) | push **(SUY ĐOÁN)** |
| QuizResultScreen (màn 35) | Gợi ý ôn tập: "Bài tập nâng cao" | QuizScreen (màn 34) | push **(SUY ĐOÁN)** |
| PracticeListScreen (màn 41) | Nút quay lại | pop | pop |
| PracticeListScreen (màn 41) | Nút "Làm bài →" | PracticeSetupScreen (màn 44) | push |
| PracticeListScreen (màn 41) | Nút "Thi thử →" | SnackBar giả lập | – |
| PracticeSetupScreen (màn 44) | Nút quay lại | pop | pop |
| PracticeSetupScreen (màn 44) | Nút "Bắt đầu làm bài" | PracticeQuestionScreen (màn 45) | push |
| PracticeQuestionScreen (màn 45) | Nút quay lại / "Câu trước" | pop | pop |
| PracticeQuestionScreen (màn 45) | Nút "Kiểm tra" | PracticeFeedbackScreen (màn 46) | push |
| PracticeFeedbackScreen (màn 46) | Nút quay lại | pop | pop |
| PracticeFeedbackScreen (màn 46) | Nút "Xem giải thích" | PracticeExplanationScreen (màn 47) | push |
| PracticeFeedbackScreen (màn 46) | Nút "Câu tiếp theo" | PracticeResultScreen (màn 48) | push |
| PracticeExplanationScreen (màn 47) | Nút quay lại | pop | pop |
| PracticeExplanationScreen (màn 47) | Nút "Lưu câu hỏi" | SnackBar giả lập | – |
| PracticeExplanationScreen (màn 47) | Nút "Câu tiếp theo" | PracticeResultScreen (màn 48) | push |
| PracticeResultScreen (màn 48) | Nút quay lại | pop | pop |
| PracticeResultScreen (màn 48) | Nút "Xem câu sai" | ReviewWrongAnswersScreen (màn 49) | push |
| PracticeResultScreen (màn 48) | Link "Luyện tập lại" | PracticeQuestionScreen (màn 45) | pushReplacement |
| PracticeResultScreen (màn 48) | Link "Về danh sách" | PracticeListScreen (màn 41) | popUntil |
| ReviewWrongAnswersScreen (màn 49) | Nút quay lại | pop | pop |
| ReviewWrongAnswersScreen (màn 49) | Link "Xem giải thích →" | PracticeExplanationScreen (màn 47) | push |
| ReviewWrongAnswersScreen (màn 49) | Nút "Luyện lại 3 câu sai" | PracticeQuestionScreen (màn 45) | push |
| PracticeListScreen (màn 41) | Nút "Thi thử →" | MockExamListScreen (màn 51) | push |
| MockExamListScreen (màn 51) | Nút quay lại | pop | pop |
| MockExamListScreen (màn 51) | Thẻ đề thi môn học | ExamDetailScreen (màn 52) | push |
| ExamDetailScreen (màn 52) | Nút quay lại | pop | pop |
| ExamDetailScreen (màn 52) | Nút "Bắt đầu thi" | ExamInstructionsScreen (màn 53) | push |
| ExamInstructionsScreen (màn 53) | Nút quay lại | pop | pop |
| ExamInstructionsScreen (màn 53) | Nút "Tôi đã hiểu • Bắt đầu" | ExamRoomScreen (màn 54) | push |
| ExamRoomScreen (màn 54) | Nút quay lại / Nộp bài | SubmitExamScreen (màn 55) | push |
| SubmitExamScreen (màn 55) | Nút "Quay lại làm bài" | ExamRoomScreen (màn 54) | pop |
| SubmitExamScreen (màn 55) | Nút "Xác nhận nộp bài" | ExamResultScreen (màn 56) | pushReplacement |
| ExamResultScreen (màn 56) | Nút quay lại | ExamDetailScreen (màn 52) | popUntil |
| ExamResultScreen (màn 56) | Nút "Làm lại đề này" | ExamDetailScreen (màn 52) | popUntil |
| ExamResultScreen (màn 56) | Nút "Phân tích chi tiết" | TODO (SUY ĐOÁN) | SnackBar |
| LearningCenterScreen (màn 21) | Khối "Tổng quan học tập" | OverallProgressScreen (màn 61) | push |
| MyCoursesScreen (màn 17) | Thẻ "Tổng quan tiến độ" | OverallProgressScreen (màn 61) | push |
| MyCoursesScreen (màn 17) | Nút "Tạo kế hoạch" | LearningGoalsScreen (màn 65) | push |
| OverallProgressScreen (màn 61) | Nút quay lại | pop | pop |
| OverallProgressScreen (màn 61) | Thẻ "8/12 Môn học" / Hoạt động môn | SubjectProgressScreen (màn 62) | push (SUY ĐOÁN) |
| SubjectProgressScreen (màn 62) | Nút quay lại | pop | pop |
| SubjectProgressScreen (màn 62) | Thẻ môn học | CourseDetailScreen (màn 16) | push (SUY ĐOÁN) |
| LearningGoalsScreen (màn 65) | Nút quay lại | pop | pop |
| LearningGoalsScreen (màn 65) | Nút "+ Thêm mục tiêu mới" | CreateGoalScreen (màn 66) | push |
| CreateGoalScreen (màn 66) | Nút quay lại | pop | pop |
| CreateGoalScreen (màn 66) | Nút "Lưu mục tiêu" | LearningGoalsScreen (màn 65) | pop |
| HomeScreen (màn 11) | Icon chuông thông báo (Header) | NotificationListScreen (màn 77) | push |
| MainNavigationScreen (Tab 4 - Cá nhân) | Mục "Thông báo" | NotificationListScreen (màn 77) | push |
| MainNavigationScreen (Tab 4 - Cá nhân) | Mục "Lịch học & Thời khóa biểu" | MonthlyScheduleScreen (màn 71) | push |
| MyCoursesScreen (màn 17) | Thẻ lịch học "Lên kế hoạch học tập" (study_plan) | MonthlyScheduleScreen (màn 71) | push |
| LearningCenterScreen (màn 21) | Liên kết "Xem lịch tháng ›" (Công việc ưu tiên) | MonthlyScheduleScreen (màn 71) | push |
| MonthlyScheduleScreen (màn 71) | Nút quay lại | pop | pop |
| MonthlyScheduleScreen (màn 71) | Thẻ sự kiện lịch học | ScheduleDetailScreen (màn 73) | push |
| LearningCenterScreen (màn 21) | Khối ưu tiên "19:30 Ôn bài 4.1" (Xem lịch học) | ScheduleDetailScreen (màn 73) | push |
| ScheduleDetailScreen (màn 73) | Nút quay lại | pop | pop |
| ScheduleDetailScreen (màn 73) | Nút "Sửa lịch" | CreateScheduleScreen (màn 74) | push |
| ScheduleDetailScreen (màn 73) | Nút "Bắt đầu học" / "Bài giảng Chương 4" | LectureVideoScreen (màn 33) | push (SUY ĐOÁN) |
| ScheduleDetailScreen (màn 73) | Nút "10 câu luyện tập" | PracticeQuestionScreen (màn 45) | push (SUY ĐOÁN) |
| CreateScheduleScreen (màn 74) | Nút quay lại / Nút "Hủy" | pop | pop |
| CreateScheduleScreen (màn 74) | Nút "Lưu kế hoạch học" | ScheduleDetailScreen (màn 73) | pop |
| NotificationListScreen (màn 77) | Nút quay lại | pop | pop |
| NotificationListScreen (màn 77) | Nút "Nộp bài ngay" | MyAssignmentsScreen (màn 26) | push (SUY ĐOÁN) |
| NotificationListScreen (màn 77) | Nút "Xem đề bài" | CourseContentScreen (màn 32) | push (SUY ĐOÁN) |
| NotificationListScreen (màn 77) | Nút "Ôn tập ngay" | PracticeQuestionScreen (màn 45) | push (SUY ĐOÁN) |
| NotificationListScreen (màn 77) | Nút "Xem lộ trình" | CourseOverviewScreen (màn 31) | push (SUY ĐOÁN) |
| MainNavigationScreen (Tab 4 - Cá nhân) | Thẻ sinh viên / Avatar / Tên | StudentProfileScreen (màn 81) | push |
| StudentProfileScreen (màn 81) | Nút quay lại | pop | pop |
| StudentProfileScreen (màn 81) | Nút sửa / Icon bút | EditProfileScreen (màn 82) | push |
| EditProfileScreen (màn 82) | Nút quay lại / Nút "Hủy bỏ" | pop | pop |
| EditProfileScreen (màn 82) | Nút "Lưu thay đổi" | StudentProfileScreen (màn 81) | pop |
| MainNavigationScreen (Tab 4 - Cá nhân) | Mục "Cài đặt tài khoản" | AccountSettingsScreen (màn 84) | push |
| AccountSettingsScreen (màn 84) | Nút quay lại | pop | pop |
| AccountSettingsScreen (màn 84) | Mục "Đổi mật khẩu" | ChangePasswordScreen (màn 85) | push |
| ChangePasswordScreen (màn 85) | Nút quay lại / Nút "Hủy bỏ và quay lại cài đặt" | pop | pop |
| ChangePasswordScreen (màn 85) | Nút "Cập nhật mật khẩu mới" | AccountSettingsScreen (màn 84) | pop |
| AccountSettingsScreen (màn 84) | Nút "Đăng xuất tài khoản" | LogoutConfirmationScreen (màn 90) | push |
| MainNavigationScreen (Tab 4 - Cá nhân) | Mục "Đăng xuất tài khoản" | LogoutConfirmationScreen (màn 90) | push |
| LogoutConfirmationScreen (màn 90) | Nút quay lại / Nút "Ở lại học tiếp" | pop | pop |
| LogoutConfirmationScreen (màn 90) | Nút "Đăng xuất an toàn" | LoginScreen (màn 03) | pushAndRemoveUntil |
| MainNavigationScreen (Tab 4 - Cá nhân) | Mục "Trợ giúp & Hỗ trợ" | HelpCenterScreen (màn 91) | push |
| HelpCenterScreen (màn 91) | Nút quay lại | pop | pop |
| HelpCenterScreen (màn 91) | Nút "Liên hệ hỗ trợ" | ContactSupportScreen (màn 93) | push |
| ContactSupportScreen (màn 93) | Nút quay lại | pop | pop |
| ContactSupportScreen (màn 93) | Nút "Gửi yêu cầu" | Dialog xác nhận → pop | dialog |
