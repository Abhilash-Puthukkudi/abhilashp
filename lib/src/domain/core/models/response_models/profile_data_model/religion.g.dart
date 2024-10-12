// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'religion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Religion _$ReligionFromJson(Map<String, dynamic> json) => Religion(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      flag: json['flag'] as bool?,
    );

Map<String, dynamic> _$ReligionToJson(Religion instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'flag': instance.flag,
    };
