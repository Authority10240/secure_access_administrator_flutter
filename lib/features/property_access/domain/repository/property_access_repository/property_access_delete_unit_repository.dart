

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';

abstract class PropertyAccessDeleteUnitRepository  extends BaseRepository<PropertyAccessDeleteUnitRepositoryParams, bool>{}

class PropertyAccessDeleteUnitRepositoryParams extends BaseRepositoryParams{

  final String blockId;
  final String unitId;

  PropertyAccessDeleteUnitRepositoryParams({required this.unitId, required this.blockId});
}
