import 'package:flutter/material.dart';
import 'package:peak_mates/features/chat/presentation/views/chat_center_screen.dart';
import 'package:peak_mates/features/explore/presentation/views/explore_screen.dart';
import 'package:peak_mates/features/home/presentation/views/home_screen.dart';
import 'package:peak_mates/features/profile/presentation/views/profile_screen.dart';

class NavigationController extends ChangeNotifier {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const ChatCenterScreen(),
    const ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'DMs',
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
