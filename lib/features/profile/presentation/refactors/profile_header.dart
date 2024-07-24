import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/res/string_res.dart';
import 'package:peak_mates/features/profile/presentation/widgets/profile_stats_item.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  width: context.width * .3,
                  height: context.width * .3,
                  child: DashedCircularProgressBar.square(
                    dimensions: 100,
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: AppColors.grayDarkColor.withOpacity(.6),
                    progress: 78,
                    maxProgress: 100,
                    startAngle: 0,
                    foregroundDashSize: 10,
                    backgroundDashSize: 10,
                    backgroundGapSize: 10,
                    foregroundGapSize: 10,
                    animation: true,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          MediaRes.tempAvatar,
                        ),
                        radius: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Jakub Trznadel',
                      style: context.theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.verified, color: AppColors.primaryColor),
                  ],
                ),
                Text(
                  '@${context.currentUser!.username}',
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.grayLightColor,
                  ),
                ),
                Text(
                  'Rzeszów, Poland 🇵🇱',
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.grayLightColor,
                  ),
                ),
                Text(
                  'Elevation Expert',
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              backgroundColor: AppColors.bgColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            child: const Text('Follow'),
          ),
        ),
      ],
    );
  }
}
