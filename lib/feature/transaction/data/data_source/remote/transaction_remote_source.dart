import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/error/business_exception.dart';
import '../../../../../core/network/api_client.dart';
import '../../model/transaction_model.dart';

class TransactionRemoteSource {
  final ApiClient apiClient;

  TransactionRemoteSource(this.apiClient);

  Future<TransactionModel> sendMoney(double amount) async {
    try {
      final response = await apiClient.dio.post(
        "/posts",
        data: {"title": "Send Money", "body": amount.toString()},
      );

      final body = response.data;
      if (body is! Map) {
        throw BusinessException(
          message: 'Unexpected response shape for send money',
          errorCode: ErrorCode.userNotFound,
          statusCode: HttpStatus.internalServerError,
        );
      }
      return TransactionModel.fromJson(body as Map<String, dynamic>? ?? {});
    } on DioException catch (e) {
      throw BusinessException(
        message: e.response?.data?.toString() ?? 'Failed to send money',
        errorCode: ErrorCode.transactionNotProcessed,
        statusCode: e.response?.statusCode ?? HttpStatus.internalServerError,
      );
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      final response = await apiClient.dio.get("/posts");

      final data = response.data;

      final list = data as List? ?? [];

      final transactions = list.map((item) {
        return TransactionModel.fromJson(item as Map<String, dynamic>? ?? {});
      }).toList();

      return transactions;
    } on DioException catch (e) {
      throw BusinessException(
        message: e.response?.data?.toString() ?? 'Failed to load transactions',
        errorCode: ErrorCode.transactionsNotFound,
        statusCode: e.response?.statusCode ?? HttpStatus.internalServerError,
      );
    }
  }
}
