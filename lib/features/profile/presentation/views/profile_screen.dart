import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/features/profile/presentation/refactors/profile_body.dart';
import 'package:peak_mates/features/profile/presentation/refactors/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorDark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(
              height: 15,
            ),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
