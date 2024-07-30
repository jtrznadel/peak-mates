import 'package:flutter/material.dart';
import 'package:peak_mates/features/profile/presentation/refactors/sections/profile_level_section.dart';
import 'package:peak_mates/features/profile/presentation/refactors/sections/profile_stats_section.dart';
import 'package:peak_mates/features/profile/presentation/refactors/sections/profile_bio_section.dart';
import 'package:peak_mates/features/profile/presentation/refactors/sections/profile_details_section.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileLevelSection(),
            SizedBox(width: 15),
            ProfileDetailsSection(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ProfileBioSection(),
        SizedBox(height: 10),
        ProfileStatsSection(),
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
  }
}
