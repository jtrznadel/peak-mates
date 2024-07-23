import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/common/providers/navigation_controller.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
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
    return StreamBuilder<UserModel>(
      stream: Streams.userDataStream,
      builder: (_, snapshot) {
        return Consumer<NavigationController>(
          builder: (_, controller, __) {
            if (snapshot.hasData && snapshot.data is UserModel) {
              context.read<UserProvider>().user = snapshot.data;
            }
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
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
