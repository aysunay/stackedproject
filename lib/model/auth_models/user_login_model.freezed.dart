// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) {
  return _UserLoginModel.fromJson(json);
}

/// @nodoc
mixin _$UserLoginModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginModelCopyWith<UserLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginModelCopyWith<$Res> {
  factory $UserLoginModelCopyWith(
          UserLoginModel value, $Res Function(UserLoginModel) then) =
      _$UserLoginModelCopyWithImpl<$Res, UserLoginModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$UserLoginModelCopyWithImpl<$Res, $Val extends UserLoginModel>
    implements $UserLoginModelCopyWith<$Res> {
  _$UserLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginModelImplCopyWith<$Res>
    implements $UserLoginModelCopyWith<$Res> {
  factory _$$UserLoginModelImplCopyWith(_$UserLoginModelImpl value,
          $Res Function(_$UserLoginModelImpl) then) =
      __$$UserLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$UserLoginModelImplCopyWithImpl<$Res>
    extends _$UserLoginModelCopyWithImpl<$Res, _$UserLoginModelImpl>
    implements _$$UserLoginModelImplCopyWith<$Res> {
  __$$UserLoginModelImplCopyWithImpl(
      _$UserLoginModelImpl _value, $Res Function(_$UserLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$UserLoginModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginModelImpl implements _UserLoginModel {
  const _$UserLoginModelImpl({required this.email, required this.password});

  factory _$UserLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserLoginModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginModelImplCopyWith<_$UserLoginModelImpl> get copyWith =>
      __$$UserLoginModelImplCopyWithImpl<_$UserLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginModelImplToJson(
      this,
    );
  }
}

abstract class _UserLoginModel implements UserLoginModel {
  const factory _UserLoginModel(
      {required final String email,
      required final String password}) = _$UserLoginModelImpl;

  factory _UserLoginModel.fromJson(Map<String, dynamic> json) =
      _$UserLoginModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$UserLoginModelImplCopyWith<_$UserLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
