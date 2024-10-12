import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interest_status.g.dart';

@JsonSerializable()
class InterestStatus extends Equatable {
  final int? id;
  @JsonKey(name: 'interest_status')
  final String? interestStatus;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  @JsonKey(name: 'modified_date')
  final String? modifiedDate;
  @JsonKey(name: 'modified_time')
  final String? modifiedTime;
  final bool? flag;
  final int? sender;
  final int? reciever;

  const InterestStatus({
    this.id,
    this.interestStatus,
    this.createdDate,
    this.createdTime,
    this.modifiedDate,
    this.modifiedTime,
    this.flag,
    this.sender,
    this.reciever,
  });

  factory InterestStatus.fromJson(Map<String, dynamic> json) {
    return _$InterestStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InterestStatusToJson(this);

  InterestStatus copyWith({
    int? id,
    String? interestStatus,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,
    int? sender,
    int? reciever,
  }) {
    return InterestStatus(
      id: id ?? this.id,
      interestStatus: interestStatus ?? this.interestStatus,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedTime: modifiedTime ?? this.modifiedTime,
      flag: flag ?? this.flag,
      sender: sender ?? this.sender,
      reciever: reciever ?? this.reciever,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      interestStatus,
      createdDate,
      createdTime,
      modifiedDate,
      modifiedTime,
      flag,
      sender,
      reciever,
    ];
  }
}
