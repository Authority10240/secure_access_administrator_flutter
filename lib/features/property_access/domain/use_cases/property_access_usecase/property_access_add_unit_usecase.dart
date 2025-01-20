
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/property_access/domain/repository/property_access_repository/property_access_add_unit_repository.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

import '../../../../../core/base_classes/base_usecase.dart';

@Injectable()
class PropertyAccessAddUnitUseCase extends BaseUseCase<PropertyAccessAddUnitUseCaseParams, bool>{

  final PropertyAccessAddUnitRepository propertyAccessAddUnitRepository;

  PropertyAccessAddUnitUseCase({required this.propertyAccessAddUnitRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertyAccessAddUnitUseCaseParams? params}) async {
    await propertyAccessAddUnitRepository.call(
        onSuccess:(model)=>onSuccess!(model)
        , onError: (error)=> onError!(error),
    params: PropertyAccessAddUnitRepositoryParams(secureAccessUnitsModel: params!.secureAccessUnitsModel, blockId: params!.blockId));
  }
}

class PropertyAccessAddUnitUseCaseParams extends BaseUseCaseParams{

  final String blockId;
  final SecureAccessUnitsModel secureAccessUnitsModel;

  PropertyAccessAddUnitUseCaseParams({required this.blockId, required this.secureAccessUnitsModel});
}
