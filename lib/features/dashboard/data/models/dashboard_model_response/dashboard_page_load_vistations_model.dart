import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dashboard_page_load_visitations_vehicle_model.dart';

part 'dashboard_page_load_vistations_model.freezed.dart';
part 'dashboard_page_load_vistations_model.g.dart';

@freezed
class DashboardPageLoadVisitationsModel with _$DashboardPageLoadVisitationsModel {
  const factory DashboardPageLoadVisitationsModel({
    required String? identificationNumber,
    required String? identificationType,
    required String? firstName,
    required String? middleName,
    required String? lastName,
    required String? transportationType,
    required String? mobileNumber,
    required String? email,
    required DateTime? dateTime,
    required String? unitVisited,
    required DashboardPageLoadVisitationsVehicleModel? vehicle
  }) = _DashboardPageLoadVisitationsModel;

  factory DashboardPageLoadVisitationsModel.fromJson(
          Map<String, Object?> json) =>
      _$DashboardPageLoadVisitationsModelFromJson(json);
}
