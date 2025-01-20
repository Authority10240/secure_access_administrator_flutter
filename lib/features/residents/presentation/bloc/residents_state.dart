part of 'residents_bloc.dart';
@immutable
abstract class ResidentsPageState extends BaseState {

  Stream<QuerySnapshot<SecureAccessResidentModel?>>? residenceResidents;

  ResidentsPageState({this.residenceResidents, super.errorCode, super.errorMessage});
}

class ResidentsPageInitState extends ResidentsPageState  {
}

class PropertyAccessGetResidentsState extends ResidentsPageState{

  PropertyAccessGetResidentsState({super.residenceResidents, super.errorCode, super.errorMessage});
}

class AddResidentClickedState extends ResidentsPageState{

  AddResidentClickedState({super.residenceResidents, super.errorCode, super.errorMessage});

}