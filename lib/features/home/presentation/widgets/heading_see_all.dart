import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class HeadingSeeAll extends StatelessWidget {
  const HeadingSeeAll({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: context.theme.textTheme.labelLarge,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See all',
            style: context.theme.textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
