// Mock data cho dự án EduPath (mobile app học trực tuyến frontend)
import 'package:flutter/material.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}

class ChapterModel {
  final String number;
  final String title;
  final int lessonCount;

  const ChapterModel({
    required this.number,
    required this.title,
    required this.lessonCount,
  });
}

class CourseModel {
  final String id;
  final String title;
  final String subtitle;
  final double progress; // 0.0 -> 1.0
  final String category;
  final String credits;
  final String? coverImage;
  final String? iconImage;
  final Color? badgeColor;
  final String? badgeText;
  final double rating;
  final String studentsCount;
  final String duration;
  final int lessonsCount;
  final int testsCount;
  final int documentsCount;
  final String description;
  final List<String> learningOutcomes;
  final List<ChapterModel> chapters;
  final String examPrepTitle;
  final String examPrepSubtitle;

  const CourseModel({
    required this.id,
    required this.title,
    this.subtitle = '',
    this.progress = 0.0,
    required this.category,
    this.credits = '3 tín chỉ',
    this.coverImage,
    this.iconImage,
    this.badgeColor,
    this.badgeText,
    this.rating = 4.8,
    this.studentsCount = '1.2k học viên',
    this.duration = '45 giờ',
    this.lessonsCount = 48,
    this.testsCount = 8,
    this.documentsCount = 20,
    this.description = '',
    this.learningOutcomes = const [],
    this.chapters = const [],
    this.examPrepTitle = 'Đề thi mẫu & câu hỏi ôn tập',
    this.examPrepSubtitle = 'Có đáp án chi tiết và video chữa bài',
  });
}

class CategoryModel {
  final String id;
  final String title;
  final String subtitle;
  final int courseCount;
  final String iconImage;
  final Color backgroundColor;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.courseCount,
    required this.iconImage,
    required this.backgroundColor,
  });
}

class ChapterModel {
  final int number;
  final String title;
  final int lessonCount;

  const ChapterModel({
    required this.number,
    required this.title,
    required this.lessonCount,
  });
}

class AssignmentModel {
  final String id;
  final String title;
  final String courseName;
  final String deadline;
  final String status; // 'dang_lam', 'da_nop', 'chua_lam'
  final IconData icon;
  final Color iconBgColor;

  const AssignmentModel({
    required this.id,
    required this.title,
    required this.courseName,
    required this.deadline,
    required this.status,
    required this.icon,
    required this.iconBgColor,
  });
}

class DocumentModel {
  final String id;
  final String fileName;
  final String courseName;
  final String fileSize;
  final String fileType; // 'pdf', 'pptx', 'doc'
  final Color iconColor;

  const DocumentModel({
    required this.id,
    required this.fileName,
    required this.courseName,
    required this.fileSize,
    required this.fileType,
    required this.iconColor,
  });
}

class MockData {
  MockData._();

  static const UserModel currentUser = UserModel(
    id: 'user_1',
    name: 'Hải Ly',
    email: 'haily@student.edu.vn',
    avatarUrl: 'assets/images/banner_student.png',
  );

  static const CourseModel mathCourse = CourseModel(
    id: 'course_1',
    title: 'Toán cao cấp',
    subtitle: 'Giải tích & Đại số tuyến tính',
    progress: 0.65,
    category: 'Đại cương',
    credits: '3 tín chỉ',
    coverImage: 'assets/images/course_math.png',
    iconImage: 'assets/images/ic_search_math.png',
    badgeText: 'TOÁN CAO CẤP',
    rating: 4.8,
    studentsCount: '1.2k học viên',
    duration: '45 giờ',
    lessonsCount: 48,
    testsCount: 8,
    documentsCount: 20,
    description:
        'Môn học cung cấp kiến thức nền tảng về giải tích và đại số tuyến tính cho sinh viên các ngành kỹ thuật, kinh tế và công nghệ thông tin. Giúp rèn luyện tư duy logic và kỹ năng giải quyết bài toán thực tế.',
    learningOutcomes: [
      'Nắm vững các khái niệm giải tích cơ bản',
      'Giải bài toán ma trận - hệ phương trình',
      'Ứng dụng toán học trong kinh tế và kỹ thuật',
    ],
    chapters: [
      ChapterModel(
        number: '01',
        title: 'Giới hạn và tính liên tục',
        lessonCount: 12,
      ),
      ChapterModel(
        number: '02',
        title: 'Đạo hàm và vi phân',
        lessonCount: 10,
      ),
      ChapterModel(
        number: '03',
        title: 'Tích phân và ứng dụng',
        lessonCount: 15,
      ),
      ChapterModel(
        number: '04',
        title: 'Ma trận và đại số tuyến tính',
        lessonCount: 11,
      ),
    ],
    examPrepTitle: 'Đề thi mẫu & câu hỏi ôn tập',
    examPrepSubtitle: 'Có đáp án chi tiết và video chữa bài',
  );

