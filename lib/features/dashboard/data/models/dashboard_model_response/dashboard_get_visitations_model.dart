import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_get_visitations_model.freezed.dart';
part 'dashboard_get_visitations_model.g.dart';

@freezed
class DashboardGetVisitationsModel with _$DashboardGetVisitationsModel {
  const factory DashboardGetVisitationsModel({
    required String? identificationNumber,
    required String? identificationType,
    required String? firstName,
    required String? middleName,
    required String? lastName,
    required String? transportationType,
    required String? mobileNumber,
    required String? email,
    required String? date,
    required String? unit,
    required String? time
  }) = _DashboardGetVisitationsModel;

  factory DashboardGetVisitationsModel.fromJson(
          Map<String, Object?> json) =>
      _$DashboardGetVisitationsModelFromJson(json);
}
