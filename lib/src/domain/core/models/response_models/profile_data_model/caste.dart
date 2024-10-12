import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'caste.g.dart';

@JsonSerializable()
class Caste extends Equatable {
  final int? id;
  final String? title;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  final bool? flag;
  final int? religion;

  const Caste({
    this.id,
    this.title,
    this.createdDate,
    this.createdTime,
    this.flag,
    this.religion,
  });

  factory Caste.fromJson(Map<String, dynamic> json) => _$CasteFromJson(json);

  Map<String, dynamic> toJson() => _$CasteToJson(this);

  Caste copyWith({
    int? id,
    String? title,
    String? createdDate,
    String? createdTime,
    bool? flag,
    int? religion,
  }) {
    return Caste(
      id: id ?? this.id,
      title: title ?? this.title,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      flag: flag ?? this.flag,
      religion: religion ?? this.religion,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      createdDate,
      createdTime,
      flag,
      religion,
    ];
  }
}
