// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      customerId: (json['customer_id'] as num?)?.toInt(),
      completedPage: json['completed_page'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'customer_id': instance.customerId,
      'completed_page': instance.completedPage,
    };
