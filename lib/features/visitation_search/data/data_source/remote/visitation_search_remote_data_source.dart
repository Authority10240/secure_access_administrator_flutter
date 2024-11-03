import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';

abstract class VisitationSearchRemoteDataSource{

  Stream<QuerySnapshot<DashboardGetVisitationsModel?>> visitationSearchValueChanged({required VisitationSearchCriteria visitationSearchCriteria});
}