// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegisterModel _$UserRegisterModelFromJson(Map<String, dynamic> json) {
  return _UserRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterModelCopyWith<UserRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterModelCopyWith<$Res> {
  factory $UserRegisterModelCopyWith(
          UserRegisterModel value, $Res Function(UserRegisterModel) then) =
      _$UserRegisterModelCopyWithImpl<$Res, UserRegisterModel>;
  @useResult
  $Res call({String email, String password, String username});
}

/// @nodoc
class _$UserRegisterModelCopyWithImpl<$Res, $Val extends UserRegisterModel>
    implements $UserRegisterModelCopyWith<$Res> {
  _$UserRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterModelImplCopyWith<$Res>
    implements $UserRegisterModelCopyWith<$Res> {
  factory _$$UserRegisterModelImplCopyWith(_$UserRegisterModelImpl value,
          $Res Function(_$UserRegisterModelImpl) then) =
      __$$UserRegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String username});
}

/// @nodoc
class __$$UserRegisterModelImplCopyWithImpl<$Res>
    extends _$UserRegisterModelCopyWithImpl<$Res, _$UserRegisterModelImpl>
    implements _$$UserRegisterModelImplCopyWith<$Res> {
  __$$UserRegisterModelImplCopyWithImpl(_$UserRegisterModelImpl _value,
      $Res Function(_$UserRegisterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_$UserRegisterModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterModelImpl implements _UserRegisterModel {
  const _$UserRegisterModelImpl(
      {required this.email, required this.password, required this.username});

  factory _$UserRegisterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String username;

  @override
  String toString() {
    return 'UserRegisterModel(email: $email, password: $password, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterModelImplCopyWith<_$UserRegisterModelImpl> get copyWith =>
      __$$UserRegisterModelImplCopyWithImpl<_$UserRegisterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterModelImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterModel implements UserRegisterModel {
  const factory _UserRegisterModel(
      {required final String email,
      required final String password,
      required final String username}) = _$UserRegisterModelImpl;

  factory _UserRegisterModel.fromJson(Map<String, dynamic> json) =
      _$UserRegisterModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$UserRegisterModelImplCopyWith<_$UserRegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
