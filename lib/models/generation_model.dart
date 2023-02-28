import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_model.freezed.dart';
part 'generation_model.g.dart';

@unfreezed
class GenerationModel with _$GenerationModel {
  factory GenerationModel({
    int? id,
    required String name,
    required String endDate,
    String? createdAt,
    String? updatedAt,
  }) = _GenerationModel;

  factory GenerationModel.fromJson(Map<String, dynamic> json) =>
      _$GenerationModelFromJson(json);
}
