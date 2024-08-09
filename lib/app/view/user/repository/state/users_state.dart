// import 'dart:io';

import 'dart:io';
import 'package:dipl/app/view/user/models/user.dart';
import 'package:dipl/core/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    File? userFileImage,
    @Default(0.00) double latitude,
    @Default(0.00) double longitude,
    User? user,
    @Default(LoadingState.idle) LoadingState loading,
  }) = _UserState;

  factory UserState.initial() => const UserState();
}
