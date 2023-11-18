import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      builder: (context,child)=>const MaterialApp(
        title: 'TwaSol',
        onGenerateRoute: MyRouter.onGenerateRoute,

        initialRoute: RoutesManager.homeRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}