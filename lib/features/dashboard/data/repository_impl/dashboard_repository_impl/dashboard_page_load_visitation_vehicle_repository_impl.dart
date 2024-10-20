
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitation_vehicle_repository.dart';

@Injectable(as: DashboardPageLoadVisitationVehicleRepository)
class DashboardPageLoadVisitationVehicleRepositoryImpl extends DashboardPageLoadVisitationVehicleRepository {

  DashboardPageLoadVisitationVehicleRepositoryImpl({required this.dashboardService});

  final DashboardService dashboardService;
  @override
  Future<void> call({
    DashboardPageLoadVisitationVehicleRepositoryParams? params,
    required Function(DashboardPageLoadVisitationsVehicleModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
   await safeBackEndCalls(
       apiRequest: dashboardService.dashboardPageLoadVisitationVehicle
         (visitationId: params!.visitationId),
       onSuccess: (model)=> onSuccess!.call(model),
       onError: (error)=> onError!.call(error));
  }
  

}
