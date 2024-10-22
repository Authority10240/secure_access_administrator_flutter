// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitation_view_load_visitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitationViewLoadVisitationModelImpl
    _$$VisitationViewLoadVisitationModelImplFromJson(
            Map<String, dynamic> json) =>
        _$VisitationViewLoadVisitationModelImpl(
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
          year: json['year'] as String?,
          month: json['month'] as String?,
        );

Map<String, dynamic> _$$VisitationViewLoadVisitationModelImplToJson(
        _$VisitationViewLoadVisitationModelImpl instance) =>
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
      'year': instance.year,
      'month': instance.month,
    };
