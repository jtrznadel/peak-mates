import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/features/profile/presentation/views/update_profile_screen.dart';
import 'package:peak_mates/features/profile/presentation/widgets/setting_switch_tile.dart';
import 'package:peak_mates/features/profile/presentation/widgets/setting_tile.dart';
import 'package:peak_mates/features/profile/presentation/widgets/theme_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: context.theme.textTheme.labelMedium,
            ),
            const SizedBox(height: 5),
            SettingTile(
              title: 'Update profile',
              icon: const Icon(Icons.face_retouching_natural),
              onTap: () {
                Navigator.pushNamed(context, UpdateProfileScreen.routeName);
              },
            ),
            const SizedBox(height: 5),
            SettingTile(
              title: 'Language',
              subtitle: 'English',
              icon: const Icon(Icons.language),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            Text(
              'Account',
              style: context.theme.textTheme.labelMedium,
            ),
            const SizedBox(height: 5),
            SettingTile(
              title: 'Upgrade account',
              icon: const Icon(Icons.bolt_rounded),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            SettingTile(
              title: 'Limit account',
              icon: const Icon(Icons.av_timer_rounded),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            Text(
              'Preference',
              style: context.theme.textTheme.labelMedium,
            ),
            const SizedBox(height: 5),
            const ThemeSwitch(),
            const SizedBox(height: 5),
            SettingSwitchTile(
              title: 'Notifications',
              icon: const Icon(Icons.notifications_active_outlined),
              onTap: () {},
            ),
            const SizedBox(height: 5),
            Text(
              'Security',
              style: context.theme.textTheme.labelMedium,
            ),
            const SizedBox(height: 5),
            SettingSwitchTile(
              title: 'Face ID',
              icon: const Icon(Icons.center_focus_weak),
              onTap: () {},
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  sl<FirebaseAuth>().signOut();
                },
                child: const Text('Sign out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
