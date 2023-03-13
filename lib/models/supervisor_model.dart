import 'models.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supervisor_model.freezed.dart';
part 'supervisor_model.g.dart';

@unfreezed
class SupervisorModel with _$SupervisorModel {
  factory SupervisorModel({
    int? id,
    required int userID,
    required String socialMedia,
    required String skills,
    required String hobbies,
    required String description,
    required String educations,
    required String workExperiences,
    required String phoneNumber,
    required String address,
    required String position,
    String? photo,
    String? createdAt,
    String? updatedAt,
    UserModel? user,
    List<InternModel>? interns,
  }) = _SupervisorModel;

  factory SupervisorModel.fromJson(Map<String, dynamic> json) =>
      _$SupervisorModelFromJson(json);
}
