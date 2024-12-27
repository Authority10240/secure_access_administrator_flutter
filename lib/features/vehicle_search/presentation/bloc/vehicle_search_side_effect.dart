import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_repository/secure_access_repository.dart';

class VehicleSearchSideEffect extends BaseSideEffects{
  VehicleSearchSideEffect({super.errorCode, super.errorMessage});
}


class VehicleSearchLoadVisitationSideEffect extends VehicleSearchSideEffect{

  VehicleSearchLoadVisitationSideEffect({this.dashboardGetVisitationsModel, this.dashboardPageLoadVisitationsVehicleModel, super.errorCode, super.errorMessage});

  final SecureAccessVisitationsVehicleModel? dashboardPageLoadVisitationsVehicleModel;
  final SecureAccessVisitationsModel? dashboardGetVisitationsModel;
}