import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dipl/app/app_environment.dart';
import 'package:dipl/core/exceptions/exception_handler_mixin.dart';
import 'package:dipl/core/exceptions/network_exception.dart';
import 'package:dipl/core/network/app_response.dart';
import 'package:dipl/core/network/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  DioNetworkService(this.dio, this.ref) {
    dio.options = dioBaseOptions;
  }
  final Dio dio;
  final Ref ref;

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => EnvInfo.environment.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<Either<AppException, AppResponse>> post(
    String endpoint, {
    dynamic data,
  }) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, AppResponse>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, AppResponse>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.delete(
        endpoint,
        queryParameters: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, AppResponse>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.patch(
        endpoint,
        queryParameters: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, AppResponse>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.put(
        endpoint,
        queryParameters: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
