import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitation_view_load_visitation_model.freezed.dart';
part 'visitation_view_load_visitation_model.g.dart';

@freezed
class VisitationViewLoadVisitationModel with _$VisitationViewLoadVisitationModel {
  const factory VisitationViewLoadVisitationModel({
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
    required String? time,
    required String? year,
    required String? month
  }) = _VisitationViewLoadVisitationModel;

  factory VisitationViewLoadVisitationModel.fromJson(
          Map<String, Object?> json) =>
      _$VisitationViewLoadVisitationModelFromJson(json);
}
