import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

sealed class DashboardPageSideEffect extends BaseSideEffects{

  DashboardPageSideEffect({super.errorCode, super.errorMessage});
}

class DashBoardPageLoadVisitationVehicleSideEffect extends DashboardPageSideEffect{

  DashBoardPageLoadVisitationVehicleSideEffect({
    super.errorCode,
    super.errorMessage,
    this.dashboardPageLoadVisitationsVehicleModel,
    this.dashboardGetVisitationsModel });

  final SecureAccessVisitationsVehicleModel? dashboardPageLoadVisitationsVehicleModel;
  final SecureAccessVisitationsModel? dashboardGetVisitationsModel;
}