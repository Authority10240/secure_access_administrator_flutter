
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_vehicle_model.dart';
import 'package:secure_access_administrator/features/visitation_view/domain/repository/visitation_view_repository/visitation_view_load_visitation_vehicle_repository.dart';

@Injectable()
class VisitationViewLoadVisitationVehicleUseCase extends BaseUseCase<VisitationViewLoadVisitationVehicleUseCaseParams, VisitationViewLoadVisitationVehicleModel>{

  final VisitationViewLoadVisitationVehicleRepository visitationViewLoadVisitationVehicleRepository;

  VisitationViewLoadVisitationVehicleUseCase({required this.visitationViewLoadVisitationVehicleRepository});

  @override
  Future<void> call({required Function(VisitationViewLoadVisitationVehicleModel? model)? onSuccess, required Function(BaseFailure? error)? onError, VisitationViewLoadVisitationVehicleUseCaseParams? params}) async{
   await visitationViewLoadVisitationVehicleRepository.call(
       onSuccess: (model)=> onSuccess!.call(model),
       onError: (error)=> onError!.call(error),
   params: VisitationViewLoadVisitationVehicleRepositoryParams(visitationId: params!.visitationId, date: params!.date));
  }
}

class VisitationViewLoadVisitationVehicleUseCaseParams extends BaseUseCaseParams{

  VisitationViewLoadVisitationVehicleUseCaseParams({required this.date, required this.visitationId});

  final String visitationId;
  final String date;
}
