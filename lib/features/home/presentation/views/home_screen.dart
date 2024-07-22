import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/res/media_res.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackground(
        image: MediaRes.onboardingBackground,
        child: Center(
          child: Column(
            children: [
              const Text('Home Screen'),
              TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text('logoue'))
            ],
          ),
        ),
      ),
    );
  }
}
