// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technician_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Technician _$TechnicianFromJson(Map<String, dynamic> json) {
  return _Technician.fromJson(json);
}

/// @nodoc
mixin _$Technician {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechnicianCopyWith<Technician> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicianCopyWith<$Res> {
  factory $TechnicianCopyWith(
          Technician value, $Res Function(Technician) then) =
      _$TechnicianCopyWithImpl<$Res, Technician>;
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String contact,
      String status,
      String? photoUrl});
}

/// @nodoc
class _$TechnicianCopyWithImpl<$Res, $Val extends Technician>
    implements $TechnicianCopyWith<$Res> {
  _$TechnicianCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? contact = null,
    Object? status = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TechnicianImplCopyWith<$Res>
    implements $TechnicianCopyWith<$Res> {
  factory _$$TechnicianImplCopyWith(
          _$TechnicianImpl value, $Res Function(_$TechnicianImpl) then) =
      __$$TechnicianImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String contact,
      String status,
      String? photoUrl});
}

/// @nodoc
class __$$TechnicianImplCopyWithImpl<$Res>
    extends _$TechnicianCopyWithImpl<$Res, _$TechnicianImpl>
    implements _$$TechnicianImplCopyWith<$Res> {
  __$$TechnicianImplCopyWithImpl(
      _$TechnicianImpl _value, $Res Function(_$TechnicianImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? contact = null,
    Object? status = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_$TechnicianImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnicianImpl implements _Technician {
  const _$TechnicianImpl(
      {required this.id,
      required this.name,
      required this.role,
      required this.contact,
      required this.status,
      this.photoUrl});

  factory _$TechnicianImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnicianImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String role;
  @override
  final String contact;
  @override
  final String status;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'Technician(id: $id, name: $name, role: $role, contact: $contact, status: $status, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnicianImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, contact, status, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnicianImplCopyWith<_$TechnicianImpl> get copyWith =>
      __$$TechnicianImplCopyWithImpl<_$TechnicianImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnicianImplToJson(
      this,
    );
  }
}

abstract class _Technician implements Technician {
  const factory _Technician(
      {required final String id,
      required final String name,
      required final String role,
      required final String contact,
      required final String status,
      final String? photoUrl}) = _$TechnicianImpl;

  factory _Technician.fromJson(Map<String, dynamic> json) =
      _$TechnicianImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get role;
  @override
  String get contact;
  @override
  String get status;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$TechnicianImplCopyWith<_$TechnicianImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
