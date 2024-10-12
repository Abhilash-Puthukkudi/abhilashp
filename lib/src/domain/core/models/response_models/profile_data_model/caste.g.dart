// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caste.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Caste _$CasteFromJson(Map<String, dynamic> json) => Caste(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      flag: json['flag'] as bool?,
      religion: (json['religion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CasteToJson(Caste instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'flag': instance.flag,
      'religion': instance.religion,
    };
