import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_model.freezed.dart';
part 'user_register_model.g.dart';

@freezed
class UserRegisterModel with _$UserRegisterModel {
  const factory UserRegisterModel({
    required String email,
    required String password,
    required String username,
  }) = _UserRegisterModel;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => _$UserRegisterModelFromJson(json);
}
