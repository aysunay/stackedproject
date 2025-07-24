// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_time_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnTimeCardModelImpl _$$OnTimeCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OnTimeCardModelImpl(
      cardId: json['cardId'] as String?,
      cardType: json['cardType'] as String?,
      cardBarcode: json['cardBarcode'] as String?,
      cardStatus: json['cardStatus'] as String?,
      cardStatusId: json['cardStatusId'] as String?,
      cardDescription: json['cardDescription'] as String?,
      tailNo: json['tailNo'] as String?,
      isCritical: json['isCritical'] as bool?,
      staffCount: (json['staffCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$OnTimeCardModelImplToJson(
        _$OnTimeCardModelImpl instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'cardType': instance.cardType,
      'cardBarcode': instance.cardBarcode,
      'cardStatus': instance.cardStatus,
      'cardStatusId': instance.cardStatusId,
      'cardDescription': instance.cardDescription,
      'tailNo': instance.tailNo,
      'isCritical': instance.isCritical,
      'staffCount': instance.staffCount,
    };
