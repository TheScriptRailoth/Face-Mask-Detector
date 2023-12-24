import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_detector/mask_off_screen.dart';
import 'package:mask_detector/mask_on_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
        return MaterialApp(
            theme: ThemeData(primaryColor: Color(0xff132136)),
            debugShowCheckedModeBanner: false,
            home: HomeScreen()
        );
      },
    );
  }
}
