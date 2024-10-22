import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_vehicle_model.dart';

abstract class VisitationViewLoadVisitationVehicleRepository  extends BaseRepository<VisitationViewLoadVisitationVehicleRepositoryParams, VisitationViewLoadVisitationVehicleModel>{}

class VisitationViewLoadVisitationVehicleRepositoryParams extends BaseRepositoryParams{
VisitationViewLoadVisitationVehicleRepositoryParams({required this.visitationId, required this.date});

  final String visitationId;
  final String date;
}
