part of 'residents_bloc.dart';


@immutable
abstract class ResidentsPageEvent extends BaseEvent {}

class AddResidentClickedEvent extends ResidentsPageEvent{
  final SecureAccessResidentModel secureAccessResidentModel;
  final String blockId;
  final String unitId;

  AddResidentClickedEvent({
    required this.secureAccessResidentModel,
    required this.blockId,
    required this.unitId
  });
}

class PropertyAccessGetResidentsEvent extends ResidentsPageEvent{
  final String blockId;
  final String unitId;

  PropertyAccessGetResidentsEvent({
    required this.unitId,
    required this.blockId
});


}
