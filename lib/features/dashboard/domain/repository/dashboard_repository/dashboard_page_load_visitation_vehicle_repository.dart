import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';

abstract class DashboardPageLoadVisitationVehicleRepository  extends BaseRepository<DashboardPageLoadVisitationVehicleRepositoryParams, DashboardPageLoadVisitationsVehicleModel>{}

class DashboardPageLoadVisitationVehicleRepositoryParams extends BaseRepositoryParams{

  DashboardPageLoadVisitationVehicleRepositoryParams({required this.visitationId, required this.date});

  final String visitationId;
  final String date;
}
