import 'package:freezed_annotation/freezed_annotation.dart';

part 'dob.freezed.dart';
part 'dob.g.dart';

@freezed
sealed class Dob with _$Dob {
  factory Dob({
    DateTime? date,
    @Default(0) num age,
  }) = _Dob;

  factory Dob.fromJson(Map<String, dynamic> json) => _$DobFromJson(json);

  factory Dob.empty() => Dob();
}
