part of 'property_access_bloc.dart';
@immutable
abstract class PropertyAccessPageState extends BaseState {

  PropertyAccessPageState({ this.residenceUnits, super.errorCode, super.errorMessage});

  Stream<QuerySnapshot<SecureAccessUnitsModel?>>? residenceUnits;
}

class PropertyAccessPageInitState extends PropertyAccessPageState  {}

class PropertyAccessGetUnitsState extends PropertyAccessPageState{

  PropertyAccessGetUnitsState({required super.residenceUnits, super.errorCode, super.errorMessage});

}

class PropertyAccessDeleteUnitState extends PropertyAccessPageState{

  PropertyAccessDeleteUnitState({required super.residenceUnits, super.errorCode, super.errorMessage});
}

class PropertyAccessAddUnitState extends PropertyAccessPageState{

  PropertyAccessAddUnitState({required super.residenceUnits, super.errorCode, super.errorMessage});
}

