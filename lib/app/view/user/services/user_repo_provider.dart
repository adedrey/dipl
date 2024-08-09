import 'package:dipl/app/view/user/services/user_repository.dart';
import 'package:dipl/core/exceptions/exceptions.dart';
import 'package:dipl/core/network/dio_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repo_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final networkService = ref.watch(networkServiceProvider);
  final exceptionService = Exceptions();
  return UserRepository(
    dioNetworkService: networkService,
    exceptions: exceptionService,
  );
}
