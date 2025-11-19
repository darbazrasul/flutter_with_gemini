import 'package:fluter_chat_bot/modules/caching_helper.dart';
import 'package:fluter_chat_bot/modules/service_locator.dart';
import 'package:fluter_chat_bot/modules/shared_key.dart';
import 'package:fluter_chat_bot/modules/shared_preferences_module.dart';
import 'package:fluter_chat_bot/route/app_routes.dart';
import 'package:fluter_chat_bot/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final sharedPrefHelper = getIt<SharedPrefHelper>();
  await sharedPrefHelper.setValue(
    SharedPrefKeys.apiKey,
    "AIzaSyDQMgVAq9nMiBkoNEEMmzAD4XpQOSc87Vw",
  );
  await CacheService.cacheInitialization();

  runApp(MyApp());
}

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
        theme: ThemeData.dark(),

        locale: const Locale('en'),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: AppRoutes.homeScreen,
      ),
    );
  }
}
