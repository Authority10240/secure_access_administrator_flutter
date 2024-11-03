part of 'visitation_search_bloc.dart';
@immutable
abstract class VisitationSearchPageState extends BaseState {

  VisitationSearchPageState({super.errorCode, super.errorMessage,this.visitations,this.personnelDrawerOpen, this.dateDrawerOpen, this.carDrawerOpen});

  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? visitations;
  bool? personnelDrawerOpen ;
  bool? carDrawerOpen ;
  bool? dateDrawerOpen ;
}

class VisitationSearchPageInitState extends VisitationSearchPageState  {

  VisitationSearchPageInitState({super.visitations,super.personnelDrawerOpen, super.dateDrawerOpen, super.carDrawerOpen});

}

class VisitationSearchOpenDrawerState extends VisitationSearchPageState{

  VisitationSearchOpenDrawerState({super.visitations,super.personnelDrawerOpen, super.dateDrawerOpen, super.carDrawerOpen});


}

class VisitationSearchLoadVisitationState extends VisitationSearchPageState{

  VisitationSearchLoadVisitationState({super.errorCode, super.errorMessage,super.carDrawerOpen, super.dateDrawerOpen, super.personnelDrawerOpen, super.visitations});
}