import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
import 'package:peak_mates/features/profile/presentation/widgets/profile_stats_item.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: Streams.userDataStream,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Stream is still loading
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Stream has an error
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data is UserModel) {
          context.read<UserProvider>().user = snapshot.data;
        }
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
                        foregroundColor: context.theme.primaryColor,
                        backgroundColor: AppColors.grayLightColor,
                        progress: 78,
                        maxProgress: 100,
                        startAngle: 0,
                        foregroundDashSize: 10,
                        backgroundDashSize: 10,
                        backgroundGapSize: 10,
                        foregroundGapSize: 10,
                        animation: true,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundImage:
                                context.currentUser!.profilePicture != null
                                    ? NetworkImage(
                                        context.currentUser!.profilePicture!)
                                    : const AssetImage(MediaRes.defaultAvatar),
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
                          '${context.currentUser!.firstName} ${context.currentUser!.lastName}',
                          style: context.theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(width: 5),
                        context.currentUser!.verified!
                            ? const Icon(Icons.verified)
                            : const Icon(Icons.verified_outlined),
                      ],
                    ),
                    Text(
                      '@${context.currentUser!.username}',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.grayLightColor,
                      ),
                    ),
                    Text(
                      '${context.currentUser!.city}, ${context.currentUser!.nationality}',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.grayLightColor,
                      ),
                    ),
                    Text(
                      'Elevation Expert',
                      style: context.theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.currentUser!.bio!,
              style: context.theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.grayLightColor,
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileStatsItem(value: '201', label: 'Followers'),
                ProfileStatsItem(value: '127', label: 'Following'),
                ProfileStatsItem(value: '23', label: 'Friends'),
                ProfileStatsItem(value: '176', label: 'Trips'),
              ],
            ),
            // const SizedBox(height: 10),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(
            //     onPressed: () {},
            //     child: const Text('Follow'),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
