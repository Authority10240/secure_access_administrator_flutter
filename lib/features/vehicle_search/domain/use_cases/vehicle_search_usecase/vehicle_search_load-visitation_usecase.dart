
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_load_visitation_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable()
class VehicleSearchLoadVisitationUseCase extends BaseUseCase<VehicleSearchLoadVisitationUseCaseParams, SecureAccessVisitationsModel>{

  final VehicleSearchLoadVisitationRepository vehicleSearchLoadVisitationRepository;

  VehicleSearchLoadVisitationUseCase({required this.vehicleSearchLoadVisitationRepository});

  @override
  Future<void> call({
    required Function(SecureAccessVisitationsModel? model)? onSuccess,
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
