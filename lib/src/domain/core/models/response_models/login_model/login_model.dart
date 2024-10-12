import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final String? refresh;
  final String? access;
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @JsonKey(name: 'completed_page')
  final String? completedPage;

  const LoginModel({
    this.refresh,
    this.access,
    this.customerId,
    this.completedPage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [refresh, access, customerId, completedPage];
}
