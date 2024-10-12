import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  final bool? flag;

  const Country({
    this.id,
    this.name,
    this.countryCode,
    this.createdDate,
    this.createdTime,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return _$CountryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Country copyWith({
    int? id,
    String? name,
    String? countryCode,
    String? createdDate,
    String? createdTime,
    bool? flag,
  }) {
    return Country(
      id: id ?? this.id,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      flag: flag ?? this.flag,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      countryCode,
      createdDate,
      createdTime,
      flag,
    ];
  }
}
