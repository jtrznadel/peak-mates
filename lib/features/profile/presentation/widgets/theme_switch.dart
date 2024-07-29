import 'package:flutter/material.dart';
import 'package:peak_mates/core/common/providers/theme_controller.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.brightness_2_outlined),
        title: const Text('Dark mode'),
        trailing: Switch(
          value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
          onChanged: (value) {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            setState(() {});
          },
        ));
  }
}
