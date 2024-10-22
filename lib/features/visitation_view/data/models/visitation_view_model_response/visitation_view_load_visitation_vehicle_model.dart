import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitation_view_load_visitation_vehicle_model.freezed.dart';
part 'visitation_view_load_visitation_vehicle_model.g.dart';

@freezed
class VisitationViewLoadVisitationVehicleModel with _$VisitationViewLoadVisitationVehicleModel {
  const factory VisitationViewLoadVisitationVehicleModel({
    required String? engineNumber,
    required String? licenseNumber,
    required String? regNumber,
    required String? description,
    required String? vinNumber,
    required String? expiryYear,
    required String? make,
    required String? model,
    required String? identificationNumber,
    required String? date,
    required String? unit,
    required String? color,
    required String? time,
    required String? year,
    required String? month
  }) = _VisitationViewLoadVisitationVehicleModel;

  factory VisitationViewLoadVisitationVehicleModel.fromJson(
          Map<String, Object?> json) =>
      _$VisitationViewLoadVisitationVehicleModelFromJson(json);
}
