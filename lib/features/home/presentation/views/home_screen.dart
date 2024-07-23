import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/string_res.dart';
import 'package:peak_mates/features/home/presentation/refactors/home_body.dart';
import 'package:peak_mates/features/home/presentation/refactors/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.bgColorDark,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(StringRes.appName),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.primaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(),
          )
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              SizedBox(
                height: 10,
              ),
              HomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
