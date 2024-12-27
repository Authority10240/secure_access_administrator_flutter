
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/repository/visitation_search_repository/visitation_search_load_vehicle_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable()
class VisitationSearchLoadVehicleUseCase extends BaseUseCase<VisitationSearchLoadVehicleUseCaseParams, SecureAccessVisitationsVehicleModel>{

  final VisitationSearchLoadVehicleRepository visitationSearchLoadVehicleRepository;

  VisitationSearchLoadVehicleUseCase({required this.visitationSearchLoadVehicleRepository});

  @override
  Future<void> call({
    required Function(SecureAccessVisitationsVehicleModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    VisitationSearchLoadVehicleUseCaseParams? params}) async{
      await visitationSearchLoadVehicleRepository.call(
          onSuccess: (model)=> onSuccess!.call(model),
          onError: (error)=> onError!.call(error),
      params: VisitationSearchLoadVehicleRepositoryParams(date: params!.date, visitationId: params.visitationId));
  }
}

class VisitationSearchLoadVehicleUseCaseParams extends BaseUseCaseParams{

  VisitationSearchLoadVehicleUseCaseParams({required this.date, required this.visitationId});

  final String visitationId;
  final String date;
}
