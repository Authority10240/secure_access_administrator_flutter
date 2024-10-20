import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';

abstract class DashboardService {

  Stream<QuerySnapshot<DashboardGetVisitationsModel>> dashboardGetVisitations({required String date});

  Future<DashboardPageLoadVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId, required String date});



}