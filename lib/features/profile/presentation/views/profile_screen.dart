
import 'package:flutter/material.dart';
import 'package:peak_mates/features/profile/presentation/refactors/profile_body.dart';
import 'package:peak_mates/features/profile/presentation/refactors/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: const Text(
          'Profile',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
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
