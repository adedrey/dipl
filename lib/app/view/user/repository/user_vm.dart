import 'dart:io';

import 'package:dipl/app/view/user/repository/state/users_state.dart';
import 'package:dipl/app/view/user/services/user_repo_provider.dart';
import 'package:dipl/core/utils/enums.dart';
import 'package:dipl/core/utils/logger.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_vm.g.dart';

@riverpod
class UserVM extends _$UserVM {
  final ImagePicker _picker = ImagePicker();
  @override
  UserState build() {
    return UserState.initial();
  }

  Future<void> selectImage() async {
    XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      state = state.copyWith(userFileImage: File(imageFile.path));
    }
  }

  Future<void> retrieveUserData() async {
    state = state.copyWith(loading: LoadingState.loading);
    final response = await ref.read(userRepositoryProvider).retrieveUserData();
    await response.fold(
      (error) {
        state = state.copyWith(
          loading: LoadingState.error,
        );
      },
      (result) async {
        state = state.copyWith(
          user: result,
          loading: LoadingState.success,
        );
      },
    );
  }

  void swipe() {
    if (state.loading != LoadingState.loading) {
      retrieveUserData();
    }
  }

  Future<void> setPosition() async {
    await handlePermission().whenComplete(
      getPostion,
    );
  }

  Future<void> handlePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        logger.info('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        logger.info("'Location permissions are permanently denied");
      } else {
        logger.info('GPS Location service is granted');
      }
    } else {
      logger.info('GPS Location permission granted.');
    }
  }

  Future<void> getPostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    logger
      ..info(position.longitude) //Output: 80.24599079
      ..info(position.latitude); //Output: 29.6593457

    double long = position.longitude;
    double lat = position.latitude;

    state = state.copyWith(
      longitude: long,
      latitude: lat,
    );
  }
}
