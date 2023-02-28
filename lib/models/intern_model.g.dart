// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intern_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InternModel _$$_InternModelFromJson(Map<String, dynamic> json) =>
    _$_InternModel(
      id: json['id'] as int?,
      userID: json['userID'] as int,
      generationID: json['generationID'] as int,
      supervisorID: json['supervisorID'] as int,
      phoneNumber: json['phoneNumber'] as String,
      schoolName: json['schoolName'] as String,
      vocation: json['vocation'] as String,
      startDate: json['startDate'] as String,
      finishDate: json['finishDate'] as String,
      motorcycleBrand: json['motorcycleBrand'] as String,
      motorcycleNumberPlate: json['motorcycleNumberPlate'] as String,
      schoolSupervisorName: json['schoolSupervisorName'] as String,
      schoolSupervisorPhoneNumber:
          json['schoolSupervisorPhoneNumber'] as String,
      parentName: json['parentName'] as String,
      parentPhoneNumber: json['parentPhoneNumber'] as String,
      birthPlace: json['birthPlace'] as String,
      birthDate: json['birthDate'] as String,
      religion: json['religion'] as String,
      bloodType: json['bloodType'] as String,
      address: json['address'] as String,
      identity: json['identity'] as String,
      selfiePhoto: json['selfiePhoto'] as String,
      skills: json['skills'] as String,
      socialMedia: json['socialMedia'] as Map<String, dynamic>,
      congenitalDisease: json['congenitalDisease'] as String,
      hobbies: json['hobbies'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      generation: json['generation'] == null
          ? null
          : GenerationModel.fromJson(
              json['generation'] as Map<String, dynamic>),
      supervisor: json['supervisor'] == null
          ? null
          : SupervisorModel.fromJson(
              json['supervisor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_InternModelToJson(_$_InternModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'generationID': instance.generationID,
      'supervisorID': instance.supervisorID,
      'phoneNumber': instance.phoneNumber,
      'schoolName': instance.schoolName,
      'vocation': instance.vocation,
      'startDate': instance.startDate,
      'finishDate': instance.finishDate,
      'motorcycleBrand': instance.motorcycleBrand,
      'motorcycleNumberPlate': instance.motorcycleNumberPlate,
      'schoolSupervisorName': instance.schoolSupervisorName,
      'schoolSupervisorPhoneNumber': instance.schoolSupervisorPhoneNumber,
      'parentName': instance.parentName,
      'parentPhoneNumber': instance.parentPhoneNumber,
      'birthPlace': instance.birthPlace,
      'birthDate': instance.birthDate,
      'religion': instance.religion,
      'bloodType': instance.bloodType,
      'address': instance.address,
      'identity': instance.identity,
      'selfiePhoto': instance.selfiePhoto,
      'skills': instance.skills,
      'socialMedia': instance.socialMedia,
      'congenitalDisease': instance.congenitalDisease,
      'hobbies': instance.hobbies,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'user': instance.user,
      'generation': instance.generation,
      'supervisor': instance.supervisor,
    };
