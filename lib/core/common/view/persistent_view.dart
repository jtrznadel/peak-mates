import 'package:flutter/material.dart';
import 'package:peak_mates/core/res/colors.dart';

class PersistentView extends StatelessWidget {
  const PersistentView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: child,
        ),
      ),
    );
  }
}
