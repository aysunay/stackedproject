// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TechnicianImpl _$$TechnicianImplFromJson(Map<String, dynamic> json) =>
    _$TechnicianImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      contact: json['contact'] as String,
      status: json['status'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$TechnicianImplToJson(_$TechnicianImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'contact': instance.contact,
      'status': instance.status,
      'photoUrl': instance.photoUrl,
    };
