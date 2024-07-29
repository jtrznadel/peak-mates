import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final Icon icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
              )
            : null,
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
