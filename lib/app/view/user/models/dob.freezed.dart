// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dob.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dob _$DobFromJson(Map<String, dynamic> json) {
  return _Dob.fromJson(json);
}

/// @nodoc
mixin _$Dob {
  DateTime? get date => throw _privateConstructorUsedError;
  num get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DobCopyWith<Dob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DobCopyWith<$Res> {
  factory $DobCopyWith(Dob value, $Res Function(Dob) then) =
      _$DobCopyWithImpl<$Res, Dob>;
  @useResult
  $Res call({DateTime? date, num age});
}

/// @nodoc
class _$DobCopyWithImpl<$Res, $Val extends Dob> implements $DobCopyWith<$Res> {
  _$DobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DobImplCopyWith<$Res> implements $DobCopyWith<$Res> {
  factory _$$DobImplCopyWith(_$DobImpl value, $Res Function(_$DobImpl) then) =
      __$$DobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, num age});
}

/// @nodoc
class __$$DobImplCopyWithImpl<$Res> extends _$DobCopyWithImpl<$Res, _$DobImpl>
    implements _$$DobImplCopyWith<$Res> {
  __$$DobImplCopyWithImpl(_$DobImpl _value, $Res Function(_$DobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? age = null,
  }) {
    return _then(_$DobImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DobImpl implements _Dob {
  _$DobImpl({this.date, this.age = 0});

  factory _$DobImpl.fromJson(Map<String, dynamic> json) =>
      _$$DobImplFromJson(json);

  @override
  final DateTime? date;
  @override
  @JsonKey()
  final num age;

  @override
  String toString() {
    return 'Dob(date: $date, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DobImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DobImplCopyWith<_$DobImpl> get copyWith =>
      __$$DobImplCopyWithImpl<_$DobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DobImplToJson(
      this,
    );
  }
}

abstract class _Dob implements Dob {
  factory _Dob({final DateTime? date, final num age}) = _$DobImpl;

  factory _Dob.fromJson(Map<String, dynamic> json) = _$DobImpl.fromJson;

  @override
  DateTime? get date;
  @override
  num get age;
  @override
  @JsonKey(ignore: true)
  _$$DobImplCopyWith<_$DobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
