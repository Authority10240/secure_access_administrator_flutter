import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class DashboardGetVisitationsRepository  extends BaseRepository<DashboardGetVisitationsRepositoryParams,
    Stream<QuerySnapshot<SecureAccessVisitationsModel>>>{}

class DashboardGetVisitationsRepositoryParams extends BaseRepositoryParams{

  DashboardGetVisitationsRepositoryParams({required this.date});
  final String date;
}
