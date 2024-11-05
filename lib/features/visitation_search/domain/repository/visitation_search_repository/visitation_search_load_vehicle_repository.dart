
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';

abstract class VisitationSearchLoadVehicleRepository  extends BaseRepository<VisitationSearchLoadVehicleRepositoryParams, DashboardPageLoadVisitationsVehicleModel>{}

class VisitationSearchLoadVehicleRepositoryParams extends BaseRepositoryParams{
  VisitationSearchLoadVehicleRepositoryParams({required this.date, required this.visitationId});

  final String visitationId;
  final String date;
}
