import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class ProfileStatsItem extends StatelessWidget {
  const ProfileStatsItem({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: context.theme.textTheme.titleMedium,
          ),
          Text(
            label,
            style: context.theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
