import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Explore Screen',
      style: context.theme.textTheme.titleLarge,
    );
  }
}
