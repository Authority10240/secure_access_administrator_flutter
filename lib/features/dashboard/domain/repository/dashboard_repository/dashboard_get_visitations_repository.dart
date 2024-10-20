import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';

abstract class DashboardGetVisitationsRepository  extends BaseRepository<DashboardGetVisitationsRepositoryParams,
    Stream<QuerySnapshot<DashboardGetVisitationsModel>>>{}

class DashboardGetVisitationsRepositoryParams extends BaseRepositoryParams{

  DashboardGetVisitationsRepositoryParams({required this.date});
  final String date;
}
