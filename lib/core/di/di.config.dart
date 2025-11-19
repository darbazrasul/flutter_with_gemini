// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:fluter_chat_bot/core/api_layar/gemini_api_service.dart'
    as _i356;
import 'package:fluter_chat_bot/features/smart_coach/data/data_source/impl/chat_local_data_source_impl.dart'
    as _i82;
import 'package:fluter_chat_bot/features/smart_coach/data/data_source/interfac/chat_local_datasource.dart'
    as _i366;
import 'package:fluter_chat_bot/features/smart_coach/domain/repo/chat_repository.dart'
    as _i781;
import 'package:fluter_chat_bot/features/smart_coach/presentation/view_model/chat_cubit.dart'
    as _i686;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../modules/dio_module.dart' as _i948;
import '../modules/shared_preferences_module.dart' as _i744;

extension GetItInjectableX on _i174.GetIt {
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.singleton<_i744.SharedPrefHelper>(
      () => _i744.SharedPrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i528.PrettyDioLogger>(),
        gh<_i744.SharedPrefHelper>(),
      ),
    );

    gh.singleton<_i366.ChatLocalDataSource>(
      () => _i82.ChatLocalDataSourceImpl(gh<_i744.SharedPrefHelper>()),
    );
    gh.lazySingleton<_i356.GeminiApiService>(
      () => _i356.GeminiApiService(gh<_i744.SharedPrefHelper>()),
    );

    gh.factory<_i686.ChatCubit>(
      () => _i686.ChatCubit(gh<_i781.ChatRepository>()),
    );
    gh.singleton<_i781.ChatRepository>(
      () => _i781.ChatRepository(
        gh<_i356.GeminiApiService>(),
        gh<_i366.ChatLocalDataSource>(),
      ),
    );

    return this;
  }
}

class _$DioModule extends _i948.DioModule {}

class _$SharedPreferencesModule extends _i744.SharedPreferencesModule {}
