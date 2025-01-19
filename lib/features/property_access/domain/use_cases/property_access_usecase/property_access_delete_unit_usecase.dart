


import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/property_access/domain/repository/property_access_repository/property_access_delete_unit_repository.dart';

@Injectable()
class PropertyAccessDeleteUnitUseCase extends BaseUseCase<PropertyAccessDeleteUnitUseCaseParams, bool>{

  final PropertyAccessDeleteUnitRepository propertyAccessDeleteUnitRepository;

  PropertyAccessDeleteUnitUseCase({required this.propertyAccessDeleteUnitRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertyAccessDeleteUnitUseCaseParams? params})async {
    await propertyAccessDeleteUnitRepository.call(
      onSuccess:(model)=> onSuccess!(model),
      onError:(error)=> onError!(error),
      params: PropertyAccessDeleteUnitRepositoryParams(blockId: params!.blockId, unitId: params!.unitId)
    );
  }
}

class PropertyAccessDeleteUnitUseCaseParams extends BaseUseCaseParams{

  final String blockId;
  final String unitId;

  PropertyAccessDeleteUnitUseCaseParams({required this.unitId, required this.blockId});
}
