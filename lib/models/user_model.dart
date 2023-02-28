import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    required String uid,
    required String email,
    required String name,
    required String role,
    required String status,
    String? createdAt,
    String? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
