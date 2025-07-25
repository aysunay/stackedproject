import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_time_card_model.freezed.dart';
part 'on_time_card_model.g.dart';

@freezed
class OnTimeCardModel with _$OnTimeCardModel {
  const factory OnTimeCardModel({
    int? id,
    int? typeId,
    String? barcode,
    int? statusId,
    String? description,
    String? tailNo,
    bool? isCritical,
    String? createDate,
    String? createUser,
    String? updateDate,
    String? updateUser,
    @Default(0) int staffCount,
  }) = _OnTimeCardModel;

  factory OnTimeCardModel.fromJson(Map<String, dynamic> json) => _$OnTimeCardModelFromJson(json);
}
