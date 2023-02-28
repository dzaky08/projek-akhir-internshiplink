// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerationModel _$GenerationModelFromJson(Map<String, dynamic> json) {
  return _GenerationModel.fromJson(json);
}

/// @nodoc
mixin _$GenerationModel {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  set endDate(String value) => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  set createdAt(String? value) => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerationModelCopyWith<GenerationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationModelCopyWith<$Res> {
  factory $GenerationModelCopyWith(
          GenerationModel value, $Res Function(GenerationModel) then) =
      _$GenerationModelCopyWithImpl<$Res, GenerationModel>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String endDate,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$GenerationModelCopyWithImpl<$Res, $Val extends GenerationModel>
    implements $GenerationModelCopyWith<$Res> {
  _$GenerationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? endDate = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenerationModelCopyWith<$Res>
    implements $GenerationModelCopyWith<$Res> {
  factory _$$_GenerationModelCopyWith(
          _$_GenerationModel value, $Res Function(_$_GenerationModel) then) =
      __$$_GenerationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String endDate,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$_GenerationModelCopyWithImpl<$Res>
    extends _$GenerationModelCopyWithImpl<$Res, _$_GenerationModel>
    implements _$$_GenerationModelCopyWith<$Res> {
  __$$_GenerationModelCopyWithImpl(
      _$_GenerationModel _value, $Res Function(_$_GenerationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? endDate = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_GenerationModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenerationModel
    with DiagnosticableTreeMixin
    implements _GenerationModel {
  _$_GenerationModel(
      {this.id,
      required this.name,
      required this.endDate,
      this.createdAt,
      this.updatedAt});

  factory _$_GenerationModel.fromJson(Map<String, dynamic> json) =>
      _$$_GenerationModelFromJson(json);

  @override
  int? id;
  @override
  String name;
  @override
  String endDate;
  @override
  String? createdAt;
  @override
  String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenerationModel(id: $id, name: $name, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenerationModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerationModelCopyWith<_$_GenerationModel> get copyWith =>
      __$$_GenerationModelCopyWithImpl<_$_GenerationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenerationModelToJson(
      this,
    );
  }
}

abstract class _GenerationModel implements GenerationModel {
  factory _GenerationModel(
      {int? id,
      required String name,
      required String endDate,
      String? createdAt,
      String? updatedAt}) = _$_GenerationModel;

  factory _GenerationModel.fromJson(Map<String, dynamic> json) =
      _$_GenerationModel.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  String get name;
  set name(String value);
  @override
  String get endDate;
  set endDate(String value);
  @override
  String? get createdAt;
  set createdAt(String? value);
  @override
  String? get updatedAt;
  set updatedAt(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_GenerationModelCopyWith<_$_GenerationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
