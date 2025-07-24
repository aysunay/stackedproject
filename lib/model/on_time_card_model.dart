import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_time_card_model.freezed.dart';
part 'on_time_card_model.g.dart';

@freezed
class OnTimeCardModel with _$OnTimeCardModel {
  const factory OnTimeCardModel({
    String? cardId,
    String? cardType,
    String? cardBarcode,
    String? cardStatus,
    String? cardStatusId,
    String? cardDescription,
    String? tailNo,
    bool? isCritical,
    @Default(0) int staffCount,
  }) = _OnTimeCardModel;

  factory OnTimeCardModel.fromJson(Map<String, dynamic> json) =>
      _$OnTimeCardModelFromJson(json);
}
