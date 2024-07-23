import 'package:flutter/material.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/common/providers/navigation_controller.dart';
import 'package:provider/provider.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  static const String routeName = '/navigation';

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (_, controller, __) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              onTap: controller.changeIndex,
              items: controller.items,
              currentIndex: controller.currentIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Theme.of(context).disabledColor,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.lightColor,
            ),
          ),
        );
      },
    );
  }
}
