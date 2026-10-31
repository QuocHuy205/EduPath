import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const EduPathApp());
}

class EduPathApp extends StatelessWidget {
  const EduPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPath',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
