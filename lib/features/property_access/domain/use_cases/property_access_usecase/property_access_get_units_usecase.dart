
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/property_access/domain/repository/property_access_repository/property_access_get_units_repository.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

@Injectable()
class PropertyAccessGetUnitsUseCase extends BaseUseCase<PropertyAccessGetUnitsUseCaseParams, Stream<QuerySnapshot<SecureAccessUnitsModel?>>>{

  final PropertyAccessGetUnitsRepository propertyAccessGetUnitsRepository;

  PropertyAccessGetUnitsUseCase({required this.propertyAccessGetUnitsRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<SecureAccessUnitsModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertyAccessGetUnitsUseCaseParams? params})async {
    await propertyAccessGetUnitsRepository.call(
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error),
    params: PropertyAccessGetUnitsRepositoryParams(blockId: params!.blockId));
  }
}

class PropertyAccessGetUnitsUseCaseParams extends BaseUseCaseParams{

  final String blockId;

  PropertyAccessGetUnitsUseCaseParams({required this.blockId});
}
