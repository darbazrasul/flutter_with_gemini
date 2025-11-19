import 'package:fluter_chat_bot/App/my_app.dart';
import 'package:fluter_chat_bot/core/di/di.dart';
import 'package:fluter_chat_bot/core/keys/shared_key.dart';
import 'package:fluter_chat_bot/core/utils/caching/caching_helper.dart';
import 'package:fluter_chat_bot/core/modules/shared_preferences_module.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final sharedPrefHelper = getIt<SharedPrefHelper>();
  await sharedPrefHelper.setValue(SharedPrefKeys.apiKey, "UrApiKey");
  await CacheService.cacheInitialization();

  runApp(MyApp());
}
