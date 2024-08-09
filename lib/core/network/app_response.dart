import 'package:dartz/dartz.dart';
import 'package:dipl/core/exceptions/network_exception.dart';

class AppResponse {
  AppResponse({
    required this.statusCode,
    this.statusMessage,
    this.data,
  });
  final int statusCode;
  final String? statusMessage;
  final dynamic data;
  @override
  String toString() {
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
  }
}

extension ResponseExtension on AppResponse {
  Right<AppException, AppResponse> get toRight => Right(this);
}
