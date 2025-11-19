import 'package:fluter_chat_bot/route/app_routes.dart';
import 'package:fluter_chat_bot/route/routes.dart';
import 'package:fluter_chat_bot/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Chat Boot App",
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: FontConstants.fontFamily,
        ),

        locale: const Locale('en'),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: AppRoutes.homeScreen,
      ),
    );
  }
}
