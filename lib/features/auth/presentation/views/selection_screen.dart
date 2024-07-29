import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/res/string_res.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  static const routeName = '/selection';

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return ImageBackground(
      image: MediaRes.onboardingBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: StringRes.selectionTitle,
              style: context.theme.textTheme.titleLarge!.copyWith(
                color: AppColors.lightTextColor,
              ),
              children: [
                TextSpan(
                  text: StringRes.appName,
                  style: context.theme.textTheme.titleLarge,
                ),
                TextSpan(
                  text: '!',
                  style: context.theme.textTheme.titleLarge!.copyWith(
                    color: AppColors.lightTextColor,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
    );
  }
}
