part of 'dashboard_bloc.dart';
 @immutable
abstract class DashboardPageEvent extends BaseEvent {}

class DashBoardPageSwitchEvent extends DashboardPageEvent{
  final DashboardPageState pageState;

  DashBoardPageSwitchEvent({required this.pageState});
}

class DashBoardGetVisitationEvent extends DashboardPageEvent{

}

class DashBoardCalendarMonthIncrementEvent extends DashboardPageEvent{}


class DashBoardCalendarMonthDecrementEvent extends DashboardPageEvent{}

class DashBoardCalendarDateSelectedEvent extends DashboardPageEvent{
  final DateTime dateTime;
  final List<Event> events;

  DashBoardCalendarDateSelectedEvent({required this.dateTime, required this.events});

}

class DashBoardCalendarChangedEvent extends DashboardPageEvent{
  final DateTime dateTime;

  DashBoardCalendarChangedEvent({required this.dateTime});
}

class DashBoardPageLoadVisitationVehicleEvent extends DashboardPageEvent{

  DashBoardPageLoadVisitationVehicleEvent({required this.dashboardGetVisitationsModel,required this.visitationId});

  final String visitationId;
  final SecureAccessVisitationsModel dashboardGetVisitationsModel;
}


