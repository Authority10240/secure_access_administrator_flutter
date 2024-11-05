import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/visitation_search/data/data_source/remote/visitation_search_remote_data_source.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/repository/visitation_search_repository/visitation_search_load_vehicle_repository.dart';

@Injectable(as: VisitationSearchLoadVehicleRepository)
class VisitationSearchLoadVehicleRepositoryImpl extends VisitationSearchLoadVehicleRepository {

  VisitationSearchLoadVehicleRepositoryImpl({required this.visitationSearchRemoteDataSource});

  final VisitationSearchRemoteDataSource visitationSearchRemoteDataSource;
  @override
  Future<void> call({
    VisitationSearchLoadVehicleRepositoryParams? params,
    required Function(DashboardPageLoadVisitationsVehicleModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async  {
    await safeBackEndCalls(
    apiRequest: visitationSearchRemoteDataSource.visitationSearchLoadVehicle
      (visitationId: params!.visitationId, date: params!.date),
    onSuccess: (model)=> onSuccess!.call(model),
    onError: (error)=> onError!.call(error));
  }

  

}
