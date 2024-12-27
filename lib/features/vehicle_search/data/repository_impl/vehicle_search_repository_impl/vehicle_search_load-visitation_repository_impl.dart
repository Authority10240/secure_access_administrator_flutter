

import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/vehicle_search/data/data_source/remote/vehicle_search_data_source.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_load_visitation_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable(as: VehicleSearchLoadVisitationRepository)
class VehicleSearchLoadVisitationRepositoryImpl extends VehicleSearchLoadVisitationRepository {

  VehicleSearchLoadVisitationRepositoryImpl({required this.vehicleSearchDataSource});


final VehicleSearchDataSource vehicleSearchDataSource;

  @override
  Future<void> call({VehicleSearchLoadVisitationRepositoryParams? params,
    required Function(SecureAccessVisitationsModel? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    safeBackEndCalls(
        apiRequest: vehicleSearchDataSource.visitationSearchLoadVehicle(visitationId: params!.visitationid),
        onSuccess: (model)=>onSuccess!(model),
        onError:(error)=> onError!(error));
  }
  

}
