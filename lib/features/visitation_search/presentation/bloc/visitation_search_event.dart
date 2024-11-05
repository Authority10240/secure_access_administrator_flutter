part of 'visitation_search_bloc.dart';
 @immutable
abstract class VisitationSearchPageEvent extends BaseEvent {}

class VisitationSearchOpenDrawerEvent extends VisitationSearchPageEvent{

  VisitationSearchOpenDrawerEvent({this.carDrawerOpen, this.dateDrawerOpen, this.personnelDrawerOpen});

   bool? personnelDrawerOpen;
   bool? carDrawerOpen;
   bool? dateDrawerOpen;
}

class VisitationSearchLoadVisitationEvent extends VisitationSearchPageEvent{

  final VisitationSearchCriteria visitationSearchCriteria;


  VisitationSearchLoadVisitationEvent({required this.visitationSearchCriteria});

}

class VisitationSearchLoadVehicleEvent extends VisitationSearchPageEvent{
   final DashboardGetVisitationsModel dashboardGetVisitationsModel;
   final String visitationId;

   VisitationSearchLoadVehicleEvent({
     required this.dashboardGetVisitationsModel,
   required this.visitationId});

}