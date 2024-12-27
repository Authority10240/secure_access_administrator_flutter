part of 'vehicle_search_bloc.dart';
@immutable
abstract class VehicleSearchPageState extends BaseState {

  VehicleSearchPageState({super.errorCode, super.errorMessage,this.dateDrawerOpen, this.carDrawerOpen, this.visitations});
  Stream<QuerySnapshot<SecureAccessVisitationsVehicleModel?>>? visitations;
  bool? carDrawerOpen ;
  bool? dateDrawerOpen ;
}

class VehicleSearchPageInitState extends VehicleSearchPageState  {

  VehicleSearchPageInitState({super.carDrawerOpen, super.dateDrawerOpen});
}

class VehicleSearchOpenDrawerState extends VehicleSearchPageState{

  VehicleSearchOpenDrawerState({super.carDrawerOpen, super.dateDrawerOpen, super.visitations});
}

class VehicleSearchValueChangedState extends VehicleSearchPageState{

  VehicleSearchValueChangedState({super.carDrawerOpen, super.dateDrawerOpen, super.errorCode, super.errorMessage, super.visitations});

}

