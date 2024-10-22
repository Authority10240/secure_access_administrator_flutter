import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_vehicle_model.dart';

sealed class VisitationViewSideEffect extends BaseSideEffects{

  VisitationViewSideEffect({super.errorCode, super.errorMessage});
}

class VisitationViewLoadVisitationVehicleSideEffect extends VisitationViewSideEffect{

  VisitationViewLoadVisitationVehicleSideEffect({
    super.errorCode, super.errorMessage,
    this.visitationViewLoadVisitationVehicleModel,
    this.visitationViewLoadVisitationModel
});
  VisitationViewLoadVisitationModel? visitationViewLoadVisitationModel;
  VisitationViewLoadVisitationVehicleModel? visitationViewLoadVisitationVehicleModel;
}