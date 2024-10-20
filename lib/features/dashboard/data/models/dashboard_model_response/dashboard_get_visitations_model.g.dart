// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_get_visitations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardGetVisitationsModelImpl _$$DashboardGetVisitationsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardGetVisitationsModelImpl(
      identificationNumber: json['identificationNumber'] as String?,
      identificationType: json['identificationType'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      transportationType: json['transportationType'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      date: json['date'] as String?,
      unit: json['unit'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$DashboardGetVisitationsModelImplToJson(
        _$DashboardGetVisitationsModelImpl instance) =>
    <String, dynamic>{
      'identificationNumber': instance.identificationNumber,
      'identificationType': instance.identificationType,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'transportationType': instance.transportationType,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'date': instance.date,
      'unit': instance.unit,
      'time': instance.time,
    };
