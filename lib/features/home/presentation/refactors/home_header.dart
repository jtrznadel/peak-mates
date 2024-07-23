import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Welcome, ',
            style: context.theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            children: [
              TextSpan(
                text: context.currentUser?.username ?? 'Unknown',
                style: context.theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Where would you like to go?',
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(10),
            suffixIcon: Icon(Icons.filter_list),
            suffixIconColor: AppColors.grayLightColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.grayDarkColor,
          ),
          cursorColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
