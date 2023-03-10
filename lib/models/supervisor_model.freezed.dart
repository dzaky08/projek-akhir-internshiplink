// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supervisor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupervisorModel _$SupervisorModelFromJson(Map<String, dynamic> json) {
  return _SupervisorModel.fromJson(json);
}

/// @nodoc
mixin _$SupervisorModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  set userID(int value) => throw _privateConstructorUsedError;
  String get socialMedia => throw _privateConstructorUsedError;
  set socialMedia(String value) => throw _privateConstructorUsedError;
  String get skills => throw _privateConstructorUsedError;
  set skills(String value) => throw _privateConstructorUsedError;
  String get hobbies => throw _privateConstructorUsedError;
  set hobbies(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  String get educations => throw _privateConstructorUsedError;
  set educations(String value) => throw _privateConstructorUsedError;
  String get workExperiences => throw _privateConstructorUsedError;
  set workExperiences(String value) => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String value) => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  set address(String value) => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  set position(String value) => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  set photo(String value) => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  set createdAt(String? value) => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(String? value) => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  set user(UserModel? value) => throw _privateConstructorUsedError;
  List<InternModel>? get interns => throw _privateConstructorUsedError;
  set interns(List<InternModel>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupervisorModelCopyWith<SupervisorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupervisorModelCopyWith<$Res> {
  factory $SupervisorModelCopyWith(
          SupervisorModel value, $Res Function(SupervisorModel) then) =
      _$SupervisorModelCopyWithImpl<$Res, SupervisorModel>;
  @useResult
  $Res call(
      {int? id,
      int userID,
      String socialMedia,
      String skills,
      String hobbies,
      String description,
      String educations,
      String workExperiences,
      String phoneNumber,
      String address,
      String position,
      String photo,
      String? createdAt,
      String? updatedAt,
      UserModel? user,
      List<InternModel>? interns});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$SupervisorModelCopyWithImpl<$Res, $Val extends SupervisorModel>
    implements $SupervisorModelCopyWith<$Res> {
  _$SupervisorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userID = null,
    Object? socialMedia = null,
    Object? skills = null,
    Object? hobbies = null,
    Object? description = null,
    Object? educations = null,
    Object? workExperiences = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? position = null,
    Object? photo = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? user = freezed,
    Object? interns = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      socialMedia: null == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      educations: null == educations
          ? _value.educations
          : educations // ignore: cast_nullable_to_non_nullable
              as String,
      workExperiences: null == workExperiences
          ? _value.workExperiences
          : workExperiences // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      interns: freezed == interns
          ? _value.interns
          : interns // ignore: cast_nullable_to_non_nullable
              as List<InternModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SupervisorModelCopyWith<$Res>
    implements $SupervisorModelCopyWith<$Res> {
  factory _$$_SupervisorModelCopyWith(
          _$_SupervisorModel value, $Res Function(_$_SupervisorModel) then) =
      __$$_SupervisorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int userID,
      String socialMedia,
      String skills,
      String hobbies,
      String description,
      String educations,
      String workExperiences,
      String phoneNumber,
      String address,
      String position,
      String photo,
      String? createdAt,
      String? updatedAt,
      UserModel? user,
      List<InternModel>? interns});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_SupervisorModelCopyWithImpl<$Res>
    extends _$SupervisorModelCopyWithImpl<$Res, _$_SupervisorModel>
    implements _$$_SupervisorModelCopyWith<$Res> {
  __$$_SupervisorModelCopyWithImpl(
      _$_SupervisorModel _value, $Res Function(_$_SupervisorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userID = null,
    Object? socialMedia = null,
    Object? skills = null,
    Object? hobbies = null,
    Object? description = null,
    Object? educations = null,
    Object? workExperiences = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? position = null,
    Object? photo = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? user = freezed,
    Object? interns = freezed,
  }) {
    return _then(_$_SupervisorModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      socialMedia: null == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      educations: null == educations
          ? _value.educations
          : educations // ignore: cast_nullable_to_non_nullable
              as String,
      workExperiences: null == workExperiences
          ? _value.workExperiences
          : workExperiences // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      interns: freezed == interns
          ? _value.interns
          : interns // ignore: cast_nullable_to_non_nullable
              as List<InternModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupervisorModel
    with DiagnosticableTreeMixin
    implements _SupervisorModel {
  _$_SupervisorModel(
      {this.id,
      required this.userID,
      required this.socialMedia,
      required this.skills,
      required this.hobbies,
      required this.description,
      required this.educations,
      required this.workExperiences,
      required this.phoneNumber,
      required this.address,
      required this.position,
      required this.photo,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.interns});

  factory _$_SupervisorModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupervisorModelFromJson(json);

  @override
  int? id;
  @override
  int userID;
  @override
  String socialMedia;
  @override
  String skills;
  @override
  String hobbies;
  @override
  String description;
  @override
  String educations;
  @override
  String workExperiences;
  @override
  String phoneNumber;
  @override
  String address;
  @override
  String position;
  @override
  String photo;
  @override
  String? createdAt;
  @override
  String? updatedAt;
  @override
  UserModel? user;
  @override
  List<InternModel>? interns;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupervisorModel(id: $id, userID: $userID, socialMedia: $socialMedia, skills: $skills, hobbies: $hobbies, description: $description, educations: $educations, workExperiences: $workExperiences, phoneNumber: $phoneNumber, address: $address, position: $position, photo: $photo, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, interns: $interns)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SupervisorModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userID', userID))
      ..add(DiagnosticsProperty('socialMedia', socialMedia))
      ..add(DiagnosticsProperty('skills', skills))
      ..add(DiagnosticsProperty('hobbies', hobbies))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('educations', educations))
      ..add(DiagnosticsProperty('workExperiences', workExperiences))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('interns', interns));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupervisorModelCopyWith<_$_SupervisorModel> get copyWith =>
      __$$_SupervisorModelCopyWithImpl<_$_SupervisorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupervisorModelToJson(
      this,
    );
  }
}

abstract class _SupervisorModel implements SupervisorModel {
  factory _SupervisorModel(
      {int? id,
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
      required String photo,
      String? createdAt,
      String? updatedAt,
      UserModel? user,
      List<InternModel>? interns}) = _$_SupervisorModel;

  factory _SupervisorModel.fromJson(Map<String, dynamic> json) =
      _$_SupervisorModel.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  int get userID;
  set userID(int value);
  @override
  String get socialMedia;
  set socialMedia(String value);
  @override
  String get skills;
  set skills(String value);
  @override
  String get hobbies;
  set hobbies(String value);
  @override
  String get description;
  set description(String value);
  @override
  String get educations;
  set educations(String value);
  @override
  String get workExperiences;
  set workExperiences(String value);
  @override
  String get phoneNumber;
  set phoneNumber(String value);
  @override
  String get address;
  set address(String value);
  @override
  String get position;
  set position(String value);
  @override
  String get photo;
  set photo(String value);
  @override
  String? get createdAt;
  set createdAt(String? value);
  @override
  String? get updatedAt;
  set updatedAt(String? value);
  @override
  UserModel? get user;
  set user(UserModel? value);
  @override
  List<InternModel>? get interns;
  set interns(List<InternModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$_SupervisorModelCopyWith<_$_SupervisorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
