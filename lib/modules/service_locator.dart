import 'package:fluter_chat_bot/gemini_api_service.dart';
import 'package:fluter_chat_bot/modules/di.config.dart';
import 'package:fluter_chat_bot/modules/shared_preferences_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  await getIt.init();
}
