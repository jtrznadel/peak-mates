import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';

class ProfileLevelSection extends StatelessWidget {
  const ProfileLevelSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: Streams.userDataStream,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data is UserModel) {
          context.read<UserProvider>().user = snapshot.data;
        }
        return SizedBox(
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
                backgroundImage: context.currentUser!.profilePicture != null
                    ? NetworkImage(context.currentUser!.profilePicture!)
                    : const AssetImage(MediaRes.defaultAvatar),
                radius: 100,
              ),
            ),
          ),
        );
      },
    );
  }
}
