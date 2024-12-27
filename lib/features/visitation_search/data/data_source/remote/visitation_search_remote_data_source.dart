import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class VisitationSearchRemoteDataSource{

  Stream<QuerySnapshot<SecureAccessVisitationsModel?>> visitationSearchValueChanged({required VisitationSearchCriteria visitationSearchCriteria});

  Future<SecureAccessVisitationsVehicleModel> visitationSearchLoadVehicle({required String visitationId, required String date});

}