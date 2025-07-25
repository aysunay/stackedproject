// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_time_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnTimeCardModelImpl _$$OnTimeCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OnTimeCardModelImpl(
      id: (json['id'] as num?)?.toInt(),
      typeId: (json['typeId'] as num?)?.toInt(),
      barcode: json['barcode'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
      description: json['description'] as String?,
      tailNo: json['tailNo'] as String?,
      isCritical: json['isCritical'] as bool?,
      createDate: json['createDate'] as String?,
      createUser: json['createUser'] as String?,
      updateDate: json['updateDate'] as String?,
      updateUser: json['updateUser'] as String?,
      staffCount: (json['staffCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$OnTimeCardModelImplToJson(
        _$OnTimeCardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeId': instance.typeId,
      'barcode': instance.barcode,
      'statusId': instance.statusId,
      'description': instance.description,
      'tailNo': instance.tailNo,
      'isCritical': instance.isCritical,
      'createDate': instance.createDate,
      'createUser': instance.createUser,
      'updateDate': instance.updateDate,
      'updateUser': instance.updateUser,
      'staffCount': instance.staffCount,
    };
