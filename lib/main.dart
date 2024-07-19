import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peak_mates/core/services/router.dart';
import 'package:peak_mates/core/utilities/themes/theme.dart';
import 'package:peak_mates/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
