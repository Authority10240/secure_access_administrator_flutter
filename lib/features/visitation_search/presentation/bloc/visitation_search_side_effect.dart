part of 'visitation_search_bloc.dart';

sealed class VisitationSearchSideEffect extends BaseSideEffects{

  VisitationSearchSideEffect({super.errorCode, super.errorMessage});
}

class VisitationSearchLoadVehicleSideEffect extends VisitationSearchSideEffect{
  VisitationSearchLoadVehicleSideEffect({
    this.dashboardGetVisitationsModel,
    this.dashboardPageLoadVisitationsVehicleModel,super.errorCode, super.errorMessage});

  final SecureAccessVisitationsVehicleModel? dashboardPageLoadVisitationsVehicleModel;
  final SecureAccessVisitationsModel? dashboardGetVisitationsModel;
}