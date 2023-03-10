// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervisor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupervisorModel _$$_SupervisorModelFromJson(Map<String, dynamic> json) =>
    _$_SupervisorModel(
      id: json['id'] as int?,
      userID: json['userID'] as int,
      socialMedia: json['socialMedia'] as String,
      skills: json['skills'] as String,
      hobbies: json['hobbies'] as String,
      description: json['description'] as String,
      educations: json['educations'] as String,
      workExperiences: json['workExperiences'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      position: json['position'] as String,
      photo: json['photo'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      interns: (json['interns'] as List<dynamic>?)
          ?.map((e) => InternModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SupervisorModelToJson(_$_SupervisorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'socialMedia': instance.socialMedia,
      'skills': instance.skills,
      'hobbies': instance.hobbies,
      'description': instance.description,
      'educations': instance.educations,
      'workExperiences': instance.workExperiences,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'position': instance.position,
      'photo': instance.photo,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'user': instance.user,
      'interns': instance.interns,
    };
