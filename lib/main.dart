import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/providers/theme_controller.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/core/services/router.dart';
import 'package:peak_mates/core/utilities/themes/theme.dart';
import 'package:peak_mates/core/common/providers/navigation_controller.dart';
import 'package:peak_mates/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, _) => MaterialApp(
          title: 'peakMates',
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.themeData,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
