import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
import 'package:peak_mates/features/home/presentation/widgets/destination_card.dart';
import 'package:peak_mates/features/profile/presentation/widgets/profile_stats_item.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
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
          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.currentUser!.bio!,
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.grayLightColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileStatsItem(value: '201', label: 'Followers'),
                      ProfileStatsItem(value: '127', label: 'Following'),
                      ProfileStatsItem(value: '23', label: 'Friends'),
                      ProfileStatsItem(value: '176', label: 'Trips'),
                    ],
                  ),
                  Text(
                    'Latest Trips',
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const DestinationCard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                      itemCount: 5,
                    ),
                  ),
                  Text(
                    'Posts',
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const DestinationCard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
