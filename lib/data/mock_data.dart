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

class CourseModel {
  final String id;
  final String title;
  final double progress; // 0.0 -> 1.0
  final String category;
  final String credits;
  final String? coverImage;
  final String? iconImage;
  final Color? badgeColor;

  const CourseModel({
    required this.id,
    required this.title,
    this.progress = 0.0,
    required this.category,
    this.credits = '3 tín chỉ',
    this.coverImage,
    this.iconImage,
    this.badgeColor,
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

class MockData {
  MockData._();

  static const UserModel currentUser = UserModel(
    id: 'user_1',
    name: 'Hải Ly',
    email: 'haily@student.edu.vn',
    avatarUrl: 'assets/images/banner_student.png',
  );

  static const List<CourseModel> suggestedCourses = [
    CourseModel(
      id: 'course_1',
      title: 'Toán cao cấp',
      progress: 0.65,
      category: 'Đại cương',
      credits: '3 tín chỉ',
      coverImage: 'assets/images/course_math.png',
      iconImage: 'assets/images/ic_search_math.png',
    ),
    CourseModel(
      id: 'course_2',
      title: 'Tiếng Anh cơ bản',
      progress: 0.35,
      category: 'Ngoại ngữ',
      credits: '3 tín chỉ',
      coverImage: 'assets/images/course_english.png',
      iconImage: 'assets/images/cat_english.png',
    ),
    CourseModel(
      id: 'course_3',
      title: 'Kinh tế vi mô',
      progress: 0.20,
      category: 'Kinh tế',
      credits: '3 tín chỉ',
      coverImage: 'assets/images/course_econ.png',
      iconImage: 'assets/images/cat_econ.png',
    ),
  ];

  static const List<CourseModel> searchRecommendations = [
    CourseModel(
      id: 'rec_1',
      title: 'Toán cao cấp',
      category: 'Đại cương',
      credits: '3 tín chỉ',
      iconImage: 'assets/images/ic_search_math.png',
    ),
    CourseModel(
      id: 'rec_2',
      title: 'Pháp luật đại cương',
      category: 'Đại cương',
      credits: '2 tín chỉ',
      iconImage: 'assets/images/ic_search_law.png',
    ),
    CourseModel(
      id: 'rec_3',
      title: 'Kỹ năng thuyết trình',
      category: 'Kỹ năng',
      credits: '2 tín chỉ',
      iconImage: 'assets/images/ic_search_comm.png',
    ),
  ];

  static const List<String> recentSearches = [
    'Toán cao cấp',
    'Kinh tế vi mô',
    'Tiếng Anh',
    'Pháp luật',
    'Marketing',
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
}
