import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.primaryColor,
        ),
        hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.grayLightColor,
        ),
        fillColor: AppColors.grayDarkColor.withOpacity(.5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: context.theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.lightTextColor,
      ),
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.dark,
      autocorrect: false,
    );
  }
}
