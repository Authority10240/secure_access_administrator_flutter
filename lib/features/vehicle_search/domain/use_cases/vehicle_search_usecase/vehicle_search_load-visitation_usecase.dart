
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_load_visitation_repository.dart';

@Injectable()
class VehicleSearchLoadVisitationUseCase extends BaseUseCase<VehicleSearchLoadVisitationUseCaseParams, DashboardGetVisitationsModel>{

  final VehicleSearchLoadVisitationRepository vehicleSearchLoadVisitationRepository;

  VehicleSearchLoadVisitationUseCase({required this.vehicleSearchLoadVisitationRepository});

  @override
  Future<void> call({
    required Function(DashboardGetVisitationsModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    VehicleSearchLoadVisitationUseCaseParams? params})async {
    await vehicleSearchLoadVisitationRepository.call(onSuccess: (model)=> onSuccess!(model),
        onError:(error)=> onError!(error),
    params: VehicleSearchLoadVisitationRepositoryParams(visitationid: params!.visitationid));

  }
}

class VehicleSearchLoadVisitationUseCaseParams extends BaseUseCaseParams{

  VehicleSearchLoadVisitationUseCaseParams({required this.visitationid});

  final String visitationid;
}
