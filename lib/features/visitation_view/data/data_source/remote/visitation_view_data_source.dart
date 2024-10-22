import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_vehicle_model.dart';

abstract class VisitationViewDataSource {

  Stream<QuerySnapshot<VisitationViewLoadVisitationModel?>> visitationViewLoadVisitation({required String date});

  Future<VisitationViewLoadVisitationVehicleModel> visitationViewLoadVisitationVehicle({required String visitationId, required String date});
}