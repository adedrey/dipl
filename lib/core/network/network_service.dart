import 'package:dartz/dartz.dart';
import 'package:dipl/core/exceptions/network_exception.dart';
import 'package:dipl/core/network/app_response.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, AppResponse>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, AppResponse>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, AppResponse>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, AppResponse>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, AppResponse>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
