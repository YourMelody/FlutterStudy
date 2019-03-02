// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DrugClassModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugClassModel _$DrugClassModelFromJson(Map<String, dynamic> json) {
  return DrugClassModel(
      json['categoryCode'] as String,
      json['hasNode'] as bool,
      (json['categories'] as List)
          ?.map((e) => e == null
              ? null
              : DrugClassModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['categoryName'] as String);
}

Map<String, dynamic> _$DrugClassModelToJson(DrugClassModel instance) =>
    <String, dynamic>{
      'categoryCode': instance.categoryCode,
      'hasNode': instance.hasNode,
      'categories': instance.categories,
      'categoryName': instance.categoryName
    };
