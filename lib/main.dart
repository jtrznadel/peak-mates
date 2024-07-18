import 'package:flutter/material.dart';
import 'package:peak_mates/core/services/router.dart';
import 'package:peak_mates/core/utilities/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'peakMates',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: generateRoute,
    );
  }
}
