
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/repository/visitation_search_repository/visitation_search_load_vehicle_repository.dart';

@Injectable()
class VisitationSearchLoadVehicleUseCase extends BaseUseCase<VisitationSearchLoadVehicleUseCaseParams, DashboardPageLoadVisitationsVehicleModel>{

  final VisitationSearchLoadVehicleRepository visitationSearchLoadVehicleRepository;

  VisitationSearchLoadVehicleUseCase({required this.visitationSearchLoadVehicleRepository});

  @override
  Future<void> call({
    required Function(DashboardPageLoadVisitationsVehicleModel? model)? onSuccess,
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
