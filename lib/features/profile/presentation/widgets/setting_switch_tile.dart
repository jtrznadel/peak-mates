import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class SettingSwitchTile extends StatefulWidget {
  const SettingSwitchTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  final String title;
  final Icon icon;
  final Function() onTap;

  @override
  State<SettingSwitchTile> createState() => _SettingSwitchTileState();
}

class _SettingSwitchTileState extends State<SettingSwitchTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ListTile(
          leading: widget.icon,
          title: Text(
            widget.title,
            style: context.theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.lightColor,
              fontSize: 16,
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
            },
            activeColor: AppColors.primaryColor,
            inactiveTrackColor: AppColors.bgColorDark,
            trackOutlineColor: WidgetStateProperty.all(AppColors.grayDarkColor),
            thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
          )),
    );
  }
}
