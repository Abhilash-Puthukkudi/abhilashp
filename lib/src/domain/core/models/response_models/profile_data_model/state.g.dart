// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) => State(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      flag: json['flag'] as bool?,
      country: (json['country'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'flag': instance.flag,
      'country': instance.country,
    };
