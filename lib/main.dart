import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/provider/language_provider.dart';
import 'package:translator_app/screens/home_screen.dart';
import 'package:translator_app/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedLanguageProvider(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(392.72, 850.90),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Translate App',
            theme: AppTheme.getTheme(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
