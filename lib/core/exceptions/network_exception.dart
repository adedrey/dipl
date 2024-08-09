import 'package:dartz/dartz.dart';
import 'package:dipl/core/network/app_response.dart';

class AppException implements Exception {
  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  final String? message;
  final int? statusCode;
  final String? identifier;
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

extension NetworkException on AppException {
  Left<AppException, AppResponse> get toLeft =>
      Left<AppException, AppResponse>(this);
}
