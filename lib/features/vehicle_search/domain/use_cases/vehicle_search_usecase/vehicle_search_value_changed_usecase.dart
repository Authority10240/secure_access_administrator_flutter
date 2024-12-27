import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_value_changed_repository.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable()
class VehicleSearchValueChangedUseCase extends BaseUseCase<VehicleSearchValueChangedUseCaseParams, Stream<QuerySnapshot<SecureAccessVisitationsVehicleModel>>>{

  final VehicleSearchValueChangedRepository vehicleSearchValueChangedRepository;

  VehicleSearchValueChangedUseCase({required this.vehicleSearchValueChangedRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<SecureAccessVisitationsVehicleModel>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    VehicleSearchValueChangedUseCaseParams? params}) async{

    await vehicleSearchValueChangedRepository.call(
  onSuccess: (model)=> onSuccess!.call(model),
      onError: (error)=> onError!.call(error),
      params: VehicleSearchValueChangedRepositoryParams(vehicleSearchCriteria: params!.vehicleSearchCriteria)

    );
  }
}

class VehicleSearchValueChangedUseCaseParams extends BaseUseCaseParams{


  VehicleSearchValueChangedUseCaseParams({required this.vehicleSearchCriteria});
  final VehicleSearchCriteria vehicleSearchCriteria;
}
