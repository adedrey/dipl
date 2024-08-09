import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dipl/core/exceptions/network_exception.dart';
import 'package:dipl/core/network/app_response.dart';
import 'package:dipl/core/network/network_service.dart';
import 'package:dipl/core/utils/logger.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, AppResponse>> handleException<T extends Object>(
    Future<Response<dynamic>> Function() handler, {
    String endpoint = '',
  }) async {
    try {
      final res = await handler();
      if (res.statusCode == 200 || res.statusCode == 201) {
        return Right(
          AppResponse(
            statusCode: res.statusCode!,
            data: res.data,
            statusMessage: res.statusMessage,
          ),
        );
      }
      return Left(
        AppException(
          statusCode: res.statusCode,
          message: 'An unknown error occurred',
          identifier: 'Unknown error at $endpoint',
        ),
      );
    } catch (e) {
      print(e);
      var message = 'Operation failed';
      var identifier = '';
      int statusCode;
      if (e is SocketException) {
        message =
            '''Unable to connect to the server, please check your internet connection and try again''';
        identifier = 'SocketException ${e.message} at $endpoint';
        statusCode = 0;
      } else if (e is FormatException) {
        message = 'Bad response format, please try again';
        identifier = 'FormatException ${e.message} at $endpoint';
        statusCode = 1;
      } else if (e is DioException) {
        message = getDioError(e);
        identifier = 'DioException ${e.response?.statusMessage} at $endpoint';
        statusCode = e.response?.statusCode ?? 2;
      } else if (e is AppException) {
        message = e.message ?? 'An unknown error occurred, try again';
        identifier = e.identifier ?? '';
        statusCode = e.statusCode ?? 4;
      } else {
        message = 'An unknown error occurred, please try again';
        identifier = 'UnknownException $e at $endpoint';
        statusCode = 3;
      }
      final exception = AppException(
        message: message,
        statusCode: statusCode,
        identifier: identifier,
      );
      logger.info(exception.toString());
      return Left(exception);
    }
  }

  String getDioError(DioException err) {
    print(err.message);
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        {
          return 'Connection timeout, please try again';
        }
      case DioExceptionType.sendTimeout:
        {
          return 'Operation timed out, please try again';
        }
      case DioExceptionType.receiveTimeout:
        return 'Operation timed out, please try again';
      case DioExceptionType.cancel:
        {
          return 'Operation cancelled';
        }
      case DioExceptionType.connectionError:
        {
          return 'Operation failed, please try again';
        }
      case DioExceptionType.badCertificate:
        {
          return 'Operation failed, please try again';
        }
      case DioExceptionType.badResponse:
        {
          if (err.response?.statusCode == 500) {
            return 'Operation failed, please try again';
          } else if (err.response?.statusCode == 405) {
            return 'Operation failed, please try again';
          } else {
            final errorData = err.response?.data;
            if (errorData is Map<String, dynamic>) {
              if (errorData.containsKey('errors')) {
                final errors = errorData['errors'];
                if (errors is Map) {
                  final errorMessage = StringBuffer();
                  for (final key in errors.keys) {
                    final errorValue = errors[key];
                    if (errorValue is List) {
                      for (final error in errorValue) {
                        errorMessage.write('$error\n');
                      }
                    } else if (errorValue != null) {
                      errorMessage.write('${errors[key]}\n');
                    }
                  }
                  return errorMessage.toString();
                } else {
                  return errorData['message'] != null
                      ? errorData['message'].toString()
                      : 'An unknown error occurred';
                }
              } else {
                return errorData['message'] != null
                    ? errorData['message'].toString()
                    : 'An unknown error occurred';
              }
            } else {
              return err.response?.statusMessage ?? 'An unknown error occurred';
            }
          }
        }
      case DioExceptionType.unknown:
        {
          return 'Operation failed, please try again';
        }
    }
  }
}
