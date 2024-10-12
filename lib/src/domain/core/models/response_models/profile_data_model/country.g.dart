// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      flag: json['flag'] as bool?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_code': instance.countryCode,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'flag': instance.flag,
    };
