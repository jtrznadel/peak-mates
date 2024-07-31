import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${context.currentUser!.firstName} ${context.currentUser!.lastName}',
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
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
        );
      },
    );
  }
}
