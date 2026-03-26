import 'package:banking_app/core/config/app_config.dart';
import 'package:dio/dio.dart';

final apiClient = ApiClient();

class ApiClient {
  final Dio dio;

  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Accept': 'application/json',
          }
        ),
      );
}
