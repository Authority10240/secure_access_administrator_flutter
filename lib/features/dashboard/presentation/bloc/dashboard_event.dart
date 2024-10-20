part of 'dashboard_bloc.dart';
 @immutable
abstract class DashboardPageEvent extends BaseEvent {}

class DashBoardPageSwitchEvent extends DashboardPageEvent{
  final DashboardPageState pageState;

  DashBoardPageSwitchEvent({required this.pageState});
}

class DashBoardPageVisitationEvent extends DashboardPageEvent{

}


class DashBoardPageLoadVisitationVehicleEvent extends DashboardPageEvent{

   DashBoardPageLoadVisitationVehicleEvent({required this.dashboardPageLoadVisitationsModel,required this.visitationId});

   final String visitationId;
   final DashboardPageLoadVisitationsModel dashboardPageLoadVisitationsModel;
}
