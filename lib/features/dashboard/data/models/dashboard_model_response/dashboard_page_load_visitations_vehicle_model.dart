import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_page_load_visitations_vehicle_model.freezed.dart';
part 'dashboard_page_load_visitations_vehicle_model.g.dart';

@freezed
class DashboardPageLoadVisitationsVehicleModel with _$DashboardPageLoadVisitationsVehicleModel {
  const factory DashboardPageLoadVisitationsVehicleModel({
    required String? engineNumber,
    required String? licenseNumber,
    required String? regNumber,
    required String? description,
    required String? vinNumber,
    required String? expiryYear,
    required String? make,
    required String? model,
    required String? identificationNumber,
    required String? color
  }) = _DashboardPageLoadVisitationsVehicleModel;

  factory DashboardPageLoadVisitationsVehicleModel.fromJson(
          Map<String, Object?> json) =>
      _$DashboardPageLoadVisitationsVehicleModelFromJson(json);
}
