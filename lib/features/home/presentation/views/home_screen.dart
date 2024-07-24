import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
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
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            text: 'Welcome, ',
            style: context.theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: context.currentUser?.username ?? 'Unknown',
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
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
            child: CircleAvatar(
              backgroundImage: AssetImage(MediaRes.tempAvatar),
            ),
          )
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
