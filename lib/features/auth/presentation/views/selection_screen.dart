import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/res/string_res.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  static const routeName = '/selection';

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          MediaRes.onboardingBackground,
          fit: BoxFit.cover,
        ),
        Container(
          color: AppColors.grayDarkColor.withOpacity(.6),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: StringRes.selectionTitle,
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: AppColors.lightColor,
                      ),
                      children: [
                        TextSpan(
                            text: StringRes.appName,
                            style: context.theme.textTheme.titleLarge),
                        TextSpan(
                          text: '!',
                          style: context.theme.textTheme.titleLarge!.copyWith(
                            color: AppColors.lightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(
                            'Login',
                            style: context.theme.textTheme.bodyMedium!.copyWith(
                              color: AppColors.grayDarkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signUp');
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