  static const CourseModel englishCourse = CourseModel(
    id: 'course_2',
    title: 'Tiếng Anh cơ bản',
    subtitle: 'Ngữ pháp & Giao tiếp nền tảng',
    progress: 0.40,
    category: 'Ngoại ngữ',
    credits: '3 tín chỉ',
    coverImage: 'assets/images/course_english.png',
    iconImage: 'assets/images/cat_english.png',
    badgeText: 'TIẾNG ANH CƠ BẢN',
    rating: 4.7,
    studentsCount: '2.5k học viên',
    duration: '36 giờ',
    lessonsCount: 32,
    testsCount: 6,
    documentsCount: 15,
    description:
        'Khóa học củng cố ngữ pháp, từ vựng học thuật cơ bản và nâng cao kỹ năng nghe hiểu, đọc hiểu cho sinh viên năm nhất chuẩn bị cho các kỳ thi chuẩn đầu ra.',
    learningOutcomes: [
      'Nắm vững 12 thì cơ bản và cấu trúc câu thông dụng',
      'Xây dựng vốn từ vựng 1000 từ học thuật',
      'Tự tin giao tiếp và thuyết trình đề tài cơ bản',
    ],
    chapters: [
      ChapterModel(
        number: '01',
        title: 'Phát âm chuẩn IPA & Ngữ điệu',
        lessonCount: 8,
      ),
      ChapterModel(
        number: '02',
        title: 'Ngữ pháp cốt lõi và các thì căn bản',
        lessonCount: 12,
      ),
      ChapterModel(
        number: '03',
        title: 'Từ vựng chủ đề học thuật',
        lessonCount: 8,
      ),
      ChapterModel(
        number: '04',
        title: 'Luyện nghe & phản xạ giao tiếp',
        lessonCount: 4,
      ),
    ],
    examPrepTitle: 'Đề luyện thi chuẩn đầu ra B1',
    examPrepSubtitle: 'Kèm file audio và giải thích chi tiết',
  );

  static const CourseModel lawCourse = CourseModel(
    id: 'course_law',
    title: 'Pháp luật đại cương',
    subtitle: 'Nhà nước và Pháp luật Việt Nam',
    progress: 0.15,
    category: 'Đại cương',
    credits: '2 tín chỉ',
    coverImage: 'assets/images/course_math.png',
    iconImage: 'assets/images/ic_search_law.png',
    badgeText: 'PHÁP LUẬT ĐẠI CƯƠNG',
    rating: 4.6,
    studentsCount: '1.8k học viên',
    duration: '30 giờ',
    lessonsCount: 24,
    testsCount: 4,
    documentsCount: 12,
    description:
        'Cung cấp những kiến thức cơ bản nhất về nhà nước và pháp luật nói chung, hệ thống pháp luật nước CHXHCN Việt Nam nói riêng, bồi dưỡng ý thức chấp hành pháp luật.',
    learningOutcomes: [
      'Hiểu nguồn gốc, bản chất và vai trò của pháp luật',
      'Nắm vững hệ thống pháp luật hiện hành',
      'Phân tích được các tình huống pháp lý cơ bản',
    ],
    chapters: [
      ChapterModel(
        number: '01',
        title: 'Nguồn gốc và bản chất của Nhà nước',
        lessonCount: 6,
      ),
      ChapterModel(
        number: '02',
        title: 'Quy phạm pháp luật và quan hệ pháp luật',
        lessonCount: 8,
      ),
      ChapterModel(
        number: '03',
        title: 'Vi phạm pháp luật và trách nhiệm pháp lý',
        lessonCount: 6,
      ),
      ChapterModel(
        number: '04',
        title: 'Các ngành luật chủ yếu trong hệ thống',
        lessonCount: 4,
      ),
    ],
    examPrepTitle: 'Bộ câu hỏi trắc nghiệm ôn tập',
    examPrepSubtitle: 'Có đáp án và trích dẫn điều luật',
  );

