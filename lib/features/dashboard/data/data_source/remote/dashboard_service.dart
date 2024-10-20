import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/bloc/dashboard_bloc.dart';

abstract class DashboardService {

  Stream<QuerySnapshot<DashboardPageLoadVisitationsModel?>> dashboardPageLoadVisitations();

  Future<DashboardPageLoadVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId});
}