import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class DashboardPageLoadVisitationVehicleRepository  extends BaseRepository<DashboardPageLoadVisitationVehicleRepositoryParams, SecureAccessVisitationsVehicleModel>{}

class DashboardPageLoadVisitationVehicleRepositoryParams extends BaseRepositoryParams{

  DashboardPageLoadVisitationVehicleRepositoryParams({required this.visitationId, required this.date});

  final String visitationId;
  final String date;
}
