// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenerationModel _$$_GenerationModelFromJson(Map<String, dynamic> json) =>
    _$_GenerationModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      endDate: json['endDate'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_GenerationModelToJson(_$_GenerationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'endDate': instance.endDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
