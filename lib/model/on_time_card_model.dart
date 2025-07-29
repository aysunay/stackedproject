/*
class OnTimeCardModel {
  final int? id;
  final String? barcode;
  final int? typeId;
  final int? statusId;
  final String? description;
  final String? tailNo;
  final bool? isCritical;
  final String? createDate;
  final String? createUser;
  final String? updateDate;
  final String? updateUser;
  final bool? isActive;

  OnTimeCardModel({
    this.id,
    this.barcode,
    this.typeId,
    this.statusId,
    this.description,
    this.tailNo,
    this.isCritical,
    this.createDate,
    this.createUser,
    this.updateDate,
    this.updateUser,
    this.isActive,
  });

  factory OnTimeCardModel.fromJson(Map<String, dynamic> json) {
    return OnTimeCardModel(
      id: json['Id'] is int ? json['Id'] : int.tryParse(json['Id'].toString()),
      barcode: json['Barcode']?.toString(),
      typeId: json['TypeId'] is int
          ? json['TypeId']
          : int.tryParse(json['TypeId'].toString()),
      statusId: json['StatusId'] is int
          ? json['StatusId']
          : int.tryParse(json['StatusId'].toString()),
      description: json['Description']?.toString(),
      tailNo: json['TailNo']?.toString(),
      isCritical: json['IsCritical'] == true || json['IsCritical'] == "true",
      createDate: json['CreateDate']?.toString(),
      createUser: json['CreateUser']?.toString(),
      updateDate: json['UpdateDate']?.toString(),
      updateUser: json['UpdateUser']?.toString(),
      isActive: json['IsActive'] == true || json['IsActive'] == "true",
    );
  }

  get staffCount => 0;
}
*/
/*import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_time_card_model.freezed.dart';
part 'on_time_card_model.g.dart';

@freezed
class OnTimeCardModel with _$OnTimeCardModel {
  const factory OnTimeCardModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Barcode') String? barcode,
    @JsonKey(name: 'TypeId') int? typeId,
    @JsonKey(name: 'StatusId') int? statusId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'TailNo') String? tailNo,
    @JsonKey(name: 'IsCritical') bool? isCritical,
    @JsonKey(name: 'CreateDate') String? createDate,
    @JsonKey(name: 'CreateUser') String? createUser,
    @JsonKey(name: 'UpdateDate') String? updateDate,
    @JsonKey(name: 'UpdateUser') String? updateUser,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _OnTimeCardModel;

  factory OnTimeCardModel.fromJson(Map<String, dynamic> json) => _$OnTimeCardModelFromJson(json);
}*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_time_card_model.freezed.dart';
part 'on_time_card_model.g.dart';

@freezed
class OnTimeCardModel with _$OnTimeCardModel {
  const factory OnTimeCardModel({
    int? id,
    String? barcode,
    int? typeId,
    int? statusId,
    String? description,
    String? tailNo,
    bool? isCritical,
    String? createDate,
    String? createUser,
    String? updateDate,
    String? updateUser,
    bool? isActive,
  }) = _OnTimeCardModel;

  factory OnTimeCardModel.fromJson(Map<String, dynamic> json) => _$OnTimeCardModelFromJson(json);
}
