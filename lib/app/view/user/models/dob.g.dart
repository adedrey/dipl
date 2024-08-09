// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DobImpl _$$DobImplFromJson(Map<String, dynamic> json) => _$DobImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      age: json['age'] as num? ?? 0,
    );

Map<String, dynamic> _$$DobImplToJson(_$DobImpl instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'age': instance.age,
    };
