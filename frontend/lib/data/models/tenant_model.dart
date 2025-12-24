import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_model.freezed.dart';
part 'tenant_model.g.dart';

@freezed
class TenantModel with _$TenantModel {
  const factory TenantModel({
    required String id,
    required String name,
    required String slug,
    @JsonKey(name: 'is_active') required bool isActive,
    String? domain,
    Map<String, dynamic>? settings,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TenantModel;

  factory TenantModel.fromJson(Map<String, dynamic> json) =>
      _$TenantModelFromJson(json);
}
