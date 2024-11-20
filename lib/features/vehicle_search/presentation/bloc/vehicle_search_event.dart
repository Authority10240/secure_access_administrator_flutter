part of 'vehicle_search_bloc.dart';
 @immutable
abstract class VehicleSearchPageEvent extends BaseEvent {

 }

class VehicleSearchOpenDrawerEvent extends VehicleSearchPageEvent{

  VehicleSearchOpenDrawerEvent({ this.carDrawerOpen,  this.dateDrawerOpen});

 bool? carDrawerOpen;
 bool? dateDrawerOpen;
}


class VehicleSearchValueChangedEvent extends VehicleSearchPageEvent{

  VehicleSearchValueChangedEvent({required this.vehicleSearchCriteria});

  final VehicleSearchCriteria vehicleSearchCriteria;
}

class VehicleSearchLoadVisitationEvent extends VehicleSearchPageEvent{

  VehicleSearchLoadVisitationEvent({required this.dashboardPageLoadVisitationsVehicleModel});

final DashboardPageLoadVisitationsVehicleModel dashboardPageLoadVisitationsVehicleModel;

}