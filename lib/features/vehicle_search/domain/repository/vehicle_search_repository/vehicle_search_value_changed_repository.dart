

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';

abstract class VehicleSearchValueChangedRepository  extends BaseRepository<VehicleSearchValueChangedRepositoryParams, Stream<QuerySnapshot<SecureAccessVisitationsVehicleModel>>>{}

class VehicleSearchValueChangedRepositoryParams extends BaseRepositoryParams{

  VehicleSearchValueChangedRepositoryParams({required this.vehicleSearchCriteria});

  final VehicleSearchCriteria vehicleSearchCriteria;
}
