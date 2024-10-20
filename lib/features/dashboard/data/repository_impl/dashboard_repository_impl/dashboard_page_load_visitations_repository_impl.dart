import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';
import 'package:secure_access_administrator/features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitations_repository.dart';

@Injectable(as: DashboardPageLoadVisitationsRepository)
class DashboardPageLoadVisitationsRepositoryImpl extends DashboardPageLoadVisitationsRepository {

  DashboardPageLoadVisitationsRepositoryImpl({required this.dashboardService});

  final DashboardService dashboardService;

  @override
  Future<void> call({DashboardPageLoadVisitationsRepositoryParams? params,
    required Function(Stream<QuerySnapshot<DashboardPageLoadVisitationsModel?>> model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    try{
      Stream<QuerySnapshot<DashboardPageLoadVisitationsModel?>>? list = dashboardService.dashboardPageLoadVisitations();
      onSuccess!.call(list);
    }on Exception catch (ex){
      onError!.call(BaseFailure.factory(ex: ex));
    }
  }
  

}
