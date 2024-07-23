import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';

class ChatCenterScreen extends StatelessWidget {
  const ChatCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chat Center Screen',
      style: context.theme.textTheme.titleLarge,
    );
  }
}