  static const CourseModel econCourse = CourseModel(
    id: 'course_3',
    title: 'Kinh tế vi mô',
    subtitle: 'Lý thuyết cung cầu và hành vi người tiêu dùng',
    progress: 0.20,
    category: 'Kinh tế',
    credits: '3 tín chỉ',
    coverImage: 'assets/images/course_econ.png',
    iconImage: 'assets/images/cat_econ.png',
    badgeText: 'KINH TẾ VI MÔ',
    rating: 4.9,
    studentsCount: '3.1k học viên',
    duration: '42 giờ',
    lessonsCount: 40,
    testsCount: 6,
    documentsCount: 18,
    description:
        'Phân tích hành vi của các chủ thể kinh tế đơn lẻ: người tiêu dùng, người sản xuất, cấu trúc thị trường và sự can thiệp của chính phủ.',
    learningOutcomes: [
      'Hiểu quy luật cung - cầu và trạng thái cân bằng thị trường',
      'Phân tích độ co giãn và tối đa hóa lợi ích người dùng',
      'Nắm bắt các hình thái cấu trúc thị trường',
    ],
    chapters: [
      ChapterModel(
        number: '01',
        title: 'Tổng quan và mô hình kinh tế vi mô',
        lessonCount: 8,
      ),
      ChapterModel(
        number: '02',
        title: 'Cơ chế cung - cầu và giá cả thị trường',
        lessonCount: 12,
      ),
      ChapterModel(
        number: '03',
        title: 'Lý thuyết hành vi người tiêu dùng',
        lessonCount: 10,
      ),
      ChapterModel(
        number: '04',
        title: 'Lý thuyết sản xuất và chi phí',
        lessonCount: 10,
      ),
    ],
    examPrepTitle: 'Tổng hợp đề thi giữa kỳ & cuối kỳ',
    examPrepSubtitle: 'Kèm ma trận câu hỏi và hướng dẫn giải',
  );

  static const List<CourseModel> suggestedCourses = [
    mathCourse,
    englishCourse,
    econCourse,
  ];

  static const List<CourseModel> searchRecommendations = [
    mathCourse,
    lawCourse,
    CourseModel(
      id: 'rec_3',
      title: 'Kỹ năng thuyết trình',
      subtitle: 'Kỹ năng • 8 bài học',
      category: 'Kỹ năng',
      credits: '2 tín chỉ',
      iconImage: 'assets/images/ic_search_comm.png',
    ),
  ];

  static const List<String> recentSearches = [
    'Toán cao cấp',
    'Tiếng Anh',
    'Lập trình',
    'Kinh tế vi mô',
  ];

  // Danh sách môn học cho màn hình "Kết quả tìm kiếm" (Screen 5)
  static const List<CourseModel> searchResults = [
    CourseModel(
      id: 'sr_1',
      title: 'Toán cao cấp',
      subtitle: 'Đại số tuyến tính • 12 bài học',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/ic_search_math.png',
      badgeText: 'TOÁN CAO CẤP',
      rating: 4.8,
      duration: '45 giờ',
      lessonsCount: 48,
    ),
    CourseModel(
      id: 'sr_2',
      title: 'Toán cao cấp',
      subtitle: 'Giải tích • 15 bài học',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/ic_search_math.png',
      badgeText: 'TOÁN CAO CẤP',
      rating: 4.8,
      duration: '45 giờ',
      lessonsCount: 48,
    ),
    CourseModel(
      id: 'sr_3',
      title: 'Giải tích',
      subtitle: 'Đại số • 10 bài học',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/ic_search_math.png',
      badgeText: 'GIẢI TÍCH',
      rating: 4.7,
      duration: '38 giờ',
      lessonsCount: 30,
    ),
    CourseModel(
      id: 'sr_4',
      title: 'Xác suất thống kê',
      subtitle: 'Đại số • 14 bài học',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/ic_search_math.png',
      badgeText: 'XÁC SUẤT THỐNG KÊ',
      rating: 4.6,
      duration: '40 giờ',
      lessonsCount: 35,
    ),
  ];

