import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'religion.g.dart';

@JsonSerializable()
class Religion extends Equatable {
  final int? id;
  final String? title;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  final bool? flag;

  const Religion({
    this.id,
    this.title,
    this.createdDate,
    this.createdTime,
    this.flag,
  });

  factory Religion.fromJson(Map<String, dynamic> json) {
    return _$ReligionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReligionToJson(this);

  Religion copyWith({
    int? id,
    String? title,
    String? createdDate,
    String? createdTime,
    bool? flag,
  }) {
    return Religion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      flag: flag ?? this.flag,
    );
  }

  @override
  List<Object?> get props => [id, title, createdDate, createdTime, flag];
}
