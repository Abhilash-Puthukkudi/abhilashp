// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_matches_model_with_copy_with.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllMatchesModelWithCopyWith _$AllMatchesModelWithCopyWithFromJson(
        Map<String, dynamic> json) =>
    AllMatchesModelWithCopyWith(
      respCode: (json['resp_code'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AllMatchesModelWithCopyWithToJson(
        AllMatchesModelWithCopyWith instance) =>
    <String, dynamic>{
      'resp_code': instance.respCode,
      'data': instance.data,
      'message': instance.message,
    };
