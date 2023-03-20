import 'models.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'intern_model.freezed.dart';
part 'intern_model.g.dart';

@unfreezed
class InternModel with _$InternModel {
  factory InternModel({
    int? id,
    required int userID,
    int? generationID,
    int? supervisorID,
    required String phoneNumber,
    required String schoolName,
    required String vocation,
    required String startDate,
    required String finishDate,
    required String motorcycleBrand,
    required String motorcycleNumberPlate,
    required String schoolSupervisorName,
    required String schoolSupervisorPhoneNumber,
    required String parentName,
    required String parentPhoneNumber,
    required String birthPlace,
    required String birthDate,
    required String religion,
    required String bloodType,
    required String address,
    required String identity,
    String? selfiePhoto,
    required String skills,
    required String socialMedia,
    required String congenitalDisease,
    required String hobbies,
    required String projekAkhir,
    required String status,
    String? createdAt,
    String? updatedAt,
    UserModel? user,
    GenerationModel? generation,
    SupervisorModel? supervisor,
  }) = _InternModel;

  factory InternModel.fromJson(Map<String, dynamic> json) =>
      _$InternModelFromJson(json);
}
