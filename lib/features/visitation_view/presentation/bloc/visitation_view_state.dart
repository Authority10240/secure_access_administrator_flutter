part of 'visitation_view_bloc.dart';
@immutable
abstract class VisitationViewPageState extends BaseState {

  VisitationViewPageState({
    super.errorCode, super.errorMessage, this.visitations
});

  Stream<QuerySnapshot<VisitationViewLoadVisitationModel?>>? visitations;
}

class VisitationViewPageInitState extends VisitationViewPageState  {}

class VisitationViewLoadVisitationState extends VisitationViewPageState{
  VisitationViewLoadVisitationState({ super.visitations,super.errorCode, super.errorMessage});

}



