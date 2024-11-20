

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';

abstract class VehicleSearchValueChangedRepository  extends BaseRepository<VehicleSearchValueChangedRepositoryParams, Stream<QuerySnapshot<DashboardPageLoadVisitationsVehicleModel>>>{}

class VehicleSearchValueChangedRepositoryParams extends BaseRepositoryParams{

  VehicleSearchValueChangedRepositoryParams({required this.vehicleSearchCriteria});

  final VehicleSearchCriteria vehicleSearchCriteria;
}
