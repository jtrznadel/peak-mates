import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class CustomSnackbar {
  final String message;

  const CustomSnackbar({required this.message});

  static show(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: context.theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.grayDarkColor,
      ),
    );
  }
}
