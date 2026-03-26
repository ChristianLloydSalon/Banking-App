import 'dart:io';

enum ErrorCode { userNotFound, transactionsNotFound, transactionNotProcessed }

class BusinessException implements Exception {
  const BusinessException({
    required this.message,
    required this.errorCode,
    required this.statusCode,
  });

  final String message;
  final ErrorCode errorCode;
  final int statusCode;

  String get errorName {
    const errorNames = {
      HttpStatus.badRequest: 'Bad Request',
      HttpStatus.unauthorized: 'Unauthorized',
      HttpStatus.forbidden: 'Forbidden',
      HttpStatus.notFound: 'Not Found',
      HttpStatus.conflict: 'Conflict',
      HttpStatus.unprocessableEntity: 'Unprocessable Entity',
      HttpStatus.internalServerError: 'Internal Server Error',
    };

    return errorNames[statusCode] ?? 'Error';
  }

  @override
  String toString() => message;
}
