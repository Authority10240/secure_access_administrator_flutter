import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class VehicleSearchDataSource{

  Stream<QuerySnapshot<SecureAccessVisitationsVehicleModel>> visitationSearchValueChanged({required VehicleSearchCriteria visitationSearchCriteria});

  Future<SecureAccessVisitationsModel> visitationSearchLoadVehicle({required String visitationId});
}