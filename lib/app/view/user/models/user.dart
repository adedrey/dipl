import 'package:dipl/app/view/user/models/dob.dart';
import 'package:dipl/app/view/user/models/name.dart';
import 'package:dipl/app/view/user/models/picture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  factory User({
    @Default('') String gender,
    @Default('') String email,
    @Default('') String phone,
    Name? name,
    Dob? dob,
    Picture? picture,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.empty() => User();
}
