// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestStatus _$InterestStatusFromJson(Map<String, dynamic> json) =>
    InterestStatus(
      id: (json['id'] as num?)?.toInt(),
      interestStatus: json['interest_status'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      modifiedDate: json['modified_date'] as String?,
      modifiedTime: json['modified_time'] as String?,
      flag: json['flag'] as bool?,
      sender: (json['sender'] as num?)?.toInt(),
      reciever: (json['reciever'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InterestStatusToJson(InterestStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'interest_status': instance.interestStatus,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'modified_date': instance.modifiedDate,
      'modified_time': instance.modifiedTime,
      'flag': instance.flag,
      'sender': instance.sender,
      'reciever': instance.reciever,
    };
