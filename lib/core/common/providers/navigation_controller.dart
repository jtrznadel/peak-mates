import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/chat/presentation/views/chat_center_screen.dart';
import 'package:peak_mates/features/explore/presentation/views/explore_screen.dart';
import 'package:peak_mates/features/home/presentation/views/home_screen.dart';
import 'package:peak_mates/features/profile/presentation/views/profile_screen.dart';

class NavigationController extends ChangeNotifier {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const ChatCenterScreen(),
    BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: const ProfileScreen(),
    ),
  ];

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.cabin),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.hiking),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.mail),
      label: 'Messages',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  int _currentIndex = 0;

  List<Widget> get screens => _screens;
  List<BottomNavigationBarItem> get items => _items;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
