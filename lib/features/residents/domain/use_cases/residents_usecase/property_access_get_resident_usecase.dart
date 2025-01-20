

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/residents/domain/repository/residents_repository/property_access_get_resident_repository.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

@Injectable()
class PropertyAccessGetresidentUseCase extends BaseUseCase<PropertyAccessGetresidentUseCaseParams, Stream<QuerySnapshot<SecureAccessResidentModel?>>>{

  final PropertyAccessGetresidentRepository propertyAccessGetresidentRepository;

  PropertyAccessGetresidentUseCase({required this.propertyAccessGetresidentRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<SecureAccessResidentModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertyAccessGetresidentUseCaseParams? params}) async{
    await propertyAccessGetresidentRepository.call(
      onSuccess:(model)=> onSuccess!.call(model),
      onError:(error)=> onError!.call(error),
      params: PropertyAccessGetresidentRepositoryParams(
          blockId: params!.blockId,
          unitId: params!.unitId,
      )
    );
  }
}

class PropertyAccessGetresidentUseCaseParams extends BaseUseCaseParams{

  final String blockId;
  final String unitId;

  PropertyAccessGetresidentUseCaseParams({required this.blockId, required this.unitId});
}
