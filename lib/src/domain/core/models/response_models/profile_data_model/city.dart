import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  final bool? flag;
  final int? state;

  const City({
    this.id,
    this.name,
    this.createdDate,
    this.createdTime,
    this.flag,
    this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  City copyWith({
    int? id,
    String? name,
    String? createdDate,
    String? createdTime,
    bool? flag,
    int? state,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      flag: flag ?? this.flag,
      state: state ?? this.state,
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
      state,
    ];
  }
}
