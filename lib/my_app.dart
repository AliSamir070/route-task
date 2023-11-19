import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twasol/config/theme.dart';
import 'package:twasol/core/utils/routes_manager.dart';

import 'config/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context,child)=>MaterialApp(
        title: 'TwaSol',
        onGenerateRoute: MyRouter.onGenerateRoute,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: RoutesManager.homeRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}