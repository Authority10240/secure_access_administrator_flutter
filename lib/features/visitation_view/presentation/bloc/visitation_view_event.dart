part of 'visitation_view_bloc.dart';
 @immutable
abstract class VisitationViewPageEvent extends BaseEvent {}

class VisitationViewLoadVisitationEvent extends VisitationViewPageEvent{

}


class VisitationViewLoadVisitationVehicleEvent extends VisitationViewPageEvent{

 VisitationViewLoadVisitationVehicleEvent({
  required this.visitationViewLoadVisitationModel});

 final VisitationViewLoadVisitationModel visitationViewLoadVisitationModel;
}