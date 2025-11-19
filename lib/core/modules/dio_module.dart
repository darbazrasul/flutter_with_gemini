import 'package:dio/dio.dart';
import 'package:fluter_chat_bot/core/modules/shared_preferences_module.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      compact: true,
    );
  }

  @singleton
  Dio provideDio(PrettyDioLogger logger, SharedPrefHelper sharedPrefHelper) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://flower.elevateegy.com/api/v1/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (status) => status != null && status < 500,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = sharedPrefHelper.getValue('tokenKey');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );

    dio.interceptors.add(logger);

    return dio;
  }
}
