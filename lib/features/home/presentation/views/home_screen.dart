import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/res/media_res.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Home Screen'),
        ],
      ),
    );
  }
}
