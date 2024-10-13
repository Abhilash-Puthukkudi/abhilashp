import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse extends Equatable {
  @JsonKey(name: 'resp_code')
  final int? respCode;
  final String? data;
  final String? message;
  final int? object;

  const CommonResponse({this.respCode, this.data, this.message, this.object});

  factory CommonResponse.fromJson(Map<String, dynamic> json) {
    return _$CommonResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);

  @override
  List<Object?> get props => [respCode, data, message, object];
}
