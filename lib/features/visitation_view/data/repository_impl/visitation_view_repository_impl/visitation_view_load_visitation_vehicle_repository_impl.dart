import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_view/data/data_source/remote/visitation_view_data_source.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_vehicle_model.dart';
import 'package:secure_access_administrator/features/visitation_view/domain/repository/visitation_view_repository/visitation_view_load_visitation_vehicle_repository.dart';

@Injectable(as: VisitationViewLoadVisitationVehicleRepository)
class VisitationViewLoadVisitationVehicleRepositoryImpl extends VisitationViewLoadVisitationVehicleRepository {

  VisitationViewLoadVisitationVehicleRepositoryImpl({required this.visitationViewDataSource});

  final VisitationViewDataSource visitationViewDataSource;

  @override
  Future<void> call({VisitationViewLoadVisitationVehicleRepositoryParams? params,
    required Function(VisitationViewLoadVisitationVehicleModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    safeBackEndCalls(apiRequest: visitationViewDataSource.visitationViewLoadVisitationVehicle(
        visitationId: params!.visitationId,
        date: params!.date),
        onSuccess: (model)=> onSuccess!.call(model),
        onError: (error)=> onError!.call(error));
  }
  

}
