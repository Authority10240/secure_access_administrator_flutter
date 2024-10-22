part of 'visitation_view_bloc.dart';
 @immutable
abstract class VisitationViewPageEvent extends BaseEvent {}

class VisitationViewLoadVisitationEvent extends VisitationViewPageEvent{

  VisitationViewLoadVisitationEvent({required this.date});
  final String date;
}


class VisitationViewLoadVisitationVehicleEvent extends VisitationViewPageEvent{

 VisitationViewLoadVisitationVehicleEvent({
  required this.visitationViewLoadVisitationModel});

 final VisitationViewLoadVisitationModel visitationViewLoadVisitationModel;
}