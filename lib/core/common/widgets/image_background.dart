import 'package:flutter/material.dart';
import 'package:peak_mates/core/res/colors.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key, required this.child, required this.image});

  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: AppColors.grayDarkColor.withOpacity(.6),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