  // Danh sách môn học cho màn hình "Môn học của tôi" (Screen 7)
  static const List<CourseModel> enrolledCourses = [
    CourseModel(
      id: 'enrolled_1',
      title: 'Toán cao cấp',
      subtitle: 'Giải tích & Đại số tuyến tính',
      progress: 0.65,
      category: 'Đại cương',
      credits: '3 tín chỉ',
      coverImage: 'assets/images/course_math.png',
      iconImage: 'assets/images/ic_search_math.png',
      badgeText: 'TOÁN CAO CẤP',
    ),
    CourseModel(
      id: 'enrolled_2',
      title: 'Tiếng Anh cơ bản',
      subtitle: 'Ngữ pháp & Giao tiếp',
      progress: 0.40,
      category: 'Ngoại ngữ',
      credits: '3 tín chỉ',
      coverImage: 'assets/images/course_english.png',
      iconImage: 'assets/images/cat_english.png',
      badgeText: 'TIẾNG ANH',
    ),
    CourseModel(
      id: 'enrolled_3',
      title: 'Pháp luật đại cương',
      subtitle: 'Nhà nước và Pháp luật',
      progress: 0.15,
      category: 'Đại cương',
      credits: '2 tín chỉ',
      coverImage: 'assets/images/course_math.png',
      iconImage: 'assets/images/ic_search_law.png',
      badgeText: 'PHÁP LUẬT',
    ),
  ];

  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'tech',
      title: 'Công nghệ',
      subtitle: 'Công nghệ thông tin',
      courseCount: 18,
      iconImage: 'assets/images/cat_tech.png',
      backgroundColor: Color(0xFFEBF2FE),
    ),
    CategoryModel(
      id: 'math',
      title: 'Toán học',
      subtitle: 'Toán học',
      courseCount: 24,
      iconImage: 'assets/images/cat_math.png',
      backgroundColor: Color(0xFFEAF8EF),
    ),
    CategoryModel(
      id: 'literature',
      title: 'Văn học',
      subtitle: 'Ngữ văn',
      courseCount: 18,
      iconImage: 'assets/images/cat_literature.png',
      backgroundColor: Color(0xFFFEF7EB),
    ),
    CategoryModel(
      id: 'english',
      title: 'Tiếng Anh',
      subtitle: 'Tiếng Anh',
      courseCount: 20,
      iconImage: 'assets/images/cat_english.png',
      backgroundColor: Color(0xFFEBF2FE),
    ),
    CategoryModel(
      id: 'science',
      title: 'Khoa học',
      subtitle: 'Vật lý',
      courseCount: 16,
      iconImage: 'assets/images/cat_science.png',
      backgroundColor: Color(0xFFEAF6FB),
    ),
    CategoryModel(
      id: 'econ',
      title: 'Kinh tế',
      subtitle: 'Kinh tế',
      courseCount: 14,
      iconImage: 'assets/images/cat_econ.png',
      backgroundColor: Color(0xFFFEF3EB),
    ),
    CategoryModel(
      id: 'law',
      title: 'Pháp luật',
      subtitle: 'Pháp luật',
      courseCount: 12,
      iconImage: 'assets/images/cat_law.png',
      backgroundColor: Color(0xFFFEF8EB),
    ),
    CategoryModel(
      id: 'history',
      title: 'Lịch sử',
      subtitle: 'Lịch sử',
      courseCount: 15,
      iconImage: 'assets/images/cat_history.png',
      backgroundColor: Color(0xFFFBF1E8),
    ),
  ];

  // --- Màn 15: Kết quả tìm kiếm ---
  static const List<CourseModel> searchResults = [
    CourseModel(
      id: 'sr_1',
      title: 'Toán cao cấp',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/cat_math.png',
    ),
    CourseModel(
      id: 'sr_2',
      title: 'Toán rời rạc',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/cat_math.png',
    ),
    CourseModel(
      id: 'sr_3',
      title: 'Giải tích',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/cat_math.png',
    ),
    CourseModel(
      id: 'sr_4',
      title: 'Xác suất thống kê',
      category: 'Đại cương',
      credits: '2 tín chỉ',
      iconImage: 'assets/images/cat_math.png',
    ),
  ];

  // --- Màn 16: Chi tiết môn học ---
  static const List<ChapterModel> courseChapters = [
    ChapterModel(number: 1, title: 'Giới hạn và tính liên tục', lessonCount: 10),
    ChapterModel(number: 2, title: 'Đạo hàm và ứng dụng', lessonCount: 12),
    ChapterModel(number: 3, title: 'Tích phân và ứng dụng', lessonCount: 14),
    ChapterModel(number: 4, title: 'Ma trận và đại số tuyến tính', lessonCount: 12),
  ];

  // --- Màn 17: Môn học của tôi ---
  static const List<CourseModel> myCoursesInProgress = [
    CourseModel(
      id: 'mc_1',
      title: 'Toán cao cấp',
      progress: 0.80,
      category: 'Đại cương',
      iconImage: 'assets/images/cat_math.png',
    ),
    CourseModel(
      id: 'mc_2',
      title: 'Tiếng Anh cơ bản',
      progress: 0.35,
      category: 'Ngoại ngữ',
      iconImage: 'assets/images/cat_english.png',
    ),
    CourseModel(
      id: 'mc_3',
      title: 'Pháp luật đại cương',
      progress: 0.20,
      category: 'Đại cương',
      iconImage: 'assets/images/cat_law.png',
    ),
  ];

  // --- Màn 19: Nội dung yêu thích ---
  static const List<CourseModel> favoriteCourses = [
    CourseModel(
      id: 'fav_1',
      title: 'Toán cao cấp',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/cat_math.png',
    ),
    CourseModel(
      id: 'fav_2',
      title: 'Kỹ năng thuyết trình',
      category: 'Kỹ năng',
      credits: '2 tín chỉ',
      iconImage: 'assets/images/ic_search_comm.png',
    ),
    CourseModel(
      id: 'fav_3',
      title: 'Lịch sử Việt Nam',
      category: 'Đại cương',
      credits: '2 tín chỉ',
      iconImage: 'assets/images/cat_history.png',
    ),
    CourseModel(
      id: 'fav_4',
      title: 'Marketing căn bản',
      category: 'Chuyên ngành',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/ic_search_comm.png',
    ),
  ];

  // --- Màn 26: Bài tập của tôi ---
  static const List<AssignmentModel> myAssignments = [
    AssignmentModel(
      id: 'hw_1',
      title: 'Bài tập chương 1',
      courseName: 'Toán cao cấp',
      deadline: '25/10',
      status: 'dang_lam',
      icon: Icons.description_outlined,
      iconBgColor: Color(0xFFEAF8EF),
    ),
    AssignmentModel(
      id: 'hw_2',
      title: 'Unit 3 - Grammar',
      courseName: 'Tiếng Anh',
      deadline: '28/10',
      status: 'da_nop',
      icon: Icons.spellcheck_rounded,
      iconBgColor: Color(0xFFEAF8EF),
    ),
    AssignmentModel(
      id: 'hw_3',
      title: 'Bài tập phân tích',
      courseName: 'Kinh tế vi mô',
      deadline: '28/10',
      status: 'chua_lam',
      icon: Icons.bar_chart_rounded,
      iconBgColor: Color(0xFFEAF8EF),
    ),
    AssignmentModel(
      id: 'hw_4',
      title: 'Bài luận cá nhân',
      courseName: 'Kỹ năng thuyết trình',
      deadline: '30/10',
      status: 'dang_lam',
      icon: Icons.edit_note_rounded,
      iconBgColor: Color(0xFFFEF7EB),
    ),
  ];

  // --- Màn 27: Tài liệu của tôi ---
  static const List<DocumentModel> myDocuments = [
    DocumentModel(
      id: 'doc_1',
      fileName: 'Giới hạn hàm số.pdf',
      courseName: 'Toán cao cấp',
      fileSize: '2.4 MB',
      fileType: 'pdf',
      iconColor: Color(0xFFD92D20),
    ),
    DocumentModel(
      id: 'doc_2',
      fileName: 'Unit 3 - Vocabulary.pdf',
      courseName: 'Tiếng Anh cơ bản',
      fileSize: '1.8 MB',
      fileType: 'pdf',
      iconColor: Color(0xFF2563EB),
    ),
    DocumentModel(
      id: 'doc_3',
      fileName: 'Kinh tế vi mô - Chương 2.pdf',
      courseName: 'Kinh tế vi mô',
      fileSize: '3.1 MB',
      fileType: 'pdf',
      iconColor: Color(0xFFD92D20),
    ),
    DocumentModel(
      id: 'doc_4',
      fileName: 'Kỹ năng thuyết trình.pptx',
      courseName: 'Kỹ năng mềm',
      fileSize: '4.2 MB',
      fileType: 'pptx',
      iconColor: Color(0xFFB45309),
    ),
    DocumentModel(
      id: 'doc_5',
      fileName: 'Đề cương ôn tập.pdf',
      courseName: 'Tài liệu chung',
      fileSize: '2.0 MB',
      fileType: 'pdf',
      iconColor: Color(0xFFD92D20),
    ),
  ];
}
