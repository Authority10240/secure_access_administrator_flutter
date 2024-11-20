import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';

abstract class VehicleSearchDataSource{

  Stream<QuerySnapshot<DashboardPageLoadVisitationsVehicleModel>> visitationSearchValueChanged({required VehicleSearchCriteria visitationSearchCriteria});

  Future<DashboardGetVisitationsModel> visitationSearchLoadVehicle({required String visitationId});
}