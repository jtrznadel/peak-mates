import 'package:flutter/material.dart';
import 'package:peak_mates/features/profile/presentation/widgets/profile_stats_item.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileStatsItem(value: '201', label: 'Followers'),
        ProfileStatsItem(value: '127', label: 'Following'),
        ProfileStatsItem(value: '23', label: 'Friends'),
        ProfileStatsItem(value: '176', label: 'Trips'),
      ],
    );
  }
}
