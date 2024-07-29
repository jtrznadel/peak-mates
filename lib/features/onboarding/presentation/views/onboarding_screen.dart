import 'package:flutter/material.dart';
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
    return Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
          child: Image.asset(
            MediaRes.onboardingBackground,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringRes.onBoardingTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  StringRes.appName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  StringRes.onBoardingSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 15,
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
                      Icons.landscape,
                    ),
                    buttonText: "Explore now",
                    buttontextstyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
