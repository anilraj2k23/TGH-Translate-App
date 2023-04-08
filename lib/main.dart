import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(minTextAdapt: true,
      designSize: const Size(392.72, 850.90),
      builder: (BuildContext context, Widget? child) { return  MaterialApp(
        title: 'Translate App',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      );},

    );
  }
}

