import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'customer_data.dart';

part 'profile_data_model.g.dart';

@JsonSerializable()
class ProfileDataModel extends Equatable {
  @JsonKey(name: 'resp_code')
  final int? respCode;
  @JsonKey(name: 'customer_data')
  final CustomerData? customerData;
  final String? message;

  const ProfileDataModel({this.respCode, this.customerData, this.message});

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);

  ProfileDataModel copyWith({
    int? respCode,
    CustomerData? customerData,
    String? message,
  }) {
    return ProfileDataModel(
      respCode: respCode ?? this.respCode,
      customerData: customerData ?? this.customerData,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [respCode, customerData, message];
}
