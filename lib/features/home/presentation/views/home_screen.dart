import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/app/streams/streams.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
import 'package:peak_mates/features/home/presentation/refactors/home_body.dart';
import 'package:peak_mates/features/home/presentation/refactors/home_header.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

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
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            title: RichText(
              text: TextSpan(
                text: 'Welcome, ',
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.grayLightColor,
                ),
                children: [
                  TextSpan(
                    text: context.currentUser?.firstName,
                    style: context.theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: context.currentUser!.profilePicture != null
                      ? NetworkImage(context.currentUser!.profilePicture!)
                      : const AssetImage(MediaRes.defaultAvatar),
                ),
              )
            ],
          ),
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  HomeBody(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
