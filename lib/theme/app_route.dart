import 'package:flutter/material.dart';

/// Custom page route với Animation "Move in" hướng từ phải sang trái,
/// thời lượng 300ms, Curve Ease out chuẩn theo quy tắc Prototype Figma.
class AppSlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  AppSlideRoute({required this.page, super.settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );
}
