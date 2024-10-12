import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class State extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  final bool? flag;
  final int? country;

  const State({
    this.id,
    this.name,
    this.createdDate,
    this.createdTime,
    this.flag,
    this.country,
  });

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);

  State copyWith({
    int? id,
    String? name,
    String? createdDate,
    String? createdTime,
    bool? flag,
    int? country,
  }) {
    return State(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      flag: flag ?? this.flag,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      createdDate,
      createdTime,
      flag,
      country,
    ];
  }
}
