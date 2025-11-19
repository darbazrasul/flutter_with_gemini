import 'package:fluter_chat_bot/App/my_app.dart';
import 'package:fluter_chat_bot/modules/caching_helper.dart';
import 'package:fluter_chat_bot/modules/service_locator.dart';
import 'package:fluter_chat_bot/modules/shared_key.dart';
import 'package:fluter_chat_bot/modules/shared_preferences_module.dart';
import 'package:flutter/material.dart';

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
