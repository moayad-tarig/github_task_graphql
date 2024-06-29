import 'package:json_annotation/json_annotation.dart';

part 'popular_model.g.dart';

@JsonSerializable()
class PopularModel {
  final String? id;
  final String? name;
  final String? description;
  final PrimaryLanguage? primaryLanguage;
  final int? stargazerCount;
  final String? url;
  PopularModel(this.id, this.name, this.description, this.primaryLanguage,
      this.stargazerCount, this.url );

  factory PopularModel.fromJson(Map<String, dynamic> json) =>
      _$PopularModelFromJson(json);
  Map<String, dynamic> toJson() => _$PopularModelToJson(this);
}

@JsonSerializable()
class PrimaryLanguage {
  @JsonKey(name: 'name')
  final String? language;
  PrimaryLanguage(this.language);

  factory PrimaryLanguage.fromJson(Map<String, dynamic> json) =>
      _$PrimaryLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryLanguageToJson(this);
}
