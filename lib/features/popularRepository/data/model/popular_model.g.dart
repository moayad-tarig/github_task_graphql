// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularModel _$PopularModelFromJson(Map<String, dynamic> json) => PopularModel(
      json['id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['primaryLanguage'] == null
          ? null
          : PrimaryLanguage.fromJson(
              json['primaryLanguage'] as Map<String, dynamic>),
      (json['stargazerCount'] as num?)?.toInt(),
      json['url'] as String?,
    );

Map<String, dynamic> _$PopularModelToJson(PopularModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'primaryLanguage': instance.primaryLanguage,
      'stargazerCount': instance.stargazerCount,
      'url': instance.url,
    };

PrimaryLanguage _$PrimaryLanguageFromJson(Map<String, dynamic> json) =>
    PrimaryLanguage(
      json['name'] as String?,
    );

Map<String, dynamic> _$PrimaryLanguageToJson(PrimaryLanguage instance) =>
    <String, dynamic>{
      'name': instance.language,
    };
