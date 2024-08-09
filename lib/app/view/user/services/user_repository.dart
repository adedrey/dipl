import 'package:dartz/dartz.dart';

import 'package:dipl/app/view/user/models/user.dart';
import 'package:dipl/core/exceptions/exceptions.dart';
import 'package:dipl/core/exceptions/network_exception.dart';
import 'package:dipl/core/network/dio_service.dart';
import 'package:dipl/core/utils/logger.dart';

class UserRepository {
  UserRepository({
    required this.dioNetworkService,
    required this.exceptions,
  });
  final DioNetworkService dioNetworkService;
  final Exceptions exceptions;

  Future<Either<AppException, User>> retrieveUserData() async {
    final response = await dioNetworkService.get(
      '',
    );
    return response.fold(left, (r) {
      try {
        final responseData = r.data as Map<String, dynamic>;
        final userResponse = responseData['results'] as List<dynamic>;

        logger.info(userResponse[0]);
        final user = User.fromJson(userResponse[0] as Map<String, dynamic>);
        return right(user);
      } catch (e) {
        return left(exceptions.getAppError(e));
      }
    });
  }
}
