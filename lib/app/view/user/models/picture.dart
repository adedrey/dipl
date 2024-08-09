import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';
part 'picture.g.dart';

@freezed
sealed class Picture with _$Picture {
  factory Picture({
    @Default('') String large,
    @Default('') String medium,
    @Default('') String thumbnail,
  }) = _Name;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  factory Picture.empty() => Picture();
}
