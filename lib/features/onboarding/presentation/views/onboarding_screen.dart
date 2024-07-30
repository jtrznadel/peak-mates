import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/res/string_res.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isFinished = false;
  @override
  Widget build(BuildContext context) {
    return ImageBackground(
      image: MediaRes.onboardingBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringRes.onBoardingInfo,
            style: context.theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: AppColors.lightTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Text(
            StringRes.onBoardingTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.lightTextColor,
                ),
          ),
          Text(
            StringRes.appName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            StringRes.onBoardingSubtitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                  color: AppColors.lightTextColor,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SwipeableButtonView(
              onFinish: () {
                Navigator.of(context).pushNamed('/selection');
              },
              isFinished: _isFinished,
              onWaitingProcess: () {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _isFinished = true;
                  });
                });
              },
              activeColor: AppColors.grayDarkColor.withOpacity(.6),
              buttonColor: AppColors.primaryColor,
              buttonWidget: const Icon(
                Icons.arrow_forward_ios,
              ),
              buttonText: "Explore now",
              buttontextstyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.lightTextColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
