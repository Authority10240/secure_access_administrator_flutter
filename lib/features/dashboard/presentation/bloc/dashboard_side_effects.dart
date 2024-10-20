import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';

sealed class DashboardPageSideEffect extends BaseSideEffects{

  DashboardPageSideEffect({super.errorCode, super.errorMessage});
}

class DashBoardPageLoadVisitationVehicleSideEffect extends DashboardPageSideEffect{

  DashBoardPageLoadVisitationVehicleSideEffect({
    super.errorCode,
    super.errorMessage,
    this.dashboardPageLoadVisitationsVehicleModel,
    this.dashboardGetVisitationsModel });

  final DashboardPageLoadVisitationsVehicleModel? dashboardPageLoadVisitationsVehicleModel;
  final DashboardGetVisitationsModel? dashboardGetVisitationsModel;
}