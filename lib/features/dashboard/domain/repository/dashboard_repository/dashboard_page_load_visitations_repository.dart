import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';

abstract class DashboardPageLoadVisitationsRepository  extends BaseRepository<DashboardPageLoadVisitationsRepositoryParams, Stream<QuerySnapshot<DashboardPageLoadVisitationsModel?>>>{}

class DashboardPageLoadVisitationsRepositoryParams extends BaseRepositoryParams{}
