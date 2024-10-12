import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pm_login_model.g.dart';

@JsonSerializable()
class PmLoginModel extends Equatable {
  final String? username;
  final String? password;

  const PmLoginModel({this.username, this.password});

  factory PmLoginModel.fromJson(Map<String, dynamic> json) {
    return _$PmLoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PmLoginModelToJson(this);

  @override
  List<Object?> get props => [username, password];
}
