import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'all_matches_model_with_copy_with.g.dart';

@JsonSerializable()
class AllMatchesModelWithCopyWith extends Equatable {
  @JsonKey(name: 'resp_code')
  final int? respCode;
  final List<UserData>? data;
  final String? message;

  const AllMatchesModelWithCopyWith({
    this.respCode,
    this.data,
    this.message,
  });

  factory AllMatchesModelWithCopyWith.fromJson(Map<String, dynamic> json) {
    return _$AllMatchesModelWithCopyWithFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllMatchesModelWithCopyWithToJson(this);

  AllMatchesModelWithCopyWith copyWith({
    int? respCode,
    List<UserData>? data,
    String? message,
  }) {
    return AllMatchesModelWithCopyWith(
      respCode: respCode ?? this.respCode,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [respCode, data, message];
}
