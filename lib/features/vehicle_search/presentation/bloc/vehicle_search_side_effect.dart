import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';

class VehicleSearchSideEffect extends BaseSideEffects{
  VehicleSearchSideEffect({super.errorCode, super.errorMessage});
}


class VehicleSearchLoadVisitationSideEffect extends VehicleSearchSideEffect{

  VehicleSearchLoadVisitationSideEffect({this.dashboardGetVisitationsModel, this.dashboardPageLoadVisitationsVehicleModel, super.errorCode, super.errorMessage});

  final DashboardPageLoadVisitationsVehicleModel? dashboardPageLoadVisitationsVehicleModel;
  final DashboardGetVisitationsModel? dashboardGetVisitationsModel;
}