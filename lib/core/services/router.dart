import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/auth/presentation/views/login_screen.dart';
import 'package:peak_mates/features/auth/presentation/views/selection_screen.dart';
import 'package:peak_mates/features/auth/presentation/views/sign_up_screen.dart';
import 'package:peak_mates/core/common/view/navigation_view.dart';
import 'package:peak_mates/features/home/presentation/views/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case OnboardingScreen.routeName:
    //   return _pageBuilder((_) => const OnboardingScreen(), settings: settings);
    case '/':
      return _pageBuilder((context) {
        if (sl<FirebaseAuth>().currentUser != null) {
          final user = sl<FirebaseAuth>().currentUser!;
          final userModel = UserModel(
            uid: user.uid,
            email: user.email ?? '',
            username: user.displayName ?? '',
          );
          context.userProvider.initUser(userModel);
          return const NavigationView();
        } else {
          return const SelectionScreen();
        }
      }, settings: settings);
    case SelectionScreen.routeName:
      return _pageBuilder((_) => const SelectionScreen(), settings: settings);
    case LoginScreen.routeName:
      return _pageBuilder(
          (_) => BlocProvider(
                create: (context) => sl<AuthCubit>(),
                child: const LoginScreen(),
              ),
          settings: settings);
    case SignUpScreen.routeName:
      return _pageBuilder(
          (_) => BlocProvider(
                create: (context) => sl<AuthCubit>(),
                child: const SignUpScreen(),
              ),
          settings: settings);
    case HomeScreen.routeName:
      return _pageBuilder((_) => const HomeScreen(), settings: settings);
    case NavigationView.routeName:
      return _pageBuilder((_) => const NavigationView(), settings: settings);
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
