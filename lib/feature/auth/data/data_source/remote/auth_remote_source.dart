import 'dart:io';

import 'package:banking_app/core/error/business_exception.dart';
import 'package:banking_app/core/network/api_client.dart';
import 'package:dio/dio.dart';

import '../../model/user_model.dart';

class AuthRemoteSource {
  final ApiClient apiClient;

  AuthRemoteSource({ApiClient? apiClient})
    : apiClient = apiClient ?? ApiClient();

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    // JSONPlaceholder mock: always fetch user id=1.
    try {
      /// Mock username and password
      if (username != 'user' || password != '1234') {
        throw BusinessException(
          message: 'Incorrect username or password',
          errorCode: ErrorCode.userNotFound,
          statusCode: HttpStatus.notFound,
        );
      }

      final response = await apiClient.dio.get("/users/1");
      final data = response.data;

      return UserModel.fromJson(data as Map<String, dynamic>? ?? {});
    } on DioException catch (e) {
      throw BusinessException(
        message: e.response?.data?.toString() ?? 'Failed to login',
        errorCode: ErrorCode.userNotFound,
        statusCode: e.response?.statusCode ?? HttpStatus.internalServerError,
      );
    }
  }

  Future<void> logout() async {
    // Mock logout
    return await Future.delayed(const Duration(seconds: 1));
  }
}
