
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitation_vehicle_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@injectable
class DashboardPageLoadVisitationVehicleUseCase extends BaseUseCase<DashboardPageLoadVisitationVehicleUseCaseParams, SecureAccessVisitationsVehicleModel>{

  final DashboardPageLoadVisitationVehicleRepository dashboardPageLoadVisitationVehicleRepository;

  DashboardPageLoadVisitationVehicleUseCase({required this.dashboardPageLoadVisitationVehicleRepository});

  @override
  Future<void> call({
    required Function(SecureAccessVisitationsVehicleModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    DashboardPageLoadVisitationVehicleUseCaseParams? params})async {
    await dashboardPageLoadVisitationVehicleRepository.call(
        onSuccess: (model)=> onSuccess!.call(model),
        onError:(error)=> onError!.call(error),
    params: DashboardPageLoadVisitationVehicleRepositoryParams(visitationId: params!.visitationId, date: params!.date));
  }
}

class DashboardPageLoadVisitationVehicleUseCaseParams extends BaseUseCaseParams{
  DashboardPageLoadVisitationVehicleUseCaseParams({required this.visitationId, required this.date});

  final String visitationId;
  final String date;
}
