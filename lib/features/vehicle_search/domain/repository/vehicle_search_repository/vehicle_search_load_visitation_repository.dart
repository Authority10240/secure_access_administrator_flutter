

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';

abstract class VehicleSearchLoadVisitationRepository  extends BaseRepository<VehicleSearchLoadVisitationRepositoryParams, DashboardGetVisitationsModel>{}

class VehicleSearchLoadVisitationRepositoryParams extends BaseRepositoryParams{


  VehicleSearchLoadVisitationRepositoryParams({required this.visitationid});

  final String visitationid;
}
