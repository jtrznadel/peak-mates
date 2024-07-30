import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';

class ProfileBioSection extends StatelessWidget {
  const ProfileBioSection({
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
        return Text(
          context.currentUser!.bio!,
          style: context.theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.grayLightColor,
            fontStyle: FontStyle.italic,
            fontSize: 14,
          ),
          textAlign: TextAlign.start,
        );
      },
    );
  }
}
