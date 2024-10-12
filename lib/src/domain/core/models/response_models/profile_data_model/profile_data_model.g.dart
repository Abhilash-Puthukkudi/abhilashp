// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      respCode: (json['resp_code'] as num?)?.toInt(),
      customerData: json['customer_data'] == null
          ? null
          : CustomerData.fromJson(
              json['customer_data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'resp_code': instance.respCode,
      'customer_data': instance.customerData,
      'message': instance.message,
    };
