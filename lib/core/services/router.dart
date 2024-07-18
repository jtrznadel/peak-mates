import 'package:flutter/material.dart';
import 'package:peak_mates/features/onboarding/presentation/views/onboarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return _pageBuilder((_) => const OnboardingScreen(), settings: settings);
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, __, ___) => page(
      context,
    ),
  );
}
