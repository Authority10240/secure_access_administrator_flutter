part of 'property_access_bloc.dart';
 @immutable
abstract class PropertyAccessPageEvent extends BaseEvent {

  final String blockId;

  PropertyAccessPageEvent({required this.blockId});
 }


class PropertyAccessGetUnitsEvent extends PropertyAccessPageEvent{


  PropertyAccessGetUnitsEvent({required super.blockId});
}

class PropertyAccessAddUnitEvent extends PropertyAccessPageEvent{

  final SecureAccessUnitsModel secureAccessUnitsModel;
  PropertyAccessAddUnitEvent({required super.blockId,
   required this.secureAccessUnitsModel});
}

class PropertyAccessDeleteUnitEvent extends PropertyAccessPageEvent{

  final String unitId;
  PropertyAccessDeleteUnitEvent({required super.blockId, required this.unitId });

}