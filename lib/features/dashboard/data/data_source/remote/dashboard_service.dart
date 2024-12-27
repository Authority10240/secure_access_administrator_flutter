import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_repository/models/repository_models.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';

abstract class DashboardService {

  Stream<QuerySnapshot<SecureAccessVisitationsModel>> dashboardGetVisitations({required String date});

  Future<SecureAccessVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId, required String date});



}