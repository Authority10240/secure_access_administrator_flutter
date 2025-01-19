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

class PropertyAccessDeleteUnit extends PropertyAccessPageState{

  PropertyAccessDeleteUnit({required super.residenceUnits, super.errorCode, super.errorMessage});
}

class PropertyAccessAddUnit extends PropertyAccessPageState{

  PropertyAccessAddUnit({required super.residenceUnits, super.errorCode, super.errorMessage});
}

