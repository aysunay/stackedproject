import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_model.freezed.dart';
part 'technician_model.g.dart';

@freezed
class Technician with _$Technician {
  const factory Technician({
    required String id,
    required String name,
    required String role,
    required String contact,
    required String status,
    String? photoUrl,
  }) = _Technician;

  factory Technician.fromJson(Map<String, dynamic> json) => _$TechnicianFromJson(json);
}
