import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/domain/repository/dashboard_repository/dashboard_get_visitations_repository.dart';

@Injectable(as: DashboardGetVisitationsRepository)
class DashboardGetVisitationsRepositoryImpl extends DashboardGetVisitationsRepository {

  DashboardGetVisitationsRepositoryImpl({required this.dashboardService});

  final DashboardService dashboardService;

  @override
  Future<void> call({
    DashboardGetVisitationsRepositoryParams? params,
    required Function(Stream<QuerySnapshot<DashboardGetVisitationsModel>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async{
    try{
      onSuccess!.call( dashboardService.dashboardGetVisitations(date: params!.date));
    }on Exception catch(ex){
      onError!.call(BaseFailure.factory(ex: ex));
    }

  }
  

}
