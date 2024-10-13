// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) =>
    CommonResponse(
      respCode: (json['resp_code'] as num?)?.toInt(),
      data: json['data'] as String?,
      message: json['message'] as String?,
      object: (json['object'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'resp_code': instance.respCode,
      'data': instance.data,
      'message': instance.message,
      'object': instance.object,
    };
