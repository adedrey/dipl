import 'package:dio/dio.dart';
import 'package:dipl/core/network/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_service_provider.g.dart';

@Riverpod(keepAlive: true)
DioNetworkService networkService(Ref ref) {
  final dio = Dio();
  return DioNetworkService(dio, ref);
}
