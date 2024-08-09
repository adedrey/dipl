import 'package:dipl/core/exceptions/network_exception.dart';
import 'package:dipl/core/utils/logger.dart';
import 'package:flutter/services.dart';

class Exceptions {
  AppException getAppError(dynamic err) {
    logger.shout(err.toString());
    var message = '';
    if (err is TypeError) {
      message = 'Operation failed, please try again';
    } else if (err is Exception) {
      message = err.toString();
    } else if (err is PlatformException) {
      message = err.toString();
    } else if (err is FormatException) {
      message = 'Bad response format, please try again';
    } else {
      message = 'An unknown error occurred, please try again';
    }
    return AppException(
      message: message,
      statusCode: 1,
      identifier: 'There is an exception while parsing data',
    );
  }
}
